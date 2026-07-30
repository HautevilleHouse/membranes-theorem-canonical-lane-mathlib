import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure BranchedImmersionPackage where
  domain : Type u
  target : Type v
  immersion : Type w
  branchPoints : Set domain
  regularity : Prop
  areaBound : Prop

structure BranchedImmersionEvidence (B : BranchedImmersionPackage) where
  regularityClosed : B.regularity
  areaBoundClosed : B.areaBound

def BranchedImmersionClosed (B : BranchedImmersionPackage) : Prop :=
  B.regularity ∧ B.areaBound

theorem branched_immersion_closed_from_evidence
    (B : BranchedImmersionPackage) (E : BranchedImmersionEvidence B) :
    BranchedImmersionClosed B := by
  exact And.intro E.regularityClosed E.areaBoundClosed

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
