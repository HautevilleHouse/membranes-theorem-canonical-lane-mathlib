import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure AsymptoticExpansionPackage where
  reducedDimension : Type u
  asymptoticModel : Type v
  scalingLawDerived : Prop
  limitSystemWellPosed : Prop
  correctionTerms : Prop

structure AsymptoticExpansionEvidence (A : AsymptoticExpansionPackage) where
  scalingLawDerivedClosed : A.scalingLawDerived
  limitSystemWellPosedClosed : A.limitSystemWellPosed
  correctionTermsClosed : A.correctionTerms

def AsymptoticExpansionClosed (A : AsymptoticExpansionPackage) : Prop :=
  A.scalingLawDerived ∧ A.limitSystemWellPosed ∧ A.correctionTerms

theorem asymptotic_expansion_closed_from_evidence (A : AsymptoticExpansionPackage) (E : AsymptoticExpansionEvidence A) : AsymptoticExpansionClosed A := by
  exact And.intro E.scalingLawDerivedClosed (And.intro E.limitSystemWellPosedClosed E.correctionTermsClosed)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse