import MembranesTheoremCanonicalLaneLean.MembraneMetricStructure

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MinimalSurfacePackage {M : MembraneMetricPackage} (E : MembraneMetricEvidence M) where
  meanCurvatureZero : Prop
  harmonicCoordinate : Prop
  areaMinimizingProperty : Prop
  monotonicityFormula : Prop
  regularityResult : Prop

structure MinimalSurfaceEvidence {M : MembraneMetricPackage} {E : MembraneMetricEvidence M} (P : MinimalSurfacePackage E) where
  meanCurvatureZeroClosed : P.meanCurvatureZero
  harmonicCoordinateClosed : P.harmonicCoordinate
  areaMinimizingPropertyClosed : P.areaMinimizingProperty
  monotonicityFormulaClosed : P.monotonicityFormula
  regularityResultClosed : P.regularityResult

def MinimalSurfaceClosed {M : MembraneMetricPackage} {E : MembraneMetricEvidence M} (P : MinimalSurfacePackage E) : Prop :=
  P.meanCurvatureZero ∧ P.harmonicCoordinate ∧ P.areaMinimizingProperty ∧ P.monotonicityFormula ∧ P.regularityResult

theorem minimal_surface_closed_from_evidence {M : MembraneMetricPackage} {E : MembraneMetricEvidence M} (P : MinimalSurfacePackage E) (Ev : MinimalSurfaceEvidence P) : MinimalSurfaceClosed P := by
  exact And.intro Ev.meanCurvatureZeroClosed
    (And.intro Ev.harmonicCoordinateClosed
      (And.intro Ev.areaMinimizingPropertyClosed
        (And.intro Ev.monotonicityFormulaClosed Ev.regularityResultClosed)))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse