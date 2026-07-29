import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.MikusiNskiAlgebra

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure HeavisideFraction (A : MikusiNskiAlgebra) where
  numerator : A.carrier
  denominator : A.carrier
  denominatorNonZero : denominator ≠ A.zero
  fractionEquality : ∀ f g : HeavisideFraction A,
    (A.mul f.numerator g.denominator) = (A.mul g.numerator f.denominator) → f = g

structure HeavisideFractionEvidence (A : MikusiNskiAlgebra) (H : HeavisideFraction A) where
  denominatorNonZeroClosed : H.denominator ≠ A.zero
  fractionEqualityClosed : ∀ f g : HeavisideFraction A,
    (A.mul f.numerator g.denominator) = (A.mul g.numerator f.denominator) → f = g

def HeavisideFractionClosed (A : MikusiNskiAlgebra) (H : HeavisideFraction A) : Prop :=
  H.denominator ≠ A.zero ∧
  (∀ f g : HeavisideFraction A, (A.mul f.numerator g.denominator) = (A.mul g.numerator f.denominator) → f = g)

theorem heaviside_fraction_closed_from_evidence (A : MikusiNskiAlgebra) (H : HeavisideFraction A)
    (E : HeavisideFractionEvidence A H) : HeavisideFractionClosed A H := by
  exact And.intro E.denominatorNonZeroClosed E.fractionEqualityClosed

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse