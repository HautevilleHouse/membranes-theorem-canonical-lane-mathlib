import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MembranesTheoremCanonicalLaneLean.MembraneElasticity

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure CanhamHelfrichEnergyPackage {M : MembraneElasticityPackage} (E : MembraneElasticityEvidence M) where
  bendingEnergy : Type u
  gaussianEnergy : Type v
  totalEnergy : Type w
  bendingEnergyClosed : Prop
  gaussianEnergyClosed : Prop
  totalEnergyClosed : Prop

structure CanhamHelfrichEnergyEvidence {M : MembraneElasticityPackage} {E : MembraneElasticityEvidence M} (C : CanhamHelfrichEnergyPackage E) where
  bendingEnergyClosedClosed : C.bendingEnergyClosed
  gaussianEnergyClosedClosed : C.gaussianEnergyClosed
  totalEnergyClosedClosed : C.totalEnergyClosed

def CanhamHelfrichEnergyClosed {M : MembraneElasticityPackage} {E : MembraneElasticityEvidence M} (C : CanhamHelfrichEnergyPackage E) : Prop :=
  C.bendingEnergyClosed ∧ C.gaussianEnergyClosed ∧ C.totalEnergyClosed

theorem canham_helfrich_energy_closed_from_evidence {M : MembraneElasticityPackage} {E : MembraneElasticityEvidence M} (C : CanhamHelfrichEnergyPackage E) (Ev : CanhamHelfrichEnergyEvidence C) : CanhamHelfrichEnergyClosed C := by
  exact And.intro Ev.bendingEnergyClosedClosed (And.intro Ev.gaussianEnergyClosedClosed Ev.totalEnergyClosedClosed)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
