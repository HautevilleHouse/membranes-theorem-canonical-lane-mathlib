import MembranesTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MembraneMetricPackage where
  surfaceType : Type u
  metricField : Type v
  meanCurvature : Type w
  gaussianCurvature : Type x
  smoothSurface : Prop
  metricSmooth : Prop
  meanCurvatureDefined : Prop
  gaussianCurvatureDefined : Prop
  membraneTension : Prop

structure MembraneMetricEvidence (M : MembraneMetricPackage) where
  smoothSurfaceClosed : M.smoothSurface
  metricSmoothClosed : M.metricSmooth
  meanCurvatureDefinedClosed : M.meanCurvatureDefined
  gaussianCurvatureDefinedClosed : M.gaussianCurvatureDefined
  membraneTensionClosed : M.membraneTension

def MembraneMetricClosed (M : MembraneMetricPackage) : Prop :=
  M.smoothSurface ∧ M.metricSmooth ∧ M.meanCurvatureDefined ∧ M.gaussianCurvatureDefined ∧ M.membraneTension

theorem membrane_metric_closed_from_evidence (M : MembraneMetricPackage) (E : MembraneMetricEvidence M) : MembraneMetricClosed M := by
  exact And.intro E.smoothSurfaceClosed
    (And.intro E.metricSmoothClosed
      (And.intro E.meanCurvatureDefinedClosed
        (And.intro E.gaussianCurvatureDefinedClosed E.membraneTensionClosed)))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse