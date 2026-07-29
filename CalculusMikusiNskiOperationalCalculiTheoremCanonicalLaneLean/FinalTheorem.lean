import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.BridgeLemmas
import CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

def ConstrainedMikusińskiOperationalCalculiClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_mikusiński_operational_calculi_endgame (A : AdmissibleClass) :
    ConstrainedMikusińskiOperationalCalculiClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse