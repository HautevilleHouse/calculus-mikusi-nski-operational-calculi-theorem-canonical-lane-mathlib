import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure LaplaceTransform (A : Type u) [AddCommGroup A] [Module ℝ A] (C : ConvolutionAlgebra A) where
  L : A → ℝ → ℝ
  linearity : ∀ f g s, L (f + g) s = L f s + L g s
  convolution_property : ∀ f g s, L (C.convolution f g) s = L f s * L g s
  inversion : (∀ s, L f s = L g s) → f = g

structure LaplaceTransformEvidence (A : Type u) [AddCommGroup A] [Module ℝ A]
    (C : ConvolutionAlgebra A) (L : LaplaceTransform A C) where
  linearity_closed : L.linearity
  convolution_property_closed : L.convolution_property
  inversion_closed : L.inversion

def LaplaceTransformClosed (A : Type u) [AddCommGroup A] [Module ℝ A]
    (C : ConvolutionAlgebra A) (L : LaplaceTransform A C) : Prop :=
  L.linearity ∧ L.convolution_property ∧ L.inversion

theorem laplace_transform_closed_from_evidence (A : Type u) [AddCommGroup A] [Module ℝ A]
    (C : ConvolutionAlgebra A) (L : LaplaceTransform A C) (E : LaplaceTransformEvidence A C L) :
    LaplaceTransformClosed A C L := by
  exact And.intro E.linearity_closed (And.intro E.convolution_property_closed E.inversion_closed)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse
