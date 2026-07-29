import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure SuppressionTheoremPackage where
  mikusinskiField : Type u
  operationalCalculi : Type v
  suppressionProperty : Prop
  algebraicClosure : Prop

structure SuppressionTheoremEvidence (S : SuppressionTheoremPackage) where
  suppressionPropertyClosed : S.suppressionProperty
  algebraicClosureClosed : S.algebraicClosure

def SuppressionTheoremClosed (S : SuppressionTheoremPackage) : Prop :=
  S.suppressionProperty ∧ S.algebraicClosure

theorem suppression_theorem_closed_from_evidence
    (S : SuppressionTheoremPackage) (E : SuppressionTheoremEvidence S) :
    SuppressionTheoremClosed S := by
  exact And.intro E.suppressionPropertyClosed E.algebraicClosureClosed

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse
