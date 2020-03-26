! Standalone code for low-density-lipoprotein and foam-cell reaction-diffusion system

! Author: Kiran Manjunatha, IFAM, RWTH Aachen University


include 'mesh_read_in.f90'
include 'fem_tools.f90'
include 'vtk_io.f90'

program reac_diffuse

  use mesh_data
  use fem_tools

  implicit none

  character ( len = 255 ) prefix
  DOUBLE PRECISION, ALLOCATABLE :: node_x(:,:)
  INTEGER, ALLOCATABLE :: element_node(:,:)
  integer :: nqp, i, j, k, ne, node_set(8), n_s, nsteps, n_BC 
  integer, allocatable :: BC_nodes(:), BC_toggle(:)
  DOUBLE PRECISION, ALLOCATABLE :: quadrature(:,:)
  INTEGER, ALLOCATABLE :: dofs(:), free_dofs(:), ipiv(:), ipiv2(:)
  DOUBLE PRECISION :: N(8), A_e(8,8), B(8,3), Jac(3,3), invJac(3,3), X_e(8,3)
  DOUBLE PRECISION :: K_e_LDL(8,8), K_e_FC(8,8)
  DOUBLE PRECISION :: R_e_LDL(8,8), R_e_FC(8,8)
  DOUBLE PRECISION :: diff_coeff_LDL, diff_coeff_FC, gamma_LDL, c_LDL_thresh, degradation_rate_LDL
  DOUBLE PRECISION :: detJac, del_t, t, kron, tol
  DOUBLE PRECISION, ALLOCATABLE :: A_global(:,:), K_LDL_global(:,:), K_FC_global(:,:)
  DOUBLE PRECISION, ALLOCATABLE :: R_LDL_global(:,:), R_FC_global(:,:)
  DOUBLE PRECISION, ALLOCATABLE :: A_free(:,:), K_LDL_free(:,:), K_FC_free(:,:)
  DOUBLE PRECISION, ALLOCATABLE :: R_LDL_free(:,:), R_FC_free(:,:)
  DOUBLE PRECISION, ALLOCATABLE :: c_LDL_current(:),c_FC_current(:),c_LDL_next(:),c_FC_next(:)
  DOUBLE PRECISION, ALLOCATABLE :: E_global_LDL_free(:,:), E_global_FC_free(:,:)
  DOUBLE PRECISION, ALLOCATABLE :: E_inv_LDL(:,:), E_inv_FC(:,:)
  DOUBLE PRECISION, ALLOCATABLE :: E_global_LDL(:,:), E_global_FC(:,:) 
  DOUBLE PRECISION, ALLOCATABLE :: c_bar_LDL(:,:),c_bar_FC(:,:), c_bar_mod_LDL(:,:), c_bar_mod_FC(:,:)
  INTEGER :: p, p2, info, info2, a, bb 
  DOUBLE PRECISION, ALLOCATABLE :: work(:), work2(:)
  integer ( kind = 4 ) output_unit, count
  character ( len = 255 ) ::  output_filename_FC, output_filename_LDL, FC_strng, LDL_strng
  real*8 percentage_assembly

  !INTEGER :: n_constituents

! Mesh input  
  prefix = 'in/5' ! file names would be 'prefix'_nodes.txt and 'prefix'_elements.txt 
  call read_mesh_data(prefix,element_node,node_x)

  ALLOCATE(A_global(1:size(node_x,2),1:size(node_x,2)))
  ALLOCATE(K_LDL_global(1:size(node_x,2),1:size(node_x,2)))
  ALLOCATE(K_FC_global(1:size(node_x,2),1:size(node_x,2)))
  ALLOCATE(R_LDL_global(1:size(node_x,2),1:size(node_x,2)))
  ALLOCATE(R_FC_global(1:size(node_x,2),1:size(node_x,2)))

  ALLOCATE(c_LDL_current(1:size(node_x,2)))
  ALLOCATE(c_LDL_next(1:size(node_x,2)))
  ALLOCATE(c_FC_current(1:size(node_x,2)))
  ALLOCATE(c_FC_next(1:size(node_x,2)))
  ALLOCATE(dofs(1:size(node_x,2)))

! Diffusion - reaction parameters

  diff_coeff_LDL = 5.4e-3
  diff_coeff_FC = 0.0d0 
  degradation_rate_LDL = 1.d0
  gamma_LDL = 0.d0
  c_LDL_thresh = 2.0e-6

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

  ! BC_nodes = (/41, 42, 43, 44, 45,&
  !              86, 87, 88, 89, 90, &
  !              131, 132, 133, 134, 135, &
  !              176, 177, 178, 179, 180, &
  !              221, 222, 223, 224, 225/)

  ! BC_nodes = (/(i, i=833,858, 1)/)
!  BC_nodes = (/1, 2, 3, 4/)

  ALLOCATE(free_dofs(1:(size(node_x,2) - size(BC_nodes))))
  free_dofs = pack(dofs, [(all(BC_nodes /= dofs(i)), i=1, size(dofs))])
  
  ALLOCATE(A_free(1:size(free_dofs),1:size(free_dofs)))
  ALLOCATE(K_LDL_free(1:size(free_dofs),1:size(free_dofs)))
  ALLOCATE(K_FC_free(1:size(free_dofs),1:size(free_dofs)))
  ALLOCATE(R_LDL_free(1:size(free_dofs),1:size(free_dofs)))
  ALLOCATE(R_FC_free(1:size(free_dofs),1:size(free_dofs)))
  ALLOCATE(E_global_LDL(1:size(dofs),1:size(dofs)))
  ALLOCATE(E_global_FC(1:size(dofs),1:size(dofs)))
  ALLOCATE(E_global_LDL_free(1:size(free_dofs),1:size(free_dofs)))
  ALLOCATE(E_global_FC_free(1:size(dofs),1:size(dofs)))
  ALLOCATE(E_inv_LDL(1:size(free_dofs),1:size(free_dofs)))
  ALLOCATE(E_inv_FC(1:size(dofs),1:size(dofs)))
  ALLOCATE(c_bar_LDL(1:size(dofs),1))
  ALLOCATE(c_bar_FC(1:size(dofs),1))
  ALLOCATE(c_bar_mod_LDL(1:size(dofs),1))
  ALLOCATE(c_bar_mod_FC(1:size(dofs),1))

  ALLOCATE(ipiv(1:size(free_dofs)))
  ALLOCATE(work(1:size(free_dofs)))
  ALLOCATE(ipiv2(1:size(dofs)))
  ALLOCATE(work2(1:size(dofs)))

  ! Time step incrementation
  del_t = 0.0001d0
  nsteps = 10
  
  c_LDL_current = 0.d0
  c_FC_current = 0.d0
  do n_s = 1, nsteps
    t = t + del_t
    print*,''
    print*,''
    print*,'--------------------------'
    print*,'Time step  = ',n_s
    print*,'Total time = ',t
    print*,'--------------------------'
    
  ! Apply Dirichlet BC
    c_LDL_current(BC_nodes) = 0.01d0

    A_global = 0.d0
    K_LDL_global = 0.d0
    K_FC_global = 0.d0
    R_LDL_global = 0.d0
    R_FC_global = 0.d0

  ! Stiffness matrix assembly
    do ne = 1,size(element_node,2)

      A_e = 0.d0
      R_e_LDL = 0.d0
      K_e_LDL = 0.d0
      R_e_FC = 0.d0
      K_e_FC = 0.d0
      node_set = element_node(:,ne)

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
            A_e(j,k) = A_e(j,k) + N(j)*N(k)*detJac*quadrature(i,4)
          end do
        end do

      ! Calculate gradient operator
        call shape_func_deriv3D(quadrature(i,1),quadrature(i,2),quadrature(i,3),invJac,B)

      ! Calculate K_e = B^T.D.B  
        K_e_LDL = K_e_LDL + del_t*diff_coeff_LDL*matmul(B,transpose(B))*detJac*quadrature(i,4)
        K_e_FC = K_e_FC + del_t*diff_coeff_FC*matmul(B,transpose(B))*detJac*quadrature(i,4)

      ! Calculate R_e = - d_i * A_e - gamma_LDL*(A_e - c_LDL_thresh)
        tol = 0.d0
        kron = 0.d0
          do j = 1,size(N)
            do k = 1,size(N)
              ! if (c_LDL_current(k).gt.tol) then
                R_e_LDL(j,k) = R_e_LDL(j,k) - degradation_rate_LDL*(del_t)*A_e(j,k)*detJac*quadrature(i,4)
              ! end if
              if (j.eq.k) then
                kron = 1.d0
              end if
              if (c_LDL_current(k)- c_LDL_thresh.gt.tol) then
                R_e_LDL(j,k) = R_e_LDL(j,k) - gamma_LDL*((del_t)*A_e(j,k) - c_LDL_thresh*kron)*detJac*quadrature(i,4)
                R_e_FC(j,k) = R_e_FC(j,k) + gamma_LDL*((del_t)*A_e(j,k) - c_LDL_thresh*kron)*detJac*quadrature(i,4)
              end if
              kron = 0.d0
            end do
          end do
      end do

      A_global(node_set,node_set) = A_global(node_set,node_set) + A_e
      K_LDL_global(node_set,node_set) = K_LDL_global(node_set,node_set) + K_e_LDL
      K_FC_global(node_set,node_set) = K_FC_global(node_set,node_set) + K_e_FC
      R_LDL_global(node_set,node_set) = R_LDL_global(node_set,node_set) + R_e_LDL
      R_FC_global(node_set,node_set) = R_FC_global(node_set,node_set) + R_e_FC

      ! percentage_assembly = 100.d0*(ne/size(node_x,2))
      ! print*,'Assembling system matrices: Percentage complete = ',percentage_assembly    
    end do
    E_global_LDL = A_global + K_LDL_global + R_LDL_global
    E_global_FC = A_global + K_FC_global

  ! Update current concentrations
    A_free = A_global(free_dofs,free_dofs)
    K_LDL_free = K_LDL_global(free_dofs,free_dofs)
    K_FC_free =  K_FC_global(free_dofs,free_dofs)
    R_LDL_free = R_LDL_global(free_dofs,free_dofs)
    R_FC_free = R_FC_global(free_dofs,free_dofs)
    E_global_LDL_free = A_free + K_LDL_free + R_LDL_free
    E_global_FC_free = E_global_FC

    E_inv_LDL = E_global_LDL_free
    p = size(E_inv_LDL,1)
    ipiv = 0
    work = 0.d0
    call DGETRF(p,p,E_inv_LDL,p,ipiv,info)
    call DGETRI(4,E_inv_LDL,4,ipiv,work,4,info)

    do a = 1, size(dofs)
      do bb = 1, size(dofs)
        c_bar_LDL(a,1) = c_bar_LDL(a,1) + A_global(a,bb)*c_LDL_current(bb)
      end do
    end do

    c_bar_mod_LDL(1:size(dofs),1) = c_bar_LDL(1:size(dofs),1) - matmul(E_global_LDL(:,BC_nodes),c_bar_LDL(BC_nodes,1))

    c_LDL_next = c_LDL_current

    do a = 1, size(free_dofs)
      do bb = 1, size(free_dofs)
          c_LDL_next(free_dofs(bb)) = c_LDL_next(free_dofs(bb)) + E_inv_LDL(a,bb)*c_bar_mod_LDL(free_dofs(bb),1)
      end do
    end do

    do a = 1, size(dofs)
      do bb = 1, size(dofs)
        c_bar_FC(a,1) = c_bar_FC(a,1) + A_global(a,bb)*c_FC_current(bb) + R_FC_global(a,bb)*c_LDL_next(bb)
      end do
    end do

    c_bar_mod_FC(1:size(dofs),1) = c_bar_FC(1:size(dofs),1)
    c_FC_next = c_FC_current

    E_inv_FC = E_global_FC_free
    p2 = size(E_global_FC_free,1)
    ipiv2 = 0
    work2 = 0.d0
    call DGETRF(p2,p2,E_inv_FC,p2,ipiv2,info2)
    call DGETRI(p2,E_inv_FC,p2,ipiv2,work2,p2,info2)

    do a = 1, size(dofs)
      do bb = 1, size(dofs)
          c_FC_next(bb) = c_FC_next(bb) + E_inv_FC(a,bb)*c_bar_mod_FC(bb,1)
      end do
    end do

  c_LDL_current = c_LDL_next
  c_FC_current = c_FC_next

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
    LDL_strng = 'LDLconc'
    write(output_filename_LDL, '(A4, A7, I2, A4)') 'out/',LDL_strng, n_s,'.vtk'

    call get_unit ( output_unit )
    open ( unit = output_unit, file = output_filename_LDL, status = 'replace' )
    call vtk_puvw_write ( output_unit,'Output', size(node_x,2), size(element_node,2), &
      8, node_x, element_node, c_LDL_current )

    close (  unit = output_unit )
      
    FC_strng = 'FCconc'
    write(output_filename_FC, '(A4, A6, I2, A4)'), 'out/',FC_strng, n_s,'.vtk'

    call get_unit ( output_unit )
    open ( unit = output_unit, file = output_filename_FC, status = 'replace' )
    call vtk_puvw_write ( output_unit,'Output', size(node_x,2), size(element_node,2), &
      8, node_x, element_node, c_FC_current )
    close (  unit = output_unit )
  end if
  

  end do
!      
!  Free memory.
!
 DEALLOCATE (element_node, node_x, quadrature, A_global)
 DEALLOCATE (K_FC_global, K_LDL_global, R_LDL_global, R_FC_global)
 DEALLOCATE (c_LDL_current,c_LDL_next,c_FC_current,c_FC_next)
 DEALLOCATE (dofs,free_dofs,BC_nodes)
 DEALLOCATE (A_free,K_LDL_free,K_FC_free,R_LDL_free,R_FC_free)
 DEALLOCATE (E_global_LDL,E_global_FC,E_global_LDL_free,E_global_FC_free)
 DEALLOCATE (E_inv_LDL,E_inv_FC,c_bar_LDL,c_bar_FC)
 DEALLOCATE (c_bar_mod_LDL,c_bar_mod_FC,ipiv,work)

!
!  Terminate.
!
  write ( *, '(a)' ) ' '
  write ( *, '(a)' ) '  Normal end of execution.'
  write ( *, '(a)' ) ' '
  call timestamp ( )

  stop

  end program
