import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure AreaFunctionalPackage where
  ambientManifold : Type u
  metric : Type v
  volumeForm : Type w
  variationFormula : Prop
  firstVariation : Prop
  stabilityCondition : Prop

structure AreaFunctionalEvidence (A : AreaFunctionalPackage) where
  variationFormulaClosed : A.variationFormula
  firstVariationClosed : A.firstVariation
  stabilityConditionClosed : A.stabilityCondition

def AreaFunctionalClosed (A : AreaFunctionalPackage) : Prop :=
  A.variationFormula ∧ A.firstVariation ∧ A.stabilityCondition

theorem area_functional_closed_from_evidence
    (A : AreaFunctionalPackage) (E : AreaFunctionalEvidence A) :
    AreaFunctionalClosed A := by
  exact And.intro E.variationFormulaClosed
    (And.intro E.firstVariationClosed E.stabilityConditionClosed)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
