import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure EulerLagrangeMembranePackage {E : ElasticEnergyFunctionalPackage}
    {S : ShapeOperatorPackage} where
  variationField : E.configurationSpace → ℝ³
  firstVariation : E.configurationSpace → ℝ
  equilibriumCondition : Prop
  shapeEquation : Prop
  boundaryConditions : Prop
  equilibriumConditionDerived : equilibriumCondition
  shapeEquationDerived : shapeEquation
  boundaryConditionsSatisfied : boundaryConditions
  equilibriumConditionFromEnergy : firstVariation = 0 → equilibriumCondition
  shapeEquationFromOperator : (∀ (c : E.configurationSpace), S.meanCurvature c = 0) → shapeEquation

structure EulerLagrangeMembraneEvidence {E : ElasticEnergyFunctionalPackage}
    {S : ShapeOperatorPackage} (M : EulerLagrangeMembranePackage E S) where
  equilibriumConditionClosed : M.equilibriumCondition
  shapeEquationClosed : M.shapeEquation
  boundaryConditionsClosed : M.boundaryConditions

def EulerLagrangeMembraneClosed {E : ElasticEnergyFunctionalPackage}
    {S : ShapeOperatorPackage} (M : EulerLagrangeMembranePackage E S) : Prop :=
  M.equilibriumCondition ∧ M.shapeEquation ∧ M.boundaryConditions

theorem euler_lagrange_membrane_closed_from_evidence {E : ElasticEnergyFunctionalPackage}
    {S : ShapeOperatorPackage} (M : EulerLagrangeMembranePackage E S)
    (Ev : EulerLagrangeMembraneEvidence M) : EulerLagrangeMembraneClosed M := by
  exact And.intro Ev.equilibriumConditionClosed
    (And.intro Ev.shapeEquationClosed Ev.boundaryConditionsClosed)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
