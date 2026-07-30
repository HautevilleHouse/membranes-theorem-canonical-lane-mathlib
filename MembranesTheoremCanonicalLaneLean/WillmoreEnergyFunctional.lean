import MembranesTheoremCanonicalLaneLean.MembraneMetricStructure

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure WillmoreEnergyPackage {M : MembraneMetricPackage} (W : MembraneMetricEvidence M) where
  willmoreFunctional : Type u
  eulerLagrangeEquation : Prop
  criticalPointCondition : Prop
  conformalInvariance : Prop
  lowerBound : Prop

structure WillmoreEnergyEvidence {M : MembraneMetricPackage} {W : MembraneMetricEvidence M} (E : WillmoreEnergyPackage W) where
  eulerLagrangeEquationClosed : E.eulerLagrangeEquation
  criticalPointConditionClosed : E.criticalPointCondition
  conformalInvarianceClosed : E.conformalInvariance
  lowerBoundClosed : E.lowerBound

def WillmoreEnergyClosed {M : MembraneMetricPackage} {W : MembraneMetricEvidence M} (E : WillmoreEnergyPackage W) : Prop :=
  E.eulerLagrangeEquation ∧ E.criticalPointCondition ∧ E.conformalInvariance ∧ E.lowerBound

theorem willmore_energy_closed_from_evidence {M : MembraneMetricPackage} {W : MembraneMetricEvidence M} (E : WillmoreEnergyPackage W) (Ev : WillmoreEnergyEvidence E) : WillmoreEnergyClosed E := by
  exact And.intro Ev.eulerLagrangeEquationClosed
    (And.intro Ev.criticalPointConditionClosed
      (And.intro Ev.conformalInvarianceClosed Ev.lowerBoundClosed))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse