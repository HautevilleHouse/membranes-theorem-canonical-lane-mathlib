import MembranesTheoremCanonicalLaneLean.MembraneMetricStructure

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure SobolevInequalityPackage {M : MembraneMetricPackage} (E : MembraneMetricEvidence M) where
  sobolevSpace : Type u
  embeddingConstant : Prop
  poincareInequality : Prop
  isoperimetricInequality : Prop
  sharpConstant : Prop

structure SobolevInequalityEvidence {M : MembraneMetricPackage} {E : MembraneMetricEvidence M} (S : SobolevInequalityPackage E) where
  embeddingConstantClosed : S.embeddingConstant
  poincareInequalityClosed : S.poincareInequality
  isoperimetricInequalityClosed : S.isoperimetricInequality
  sharpConstantClosed : S.sharpConstant

def SobolevInequalityClosed {M : MembraneMetricPackage} {E : MembraneMetricEvidence M} (S : SobolevInequalityPackage E) : Prop :=
  S.embeddingConstant ∧ S.poincareInequality ∧ S.isoperimetricInequality ∧ S.sharpConstant

theorem sobolev_inequality_closed_from_evidence {M : MembraneMetricPackage} {E : MembraneMetricEvidence M} (S : SobolevInequalityPackage E) (Ev : SobolevInequalityEvidence S) : SobolevInequalityClosed S := by
  exact And.intro Ev.embeddingConstantClosed
    (And.intro Ev.poincareInequalityClosed
      (And.intro Ev.isoperimetricInequalityClosed Ev.sharpConstantClosed))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse