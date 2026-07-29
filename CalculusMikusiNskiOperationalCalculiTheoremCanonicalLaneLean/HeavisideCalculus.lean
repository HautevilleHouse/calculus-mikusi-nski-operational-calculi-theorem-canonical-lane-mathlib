import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.MikusińskiOperator

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure HeavisideCalculusPackage {C : ConvolutionAlgebra}
    {P : OperationalCalculusPackage C}
    (M : MikusińskiOperatorPackage P) where
  heavisideFunction : M.operatorField
  heavisideDifferential : M.operatorField → M.operatorField
  heavisideIntegration : M.operatorField → M.operatorField
  heavisideRelations : Prop
  heavisideBridge : Prop

structure HeavisideCalculusEvidence {C : ConvolutionAlgebra}
    {P : OperationalCalculusPackage C}
    {M : MikusińskiOperatorPackage P}
    (H : HeavisideCalculusPackage M) where
  heavisideRelationsClosed : H.heavisideRelations
  heavisideBridgeClosed : H.heavisideBridge

def HeavisideCalculusClosed {C : ConvolutionAlgebra}
    {P : OperationalCalculusPackage C}
    {M : MikusińskiOperatorPackage P}
    (H : HeavisideCalculusPackage M) : Prop :=
  H.heavisideRelations ∧ H.heavisideBridge

theorem heaviside_calculus_closed_from_evidence
    {C : ConvolutionAlgebra} {P : OperationalCalculusPackage C}
    {M : MikusińskiOperatorPackage P}
    (H : HeavisideCalculusPackage M) (E : HeavisideCalculusEvidence H) :
    HeavisideCalculusClosed H := by
  exact And.intro E.heavisideRelationsClosed E.heavisideBridgeClosed

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse