import CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.MikusinskiConvolutionAlgebra

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure EndpointClassificationPackage {A : ConvolutionAlgebraPackage} where
  targetOperator : A.carrier
  representationAsFraction : ∃ f g : A.carrier, g ≠ A.zero ∧ A.convolution g targetOperator = f
  uniqueness : Prop

structure EndpointClassificationEvidence {A : ConvolutionAlgebraPackage}
    (E : EndpointClassificationPackage A) where
  representationClosed : E.representationAsFraction
  uniquenessClosed : E.uniqueness

def EndpointClassificationClosed {A : ConvolutionAlgebraPackage}
    (E : EndpointClassificationPackage A) : Prop :=
  E.representationAsFraction ∧ E.uniqueness

theorem endpoint_classification_closed_from_evidence
    {A : ConvolutionAlgebraPackage} (E : EndpointClassificationPackage A)
    (Ev : EndpointClassificationEvidence E) : EndpointClassificationClosed E := by
  exact And.intro Ev.representationClosed Ev.uniquenessClosed

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse