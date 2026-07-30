import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MembraneElasticityPackage where
  surface : Type u
  topology : TopologicalSpace surface
  metric : Type v
  curvatureTensor : Type w
  bendingEnergyFunctional : Prop
  shapeOperatorDefined : Prop
  stressResultantsBalanced : Prop
  boundaryConditionsCompatible : Prop

structure MembraneElasticityEvidence (E : MembraneElasticityPackage) where
  bendingEnergyFunctionalClosed : E.bendingEnergyFunctional
  shapeOperatorDefinedClosed : E.shapeOperatorDefined
  stressResultantsBalancedClosed : E.stressResultantsBalanced
  boundaryConditionsCompatibleClosed : E.boundaryConditionsCompatible

def MembraneElasticityClosed (E : MembraneElasticityPackage) : Prop :=
  E.bendingEnergyFunctional ∧ E.shapeOperatorDefined ∧
  E.stressResultantsBalanced ∧ E.boundaryConditionsCompatible

theorem membrane_elasticity_closed_from_evidence
    (E : MembraneElasticityPackage) (Ev : MembraneElasticityEvidence E) :
    MembraneElasticityClosed E := by
  exact And.intro Ev.bendingEnergyFunctionalClosed
    (And.intro Ev.shapeOperatorDefinedClosed
      (And.intro Ev.stressResultantsBalancedClosed Ev.boundaryConditionsCompatibleClosed))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
