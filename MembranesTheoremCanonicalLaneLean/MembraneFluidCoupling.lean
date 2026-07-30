import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MembraneFluidCouplingPackage {E : ElasticEnergyFunctionalPackage}
    {S : ShapeOperatorPackage} where
  fluidDomain : Type u
  fluidVelocity : fluidDomain → ℝ³
  fluidPressure : fluidDomain → ℝ
  membraneForce : E.configurationSpace → ℝ³
  stokesEquation : Prop
  noSlipBoundary : Prop
  membraneFluidInterface : Prop
  stokesEquationSatisfied : stokesEquation
  noSlipBoundarySatisfied : noSlipBoundary
  membraneFluidInterfaceSatisfied : membraneFluidInterface
  forceBalance : ∀ (c : E.configurationSpace), membraneForce c = 0

structure MembraneFluidCouplingEvidence {E : ElasticEnergyFunctionalPackage}
    {S : ShapeOperatorPackage} (C : MembraneFluidCouplingPackage E S) where
  stokesEquationClosed : C.stokesEquation
  noSlipBoundaryClosed : C.noSlipBoundary
  membraneFluidInterfaceClosed : C.membraneFluidInterface
  forceBalanceClosed : ∀ (c : E.configurationSpace), C.membraneForce c = 0

def MembraneFluidCouplingClosed {E : ElasticEnergyFunctionalPackage}
    {S : ShapeOperatorPackage} (C : MembraneFluidCouplingPackage E S) : Prop :=
  C.stokesEquation ∧ C.noSlipBoundary ∧ C.membraneFluidInterface ∧
  ∀ (c : E.configurationSpace), C.membraneForce c = 0

theorem membrane_fluid_coupling_closed_from_evidence {E : ElasticEnergyFunctionalPackage}
    {S : ShapeOperatorPackage} (C : MembraneFluidCouplingPackage E S)
    (Ev : MembraneFluidCouplingEvidence C) : MembraneFluidCouplingClosed C := by
  exact And.intro Ev.stokesEquationClosed
    (And.intro Ev.noSlipBoundaryClosed
      (And.intro Ev.membraneFluidInterfaceClosed Ev.forceBalanceClosed))

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
