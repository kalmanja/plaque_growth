      SUBROUTINE UMAT(STRESS,STATEV,DDSDDE,SSE,SPD,SCD,
     1 RPL,DDSDDT,DRPLDE,DRPLDT,
     2 STRAN,DSTRAN,TIME,DTIME,TEMP,DTEMP,PREDEF,DPRED,CMNAME,
     3 NDI,NSHR,NTENS,NSTATV,PROPS,NPROPS,COORDS,DROT,PNEWDT,
     4 CELENT,DFGRD0,DFGRD1,NOEL,NPT,LAYER,KSPT,KSTEP,KINC)

      INCLUDE 'ABA_PARAM.INC'
!     WARNING - the aba_param.inc file declares
!        Implicit real*8(a-h,o-z)
!     This means that, by default, any variables with
!     first letter between a-h or o-z are double precision.
!     The rest are integers.
!     Note that this also means that if you type a variable
!     name incorrectly, the compiler won't catch your typo.

      CHARACTER*80 CMNAME
      DIMENSION STRESS(NTENS),STATEV(NSTATV),
     1 DDSDDE(NTENS,NTENS),DDSDDT(NTENS),DRPLDE(NTENS),
     2 STRAN(NTENS),DSTRAN(NTENS),TIME(2),PREDEF(1),DPRED(1),
     3 PROPS(NPROPS),COORDS(3),DROT(3,3),DFGRD0(3,3),DFGRD1(3,3)

    !  subroutine umat_gasser2006(defgrad,c_NH,k1,k2,kappa,gamma,E_g,
    ! 1   nu_g,lambda_g,mu_g,S_full,P_full,C_mat)
        
    !  implicit none
    
      double precision :: c_NH,k1,k2,kappa,gamma,nu_g,gamma_rad
      double precision :: E_g,lambda_g,mu_g,K_g,d1_g,PI,J_vol
      double precision :: defgrad(3,3),I32(3,3)
      double precision :: e_1(3),rot1(3,3),rot2(3,3)
      double precision :: a_01(3),a_02(3),F_bar(3,3)
      double precision :: lcg_b(3,3),rcg_c(3,3),b_bar(3,3)
      double precision :: c_bar(3,3),a1_current(3),a2_current(3)
      double precision :: a_01_dyad(3,3),a_02_dyad(3,3)
      double precision :: a1_dyad_a1(3,3),a2_dyad_a2(3,3)
      double precision :: H1(3,3),H2(3,3),sigma_voigt(6)
      double precision :: h1_current(3,3),h2_current(3,3)
      double precision :: I4_1,I4_2,C_ABAQUS_voigt(6,6)
      double precision :: E1_strain,E2_strain
      double precision :: psif1_prime,psif2_prime
      double precision :: psif1_2prime,psif2_2prime
      double precision :: sigma_vol(3,3),sigma_iso_matrix(3,3)
      double precision :: sigma_aniso(3,3),sigma_full(3,3)
      double precision :: C_ABAQUS_vol(3,3,3,3)
      double precision :: C_ABAQUS_iso_g(3,3,3,3)
      double precision :: C_mat_aniso(3,3,3,3)
      double precision :: work(3),H1_op_H1(3,3,3,3),H2_op_H2(3,3,3,3)
      double precision :: defgrad_inv(3,3),defgrad_inv_trans(3,3)
      double precision :: SPK_temp(3,3),SPK(3,3)
      double precision :: C_ABAQUS_aniso(3,3,3,3)
      double precision :: C_ABAQUS(3,3,3,3)
      double precision :: alignment,FindDet3
      integer          :: i,j,k,l,ipiv(3),kronecker,info


      
      !----------------extracting the material parameters for ABAQUS-----------!
      ! fibre properties
      k1   = PROPS(2)
      k2   = PROPS(3)
      gamma= PROPS(4)
      kappa= PROPS(5)  
    ! Ground matrix properties
      nu_g = PROPS(6)  ! Nearly Incompressible
      c_NH = PROPS(1)

      print*,'---------------deformation gradient-------------'
      print*,defgrad(1,:)
      print*,defgrad(2,:)
      print*,defgrad(3,:)
      print*,''
      
      E_g = 2*(1+2*nu_g)*c_NH
      lambda_g = 1.d0*E_g*nu_g/((1+nu_g)*(1-2*nu_g))
      mu_g = (1.d0/2)*E_g/(1+nu_g)      
      !-------------------------------Inputs-----------------------------------!
      defgrad = DFGRD1

      K_g = (1.d0/3)*E_g/(1-2*nu_g)
      d1_g = 2/K_g
      
      PI=4.D0*DATAN(1.D0)
      
      J_vol = FindDet3(defgrad)
      print*,'-------------------J---------------'
      print*,J_vol
      print*,''
      I32 = 0.d0
      do i = 1,3
          I32(i,i) = 1.d0
      end do
      
      e_1 = 0.d0
      e_1(2) = 1.d0
      
      rot1 = 0.d0
      rot2 = 0.d0
      gamma_rad = gamma*PI/180
      
      rot1(1,1) = cos(gamma_rad)
      rot1(1,2) = -sin(gamma_rad)
      rot1(2,1) = sin(gamma_rad)
      rot1(2,2) = cos(gamma_rad)
      rot1(3,3) = 1.d0
      
      a_01 = matmul(rot1,e_1)
      
      rot2(1,1) = cos(PI-gamma_rad)
      rot2(1,2) = -sin(PI-gamma_rad)
      rot2(2,1) = sin(PI-gamma_rad)
      rot2(2,2) = cos(PI-gamma_rad)
      rot2(3,3) = 1.d0
      
      a_02 = matmul(rot2,e_1)
      
      F_bar = defgrad*J_vol**(-1.d0*1/3)
      
      lcg_b = matmul(defgrad,transpose(defgrad))
      rcg_c = matmul(transpose(defgrad),defgrad)
      b_bar = matmul(F_bar,transpose(F_bar))
      c_bar = matmul(transpose(F_bar),F_bar)

      a1_current = matmul(defgrad,a_01)
      a2_current = matmul(defgrad,a_02)
      
      call outerproduct11(a_01,a_01,a_01_dyad)
      call outerproduct11(a_02,a_02,a_02_dyad)
      
      call outerproduct11(a1_current,a1_current,a1_dyad_a1)
      call outerproduct11(a2_current,a2_current,a2_dyad_a2)
              
      H1 = kappa*I32  + (1.d0-3.d0*kappa)*a_01_dyad
      h1_current = kappa*lcg_b  + (1.d0-3.d0*kappa)*a1_dyad_a1
      H2 = kappa*I32 + (1.d0-3.d0*kappa)*a_02_dyad
      h2_current = kappa*lcg_b + (1.d0-3.d0*kappa)*a2_dyad_a2

      call innerproduct22(H1,rcg_c,I4_1)
      call innerproduct22(H2,rcg_c,I4_2)

      E1_strain = I4_1 - 1.d0
      E2_strain = I4_2 - 1.d0

      print*,'-------------fiber strains---------------------'
      print*,E1_strain
      print*,E2_strain

      psif1_prime = 0.d0
      psif2_prime = 0.d0
      psif1_2prime = 0.d0
      psif2_2prime = 0.d0
      if (E1_strain.ge.0.d0) then
          psif1_prime = k1*E1_strain*exp(k2*E1_strain**2)
          psif1_2prime = k1*(1+2.d0*k2*E1_strain**2)*exp(k2*E1_strain**2)
      end if
      if (E2_strain.ge.0.d0) then
          psif2_prime = k1*E2_strain*exp(k2*E2_strain**2)
          psif2_2prime = k1*(1+2.d0*k2*E2_strain**2)*exp(k2*E2_strain**2)
      end if

      sigma_vol = 1.d0*K_g*(J_vol - 1)*I32
      sigma_iso_matrix = c_NH*(J_vol**(-5.d0/3))*(b_bar
     &                    - (1.d0/3)*trace(c_bar)*I32)
      sigma_aniso = (2.d0/J_vol)*(psif1_prime*h1_current
     &                + psif2_prime*h2_current)

      sigma_full = sigma_vol + sigma_iso_matrix + sigma_aniso
      
      call voigt2(sigma_full,sigma_voigt)

      STRESS = sigma_voigt
      
      print*,'-------------------Cauchy stress-------------------'
      print*,'Element number',NOEL
      print*,'Gauss point',NPT
      print*,STRESS(1:3)
      print*,STRESS(4:6)

      !--------------------ABAQUS Tangent--------------------------!
      C_ABAQUS_vol = 0.d0
      C_ABAQUS_iso_g = 0.d0
      do i = 1,3
        do j = 1,3
            do k = 1,3
                do l = 1,3
                    C_ABAQUS_vol(i,j,k,l) = K_g*(2.d0*J_vol - 1)*
     &               kronecker(i,j)*kronecker(k,l)
                    C_ABAQUS_iso_g(i,j,k,l) = (1.d0*c_NH/J_vol)*
     &               (b_bar(j,l)*kronecker(i,k) 
     &               -(2.d0/3)*b_bar(i,j)*kronecker(k,l)
     &               -(2.d0/3)*b_bar(k,l)*kronecker(i,j) 
     &               +(2.d0/9)*trace(c_bar)*kronecker(i,j)
     &                  *kronecker(k,l))
                end do
            end do
        end do
      end do

      call outerproduct22(H1,H1,H1_op_H1)
      call outerproduct22(H2,H2,H2_op_H2)
      
      C_mat_aniso = 4.d0*(psif1_2prime*H1_op_H1 
     &              + psif2_2prime*H2_op_H2)

      i = size(defgrad,1)
      ipiv = 0
      work = 0.d0
      defgrad_inv = defgrad
      call DGETRF(i,i,defgrad_inv,i,ipiv,info)
      call DGETRI(i,defgrad_inv,i,ipiv,work,i,info)
      defgrad_inv_trans = transpose(defgrad_inv)

      SPK_temp = matmul(defgrad_inv,sigma_full)
      SPK = J_vol*matmul(SPK_temp,defgrad_inv_trans)

      call dSdC2dSigdEpsi(C_mat_aniso,defgrad,SPK,I32,
     &                           J_vol,C_ABAQUS_aniso)

      C_ABAQUS = C_ABAQUS_vol + C_ABAQUS_iso_g + C_ABAQUS_aniso

      call voigt4(C_ABAQUS,C_ABAQUS_voigt)
      DDSDDE = C_ABAQUS_voigt

      !print*,'-------------------Spatial tangent-------------------'
      !print*,'Element number',NOEL
      !print*,'Gauss point',NPT
      !print*,DDSDDE(1,1:3)
      !print*,DDSDDE(1,4:6)
      !print*,DDSDDE(1,7:9)
      
      call innerproduct11(a1_current,a2_current,alignment)
      print*,'-------------------alignment-------------------------'
      print*,a1_current
      STATEV(1) = alignment

    !  end subroutine umat_gasser2006
      end subroutine UMAT

!===============MATRIX SUBROUTINES=========================!
    ! -------------------Determinant-----------------------!  
      double precision FUNCTION FindDet3(matrix)
        IMPLICIT NONE
        double precision :: matrix(3,3)

        FindDet3 = matrix(1,1)*(matrix(2,2)*matrix(3,3) -
     &                matrix(3,2)*matrix(2,3)) - 
     &            matrix(1,2)*(matrix(2,1)*matrix(3,3) -
     &                matrix(3,1)*matrix(2,3)) + 
     &            matrix(1,3)*(matrix(2,1)*matrix(3,2) -
     &                matrix(3,1)*matrix(2,2))  
    
      END FUNCTION FindDet3

    !------------------------Trace--------------------------!
      double precision function trace(a)
        implicit none
    
        integer :: i
        double precision :: a(3,3)
        trace = 0.d0
        do i = 1,3
            trace = trace + a(i,i)
        end do    

      end function trace
!===============END MATRIX SUBROUTINES=====================!

      subroutine outerproduct11(a,b,op)
        implicit none
    
        double precision :: a(3),b(3),op(3,3)
        integer :: i,j
    
        op = 0.d0
        do i = 1,3
            do j = 1,3
                op(i,j) = a(i)*b(j)
            end do
        end do    
        return
      end subroutine
      
      subroutine innerproduct11(a,b,ip)
        implicit none
    
        double precision :: a(3),b(3),ip
        integer :: i
    
        ip = 0.d0
        do i = 1,3
                ip = ip + a(i)*b(i)
        end do    
        return
      end subroutine      

      subroutine outerproduct22(a,b,op)
        implicit none
    
        double precision :: a(3,3),b(3,3),op(3,3,3,3)
        integer :: i,j,k,l
    
        op = 0.d0
        do i = 1,3
            do j = 1,3
                do k = 1,3
                    do l = 1,3
                        op(i,j,k,l) = a(i,j)*b(k,l)
                    end do
                end do
            end do
        end do    
        return
      end subroutine 

      subroutine innerproduct22(a,b,ip)
        implicit none
    
        double precision :: a(3,3),b(3,3),ip
        integer :: i,j
    
        ip = 0.d0
        do i = 1,3
            do j = 1,3
                ip = ip + a(i,j)*b(i,j)
            end do
        end do    
        return
      end subroutine 

      subroutine innerproduct42(a,b,c)
        implicit none
    
        double precision ::  a(3,3,3,3), b(3,3),c(3,3)
        integer :: i,j,k,l
    
        c = 0.d0
        do i = 1,3
            do j = 1,3
                do k = 1,3
                    do l = 1,3
                        c(i,j) = c(i,j) + a(i,j,k,l)*b(k,l)
                    end do
                end do
            end do
        end do
        return
      end subroutine

      integer function kronecker(a,b)
        implicit none
    
        integer :: a,b
    
        kronecker = 0
    
        if (a == b) then
            kronecker = 1
        end if
        return

      end function kronecker

      subroutine voigt2(a,a_voigt)

        implicit none
    
        double precision :: a(3,3), a_voigt(6)
        integer :: i
    
        do i = 1,3
            a_voigt(i) = a(i,i)
        end do
    
        a_voigt(4) = a(1,2)
        a_voigt(5) = a(1,3)
        a_voigt(6) = a(2,3)
        return
      end subroutine

      subroutine voigt4(a,a_voigt)

        implicit none
    
        double precision :: a(3,3,3,3), a_voigt(6,6),mult
        integer :: i,j
    
        mult = 1.d0
        a_voigt = 0.d0

        a_voigt(1,1) = a(1,1,1,1)
        a_voigt(1,2) = a(1,1,2,2)
        a_voigt(1,3) = a(1,1,3,3)
        a_voigt(1,4) = a(1,1,1,2)
        a_voigt(1,5) = a(1,1,1,3)
        a_voigt(1,6) = a(1,1,2,3)
  
        a_voigt(2,1) = a(2,2,1,1)
        a_voigt(2,2) = a(2,2,2,2)
        a_voigt(2,3) = a(2,2,3,3)
        a_voigt(2,4) = a(2,2,1,2)
        a_voigt(2,5) = a(2,2,1,3)
        a_voigt(2,6) = a(2,2,2,3)
  
        a_voigt(3,1) = a(3,3,1,1)
        a_voigt(3,2) = a(3,3,2,2)
        a_voigt(3,3) = a(3,3,3,3)
        a_voigt(3,4) = a(3,3,1,2)
        a_voigt(3,5) = a(3,3,1,3)
        a_voigt(3,6) = a(3,3,2,3)
  
        a_voigt(4,1) = a(1,2,1,1)
        a_voigt(4,2) = a(1,2,2,2)
        a_voigt(4,3) = a(1,2,3,3)
        a_voigt(4,4) = a(1,2,1,2)
        a_voigt(4,5) = a(1,2,1,3)
        a_voigt(4,6) = a(1,2,2,3)
  
        a_voigt(5,1) = a(1,3,1,1)
        a_voigt(5,2) = a(1,3,2,2)
        a_voigt(5,3) = a(1,3,3,3)
        a_voigt(5,4) = a(1,3,1,2)
        a_voigt(5,5) = a(1,3,1,3)
        a_voigt(5,6) = a(1,3,2,3)
  
        a_voigt(6,1) = a(2,3,1,1)
        a_voigt(6,2) = a(2,3,2,2)
        a_voigt(6,3) = a(2,3,3,3)
        a_voigt(6,4) = a(2,3,1,2)
        a_voigt(6,5) = a(2,3,1,3)
        a_voigt(6,6) = a(2,3,2,3)

        return
      end subroutine

      subroutine dSdC2dSigdEpsi(Calg,dfgrd1,Spk,I33,detF1,dSigdEpsi)
            implicit none
        !---- Transform from dS/dC to dSigma/dEpsilon
        
            integer i,j,k,l,m,n
            real*8 detF1
            real*8, dimension(3,3)::dfgrd1,Spk,I33,fp33
            real*8, dimension(3,3,3,3)::Calg, A_4,T_4,Tsum4,dSigdEpsi
        
            do i=1,3
            do j=1,3
                do k=1,3
                do l=1,3
                    A_4(i,j,k,l)=I33(i,k)*Spk(j,l)
                    do m=1,3
                    do n=1,3
                        A_4(i,j,k,l)=A_4(i,j,k,l)
     &                              +2.d0*dfgrd1(i,m)
     &                              *Calg(m,j,n,l)*dfgrd1(k,n)
                    end do
                    end do
                end do
                end do
            end do
            end do
        
            call multmtx(DFGRD1,3,3,Spk,3,fp33)
        
            do i=1,3
            do j=1,3
                do k=1,3
                do l=1,3
                    T_4(i,j,k,l)=0.d0
                    do m=1,3
                        T_4(i,j,k,l)=T_4(i,j,k,l)+A_4(i,m,k,l)
     &                   *dfgrd1(j,m)+fp33(i,m)*I33(j,k)*I33(m,l)
                    end do
                end do
                end do
            end do
            end do
        
            do i=1,3
            do j=1,3
                do k=1,3
                do l=1,3
                    Tsum4(i,j,k,l)=0.d0
                    do m=1,3
                    Tsum4(i,j,k,l)=Tsum4(i,j,k,l)+
     &                                   (T_4(i,j,k,m)*dfgrd1(l,m)
     &                                 +T_4(i,j,l,m)*dfgrd1(k,m))/2.d0
                    end do
                    dSigdEpsi(i,j,k,l)=Tsum4(i,j,k,l)/detF1
                end do
                end do
            end do
            end do
        
            return 

      end subroutine

      SUBROUTINE multmtx(AM1,M1L,M1C,AM2,M2C,AMOUT)
              
              !INCLUDE 'ABA_PARAM.INC'
            implicit real(8) (a-h,m-z)
        !	CHARACTER*80 CMNAME
        !	
        !     -----------------------------------------------------------------------
        !		NOTE:AM1, AM2 and AMSAIDA are matrices
        !			 use auxiliary matrices that represent vectors or scalars
        !			 e.g.:AUX1,AUX2,TEMP0,TEMP1,TEMP2
        !     -----------------------------------------------------------------------
            integer M1L,M1C,M2L,M2C
              dimension AM1(M1L,M1C),AM2(M1C,M2C),AMOUT(M1L,M2C)
        
            do k=1,M2C
            do i=1,M1L
                C=0
                do j=1,M1C
                    A=AM1(i,j)
                    B=AM2(j,k)
                    C=C+A*B	
                end do
                AMOUT(i,k)=C
            end do
            end do
        
              RETURN
        END
