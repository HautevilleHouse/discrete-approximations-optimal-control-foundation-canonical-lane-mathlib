import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscreteApproxOptimalControlFoundation

structure DiscreteApproximationPackage where
  stateSpace : Type u
  controlSpace : Type v
  timeStep : ℝ
  dynamicsFunction : stateSpace → controlSpace → stateSpace
  costFunction : stateSpace → controlSpace → ℝ
  initialCondition : stateSpace
  terminalCondition : stateSpace → Prop
  approximationScheme : Prop
  consistencyOrder : Nat

def DiscreteApproximationClosed (D : DiscreteApproximationPackage) : Prop :=
  D.approximationScheme ∧ D.consistencyOrder ≥ 1

end DiscreteApproxOptimalControlFoundation
end HautevilleHouse
