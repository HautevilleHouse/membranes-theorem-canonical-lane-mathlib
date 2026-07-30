import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MembranesTheoremCanonicalLaneLean.ShapeEquation

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure PhaseSeparationPackage {M : MembraneElasticityPackage} {E : MembraneElasticityEvidence M} {C : CanhamHelfrichEnergyPackage E} {Ev : CanhamHelfrichEnergyEvidence C} {S : ShapeEquationPackage Ev} (Sev : ShapeEquationEvidence S) where
  lipidCompositionField : Type u
  lineTension : Type v
  domainFormation : Prop
  lineTensionPositive : Prop
  compositionCoupling : Prop
  domainFormationClosed : domainFormation
  lineTensionPositiveClosed : lineTensionPositive
  compositionCouplingClosed : compositionCoupling

structure PhaseSeparationEvidence {M : MembraneElasticityPackage} {E : MembraneElasticityEvidence M} {C : CanhamHelfrichEnergyPackage E} {Ev : CanhamHelfrichEnergyEvidence C} {S : ShapeEquationPackage Ev} {Sev : ShapeEquationEvidence S} (P : PhaseSeparationPackage Sev) where
  domainFormationClosedClosed : P.domainFormationClosed
  lineTensionPositiveClosedClosed : P.lineTensionPositiveClosed
  compositionCouplingClosedClosed : P.compositionCouplingClosed

def PhaseSeparationClosed {M : MembraneElasticityPackage} {E : MembraneElasticityEvidence M} {C : CanhamHelfrichEnergyPackage E} {Ev : CanhamHelfrichEnergyEvidence C} {S : ShapeEquationPackage Ev} {Sev : ShapeEquationEvidence S} (P : PhaseSeparationPackage Sev) : Prop :=
  P.domainFormation ∧ P.lineTensionPositive ∧ P.compositionCoupling

theorem phase_separation_closed_from_evidence {M : MembraneElasticityPackage} {E : MembraneElasticityEvidence M} {C : CanhamHelfrichEnergyPackage E} {Ev : CanhamHelfrichEnergyEvidence C} {S : ShapeEquationPackage Ev} {Sev : ShapeEquationEvidence S} (P : PhaseSeparationPackage Sev) (Pev : PhaseSeparationEvidence P) : PhaseSeparationClosed P := by
  exact And.intro Pev.domainFormationClosedClosed (And.intro Pev.lineTensionPositiveClosedClosed Pev.compositionCouplingClosedClosed)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
