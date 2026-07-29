import DiscreteApproximationsOptimalControlFoundation.OptimalityConditions

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundation

structure ApproximationErrorPackage {D : DiscreteDynamicsPackage}
    {Dyn : D} {O : OptimalityConditionsPackage Dyn} (E : O) where
  truncationError : ℝ
  samplingError : ℝ
  totalErrorBound : ℝ
  convergenceRate : ℕ

structure ApproximationErrorEvidence {D : DiscreteDynamicsPackage}
    {Dyn : D} {O : OptimalityConditionsPackage Dyn} {E : ApproximationErrorPackage O}
    (A : ApproximationErrorPackage O) where
  totalErrorBoundClosed : A.totalErrorBound ≤ A.truncationError + A.samplingError
  convergenceRateClosed : A.convergenceRate ≥ 1

def ApproximationErrorClosed {D : DiscreteDynamicsPackage}
    {Dyn : D} {O : OptimalityConditionsPackage Dyn} {E : ApproximationErrorPackage O}
    (A : ApproximationErrorPackage O) : Prop :=
  A.totalErrorBound ≤ A.truncationError + A.samplingError ∧ A.convergenceRate ≥ 1

theorem approximation_error_closed_from_evidence
    {D : DiscreteDynamicsPackage} {Dyn : D} {O : OptimalityConditionsPackage Dyn}
    {E : ApproximationErrorPackage O} (A : ApproximationErrorPackage O)
    (Ev : ApproximationErrorEvidence A) : ApproximationErrorClosed A := by
  exact And.intro Ev.totalErrorBoundClosed Ev.convergenceRateClosed

end DiscreteApproximationsOptimalControlFoundation
end HautevilleHouse
