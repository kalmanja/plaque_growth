    module fem_tools
    
    implicit none

    contains

    subroutine GaussLegendreQuad(nqp,ndim,quadrature)

        implicit none
  
        integer, intent(in) :: nqp
        integer :: i,j,k,gp,ndim
        double precision :: x(nqp)
        double precision :: w(nqp)
        double precision, intent(out), ALLOCATABLE :: quadrature (:,:)

      if (ndim.eq.3) then
        allocate (quadrature(1:nqp**3,4))
      end if

      if (ndim.eq.2) then
         allocate (quadrature(1:nqp**2,3))
      end if

    ! 1-D quadrature
        select case (nqp)
        case(1)
           x(1) =  1.0000000000000000D0
           w(1) =  2.0000000000000000D0
        case(2)
           x(1) = -0.5773502691896257D0
           x(2) =  0.5773502691896257D0
           w(1) =  1.0000000000000000D0
           w(2) =  1.0000000000000000D0
        case(3)
           x(1) = -0.7745966692414834D0
           x(2) =  0.0000000000000000D0
           x(3) =  0.7745966692414834D0
           w(1) =  0.5555555555555556D0
           w(2) =  0.8888888888888888D0
           w(3) =  0.5555555555555556D0
        case(4)
           x(1) = -0.8611363115940526D0
           x(2) = -0.3399810435848563D0
           x(3) =  0.3399810435848563D0
           x(4) =  0.8611363115940526D0
           w(1) =  0.3478548451374538D0
           w(2) =  0.6521451548625461D0
           w(3) =  0.6521451548625461D0
           w(4) =  0.3478548451374538D0
        case(5)
           x(1) = -0.9061798459386640D0
           x(2) = -0.5384693101056831D0
           x(3) =  0.0000000000000000D0
           x(4) =  0.5384693101056831D0
           x(5) =  0.9061798459386640D0
           w(1) =  0.2369268850561891D0
           w(2) =  0.4786286704993665D0
           w(3) =  0.5688888888888889D0
           w(4) =  0.4786286704993665D0
           w(5) =  0.2369268850561891D0
        case(6)
           x(1) = -0.9324695142031521D0
           x(2) = -0.6612093864662645D0
           x(3) = -0.2386191860831969D0
           x(4) =  0.2386191860831969D0
           x(5) =  0.6612093864662645D0
           x(6) =  0.9324695142031521D0
           w(1) =  0.1713244923791704D0
           w(2) =  0.3607615730481386D0
           w(3) =  0.4679139345726910D0
           w(4) =  0.4679139345726910D0
           w(5) =  0.3607615730481386D0
           w(6) =  0.1713244923791704D0
        case(7)
           x(1) = -0.9491079123427585D0
           x(2) = -0.7415311855993945D0
           x(3) = -0.4058451513773972D0
           x(4) =  0.0000000000000000D0
           x(5) =  0.4058451513773972D0
           x(6) =  0.7415311855993945D0
           x(7) =  0.9491079123427585D0
           w(1) = 0.1294849661688697D0
           w(2) = 0.2797053914892766D0
           w(3) = 0.3818300505051189D0
           w(4) = 0.4179591836734694
           w(5) = 0.3818300505051189D0
           w(6) = 0.2797053914892766D0
           w(7) = 0.1294849661688697D0
        case(8)
           x(1) = -0.9602898564975363D0
           x(2) = -0.7966664774136267D0
           x(3) = -0.5255324099163290D0
           x(4) = -0.1834346424956498D0
           x(5) =  0.1834346424956498D0
           x(6) =  0.5255324099163290D0
           x(7) =  0.7966664774136267D0
           x(8) =  0.9602898564975363D0
           w(1) = 0.1012285362903763D0
           w(2) = 0.2223810344533745D0
           w(3) = 0.3137066458778873D0
           w(4) = 0.3626837833783620D0
           w(5) = 0.3626837833783620D0
           w(6) = 0.3137066458778873D0
           w(7) = 0.2223810344533745D0
           w(8) = 0.1012285362903763D0
        case(9)
           x(1) = -0.9681602395076261D0
           x(2) = -0.8360311073266358D0
           x(3) = -0.6133714327005904D0
           x(4) = -0.3242534234038089D0
           x(5) =  0.0000000000000000D0
           x(6) =  0.3242534234038089D0
           x(7) =  0.6133714327005904D0
           x(8) =  0.8360311073266358D0
           x(9) =  0.9681602395076261D0
           w(1) = 0.0812743883615744D0
           w(2) = 0.1806481606948574D0
           w(3) = 0.2606106964029354D0
           w(4) = 0.3123470770400029D0
           w(5) = 0.3302393550012598D0
           w(6) = 0.3123470770400029D0
           w(7) = 0.2606106964029354D0
           w(8) = 0.1806481606948574D0
           w(9) = 0.0812743883615744D0
        case(10)
           x(1)  = -0.9739065285171717D0
           x(2)  = -0.8650633666889845D0
           x(3)  = -0.6794095682990244D0
           x(4)  = -0.4333953941292472D0
           x(5)  = -0.1488743389816312D0
           x(6)  =  0.1488743389816312D0
           x(7)  =  0.4333953941292472D0
           x(8)  =  0.6794095682990244D0
           x(9)  =  0.8650633666889845D0
           x(10) =  0.9739065285171717D0
           w(1)  = 0.0666713443086881D0
           w(2)  = 0.1494513491505806D0
           w(3)  = 0.2190863625159820D0
           w(4)  = 0.2692667193099963D0
           w(5)  = 0.2955242247147529D0
           w(6)  = 0.2955242247147529D0
           w(7)  = 0.2692667193099963D0
           w(8)  = 0.2190863625159820D0
           w(9)  = 0.1494513491505806D0
           w(10) = 0.0666713443086881D0
        case(11)
           x(1)  = -0.9782286581460570D0
           x(2)  = -0.8870625997680953D0
           x(3)  = -0.7301520055740494D0
           x(4)  = -0.5190961292068118D0
           x(5)  = -0.2695431559523450D0
           x(6)  =  0.0000000000000000D0
           x(7)  =  0.2695431559523450D0
           x(8)  =  0.5190961292068118D0
           x(9)  =  0.7301520055740494D0
           x(10) =  0.8870625997680953D0
           x(11) =  0.9782286581460570D0
           w(1)  = 0.0556685671161737D0
           w(2)  = 0.1255803694649046D0
           w(3)  = 0.1862902109277343D0
           w(4)  = 0.2331937645919905D0
           w(5)  = 0.2628045445102467D0
           w(6)  = 0.2729250867779006D0
           w(7)  = 0.2628045445102467D0
           w(8)  = 0.2331937645919905D0
           w(9)  = 0.1862902109277343D0
           w(10) = 0.1255803694649046D0
           w(11) = 0.0556685671161737D0
        case(12)
           x(1)  = -0.9815606342467192D0
           x(2)  = -0.9041172563704749D0
           x(3)  = -0.7699026741943047D0
           x(4)  = -0.5873179542866175D0
           x(5)  = -0.3678314989981802D0
           x(6)  = -0.1252334085114689D0
           x(7)  =  0.1252334085114689D0
           x(8)  =  0.3678314989981802D0
           x(9)  =  0.5873179542866175D0
           x(10) =  0.7699026741943047D0
           x(11) =  0.9041172563704749D0
           x(12) =  0.9815606342467192D0
           w(1)  = 0.0471753363865118D0
           w(2)  = 0.1069393259953184D0
           w(3)  = 0.1600783285433462D0
           w(4)  = 0.2031674267230659D0
           w(5)  = 0.2334925365383548D0
           w(6)  = 0.2491470458134028D0
           w(7)  = 0.2491470458134028D0
           w(8)  = 0.2334925365383548D0
           w(9)  = 0.2031674267230659D0
           w(10) = 0.1600783285433462D0
           w(11) = 0.1069393259953184D0
           w(12) = 0.0471753363865118D0
        case(13)
           x(1)  = -0.9841830547185881D0
           x(2)  = -0.9175983992229779D0
           x(3)  = -0.8015780907333099D0
           x(4)  = -0.6423493394403402D0
           x(5)  = -0.4484927510364469D0
           x(6)  = -0.2304583159551348D0
           x(7)  =  0.0000000000000000D0
           x(8)  =  0.2304583159551348D0
           x(9)  =  0.4484927510364469D0
           x(10) =  0.6423493394403402D0
           x(11) =  0.8015780907333099D0
           x(12) =  0.9175983992229779D0
           x(13) =  0.9841830547185881D0
           w(1)  = 0.0404840047653159D0
           w(2)  = 0.0921214998377285D0
           w(3)  = 0.1388735102197872D0
           w(4)  = 0.1781459807619457D0
           w(5)  = 0.2078160475368885D0
           w(6)  = 0.2262831802628972D0
           w(7)  = 0.2325515532308739D0
           w(8)  = 0.2262831802628972D0
           w(9)  = 0.2078160475368885D0
           w(10) = 0.1781459807619457D0
           w(11) = 0.1388735102197872D0
           w(12) = 0.0921214998377285D0
           w(13) = 0.0404840047653159D0
        case(14)
           x(1)  = -0.9862838086968123D0
           x(2)  = -0.9284348836635735D0
           x(3)  = -0.8272013150697650D0
           x(4)  = -0.6872929048116855D0
           x(5)  = -0.5152486363581541D0
           x(6)  = -0.3191123689278897D0
           x(7)  = -0.1080549487073437D0
           x(8)  = 0.1080549487073437D0
           x(9)  = 0.3191123689278897D0
           x(10) = 0.5152486363581541D0
           x(11) = 0.6872929048116855D0
           x(12) = 0.8272013150697650D0
           x(13) = 0.9284348836635735D0
           x(14) = 0.9862838086968123D0
           w(1)  = 0.0351194603317519D0
           w(2)  = 0.0801580871597602D0
           w(3)  = 0.1215185706879032D0
           w(4)  = 0.1572031671581935D0
           w(5)  = 0.1855383974779378D0
           w(6)  = 0.2051984637212956D0
           w(7)  = 0.2152638534631578D0
           w(8)  = 0.2152638534631578D0
           w(9)  = 0.2051984637212956D0
           w(10) = 0.1855383974779378D0
           w(11) = 0.1572031671581935D0
           w(12) = 0.1215185706879032D0
           w(13) = 0.0801580871597602D0
           w(14) = 0.0351194603317519D0
        end select
        
        gp = 0
      if (ndim.eq.3) then
        do i = 1,nqp
            do j = 1,nqp
                do k = 1,nqp
                    gp = gp + 1
                    quadrature(gp,1) = x(i)
                    quadrature(gp,2) = x(j)
                    quadrature(gp,3) = x(k)
                    quadrature(gp,4) = w(i)*w(j)*w(k)
                end do
            end do
        end do
      end if
      if (ndim.eq.2) then
        do i = 1,nqp
         do j = 1,nqp
                 gp = gp + 1
                 quadrature(gp,1) = x(i)
                 quadrature(gp,2) = x(j)
                 quadrature(gp,3) = w(i)*w(j)
         end do
        end do
      end if

        return
        end subroutine GaussLegendreQuad   
        
        
        subroutine shape_func_eval3D(xi, eta, zeta, N)
         
         DOUBLE PRECISION, INTENT(IN) :: xi, eta, zeta
         DOUBLE PRECISION :: N(8),N0(8),N_xi(8),N_eta(8),N_zeta(8)
         DOUBLE PRECISION :: N_xi_eta(8),N_eta_zeta(8),N_zeta_xi(8),N_xi_eta_zeta(8)

         N0 = (/1,1,1,1,1,1,1,1/)

         N_xi = (/-1,1,1,-1,-1,1,1,-1/)
         N_eta = (/-1,-1,1,1,-1,-1,1,1/)
         N_zeta = (/-1,-1,-1,-1,1,1,1,1/)

         N_xi_eta = (/1,-1,1,-1,1,-1,1,-1/)
         N_eta_zeta = (/1,1,-1,-1,-1,-1,1,1/)
         N_zeta_xi = (/1,-1,-1,1,-1,1,1,-1/)

         N_xi_eta_zeta = (/-1,1,-1,1,1,-1,1,-1/)

         N = (1.d0/8)*(N0 + xi*N_xi + eta*N_eta + zeta*N_zeta & 
            & + xi*eta*N_xi_eta + eta*zeta*N_eta_zeta + zeta*xi*N_zeta_xi &
            & + xi*eta*zeta*N_xi_eta_zeta)

         return
         end subroutine shape_func_eval3D

         subroutine shape_func_eval2D(xi, eta, N, X_e, detjac)
         
            DOUBLE PRECISION, INTENT(IN) :: xi, eta
            DOUBLE PRECISION :: N(4),N0(4),N_xi(4),N_eta(4)
            DOUBLE PRECISION :: N_xi_eta(4),X_e(4,3),Jac(2,2),detjac
            DOUBLE PRECISION :: N_deriv_xi(4),N_deriv_eta(4)
   
            N0 = (/1,1,1,1/)
   
            N_xi = (/-1,1,1,-1/)
            N_eta = (/-1,-1,1,1/)
   
            N_xi_eta = (/1,-1,1,-1/)

            N = (1.d0/4)*(N0 + xi*N_xi + eta*N_eta + xi*eta*N_xi_eta)

            N_deriv_xi = (1.d0/4)*N_xi
            N_deriv_eta = (1.d0/4)*N_eta

            Jac(1,1) = DOT_PRODUCT(N_deriv_xi,X_e(:,1))
            Jac(2,1) = DOT_PRODUCT(N_deriv_xi,X_e(:,2))

            Jac(1,2) = DOT_PRODUCT(N_deriv_eta,X_e(:,1))
            Jac(2,2) = DOT_PRODUCT(N_deriv_eta,X_e(:,2))
            
            detjac = FindDet(Jac,2)
   
            return

         end subroutine shape_func_eval2D

         subroutine shape_func_deriv3D(xi, eta, zeta, invJac, B)
            
            DOUBLE PRECISION, INTENT(IN) :: xi, eta, zeta
            DOUBLE PRECISION :: B_iso(8,3),B(8,3),invJac(3,3)
            DOUBLE PRECISION :: N_xi(8),N_eta(8),N_zeta(8)
            DOUBLE PRECISION :: N_xi_eta(8),N_eta_zeta(8),N_zeta_xi(8),N_xi_eta_zeta(8)
            DOUBLE PRECISION :: N_deriv_xi(8),N_deriv_eta(8),N_deriv_zeta(8)

            N_xi = (/-1,1,1,-1,-1,1,1,-1/)
            N_eta = (/-1,-1,1,1,-1,-1,1,1/)
            N_zeta = (/-1,-1,-1,-1,1,1,1,1/)
   
            N_xi_eta = (/1,-1,1,-1,1,-1,1,-1/)
            N_eta_zeta = (/1,1,-1,-1,-1,-1,1,1/)
            N_zeta_xi = (/1,-1,-1,1,-1,1,1,-1/)
   
            N_xi_eta_zeta = (/-1,1,-1,1,1,-1,1,-1/)

            N_deriv_xi = (1.d0/8)*(N_xi + eta*N_xi_eta + zeta*N_zeta_xi + eta*zeta*N_xi_eta_zeta)
            N_deriv_eta = (1.d0/8)*(N_eta + xi*N_xi_eta + zeta*N_eta_zeta + xi*zeta*N_xi_eta_zeta)
            N_deriv_zeta = (1.d0/8)*(N_zeta + eta*N_eta_zeta + zeta*N_zeta_xi + xi*eta*N_xi_eta_zeta)

            B_iso(:,1) = N_deriv_xi
            B_iso(:,2) = N_deriv_eta
            B_iso(:,3) = N_deriv_zeta

            B = MATMUL(B_iso,invJac)

            return

            end subroutine shape_func_deriv3D

         subroutine inverse_Jacobian3D(xi, eta, zeta, X_e, Jac, invJac)

               DOUBLE PRECISION :: xi, eta, zeta
               DOUBLE PRECISION :: Jac(3,3), invJac(3,3), X_e(8,3)
               DOUBLE PRECISION :: N_xi(8), N_eta(8), N_zeta(8)
               DOUBLE PRECISION :: N_xi_eta(8), N_eta_zeta(8), N_zeta_xi(8), N_xi_eta_zeta(8)
               DOUBLE PRECISION :: N_deriv_xi(8), N_deriv_eta(8), N_deriv_zeta(8)
               logical :: OK_flag
   
               N_xi = (/-1,1,1,-1,-1,1,1,-1/)
               N_eta = (/-1,-1,1,1,-1,-1,1,1/)
               N_zeta = (/-1,-1,-1,-1,1,1,1,1/)
      
               N_xi_eta = (/1,-1,1,-1,1,-1,1,-1/)
               N_eta_zeta = (/1,1,-1,-1,-1,-1,1,1/)
               N_zeta_xi = (/1,-1,-1,1,-1,1,1,-1/)
      
               N_xi_eta_zeta = (/-1,1,-1,1,1,-1,1,-1/)
   
               N_deriv_xi = (1.d0/8)*(N_xi + eta*N_xi_eta + zeta*N_zeta_xi + eta*zeta*N_xi_eta_zeta)
               N_deriv_eta = (1.d0/8)*(N_eta + xi*N_xi_eta + zeta*N_eta_zeta + xi*zeta*N_xi_eta_zeta)
               N_deriv_zeta = (1.d0/8)*(N_zeta + eta*N_eta_zeta + xi*N_zeta_xi + xi*eta*N_xi_eta_zeta)

               Jac = 0.d0

               Jac(1,1) = DOT_PRODUCT(N_deriv_xi,X_e(:,1))
               Jac(2,1) = DOT_PRODUCT(N_deriv_xi,X_e(:,2))
               Jac(3,1) = DOT_PRODUCT(N_deriv_xi,X_e(:,3))

               Jac(1,2) = DOT_PRODUCT(N_deriv_eta,X_e(:,1))
               Jac(2,2) = DOT_PRODUCT(N_deriv_eta,X_e(:,2))
               Jac(3,2) = DOT_PRODUCT(N_deriv_eta,X_e(:,3))

               Jac(1,3) = DOT_PRODUCT(N_deriv_zeta,X_e(:,1))
               Jac(2,3) = DOT_PRODUCT(N_deriv_zeta,X_e(:,2))
               Jac(3,3) = DOT_PRODUCT(N_deriv_zeta,X_e(:,3))

               CALL M33INV (Jac, invJac, OK_FLAG)

               return

         end subroutine inverse_Jacobian3D

!===============MATRIX SUBROUTINES=========================!

         SUBROUTINE M33INV (A, AINV, OK_FLAG)

            IMPLICIT NONE
      
            DOUBLE PRECISION, DIMENSION(3,3), INTENT(IN)  :: A
            DOUBLE PRECISION, DIMENSION(3,3), INTENT(OUT) :: AINV
            LOGICAL, INTENT(OUT) :: OK_FLAG
      
            DOUBLE PRECISION, PARAMETER :: EPS = 1.0D-10
            DOUBLE PRECISION :: DET
            DOUBLE PRECISION, DIMENSION(3,3) :: COFACTOR
      
      
            DET =   A(1,1)*A(2,2)*A(3,3)  &
                  - A(1,1)*A(2,3)*A(3,2)  &
                  - A(1,2)*A(2,1)*A(3,3)  &
                  + A(1,2)*A(2,3)*A(3,1)  &
                  + A(1,3)*A(2,1)*A(3,2)  &
                  - A(1,3)*A(2,2)*A(3,1)
      
            IF (ABS(DET) .LE. EPS) THEN
               AINV = 0.0D0
               OK_FLAG = .FALSE.
               RETURN
            END IF
      
            COFACTOR(1,1) = +(A(2,2)*A(3,3)-A(2,3)*A(3,2))
            COFACTOR(1,2) = -(A(2,1)*A(3,3)-A(2,3)*A(3,1))
            COFACTOR(1,3) = +(A(2,1)*A(3,2)-A(2,2)*A(3,1))
            COFACTOR(2,1) = -(A(1,2)*A(3,3)-A(1,3)*A(3,2))
            COFACTOR(2,2) = +(A(1,1)*A(3,3)-A(1,3)*A(3,1))
            COFACTOR(2,3) = -(A(1,1)*A(3,2)-A(1,2)*A(3,1))
            COFACTOR(3,1) = +(A(1,2)*A(2,3)-A(1,3)*A(2,2))
            COFACTOR(3,2) = -(A(1,1)*A(2,3)-A(1,3)*A(2,1))
            COFACTOR(3,3) = +(A(1,1)*A(2,2)-A(1,2)*A(2,1))
      
            AINV = TRANSPOSE(COFACTOR) / DET
      
            OK_FLAG = .TRUE.
      
            RETURN
      
            END SUBROUTINE M33INV

    ! -------------------Determinant-----------------------!  
         double precision FUNCTION FindDet(matrix, n)
         IMPLICIT NONE
         double precision, DIMENSION(n,n) :: matrix,matrix_copy
         INTEGER, INTENT(IN) :: n
         double precision :: m, temp
         INTEGER :: i, j, k, l
         LOGICAL :: DetExists = .TRUE.
         matrix_copy = matrix
         l = 1
         !Convert to upper triangular form
         DO k = 1, n-1
             IF (matrix_copy(k,k) == 0) THEN
                 DetExists = .FALSE.
                 DO i = k+1, n
                     IF (matrix_copy(i,k) /= 0) THEN
                         DO j = 1, n
                             temp = matrix_copy(i,j)
                             matrix_copy(i,j)= matrix_copy(k,j)
                             matrix_copy(k,j) = temp
                         END DO
                         DetExists = .TRUE.
                         l=-l
                         EXIT
                     ENDIF
                 END DO
                 IF (DetExists .EQV. .FALSE.) THEN
                     FindDet = 0
                     return
                 END IF
             ENDIF
             DO j = k+1, n
                 m = matrix_copy(j,k)/matrix_copy(k,k)
                 DO i = k+1, n
                     matrix_copy(j,i) = matrix_copy(j,i)- m*matrix_copy(k,i)
                 END DO
             END DO
         END DO
     
         !Calculate determinant by finding product of diagonal elements
         FindDet = 1.d0
         DO i = 1, n
             FindDet = FindDet * matrix_copy(i,i)
         END DO

         return
     
       END FUNCTION FindDet

    end module fem_tools