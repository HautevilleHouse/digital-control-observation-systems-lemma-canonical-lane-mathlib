import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure ObservationOperator (S : DigitalControlSystem) where
  outputMatrix : Type u
  rankCondition : Prop
  detectability : Prop
  detectabilityProof : detectability

structure ObservationEvidence {S : DigitalControlSystem} (O : ObservationOperator S) where
  rankConditionClosed : O.rankCondition
  detectabilityClosed : O.detectability

def ObservationClosed {S : DigitalControlSystem} (O : ObservationOperator S) : Prop :=
  O.rankCondition ∧ O.detectability

theorem observation_closed_from_evidence {S : DigitalControlSystem} (O : ObservationOperator S) (E : ObservationEvidence O) : ObservationClosed O :=
  And.intro E.rankConditionClosed E.detectabilityClosed

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse