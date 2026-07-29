import DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean.PontryaginMaximumPrinciple

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean

structure ConvergenceRatePackage where
  discreteScheme : Type u
  errorBound : Type v
  rateOrder : Type w
  consistencyCondition : Prop
  stabilityCondition : Prop
  convergenceOrder : Prop

structure ConvergenceRateEvidence (C : ConvergenceRatePackage) where
  consistencyConditionClosed : C.consistencyCondition
  stabilityConditionClosed : C.stabilityCondition
  convergenceOrderClosed : C.convergenceOrder

def ConvergenceRateClosed (C : ConvergenceRatePackage) : Prop :=
  C.consistencyCondition ∧ C.stabilityCondition ∧ C.convergenceOrder

theorem convergence_rate_closed_from_evidence
    (C : ConvergenceRatePackage) (E : ConvergenceRateEvidence C) :
    ConvergenceRateClosed C := by
  exact And.intro E.consistencyConditionClosed (And.intro E.stabilityConditionClosed E.convergenceOrderClosed)

end DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean
end HautevilleHouse
