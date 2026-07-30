import HautevilleHouse.MembranesTheoremCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : MembranesAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  MembranesWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse