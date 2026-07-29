import canonicals.Lemma.SeparationPrinciple

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure DigitalImplementationPackage {O : ObservationDynamicsPackage}
    {G : ObserverGainDesignPackage O} {S : SeparationPrinciplePackage G} where
  samplingPeriod : ℝ
  discretizationMethod : String
  quantizationResolution : ℝ
  samplingCondition : Prop
  discretizationErrorBound : Prop
  quantizationErrorBound : Prop

structure DigitalImplementationEvidence {O : ObservationDynamicsPackage}
    {G : ObserverGainDesignPackage O} {S : SeparationPrinciplePackage G}
    (D : DigitalImplementationPackage S) where
  samplingPeriodClosed : D.samplingPeriod > 0
  discretizationMethodClosed : D.discretizationMethod = "zero-order-hold" ∨ D.discretizationMethod = "tustin"
  quantizationResolutionClosed : D.quantizationResolution > 0
  samplingConditionClosed : D.samplingCondition
  discretizationErrorBoundClosed : D.discretizationErrorBound
  quantizationErrorBoundClosed : D.quantizationErrorBound

def DigitalImplementationClosed {O : ObservationDynamicsPackage}
    {G : ObserverGainDesignPackage O} {S : SeparationPrinciplePackage G}
    (D : DigitalImplementationPackage S) : Prop :=
  D.samplingCondition ∧ D.discretizationErrorBound ∧ D.quantizationErrorBound

theorem digital_implementation_closed_from_evidence {O : ObservationDynamicsPackage}
    {G : ObserverGainDesignPackage O} {S : SeparationPrinciplePackage G}
    (D : DigitalImplementationPackage S) (E : DigitalImplementationEvidence D) :
    DigitalImplementationClosed D := by
  exact And.intro E.samplingConditionClosed
    (And.intro E.discretizationErrorBoundClosed E.quantizationErrorBoundClosed)

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse