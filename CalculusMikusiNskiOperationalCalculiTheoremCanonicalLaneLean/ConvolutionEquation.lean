import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure ConvolutionEquationPackage where
  kernel : Type u
  unknownFunction : Type v
  equationFormulation : Prop
  existenceSolution : Prop
  uniquenessSolution : Prop

structure ConvolutionEquationEvidence (E : ConvolutionEquationPackage) where
  equationFormulationClosed : E.equationFormulation
  existenceSolutionClosed : E.existenceSolution
  uniquenessSolutionClosed : E.uniquenessSolution

def ConvolutionEquationClosed (E : ConvolutionEquationPackage) : Prop :=
  E.equationFormulation ∧ E.existenceSolution ∧ E.uniquenessSolution

theorem convolution_equation_closed_from_evidence
    (E : ConvolutionEquationPackage) (Ev : ConvolutionEquationEvidence E) :
    ConvolutionEquationClosed E := by
  exact And.intro Ev.equationFormulationClosed
    (And.intro Ev.existenceSolutionClosed Ev.uniquenessSolutionClosed)

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse
