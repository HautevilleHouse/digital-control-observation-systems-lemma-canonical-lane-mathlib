import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure ObserverDesign (S : DigitalControlSystem) (O : ObservationOperator S) where
  observerGain : Type u
  estimationError : Prop
  convergenceCondition : Prop
  convergenceProof : convergenceCondition

structure ObserverEvidence {S : DigitalControlSystem} {O : ObservationOperator S} (D : ObserverDesign S O) where
  estimationErrorClosed : D.estimationError
  convergenceConditionClosed : D.convergenceCondition

def ObserverClosed {S : DigitalControlSystem} {O : ObservationOperator S} (D : ObserverDesign S O) : Prop :=
  D.estimationError ∧ D.convergenceCondition

theorem observer_closed_from_evidence {S : DigitalControlSystem} {O : ObservationOperator S} (D : ObserverDesign S O) (E : ObserverEvidence D) : ObserverClosed D :=
  And.intro E.estimationErrorClosed E.convergenceConditionClosed

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse