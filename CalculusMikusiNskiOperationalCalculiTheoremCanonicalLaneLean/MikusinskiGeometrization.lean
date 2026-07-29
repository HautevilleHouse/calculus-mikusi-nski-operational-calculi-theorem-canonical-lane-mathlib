import CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.MikusinskiConvolutionAlgebra

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure GeometrizationPackage {A : ConvolutionAlgebraPackage} where
  primeDecomposition : Prop
  finiteExtinctionAlternative : Prop
  representationClassified : Prop
  uniqueFactorization : Prop

structure GeometrizationEvidence {A : ConvolutionAlgebraPackage}
    (G : GeometrizationPackage A) where
  primeDecompositionClosed : G.primeDecomposition
  finiteExtinctionAlternativeClosed : G.finiteExtinctionAlternative
  representationClassifiedClosed : G.representationClassified
  uniqueFactorizationClosed : G.uniqueFactorization

def GeometrizationClosed {A : ConvolutionAlgebraPackage}
    (G : GeometrizationPackage A) : Prop :=
  G.primeDecomposition ∧ G.finiteExtinctionAlternative ∧
  G.representationClassified ∧ G.uniqueFactorization

theorem geometrization_closed_from_evidence
    {A : ConvolutionAlgebraPackage} (G : GeometrizationPackage A)
    (E : GeometrizationEvidence G) : GeometrizationClosed G := by
  exact And.intro E.primeDecompositionClosed
    (And.intro E.finiteExtinctionAlternativeClosed
      (And.intro E.representationClassifiedClosed E.uniqueFactorizationClosed))

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse