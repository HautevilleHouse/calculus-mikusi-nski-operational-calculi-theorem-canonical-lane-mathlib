import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean

structure ConvolutionAlgebraPackage where
  algebra : MikusinskiAlgebra
  convolutionDefined : Prop
  titchmarshTheoremHolds : Prop
  operationalCalculus : Prop

definition MikusinskiWitnessClosed (O : MikusinskiAdmittedObject) : Prop :=
  O.convolutionClosed

end CalculusMikusiNskiOperationalCalculiTheoremCanonicalLaneLean
end HautevilleHouse