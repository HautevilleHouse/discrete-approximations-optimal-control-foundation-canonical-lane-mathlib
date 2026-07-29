import canonicalLaneMathlib.OptimalityConditions

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean

structure ConvergenceAnalysisPackage {P : DiscreteControlApproximationPackage}
    (O : OptimalityConditionsPackage P) where
  errorBound : Prop
  rateOfConvergence : Prop
  meshIndependence : Prop
  asymptoticBehavior : Prop

structure ConvergenceAnalysisEvidence {P : DiscreteControlApproximationPackage}
    {O : OptimalityConditionsPackage P} (C : ConvergenceAnalysisPackage O) where
  errorBoundClosed : C.errorBound
  rateOfConvergenceClosed : C.rateOfConvergence
  meshIndependenceClosed : C.meshIndependence
  asymptoticBehaviorClosed : C.asymptoticBehavior

def ConvergenceAnalysisClosed {P : DiscreteControlApproximationPackage}
    {O : OptimalityConditionsPackage P} (C : ConvergenceAnalysisPackage O) : Prop :=
  C.errorBound ∧ C.rateOfConvergence ∧ C.meshIndependence ∧ C.asymptoticBehavior

theorem convergence_analysis_closed_from_evidence
    {P : DiscreteControlApproximationPackage} {O : OptimalityConditionsPackage P}
    (C : ConvergenceAnalysisPackage O) (E : ConvergenceAnalysisEvidence C) :
    ConvergenceAnalysisClosed C := by
  exact And.intro E.errorBoundClosed
    (And.intro E.rateOfConvergenceClosed
      (And.intro E.meshIndependenceClosed E.asymptoticBehaviorClosed))

end DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean
end HautevilleHouse
