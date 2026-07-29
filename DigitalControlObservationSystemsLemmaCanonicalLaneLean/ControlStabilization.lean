import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure ControlStabilizationPackage where
  stateFeedback : Prop
  stabilityCondition : Prop
  controllabilityCondition : Prop

structure ControlStabilizationEvidence (C : ControlStabilizationPackage) where
  stateFeedbackClosed : C.stateFeedback
  stabilityConditionClosed : C.stabilityCondition
  controllabilityConditionClosed : C.controllabilityCondition

def ControlStabilizationClosed (C : ControlStabilizationPackage) : Prop :=
  C.stateFeedback ∧ C.stabilityCondition ∧ C.controllabilityCondition

theorem control_stabilization_closed_from_evidence (C : ControlStabilizationPackage) (E : ControlStabilizationEvidence C) :
    ControlStabilizationClosed C := by
  exact And.intro E.stateFeedbackClosed (And.intro E.stabilityConditionClosed E.controllabilityConditionClosed)

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse