import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure StabilityLemma (S : DigitalControlSystem) (O : ObservationOperator S) (D : ObserverDesign S O) where
  lyapunovFunction : Type u
  stabilityCondition : Prop
  closedLoopStability : Prop
  stableIfObservable : closedLoopStability → O.detectability

structure StabilityEvidence {S : DigitalControlSystem} {O : ObservationOperator S} {D : ObserverDesign S O} (L : StabilityLemma S O D) where
  stabilityConditionClosed : L.stabilityCondition
  closedLoopStabilityClosed : L.closedLoopStability

def StabilityClosed {S : DigitalControlSystem} {O : ObservationOperator S} {D : ObserverDesign S O} (L : StabilityLemma S O D) : Prop :=
  L.stabilityCondition ∧ L.closedLoopStability

theorem stability_closed_from_evidence {S : DigitalControlSystem} {O : ObservationOperator S} {D : ObserverDesign S O} (L : StabilityLemma S O D) (E : StabilityEvidence L) : StabilityClosed L :=
  And.intro E.stabilityConditionClosed E.closedLoopStabilityClosed

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse