import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure MikusińskiConvergencePackage where
  sequenceSpace : Type u
  limitOperator : Type v
  convergenceTopology : Type w
  algebraicOperationsContinuous : Prop
  sequentialCompleteness : Prop
  closureUnderLimits : Prop

structure MikusińskiConvergenceEvidence (C : MikusińskiConvergencePackage) where
  algebraicOperationsContinuousClosed : C.algebraicOperationsContinuous
  sequentialCompletenessClosed : C.sequentialCompleteness
  closureUnderLimitsClosed : C.closureUnderLimits

def MikusińskiConvergenceClosed (C : MikusińskiConvergencePackage) : Prop :=
  C.algebraicOperationsContinuous ∧ C.sequentialCompleteness ∧ C.closureUnderLimits

theorem mikusiński_convergence_closed_from_evidence (C : MikusińskiConvergencePackage) (E : MikusińskiConvergenceEvidence C) :
    MikusińskiConvergenceClosed C := by
  exact And.intro E.algebraicOperationsContinuousClosed (And.intro E.sequentialCompletenessClosed E.closureUnderLimitsClosed)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse