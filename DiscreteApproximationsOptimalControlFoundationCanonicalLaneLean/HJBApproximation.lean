import discreteApproximationsOptimalControlFoundationCanonicalLaneLean.MeshRefinement

/-!
# Hamilton-Jacobi-Bellman Approximation Package
-/

namespace HautevilleHouse
namespace DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean

structure HJBApproximationPackage {A : AdmissibleClass}
    {P : DiscreteTimeOptimalControlPackage A}
    {R : MeshRefinementPackage P} where
  HJBFunction : P.stateSpace → Prop
  discreteHJB : (Fin R.fineGrain) → (Fin R.fineGrain) → Prop
  approximationError : ℝ → Prop
  consistency : Prop
  stability : Prop
  monotonicity : Prop
  consistencyClosed : consistency
  stabilityClosed : stability
  monotonicityClosed : monotonicity

structure HJBApproximationEvidence {A : AdmissibleClass}
    {P : DiscreteTimeOptimalControlPackage A}
    {R : MeshRefinementPackage P}
    (H : HJBApproximationPackage A P R) where
  consistencyClosed : H.consistency
  stabilityClosed : H.stability
  monotonicityClosed : H.monotonicity

def HJBApproximationClosed {A : AdmissibleClass}
    {P : DiscreteTimeOptimalControlPackage A}
    {R : MeshRefinementPackage P}
    (H : HJBApproximationPackage A P R) : Prop :=
  H.consistency ∧ H.stability ∧ H.monotonicity

theorem hjb_approximation_closed_from_evidence
    {A : AdmissibleClass} {P : DiscreteTimeOptimalControlPackage A}
    {R : MeshRefinementPackage P}
    (H : HJBApproximationPackage A P R) (E : HJBApproximationEvidence H) :
    HJBApproximationClosed H := by
  exact And.intro E.consistencyClosed (And.intro E.stabilityClosed E.monotonicityClosed)

end DiscreteApproximationsOptimalControlFoundationCanonicalLaneLean
end HautevilleHouse