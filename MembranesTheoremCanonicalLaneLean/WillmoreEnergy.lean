import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure WillmoreEnergyPackage where
  surface : Type u
  topology : TopologicalSpace surface
  meanCurvature : Type v
  willmoreFunctional : Prop
  conformalInvariance : Prop
  criticalPointCondition : Prop
  energyLowerBound : Prop

structure WillmoreEnergyEvidence (W : WillmoreEnergyPackage) where
  willmoreFunctionalClosed : W.willmoreFunctional
  conformalInvarianceClosed : W.conformalInvariance
  criticalPointConditionClosed : W.criticalPointCondition
  energyLowerBoundClosed : W.energyLowerBound

def WillmoreEnergyClosed (W : WillmoreEnergyPackage) : Prop :=
  W.willmoreFunctional ∧ W.conformalInvariance ∧
  W.criticalPointCondition ∧ W.energyLowerBound

theorem willmore_energy_closed_from_evidence
    (W : WillmoreEnergyPackage) (Ev : WillmoreEnergyEvidence W) :
    WillmoreEnergyClosed W := by
  exact And.intro Ev.willmoreFunctionalClosed
    (And.intro Ev.conformalInvarianceClosed
      (And.intro Ev.criticalPointConditionClosed Ev.energyLowerBoundClosed))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
