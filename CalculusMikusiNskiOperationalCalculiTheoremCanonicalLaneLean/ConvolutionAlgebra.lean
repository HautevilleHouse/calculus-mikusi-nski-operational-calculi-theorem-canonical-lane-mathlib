import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure ConvolutionAlgebraPackage where
  baseRing : Type u
  group : Type v
  convolutionDefined : Prop
  associative : Prop
  distributive : Prop
  identityExists : Prop

structure ConvolutionAlgebraEvidence (A : ConvolutionAlgebraPackage) where
  convolutionDefinedClosed : A.convolutionDefined
  associativeClosed : A.associative
  distributiveClosed : A.distributive
  identityExistsClosed : A.identityExists

def ConvolutionAlgebraClosed (A : ConvolutionAlgebraPackage) : Prop :=
  A.convolutionDefined ∧ A.associative ∧ A.distributive ∧ A.identityExists

theorem convolution_algebra_closed_from_evidence
    (A : ConvolutionAlgebraPackage) (E : ConvolutionAlgebraEvidence A) :
    ConvolutionAlgebraClosed A := by
  exact And.intro E.convolutionDefinedClosed
    (And.intro E.associativeClosed
      (And.intro E.distributiveClosed E.identityExistsClosed))

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse
