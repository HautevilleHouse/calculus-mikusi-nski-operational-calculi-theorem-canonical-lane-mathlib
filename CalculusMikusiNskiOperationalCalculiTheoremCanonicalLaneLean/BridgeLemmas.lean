import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  MikusiNskiWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse