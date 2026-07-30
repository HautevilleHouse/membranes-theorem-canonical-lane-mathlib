import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure StabilityAnalysisPackage where
  perturbationNorm : Type u
  linearizedOperator : Type v
  spectralGap : Prop
  bifurcationDetected : Prop
  nonlinearStabilityRegion : Prop

structure StabilityAnalysisEvidence (S : StabilityAnalysisPackage) where
  spectralGapClosed : S.spectralGap
  bifurcationDetectedClosed : S.bifurcationDetected
  nonlinearStabilityRegionClosed : S.nonlinearStabilityRegion

def StabilityAnalysisClosed (S : StabilityAnalysisPackage) : Prop :=
  S.spectralGap ∧ S.bifurcationDetected ∧ S.nonlinearStabilityRegion

theorem stability_analysis_closed_from_evidence (S : StabilityAnalysisPackage) (E : StabilityAnalysisEvidence S) : StabilityAnalysisClosed S := by
  exact And.intro E.spectralGapClosed (And.intro E.bifurcationDetectedClosed E.nonlinearStabilityRegionClosed)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse