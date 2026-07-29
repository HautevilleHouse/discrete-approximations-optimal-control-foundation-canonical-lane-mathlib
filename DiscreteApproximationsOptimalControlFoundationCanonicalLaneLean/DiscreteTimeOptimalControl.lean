import discreteApproximationsOptimalControlFoundationCanonicalLaneLean.AdmissibleClass

/-!
# Discrete-Time Optimal Control Package
-/

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean

structure DiscreteTimeOptimalControlPackage (A : AdmissibleClass) where
  timeSteps : Type u
  stateSpace : Type v
  controlSpace : Type w
  dynamics : timeSteps → stateSpace → controlSpace → stateSpace
  costFunctional : (timeSteps → stateSpace) → (timeSteps → controlSpace) → Prop
  optimalTrajectory : timeSteps → stateSpace
  optimalControl : timeSteps → controlSpace
  optimalityCondition : Prop
  terminalConstraint : stateSpace → Prop

structure DiscreteTimeOptimalControlEvidence {A : AdmissibleClass}
    (P : DiscreteTimeOptimalControlPackage A) where
  dynamicsClosed : P.dynamics = P.dynamics
  costFunctionalClosed : P.costFunctional P.optimalTrajectory P.optimalControl
  optimalityConditionClosed : P.optimalityCondition
  terminalConstraintClosed : P.terminalConstraint (P.optimalTrajectory (P.timeSteps.mk 0))

def DiscreteTimeOptimalControlClosed {A : AdmissibleClass}
    (P : DiscreteTimeOptimalControlPackage A) : Prop :=
  P.optimalityCondition ∧ P.terminalConstraint (P.optimalTrajectory (P.timeSteps.mk 0))

theorem discrete_time_optimal_control_closed_from_evidence
    {A : AdmissibleClass} (P : DiscreteTimeOptimalControlPackage A)
    (E : DiscreteTimeOptimalControlEvidence P) : DiscreteTimeOptimalControlClosed P := by
  exact And.intro E.optimalityConditionClosed E.terminalConstraintClosed

end DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean
end HautevilleHouse