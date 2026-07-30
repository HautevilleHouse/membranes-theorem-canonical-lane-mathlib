import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure SchoenSimonRegularityPackage where
  surfaceClass : Type u
  energyFunctional : Type v
  epsilonRegularity : Prop
  decayLemma : Prop
  fullRegularity : Prop

structure SchoenSimonRegularityEvidence (S : SchoenSimonRegularityPackage) where
  epsilonRegularityClosed : S.epsilonRegularity
  decayLemmaClosed : S.decayLemma
  fullRegularityClosed : S.fullRegularity

def SchoenSimonRegularityClosed (S : SchoenSimonRegularityPackage) : Prop :=
  S.epsilonRegularity ∧ S.decayLemma ∧ S.fullRegularity

theorem schoen_simon_regularity_closed_from_evidence
    (S : SchoenSimonRegularityPackage) (E : SchoenSimonRegularityEvidence S) :
    SchoenSimonRegularityClosed S := by
  exact And.intro E.epsilonRegularityClosed
    (And.intro E.decayLemmaClosed E.fullRegularityClosed)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
