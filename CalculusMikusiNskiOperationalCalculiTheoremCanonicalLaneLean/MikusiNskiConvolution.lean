import canonicalLaneMathlib.AdmissibleClass
import CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.MikusiNskiAlgebra

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure MikusiNskiConvolution (A : MikusiNskiAlgebra) where
  convolutionProduct : A.carrier → A.carrier → A.carrier
  convolutionProductAssoc : ∀ a b c, convolutionProduct (convolutionProduct a b) c = convolutionProduct a (convolutionProduct b c)
  convolutionProductComm : ∀ a b, convolutionProduct a b = convolutionProduct b a
  convolutionProductDistrib : ∀ a b c, convolutionProduct a (A.add b c) = A.add (convolutionProduct a b) (convolutionProduct a c)
  convolutionProductUnit : A.one
  convolutionProductUnitLeft : ∀ a, convolutionProduct convolutionProductUnit a = a
  convolutionProductUnitRight : ∀ a, convolutionProduct a convolutionProductUnit = a

structure MikusiNskiConvolutionEvidence (A : MikusiNskiAlgebra) (C : MikusiNskiConvolution A) where
  assocClosed : ∀ a b c, C.convolutionProduct (C.convolutionProduct a b) c = C.convolutionProduct a (C.convolutionProduct b c)
  commClosed : ∀ a b, C.convolutionProduct a b = C.convolutionProduct b a
  distribClosed : ∀ a b c, C.convolutionProduct a (A.add b c) = A.add (C.convolutionProduct a b) (C.convolutionProduct a c)
  unitLeftClosed : ∀ a, C.convolutionProduct C.convolutionProductUnit a = a
  unitRightClosed : ∀ a, C.convolutionProduct a C.convolutionProductUnit = a

def MikusiNskiConvolutionClosed (A : MikusiNskiAlgebra) (C : MikusiNskiConvolution A) : Prop :=
  (∀ a b c, C.convolutionProduct (C.convolutionProduct a b) c = C.convolutionProduct a (C.convolutionProduct b c)) ∧
  (∀ a b, C.convolutionProduct a b = C.convolutionProduct b a) ∧
  (∀ a b c, C.convolutionProduct a (A.add b c) = A.add (C.convolutionProduct a b) (C.convolutionProduct a c)) ∧
  (∀ a, C.convolutionProduct C.convolutionProductUnit a = a) ∧
  (∀ a, C.convolutionProduct a C.convolutionProductUnit = a)

theorem mikusinski_convolution_closed_from_evidence (A : MikusiNskiAlgebra) (C : MikusiNskiConvolution A)
    (E : MikusiNskiConvolutionEvidence A C) : MikusiNskiConvolutionClosed A C := by
  exact And.intro E.assocClosed
    (And.intro E.commClosed
      (And.intro E.distribClosed
        (And.intro E.unitLeftClosed E.unitRightClosed)))

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse