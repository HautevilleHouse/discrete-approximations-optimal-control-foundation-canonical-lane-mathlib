import canonicalLaneMathlib.AdmissibleClass
import DiscreteApproximationPackage

namespace HautevilleHouse
namespace DiscreteApproxOptimalControlFoundation

structure ConvergenceAnalysisPackage (D : DiscreteApproximationPackage) where
  stabilityEstimate : Prop
  consistencyEstimate : Prop
  l2ErrorBound : ℝ
  convergenceRate : ℝ
  discreteMaximumPrinciple : Prop
  errorEstimateClosed : stabilityEstimate
  convergenceRateClosed : convergenceRate > 0

def ConvergenceAnalysisClosed (D : DiscreteApproximationPackage) (C : ConvergenceAnalysisPackage D) : Prop :=
  C.stabilityEstimate ∧ C.consistencyEstimate ∧ C.convergenceRateClosed

end DiscreteApproxOptimalControlFoundation
end HautevilleHouse
