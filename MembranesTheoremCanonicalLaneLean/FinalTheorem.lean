import MembranesTheoremCanonicalLaneLean.AdmissibleClass
import MembranesTheoremCanonicalLaneLean.BridgeLemmas
import MembranesTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

def ConstrainedMembraneClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_membrane_endgame (A : AdmissibleClass) : ConstrainedMembraneClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse