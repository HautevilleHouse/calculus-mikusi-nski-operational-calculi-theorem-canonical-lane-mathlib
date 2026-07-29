import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.MikusińskiOperationalCalculus

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure OperationalCalculusPDEPackage where
  differentialOperator : Type u
  convolutionRepresentation : Type v
  solutionSpace : Type w
  linearPDE : Prop
  convolutionSolution : Prop
  uniqueness : Prop

structure OperationalCalculusPDEEvidence (P : OperationalCalculusPDEPackage) where
  linearPDEClosed : P.linearPDE
  convolutionSolutionClosed : P.convolutionSolution
  uniquenessClosed : P.uniqueness

def OperationalCalculusPDEClosed (P : OperationalCalculusPDEPackage) : Prop :=
  P.linearPDE ∧ P.convolutionSolution ∧ P.uniqueness

theorem operational_calculus_pde_closed_from_evidence (P : OperationalCalculusPDEPackage) (E : OperationalCalculusPDEEvidence P) :
    OperationalCalculusPDEClosed P := by
  exact And.intro E.linearPDEClosed (And.intro E.convolutionSolutionClosed E.uniquenessClosed)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse