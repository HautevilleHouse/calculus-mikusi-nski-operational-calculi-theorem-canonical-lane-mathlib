import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.OperationalCalculusBridge
import CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.HeavisideFraction

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

def ConstrainedMikusiNskiClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_mikusinski_endgame (A : AdmissibleClass) :
    ConstrainedMikusiNskiClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse