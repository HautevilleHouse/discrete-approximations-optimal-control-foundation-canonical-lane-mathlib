import DiscreteApproximationsOptimalControlFoundation.BridgeLemmas

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundation

structure DiscreteDynamicsPackage where
  stateSpace : Type u
  controlSpace : Type v
  dynamics : stateSpace → controlSpace → stateSpace
  discretizationStep : ℝ
  consistencyOrder : ℕ
  stabilityCondition : Prop

structure DiscreteDynamicsEvidence (D : DiscreteDynamicsPackage) where
  consistencyOrderClosed : D.consistencyOrder ≥ 1
  stabilityConditionClosed : D.stabilityCondition

def DiscreteDynamicsClosed (D : DiscreteDynamicsPackage) : Prop :=
  D.consistencyOrder ≥ 1 ∧ D.stabilityCondition

theorem discrete_dynamics_closed_from_evidence
    (D : DiscreteDynamicsPackage) (E : DiscreteDynamicsEvidence D) :
    DiscreteDynamicsClosed D := by
  exact And.intro E.consistencyOrderClosed E.stabilityConditionClosed

end DiscreteApproximationsOptimalControlFoundation
end HautevilleHouse
