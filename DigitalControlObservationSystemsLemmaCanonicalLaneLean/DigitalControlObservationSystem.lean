import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure DigitalControlObservationSystem where
  stateSpace : Type u
  controlSpace : Type v
  outputSpace : Type w
  dynamics : stateSpace → controlSpace → stateSpace
  observationMap : stateSpace → outputSpace
  initialCondition : stateSpace
  discreteTimeSequence : Nat → stateSpace
  controlSequence : Nat → controlSpace
  observationSequence : Nat → outputSpace
  timeHorizon : Nat
  stabilityMargin : Prop
  reachabilityUnderControl : Prop
  observabilityCondition : observationSequence 0 = observationMap initialCondition

default

structure SystemControlEvidence (S : DigitalControlObservationSystem) where
  stabilityMarginClosed : S.stabilityMargin
  reachabilityUnderControlClosed : S.reachabilityUnderControl
  observabilityConditionClosed : S.observabilityCondition

def DigitalControlObservationSystemClosed (S : DigitalControlObservationSystem) : Prop :=
  S.stabilityMargin ∧ S.reachabilityUnderControl ∧ S.observabilityCondition

theorem system_control_closed_from_evidence (S : DigitalControlObservationSystem) (E : SystemControlEvidence S) :
    DigitalControlObservationSystemClosed S := by
  exact And.intro E.stabilityMarginClosed (And.intro E.reachabilityUnderControlClosed E.observabilityConditionClosed)

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
