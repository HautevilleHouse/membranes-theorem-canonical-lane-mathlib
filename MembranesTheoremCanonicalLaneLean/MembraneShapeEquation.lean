import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MembraneShapeEquationPackage where
  surfaceType : Type u
  topology : TopologicalSpace surfaceType
  pressureField : Type v
  tensionCoefficient : Prop
  curvatureRelation : Prop
  equilibriumCondition : Prop
  boundaryCondition : Prop

structure MembraneShapeEquationEvidence (M : MembraneShapeEquationPackage) where
  pressureFieldClosed : M.pressureField
  tensionCoefficientClosed : M.tensionCoefficient
  curvatureRelationClosed : M.curvatureRelation
  equilibriumConditionClosed : M.equilibriumCondition
  boundaryConditionClosed : M.boundaryCondition

def MembraneShapeEquationClosed (M : MembraneShapeEquationPackage) : Prop :=
  M.pressureField ∧ M.tensionCoefficient ∧ M.curvatureRelation ∧
  M.equilibriumCondition ∧ M.boundaryCondition

theorem membrane_shape_equation_closed_from_evidence
    (M : MembraneShapeEquationPackage) (Ev : MembraneShapeEquationEvidence M) :
    MembraneShapeEquationClosed M := by
  exact And.intro Ev.pressureFieldClosed
    (And.intro Ev.tensionCoefficientClosed
      (And.intro Ev.curvatureRelationClosed
        (And.intro Ev.equilibriumConditionClosed Ev.boundaryConditionClosed)))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
