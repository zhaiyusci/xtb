module xtb_efei
    use xtb_mctc_accuracy, only : wp
    use xtb_type_environment
    use xtb_type_molecule
    use xtb_type_restart
    use xtb_type_calculator
    use xtb_type_data
    use xtb_type_pcem
    use xtb_setparam, only : set
    implicit none
    public :: efeiEnGrad
    private
 
 contains
 subroutine efeiEnGrad(mol, energy, gradient)
    implicit none
   !> Molecular structure data
   type(TMolecule), intent(in) :: mol

   !> Molecular gradient
   real(wp), intent(inout) :: gradient(:, :)

   !> Repulsion energy
   real(wp), intent(inout) :: energy

   real(wp) :: r12(3)
   real(wp) :: r
   real(wp) :: force
   integer :: atom1, atom2
   atom1 = set%efei_atom1
   atom2 = set%efei_atom2
   force = set%efei_force /82.38723498284646_wp


   r12 = mol%xyz(:,atom2) - mol%xyz(:,atom1)
   r =  norm2(r12)

   energy = -r*force
   gradient(:, atom1) = gradient(:, atom1)+r12 * force/r
   gradient(:, atom2) = gradient(:, atom2)-r12 * force/r
 end subroutine efeiEnGrad
 end module xtb_efei
