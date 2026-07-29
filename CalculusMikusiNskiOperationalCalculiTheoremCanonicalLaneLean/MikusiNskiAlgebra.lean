import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure MikusiNskiAlgebra where
  carrier : Type u
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  convolution : carrier → carrier → carrier
  additiveCommGroup : AddCommGroup carrier
  ring : Ring carrier
  commutativeConvolution : ∀ a b, convolution a b = convolution b a
  convolutionDistributive : ∀ a b c, convolution a (add b c) = add (convolution a b) (convolution a c)
  convolutionIdentity : ∀ a, convolution a (zero : carrier) = zero
  convolutionAssociative : ∀ a b c, convolution (convolution a b) c = convolution a (convolution b c)

structure MikusiNskiAlgebraEvidence (A : MikusiNskiAlgebra) where
  additiveCommGroupClosed : AddCommGroup A.carrier
  ringClosed : Ring A.carrier
  commutativeConvolutionClosed : ∀ a b, A.convolution a b = A.convolution b a
  convolutionDistributiveClosed : ∀ a b c, A.convolution a (A.add b c) = A.add (A.convolution a b) (A.convolution a c)
  convolutionIdentityClosed : ∀ a, A.convolution a A.zero = A.zero
  convolutionAssociativeClosed : ∀ a b c, A.convolution (A.convolution a b) c = A.convolution a (A.convolution b c)

def MikusiNskiAlgebraClosed (A : MikusiNskiAlgebra) : Prop :=
  AddCommGroup A.carrier ∧ Ring A.carrier ∧
  (∀ a b, A.convolution a b = A.convolution b a) ∧
  (∀ a b c, A.convolution a (A.add b c) = A.add (A.convolution a b) (A.convolution a c)) ∧
  (∀ a, A.convolution a A.zero = A.zero) ∧
  (∀ a b c, A.convolution (A.convolution a b) c = A.convolution a (A.convolution b c))

theorem mikusinski_algebra_closed_from_evidence (A : MikusiNskiAlgebra) (E : MikusiNskiAlgebraEvidence A) :
    MikusiNskiAlgebraClosed A := by
  exact And.intro E.additiveCommGroupClosed
    (And.intro E.ringClosed
      (And.intro E.commutativeConvolutionClosed
        (And.intro E.convolutionDistributiveClosed
          (And.intro E.convolutionIdentityClosed E.convolutionAssociativeClosed))))

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse