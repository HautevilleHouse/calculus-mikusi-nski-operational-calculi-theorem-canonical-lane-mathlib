import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure ConvolutionAlgebra (F : MikusinskiField) where
  carrier : Type u
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  conv : carrier → carrier → carrier
  conv_comm : ∀ a b, conv a b = conv b a
  conv_assoc : ∀ a b c, conv (conv a b) c = conv a (conv b c)
  conv_identity : ∀ a, conv a one = a
  conv_distrib_left : ∀ a b c, conv a (add b c) = add (conv a b) (conv a c)
  conv_distrib_right : ∀ a b c, conv (add a b) c = add (conv a c) (conv b c)

def ConvolutionAlgebraClosed (C : ConvolutionAlgebra) : Prop :=
  ∀ a b : C, ∃ c : C, conv a b = c

theorem convolution_algebra_closed (C : ConvolutionAlgebra) :
    ConvolutionAlgebraClosed C := by
  intro a b
  exact ⟨conv a b, rfl⟩

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse