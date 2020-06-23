! Standalone code for low-density-lipoprotein and foam-cell reaction-diffusion system

! Author: Kiran Manjunatha, IFAM, RWTH Aachen University


include 'mesh_read_in.f90'
include 'fem_tools.f90'
include 'vtk_io.f90'

program reac_diff_nonlinear

  use mesh_data
  use fem_tools

  implicit none

  character ( len = 255 ) prefix
  DOUBLE PRECISION, ALLOCATABLE :: node_x(:,:)
  INTEGER, ALLOCATABLE :: element_node(:,:),bc_face(:,:)
  integer :: nqp, i, j, k, ne, node_set(8), n_s, nsteps, n_BC 
  integer, allocatable :: BC_nodes(:), BC_toggle(:)
  DOUBLE PRECISION, ALLOCATABLE :: quadrature(:,:)
  INTEGER, ALLOCATABLE :: dofs(:), ipiv(:)
  DOUBLE PRECISION :: N(8), A_e(8,8), B(8,3), Jac(3,3), invJac(3,3), X_e(8,3)
  DOUBLE PRECISION :: K_e(8,8),res_e(8),res_exp_e(8,8)
  DOUBLE PRECISION ::   mono_d,d_mono,diff_mono,c_LDL_ox,c_mono_thresh
  DOUBLE PRECISION :: detJac, del_t, t
  DOUBLE PRECISION, ALLOCATABLE :: A_global(:,:), K_global(:,:),res_exp(:,:)
  DOUBLE PRECISION, ALLOCATABLE :: c_mono_iter_temp(:,:),res_global(:,:),jacobi_iter(:,:),j_iter_inv(:,:)
  DOUBLE PRECISION, ALLOCATABLE :: c_mono_current(:),c_mono_iter(:),res(:),c_mono_diff(:,:),res_temp(:,:)
  DOUBLE PRECISION, ALLOCATABLE :: delta_c_mono(:,:),delta_c_mono_temp(:)
  DOUBLE PRECISION :: c_e_mono_iter(8), c_mono_current_gp, newton_tol,err
  INTEGER :: p,info,iter
  DOUBLE PRECISION, ALLOCATABLE :: work(:)
  integer ( kind = 4 ) output_unit, count
  character ( len = 255 ) ::  output_filename_mono, mono_strng
  !real*8 percentage_assembly

  !INTEGER :: n_constituents

! Mesh input  
  prefix = 'in/cube_circBC' ! file names would be 'prefix'_nodes.txt and 'prefix'_elements.txt 
  call read_mesh_data(prefix,element_node,node_x,bc_face)

  ALLOCATE(A_global(1:size(node_x,2),1:size(node_x,2)))
  ALLOCATE(K_global(1:size(node_x,2),1:size(node_x,2)))
  ALLOCATE(jacobi_iter(1:size(node_x,2),1:size(node_x,2)))
  ALLOCATE(j_iter_inv(1:size(node_x,2),1:size(node_x,2)))
  ALLOCATE(res_exp(1:size(node_x,2),1:size(node_x,2)))
  ALLOCATE(dofs(1:size(node_x,2)))
  ALLOCATE(c_mono_current(1:size(node_x,2)))
  ALLOCATE(c_mono_iter(1:size(node_x,2)))
  ALLOCATE(res_global(1:size(node_x,2),1))
  ALLOCATE(res(1:size(node_x,2)))
  ALLOCATE(res_temp(1:size(dofs),1))
  ALLOCATE(c_mono_diff(1:size(dofs),1))
  ALLOCATE(c_mono_iter_temp(1:size(dofs),1))
  ALLOCATE(delta_c_mono(1:size(dofs),1))
  ALLOCATE(delta_c_mono_temp(1:size(dofs)))
  ALLOCATE(ipiv(1:size(dofs)))
  ALLOCATE(work(1:size(dofs)))

! Diffusion - reaction parameters
  mono_d = 0.1d0
  d_mono = 0.1d0
  diff_mono = 0.1d0
  c_LDL_ox = 0.1d0
  c_mono_thresh = 1.d0

! Gauss-Legendre quadrature
  nqp = 2 ! Quadrature points along one direction
  call GaussLegendreQuad(nqp,quadrature)

  dofs(1:size(node_x,2)) = (/(i, i=1,size(node_x,2), 1)/)

  ! Identify nodes for boundary condition

  ALLOCATE(BC_toggle(1:size(node_x,2)))
  BC_toggle = 0
  n_BC = 0
  do i = 1, size(node_x,2)
    if (node_x(3,i).eq.0.d0) then
      BC_toggle(i) = 1
      n_BC = n_BC + 1
    end if
  end do

  ALLOCATE(BC_nodes(1:n_BC))
  count = 0
  do i = 1, size(node_x,2)
    if (BC_toggle(i).eq.1) then
      count = count + 1
      BC_nodes(count) = i
    end if
  end do


!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!                                Nonlinear systems - monocytes
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  

  ! Time step incrementation
  del_t = 0.0001d0
  nsteps = 10
  t = 0.d0

  c_mono_current = 0.d0
  c_mono_iter = 0.d0


  do n_s = 1, nsteps
    t = t + del_t
    print*,''
    print*,''
    print*,'--------------------------'
    print*,'Time step NL  = ',n_s
    print*,'Total time NL = ',t
    print*,'--------------------------'
     
  ! Apply Neumann BC
   

  !------------------------------------------------------------------------------------------------------------

  !                                                to be inserted  

  !------------------------------------------------------------------------------------------------------------


  ! Matrices assembly
    do ne = 1,size(element_node,2)

      A_e = 0.d0
      K_e = 0.d0

      do i = 1,nqp**3

        call shape_func_eval3D(quadrature(i,1),quadrature(i,2),quadrature(i,3),N)

      ! Inverse Jacobian
        do j = 1,size(N)
          X_e(j,1:3) = node_x(:,element_node(j,ne))
        end do

        call inverse_Jacobian3D(quadrature(i,1),quadrature(i,2),quadrature(i,3),X_e,Jac,invJac) 
        detJac = FindDet(Jac,3)

      ! Calculate A_e = N.N^T
        
        do j = 1,size(N)
          do k = 1,size(N)
            A_e(j,k) = A_e(j,k) + (1.d0 + mono_d + d_mono)*N(j)*N(k)*detJac*quadrature(i,4)
          end do
        end do

      ! Calculate gradient operator
        call shape_func_deriv3D(quadrature(i,1),quadrature(i,2),quadrature(i,3),invJac,B)

      ! Calculate K_e = B^T.D.B  
        K_e = K_e + matmul(B,transpose(B))*detJac*quadrature(i,4)
 
      end do

      A_global(node_set,node_set) = A_global(node_set,node_set) + A_e
      K_global(node_set,node_set) = K_global(node_set,node_set) + K_e

      ! percentage_assembly = 100.d0*(ne/size(node_x,2))
      ! print*,'Assembling system matrices: Percentage complete = ',percentage_assembly    
    end do
    
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    !                                         Newton loops

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


    iter = 0
    newton_tol = 1.0e-10
    c_mono_iter = 0.d0

    do while (err.gt.newton_tol)

      iter = iter +1
      res = 0.d0
      res_temp = 0.d0

      do ne = 1,size(element_node,2)

        res_e = 0.d0
        res_exp_e = 0.d0
        A_e = 0.d0
        node_set = element_node(:,ne)
        c_e_mono_iter = c_mono_iter(node_set)

        do i = 1,nqp**3

          call shape_func_eval3D(quadrature(i,1),quadrature(i,2),quadrature(i,3),N)

          ! Inverse Jacobian
          do j = 1,size(N)
            X_e(j,1:3) = node_x(:,element_node(j,ne))
          end do
    
          call inverse_Jacobian3D(quadrature(i,1),quadrature(i,2),quadrature(i,3),X_e,Jac,invJac) 
          detJac = FindDet(Jac,3)

          c_mono_current_gp = 0.d0
          do k = 1,size(N)
            c_mono_current_gp = c_mono_current_gp + N(k)*c_e_mono_iter(k)    
          end do
          res_e = res_e + N*c_mono_current_gp*c_LDL_ox*exp(-0.5*(c_mono_current_gp/c_mono_thresh)**2)&
                  &*detJac*quadrature(i,4)

          ! Calculate A_e = N.N^T
        
          do j = 1,size(N)
            do k = 1,size(N)
              A_e(j,k) = A_e(j,k) + (1.d0 + mono_d + d_mono)*N(j)*N(k)*detJac*quadrature(i,4)
            end do
          end do     

          res_exp_e = res_exp_e + exp(-0.5*(c_mono_current_gp/c_mono_thresh)**2)*detJac*quadrature(i,4)&
                    & *(1.d0 - (c_mono_current_gp**2)/(c_mono_thresh**2))*A_e
        end do
        
        res(node_set) = res(node_set) + res_e
        res_exp(node_set,node_set) = res_exp(node_set,node_set) + res_exp_e
      end do
      res_temp(1:size(node_x,2),1) = res(1:size(node_x,2))
      
      c_mono_diff(1:size(node_x,2),1) = c_mono_iter(1:size(node_x,2)) - c_mono_current(1:size(node_x,2))
      c_mono_iter_temp(1:size(node_x,2),1) = c_mono_iter(1:size(node_x,2))
      res_global = (1.d0/del_t)*matmul(A_global,c_mono_diff) + diff_mono*matmul(K_global,c_mono_iter_temp)&
                    & + (d_mono + mono_d)*matmul(A_global,c_mono_iter_temp) - res_temp

      jacobi_iter = ((1.d0/del_t) + d_mono + mono_d)*A_global + diff_mono*K_global-res_exp

      j_iter_inv = jacobi_iter
      p = size(jacobi_iter,1)
      ipiv = 0
      work = 0.d0
      call DGETRF(p,p,j_iter_inv,p,ipiv,info)
      call DGETRI(4,j_iter_inv,4,ipiv,work,4,info)

      delta_c_mono = matmul(j_iter_inv,-1.d0*res_global)
      delta_c_mono_temp(1:size(node_x,2)) = delta_c_mono(1:size(node_x,2),1)

      err = DOT_PRODUCT(delta_c_mono_temp,delta_c_mono_temp)

      c_mono_iter_temp = c_mono_iter_temp + delta_c_mono
      c_mono_iter = c_mono_iter_temp(1:size(node_x,2),1)

    end do
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    !                                        end of Newton loops

    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!  

  c_mono_current = c_mono_iter

  ! print*,''
  ! print*,'C_LDL'
  ! print*, c_LDL_current
  ! print*,''

  ! print*,''
  ! print*,'C_FC'
  ! print*, c_FC_current
  ! print*,''
  ! pause

  if (modulo(n_s,1).eq.0) then
    mono_strng = 'mono_conc'
    write(output_filename_mono, '(A4, A7, I3, A4)') 'out/',mono_strng, n_s,'.vtk'

    call get_unit ( output_unit )
    open ( unit = output_unit, file = output_filename_mono, status = 'replace' )
    call vtk_puvw_write ( output_unit,'Output', size(node_x,2), size(element_node,2), &
      8, node_x, element_node, c_mono_current )

    close (  unit = output_unit )

  end if
  
end do


!      
!  Free memory.
!
 DEALLOCATE (element_node, node_x, quadrature, A_global)
 DEALLOCATE (A_global,K_global,jacobi_iter,j_iter_inv)
 DEALLOCATE (res_exp,dofs,c_mono_current,c_mono_iter)
 DEALLOCATE (res_global,res,res_temp,c_mono_diff)
 DEALLOCATE (c_mono_iter_temp,delta_c_mono,delta_c_mono_temp)
 DEALLOCATE (ipiv,work)

!
!  Terminate.
!
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  Normal end of execution.'
  write ( *, '(a)' ) ' '
  call timestamp ( )

  stop

  end program
