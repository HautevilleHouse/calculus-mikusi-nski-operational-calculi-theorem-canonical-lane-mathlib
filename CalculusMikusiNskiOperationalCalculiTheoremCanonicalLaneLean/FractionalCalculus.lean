import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure FractionalIntegral (A : Type u) [AddCommGroup A] [Module ℝ A] (C : ConvolutionAlgebra A) where
  I_alpha : ℝ → A → A
  index_law : ∀ α β f, I_alpha α (I_alpha β f) = I_alpha (α + β) f
  convolution_representation : ∀ α f g, I_alpha α (C.convolution f g) = C.convolution (I_alpha α f) g
  semigroup_property : ∀ α β, I_alpha (α + β) = λ f => I_alpha α (I_alpha β f)

structure FractionalIntegralEvidence (A : Type u) [AddCommGroup A] [Module ℝ A]
    (C : ConvolutionAlgebra A) (F : FractionalIntegral A C) where
  index_law_closed : F.index_law
  convolution_representation_closed : F.convolution_representation
  semigroup_property_closed : F.semigroup_property

def FractionalIntegralClosed (A : Type u) [AddCommGroup A] [Module ℝ A]
    (C : ConvolutionAlgebra A) (F : FractionalIntegral A C) : Prop :=
  F.index_law ∧ F.convolution_representation ∧ F.semigroup_property

theorem fractional_integral_closed_from_evidence (A : Type u) [AddCommGroup A] [Module ℝ A]
    (C : ConvolutionAlgebra A) (F : FractionalIntegral A C) (E : FractionalIntegralEvidence A C F) :
    FractionalIntegralClosed A C F := by
  exact And.intro E.index_law_closed (And.intro E.convolution_representation_closed E.semigroup_property_closed)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse
