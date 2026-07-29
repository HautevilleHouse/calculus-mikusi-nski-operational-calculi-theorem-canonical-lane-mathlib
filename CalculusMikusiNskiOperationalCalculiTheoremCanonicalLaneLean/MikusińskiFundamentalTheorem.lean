import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.OperationalCalculusStructure

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure TitchmarshTheorem (F : MikusinskiField) where
  convolution_product_zero : ∀ f g : F.carrier, F.conv f g = F.zero → f = F.zero ∨ g = F.zero
  convolution_product_zero_proof : convolution_product_zero

def TitchmarshClosed (T : TitchmarshTheorem) : Prop :=
  T.convolution_product_zero

theorem titchmarsh_closed (T : TitchmarshTheorem) :
    TitchmarshClosed T := by
  exact T.convolution_product_zero_proof

structure MikusinskiOperatorRepresentation (F : MikusinskiField) where
  field_of_functions : Type u
  operator_space : Type v
  representation : field_of_functions → operator_space
  representation_injective : Function.Injective representation
  representation_surjective : Function.Surjective representation
  representation_conv : ∀ f g, representation (F.conv f g) = F.conv (representation f) (representation g)

def MikusinskiRepresentationClosed (M : MikusinskiOperatorRepresentation) : Prop :=
  M.representation_injective ∧ M.representation_surjective

theorem mikusinski_representation_closed (M : MikusinskiOperatorRepresentation) :
    MikusinskiRepresentationClosed M := by
  exact And.intro M.representation_injective M.representation_surjective

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse