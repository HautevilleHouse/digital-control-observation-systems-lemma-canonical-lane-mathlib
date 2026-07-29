import canonicals.Lemma.DigitalImplementation

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure RobustnessAnalysisPackage {O : ObservationDynamicsPackage}
    {G : ObserverGainDesignPackage O} {S : SeparationPrinciplePackage G}
    {D : DigitalImplementationPackage S} where
  modelUncertainty : Type u
  disturbanceBounds : ℝ → ℝ
  noiseBounds : ℝ → ℝ
  stabilityMargin : ℝ
  performanceGuarantee : Prop
  robustStabilityCondition : Prop

structure RobustnessAnalysisEvidence {O : ObservationDynamicsPackage}
    {G : ObserverGainDesignPackage O} {S : SeparationPrinciplePackage G}
    {D : DigitalImplementationPackage S} (R : RobustnessAnalysisPackage D) where
  modelUncertaintyClosed : R.modelUncertainty = R.modelUncertainty
  disturbanceBoundsClosed : ∀ t, R.disturbanceBounds t ≥ 0
  noiseBoundsClosed : ∀ t, R.noiseBounds t ≥ 0
  stabilityMarginClosed : R.stabilityMargin > 0
  performanceGuaranteeClosed : R.performanceGuarantee
  robustStabilityConditionClosed : R.robustStabilityCondition

def RobustnessAnalysisClosed {O : ObservationDynamicsPackage}
    {G : ObserverGainDesignPackage O} {S : SeparationPrinciplePackage G}
    {D : DigitalImplementationPackage S} (R : RobustnessAnalysisPackage D) : Prop :=
  R.performanceGuarantee ∧ R.robustStabilityCondition

theorem robustness_analysis_closed_from_evidence {O : ObservationDynamicsPackage}
    {G : ObserverGainDesignPackage O} {S : SeparationPrinciplePackage G}
    {D : DigitalImplementationPackage S} (R : RobustnessAnalysisPackage D)
    (E : RobustnessAnalysisEvidence R) : RobustnessAnalysisClosed R := by
  exact And.intro E.performanceGuaranteeClosed E.robustStabilityConditionClosed

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse