import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MountainPassLemmaPackage where
  ambientSpace : Type u
  functional : Type v
  criticalPoints : Type w
  compactnessCondition : Prop
  linkingCondition : Prop
  existence : Prop

structure MountainPassLemmaEvidence (M : MountainPassLemmaPackage) where
  compactnessConditionClosed : M.compactnessCondition
  linkingConditionClosed : M.linkingCondition
  existenceClosed : M.existence

def MountainPassLemmaClosed (M : MountainPassLemmaPackage) : Prop :=
  M.compactnessCondition ∧ M.linkingCondition ∧ M.existence

theorem mountain_pass_lemma_closed_from_evidence
    (M : MountainPassLemmaPackage) (E : MountainPassLemmaEvidence M) :
    MountainPassLemmaClosed M := by
  exact And.intro E.compactnessConditionClosed
    (And.intro E.linkingConditionClosed E.existenceClosed)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
