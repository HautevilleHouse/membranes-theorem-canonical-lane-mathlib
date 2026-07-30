import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MembranesTheoremCanonicalLaneLean.MembraneAdmissibleClass

namespace HautevilleHouse
namespace MembranesTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MembranesWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end MembranesTheoremCanonicalLaneLean
end HautevilleHouse
