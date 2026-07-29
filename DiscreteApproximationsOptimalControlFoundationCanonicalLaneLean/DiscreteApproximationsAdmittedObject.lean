import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean

structure DiscreteApproximationsAdmittedObject where
  stateSpace : Type
  stateTopology : TopologicalSpace stateSpace
  controlSpace : Type
  controlTopology : TopologicalSpace controlSpace
  optimalControlSatisfied : Prop
  discreteSchemeConvergent : Prop
  conclusion : optimalControlSatisfied ∧ discreteSchemeConvergent

end DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean
end HautevilleHouse