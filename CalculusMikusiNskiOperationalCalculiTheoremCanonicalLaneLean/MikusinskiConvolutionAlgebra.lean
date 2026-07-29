import Mathlib.Algebra.GroupPower.Basic
import Mathlib.Analysis.Calculus.Convolution

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure ConvolutionAlgebraPackage where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  convolution : carrier → carrier → carrier
  isRing : Prop
  isConvolutionAlgebra : Prop
  identityElement : carrier
  identityConvolution : ∀ f : carrier, convolution f identityElement = f

structure ConvolutionAlgebraEvidence (C : ConvolutionAlgebraPackage) where
  isRingClosed : C.isRing
  isConvolutionAlgebraClosed : C.isConvolutionAlgebra
  identityConvolutionClosed : C.identityConvolution

def ConvolutionAlgebraClosed (C : ConvolutionAlgebraPackage) : Prop :=
  C.isRing ∧ C.isConvolutionAlgebra ∧ C.identityConvolution

theorem convolution_algebra_closed_from_evidence
    (C : ConvolutionAlgebraPackage) (E : ConvolutionAlgebraEvidence C) :
    ConvolutionAlgebraClosed C := by
  exact And.intro E.isRingClosed (And.intro E.isConvolutionAlgebraClosed E.identityConvolutionClosed)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse