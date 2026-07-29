import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure MikusinskiTransformPackage where
  sourceFunctionSpace : Type u
  targetFunctionSpace : Type v
  transformDefinition : Prop
  invertibility : Prop
  continuity : Prop

structure MikusinskiTransformEvidence (T : MikusinskiTransformPackage) where
  transformDefinitionClosed : T.transformDefinition
  invertibilityClosed : T.invertibility
  continuityClosed : T.continuity

def MikusinskiTransformClosed (T : MikusinskiTransformPackage) : Prop :=
  T.transformDefinition ∧ T.invertibility ∧ T.continuity

theorem mikusinski_transform_closed_from_evidence
    (T : MikusinskiTransformPackage) (E : MikusinskiTransformEvidence T) :
    MikusinskiTransformClosed T := by
  exact And.intro E.transformDefinitionClosed
    (And.intro E.invertibilityClosed E.continuityClosed)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse
