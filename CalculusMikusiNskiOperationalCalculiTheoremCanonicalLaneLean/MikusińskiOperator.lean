import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.OperationalCalculus

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure MikusińskiOperatorPackage {C : ConvolutionAlgebra}
    (P : OperationalCalculusPackage C) where
  operatorField : Type u
  addition : operatorField → operatorField → operatorField
  multiplication : operatorField → operatorField → operatorField
  convolution : operatorField → operatorField → operatorField
  fieldStructure : Prop
  convolutionIdentityExists : Prop
  operatorEmbedding : C.field → operatorField
  embeddingConvolutionCompatible : Prop
  differentialOperatorField : operatorField → operatorField
  integrationOperatorField : operatorField → operatorField
  mikusińskiRelations : Prop

structure MikusińskiOperatorEvidence {C : ConvolutionAlgebra}
    {P : OperationalCalculusPackage C}
    (M : MikusińskiOperatorPackage P) where
  fieldStructureClosed : M.fieldStructure
  convolutionIdentityExistsClosed : M.convolutionIdentityExists
  embeddingConvolutionCompatibleClosed : M.embeddingConvolutionCompatible
  mikusińskiRelationsClosed : M.mikusińskiRelations

def MikusińskiOperatorClosed {C : ConvolutionAlgebra}
    {P : OperationalCalculusPackage C}
    (M : MikusińskiOperatorPackage P) : Prop :=
  M.fieldStructure ∧ M.convolutionIdentityExists ∧
  M.embeddingConvolutionCompatible ∧ M.mikusińskiRelations

theorem mikusiński_operator_closed_from_evidence
    {C : ConvolutionAlgebra} {P : OperationalCalculusPackage C}
    (M : MikusińskiOperatorPackage P) (E : MikusińskiOperatorEvidence M) :
    MikusińskiOperatorClosed M := by
  exact And.intro E.fieldStructureClosed
    (And.intro E.convolutionIdentityExistsClosed
      (And.intro E.embeddingConvolutionCompatibleClosed E.mikusińskiRelationsClosed))

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse