import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MembranesTheoremCanonicalLaneLean.PhaseSeparation

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MembranesAdmittedObject where
  membraneType : Type u
  topology : TopologicalSpace membraneType
  closedMembrane : Prop
  shapeEnergyMinimized : Prop
  phaseSeparated : Prop
  conclusion : shapeEnergyMinimized ∧ phaseSeparated

structure MembranesEndgameState where
  object : MembranesAdmittedObject

def MembranesWitnessClosed (O : MembranesAdmittedObject) : Prop :=
  O.conclusion

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
