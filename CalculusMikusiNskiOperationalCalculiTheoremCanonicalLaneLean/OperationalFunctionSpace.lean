import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure OperationalFunctionSpacePackage where
  underlyingSpace : Type u
  topology : TopologicalSpace underlyingSpace
  operationalFunctions : Type v
  compositionStructure : Prop
  closureUnderLimits : Prop
  differentialStructure : Prop

structure OperationalFunctionSpaceEvidence (F : OperationalFunctionSpacePackage) where
  compositionStructureClosed : F.compositionStructure
  closureUnderLimitsClosed : F.closureUnderLimits
  differentialStructureClosed : F.differentialStructure

def OperationalFunctionSpaceClosed (F : OperationalFunctionSpacePackage) : Prop :=
  F.compositionStructure ∧ F.closureUnderLimits ∧ F.differentialStructure

theorem operational_function_space_closed_from_evidence
    (F : OperationalFunctionSpacePackage) (E : OperationalFunctionSpaceEvidence F) :
    OperationalFunctionSpaceClosed F := by
  exact And.intro E.compositionStructureClosed
    (And.intro E.closureUnderLimitsClosed E.differentialStructureClosed)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse
