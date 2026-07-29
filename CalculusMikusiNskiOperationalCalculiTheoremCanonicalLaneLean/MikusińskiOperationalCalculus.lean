import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure MikusińskiField where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  convolutionProduct : carrier → carrier → carrier
  tShifting : carrier → carrier → carrier
  fieldAxioms : Prop
  convolutionAxioms : Prop
  shiftAxioms : Prop

structure MikusińskiFieldEvidence (F : MikusińskiField) where
  fieldAxiomsClosed : F.fieldAxioms
  convolutionAxiomsClosed : F.convolutionAxioms
  shiftAxiomsClosed : F.shiftAxioms

def MikusińskiFieldClosed (F : MikusińskiField) : Prop :=
  F.fieldAxioms ∧ F.convolutionAxioms ∧ F.shiftAxioms

theorem mikusiński_field_closed_from_evidence (F : MikusińskiField) (E : MikusińskiFieldEvidence F) :
    MikusińskiFieldClosed F := by
  exact And.intro E.fieldAxiomsClosed (And.intro E.convolutionAxiomsClosed E.shiftAxiomsClosed)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse