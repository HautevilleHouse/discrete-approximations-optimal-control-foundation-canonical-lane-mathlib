import DiscreteApproximationsOptimalControlFoundation.ApproximationError

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundation

structure AdaptiveMeshPackage {D : DiscreteDynamicsPackage}
    {Dyn : D} {O : OptimalityConditionsPackage Dyn} {E : ApproximationErrorPackage O}
    (Err : E) where
  meshRefinementCriterion : Prop
  refinementFunction : ℝ → ℕ
  errorIndicator : D.stateSpace → ℝ
  computationalBudget : ℝ

structure AdaptiveMeshEvidence {D : DiscreteDynamicsPackage}
    {Dyn : D} {O : OptimalityConditionsPackage Dyn} {E : ApproximationErrorPackage O}
    {Err : E} (M : AdaptiveMeshPackage Err) where
  meshRefinementCriterionClosed : M.meshRefinementCriterion
  computationalBudgetClosed : M.computationalBudget > 0

def AdaptiveMeshClosed {D : DiscreteDynamicsPackage}
    {Dyn : D} {O : OptimalityConditionsPackage Dyn} {E : ApproximationErrorPackage O}
    {Err : E} (M : AdaptiveMeshPackage Err) : Prop :=
  M.meshRefinementCriterion ∧ M.computationalBudget > 0

theorem adaptive_mesh_closed_from_evidence
    {D : DiscreteDynamicsPackage} {Dyn : D} {O : OptimalityConditionsPackage Dyn}
    {E : ApproximationErrorPackage O} {Err : E} (M : AdaptiveMeshPackage Err)
    (Ev : AdaptiveMeshEvidence M) : AdaptiveMeshClosed M := by
  exact And.intro Ev.meshRefinementCriterionClosed Ev.computationalBudgetClosed

end DiscreteApproximationsOptimalControlFoundation
end HautevilleHouse
