import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MinimizationPrinciplePackage where
  energyFunctional : Type u
  boundaryConditions : Type v
  existenceMinimizer : Prop
  eulerLagrangeDerived : Prop
  regularitySolution : Prop

structure MinimizationPrincipleEvidence (M : MinimizationPrinciplePackage) where
  existenceMinimizerClosed : M.existenceMinimizer
  eulerLagrangeDerivedClosed : M.eulerLagrangeDerived
  regularitySolutionClosed : M.regularitySolution

def MinimizationPrincipleClosed (M : MinimizationPrinciplePackage) : Prop :=
  M.existenceMinimizer ∧ M.eulerLagrangeDerived ∧ M.regularitySolution

theorem minimization_principle_closed_from_evidence (M : MinimizationPrinciplePackage) (E : MinimizationPrincipleEvidence M) : MinimizationPrincipleClosed M := by
  exact And.intro E.existenceMinimizerClosed (And.intro E.eulerLagrangeDerivedClosed E.regularitySolutionClosed)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse