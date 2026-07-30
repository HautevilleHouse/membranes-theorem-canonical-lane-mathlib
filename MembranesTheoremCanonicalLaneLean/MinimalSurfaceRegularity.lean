import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MinimalSurfaceRegularityPackage where
  surfaceType : Type u
  embedding : Type v
  meanCurvature : Prop
  meanCurvatureZero : Prop
  regularityClass : Prop
  interiorRegularity : Prop
  boundaryRegularity : Prop

structure MinimalSurfaceRegularityEvidence (R : MinimalSurfaceRegularityPackage) where
  meanCurvatureZeroClosed : R.meanCurvatureZero
  regularityClassClosed : R.regularityClass
  interiorRegularityClosed : R.interiorRegularity
  boundaryRegularityClosed : R.boundaryRegularity

def MinimalSurfaceRegularityClosed (R : MinimalSurfaceRegularityPackage) : Prop :=
  R.meanCurvatureZero ∧ R.regularityClass ∧ R.interiorRegularity ∧ R.boundaryRegularity

theorem minimal_surface_regularity_closed_from_evidence
    (R : MinimalSurfaceRegularityPackage) (E : MinimalSurfaceRegularityEvidence R) :
    MinimalSurfaceRegularityClosed R := by
  exact And.intro E.meanCurvatureZeroClosed
    (And.intro E.regularityClassClosed
      (And.intro E.interiorRegularityClosed E.boundaryRegularityClosed))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
