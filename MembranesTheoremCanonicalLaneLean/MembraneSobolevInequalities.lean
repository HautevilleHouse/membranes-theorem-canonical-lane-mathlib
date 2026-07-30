import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MembraneSobolevInequalitiesPackage where
  functionSpace : Type u
  norm : Type v
  sobolevEmbedding : Prop
  traceInequality : Prop
  compactnessProperty : Prop

structure MembraneSobolevInequalitiesEvidence (S : MembraneSobolevInequalitiesPackage) where
  sobolevEmbeddingClosed : S.sobolevEmbedding
  traceInequalityClosed : S.traceInequality
  compactnessPropertyClosed : S.compactnessProperty

def MembraneSobolevInequalitiesClosed (S : MembraneSobolevInequalitiesPackage) : Prop :=
  S.sobolevEmbedding ∧ S.traceInequality ∧ S.compactnessProperty

theorem membrane_sobolev_inequalities_closed_from_evidence
    (S : MembraneSobolevInequalitiesPackage) (Ev : MembraneSobolevInequalitiesEvidence S) :
    MembraneSobolevInequalitiesClosed S := by
  exact And.intro Ev.sobolevEmbeddingClosed
    (And.intro Ev.traceInequalityClosed Ev.compactnessPropertyClosed)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
