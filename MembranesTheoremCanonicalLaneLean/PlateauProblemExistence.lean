import MembranesTheoremCanonicalLaneLean.MinimalSurfaceEquation

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure PlateauPackage {M : MembraneMetricPackage} {E : MembraneMetricEvidence M} {P : MinimalSurfacePackage E} (F : MinimalSurfaceEvidence P) where
  boundaryCurve : Type u
  interiorSurface : Type v
  boundaryCondition : Prop
  areaFunctional : Prop
  solutionExists : Prop
  uniquenessUpToSymmetry : Prop

structure PlateauEvidence {M : MembraneMetricPackage} {E : MembraneMetricEvidence M} {P : MinimalSurfacePackage E} {F : MinimalSurfaceEvidence P} (Q : PlateauPackage F) where
  boundaryConditionClosed : Q.boundaryCondition
  areaFunctionalClosed : Q.areaFunctional
  solutionExistsClosed : Q.solutionExists
  uniquenessUpToSymmetryClosed : Q.uniquenessUpToSymmetry

def PlateauClosed {M : MembraneMetricPackage} {E : MembraneMetricEvidence M} {P : MinimalSurfacePackage E} {F : MinimalSurfaceEvidence P} (Q : PlateauPackage F) : Prop :=
  Q.boundaryCondition ∧ Q.areaFunctional ∧ Q.solutionExists ∧ Q.uniquenessUpToSymmetry

theorem plateau_closed_from_evidence {M : MembraneMetricPackage} {E : MembraneMetricEvidence M} {P : MinimalSurfacePackage E} {F : MinimalSurfaceEvidence P} (Q : PlateauPackage F) (Ev : PlateauEvidence Q) : PlateauClosed Q := by
  exact And.intro Ev.boundaryConditionClosed
    (And.intro Ev.areaFunctionalClosed
      (And.intro Ev.solutionExistsClosed Ev.uniquenessUpToSymmetryClosed))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse