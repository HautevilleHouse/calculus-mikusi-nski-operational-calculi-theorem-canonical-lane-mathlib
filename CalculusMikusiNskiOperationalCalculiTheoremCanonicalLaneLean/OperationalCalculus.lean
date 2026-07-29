import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.ConvolutionAlgebra

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure OperationalCalculusPackage (C : ConvolutionAlgebra) where
  operationalFunctions : C.field → C.field
  differentialOperator : C.field → C.field
  integrationOperator : C.field → C.field
  operationalAlgebra : Prop
  differentialIntegrationRelation : Prop
  operationalCalculusBridge : Prop

structure OperationalCalculusEvidence {C : ConvolutionAlgebra}
    (P : OperationalCalculusPackage C) where
  operationalAlgebraClosed : P.operationalAlgebra
  differentialIntegrationRelationClosed : P.differentialIntegrationRelation
  operationalCalculusBridgeClosed : P.operationalCalculusBridge

def OperationalCalculusClosed {C : ConvolutionAlgebra}
    (P : OperationalCalculusPackage C) : Prop :=
  P.operationalAlgebra ∧ P.differentialIntegrationRelation ∧ P.operationalCalculusBridge

theorem operational_calculus_closed_from_evidence
    {C : ConvolutionAlgebra} (P : OperationalCalculusPackage C)
    (E : OperationalCalculusEvidence P) : OperationalCalculusClosed P := by
  exact And.intro E.operationalAlgebraClosed
    (And.intro E.differentialIntegrationRelationClosed E.operationalCalculusBridgeClosed)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse