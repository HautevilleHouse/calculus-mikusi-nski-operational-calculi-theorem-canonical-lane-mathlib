import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.MikusiNskiAlgebra

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure OperationalCalculusBridge (A : MikusiNskiAlgebra) where
  convolutionRingEquiv : A.carrier ≃+* A.carrier
  convolutionPreservesIdentity : convolutionRingEquiv A.one = A.one
  convolutionPreservesZero : convolutionRingEquiv A.zero = A.zero
  convolutionPreservesAdd : ∀ a b, convolutionRingEquiv (A.add a b) = A.add (convolutionRingEquiv a) (convolutionRingEquiv b)
  convolutionPreservesMul : ∀ a b, convolutionRingEquiv (A.mul a b) = A.mul (convolutionRingEquiv a) (convolutionRingEquiv b)
  convolutionPreservesConvolution : ∀ a b, convolutionRingEquiv (A.convolution a b) = A.convolution (convolutionRingEquiv a) (convolutionRingEquiv b)
  bridgeClosedFromMikusiNski : MikusiNskiAlgebraClosed A

theorem operational_calculus_bridge_closed (A : MikusiNskiAlgebra) (B : OperationalCalculusBridge A) :
    MikusiNskiAlgebraClosed A := by
  exact B.bridgeClosedFromMikusiNski

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse