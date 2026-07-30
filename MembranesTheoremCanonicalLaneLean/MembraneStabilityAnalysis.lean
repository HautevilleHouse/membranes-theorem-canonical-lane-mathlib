import MembranesTheoremCanonicalLaneLean.WillmoreEnergyFunctional

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MembraneStabilityPackage {M : MembraneMetricPackage} {W : MembraneMetricEvidence M} {E : WillmoreEnergyPackage W} (F : WillmoreEnergyEvidence E) where
  secondVariation : Prop
  jacobiOperator : Prop
  stabilityCondition : Prop
  morseIndex : Prop

structure MembraneStabilityEvidence {M : MembraneMetricPackage} {W : MembraneMetricEvidence M} {E : WillmoreEnergyPackage W} {F : WillmoreEnergyEvidence E} (S : MembraneStabilityPackage F) where
  secondVariationClosed : S.secondVariation
  jacobiOperatorClosed : S.jacobiOperator
  stabilityConditionClosed : S.stabilityCondition
  morseIndexClosed : S.morseIndex

def MembraneStabilityClosed {M : MembraneMetricPackage} {W : MembraneMetricEvidence M} {E : WillmoreEnergyPackage W} {F : WillmoreEnergyEvidence E} (S : MembraneStabilityPackage F) : Prop :=
  S.secondVariation ∧ S.jacobiOperator ∧ S.stabilityCondition ∧ S.morseIndex

theorem membrane_stability_closed_from_evidence {M : MembraneMetricPackage} {W : MembraneMetricEvidence M} {E : WillmoreEnergyPackage W} {F : WillmoreEnergyEvidence E} (S : MembraneStabilityPackage F) (Ev : MembraneStabilityEvidence S) : MembraneStabilityClosed S := by
  exact And.intro Ev.secondVariationClosed
    (And.intro Ev.jacobiOperatorClosed
      (And.intro Ev.stabilityConditionClosed Ev.morseIndexClosed))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse