import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

structure MembraneSpace where
  carrier : Type
  topology : TopologicalSpace carrier
  dimension : Nat
  boundary : Set carrier

structure MembraneAdmittedObject where
  space : MembraneSpace
  compact : Prop
  orientable : Prop
  minimalSurface : Prop
  areaModel : Type
  areaTopology : TopologicalSpace areaModel
  areaFunctional : Prop
  conclusion : areaFunctional

structure MembraneEndgameState where
  object : MembraneAdmittedObject

def MembraneWitnessClosed (O : MembraneAdmittedObject) : Prop :=
  O.areaFunctional

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
