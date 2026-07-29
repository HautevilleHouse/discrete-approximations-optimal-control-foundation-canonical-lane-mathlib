import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean

structure ControlSystem where
  carrier : Type
  stateSpace : TopologicalSpace carrier

structure AdmittedObject where
  system : ControlSystem
  discreteApproximation : Prop
  optimalControlExists : Prop
  conclusion : optimalControlExists

structure EndgameState where
  object : AdmittedObject

def DiscreteWitnessClosed (O : AdmittedObject) : Prop :=
  O.optimalControlExists

end DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean
end HautevilleHouse
