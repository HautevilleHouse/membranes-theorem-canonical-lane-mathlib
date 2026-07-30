import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure ElasticEnergyFunctionalPackage where
  referenceDomain : Type u
  configurationSpace : Type v
  energyFunctional : configurationSpace -> ℝ
  spontaneousCurvature : ℝ
  bendingRigidity : ℝ
  tensionCoefficient : ℝ
  areaElement : configurationSpace -> ℝ
  energyFunctionalDefined : Prop
  spontaneousCurvatureSpecified : spontaneousCurvature ≠ 0
  bendingRigidityPositive : bendingRigidity > 0
  tensionCoefficientNonnegative : tensionCoefficient ≥ 0
  areaElementPositive : ∀ (c : configurationSpace), areaElement c > 0
  energyFunctionalDefinedTerm : energyFunctionalDefined

structure ElasticEnergyFunctionalEvidence (E : ElasticEnergyFunctionalPackage) where
  energyFunctionalDefinedClosed : E.energyFunctionalDefined
  spontaneousCurvatureSpecifiedClosed : E.spontaneousCurvatureSpecified
  bendingRigidityPositiveClosed : E.bendingRigidityPositive
  tensionCoefficientNonnegativeClosed : E.tensionCoefficientNonnegative
  areaElementPositiveClosed : E.areaElementPositive

def ElasticEnergyFunctionalClosed (E : ElasticEnergyFunctionalPackage) : Prop :=
  E.energyFunctionalDefined ∧ E.spontaneousCurvatureSpecified ∧
  E.bendingRigidityPositive ∧ E.tensionCoefficientNonnegative ∧
  ∀ (c : E.configurationSpace), E.areaElement c > 0

theorem elastic_energy_functional_closed_from_evidence (E : ElasticEnergyFunctionalPackage)
    (Ev : ElasticEnergyFunctionalEvidence E) : ElasticEnergyFunctionalClosed E := by
  exact And.intro Ev.energyFunctionalDefinedClosed
    (And.intro Ev.spontaneousCurvatureSpecifiedClosed
      (And.intro Ev.bendingRigidityPositiveClosed
        (And.intro Ev.tensionCoefficientNonnegativeClosed
          (fun c => Ev.areaElementPositiveClosed c))))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
