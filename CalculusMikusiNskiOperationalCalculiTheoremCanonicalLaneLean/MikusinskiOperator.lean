import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure MikusinskiOperator (A : Type u) [AddCommGroup A] [Module ℝ A] (C : ConvolutionAlgebra A) where
  operator : A → A
  operator_linear : ∀ f g r, operator (f + g) = operator f + operator g ∧ operator (r • f) = r • operator f
  commutes_with_convolution : ∀ f g, operator (C.convolution f g) = C.convolution (operator f) g
  identity_element : A
  identity_convolution : ∀ f, C.convolution identity_element f = f

structure MikusinskiOperatorEvidence (A : Type u) [AddCommGroup A] [Module ℝ A]
    (C : ConvolutionAlgebra A) (M : MikusinskiOperator A C) where
  operator_linear_closed : M.operator_linear
  commutes_with_convolution_closed : M.commutes_with_convolution
  identity_convolution_closed : M.identity_convolution

def MikusinskiOperatorClosed (A : Type u) [AddCommGroup A] [Module ℝ A]
    (C : ConvolutionAlgebra A) (M : MikusinskiOperator A C) : Prop :=
  (∀ f g r, M.operator (f + g) = M.operator f + M.operator g ∧ M.operator (r • f) = r • M.operator f) ∧
  (∀ f g, M.operator (C.convolution f g) = C.convolution (M.operator f) g) ∧
  (∀ f, C.convolution M.identity_element f = f)

theorem mikusinski_operator_closed_from_evidence (A : Type u) [AddCommGroup A] [Module ℝ A]
    (C : ConvolutionAlgebra A) (M : MikusinskiOperator A C) (E : MikusinskiOperatorEvidence A C M) :
    MikusinskiOperatorClosed A C M := by
  exact And.intro E.operator_linear_closed (And.intro E.commutes_with_convolution_closed E.identity_convolution_closed)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse
