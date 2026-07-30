import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MembranesTheoremCanonicalLaneLean.CanhamHelfrichEnergy

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure ShapeEquationPackage {M : MembraneElasticityPackage} {E : MembraneElasticityEvidence M} {C : CanhamHelfrichEnergyPackage E} (Ev : CanhamHelfrichEnergyEvidence C) where
  equilibriumCondition : Prop
  eulerLagrangeEquation : Prop
  boundaryConditions : Prop
  equilibriumConditionClosed : equilibriumCondition
  eulerLagrangeEquationClosed : eulerLagrangeEquation
  boundaryConditionsClosed : boundaryConditions

structure ShapeEquationEvidence {M : MembraneElasticityPackage} {E : MembraneElasticityEvidence M} {C : CanhamHelfrichEnergyPackage E} {Ev : CanhamHelfrichEnergyEvidence C} (S : ShapeEquationPackage Ev) where
  equilibriumConditionClosedClosed : S.equilibriumConditionClosed
  eulerLagrangeEquationClosedClosed : S.eulerLagrangeEquationClosed
  boundaryConditionsClosedClosed : S.boundaryConditionsClosed

def ShapeEquationClosed {M : MembraneElasticityPackage} {E : MembraneElasticityEvidence M} {C : CanhamHelfrichEnergyPackage E} {Ev : CanhamHelfrichEnergyEvidence C} (S : ShapeEquationPackage Ev) : Prop :=
  S.equilibriumCondition ∧ S.eulerLagrangeEquation ∧ S.boundaryConditions

theorem shape_equation_closed_from_evidence {M : MembraneElasticityPackage} {E : MembraneElasticityEvidence M} {C : CanhamHelfrichEnergyPackage E} {Ev : CanhamHelfrichEnergyEvidence C} (S : ShapeEquationPackage Ev) (Sev : ShapeEquationEvidence S) : ShapeEquationClosed S := by
  exact And.intro Sev.equilibriumConditionClosedClosed (And.intro Sev.eulerLagrangeEquationClosedClosed Sev.boundaryConditionsClosedClosed)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
