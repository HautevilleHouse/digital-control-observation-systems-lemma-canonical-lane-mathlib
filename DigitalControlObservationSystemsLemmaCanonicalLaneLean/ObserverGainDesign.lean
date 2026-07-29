import canonicals.Lemma.ObservationDynamics

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure ObserverGainDesignPackage {O : ObservationDynamicsPackage} where
  gainMatrix : Type u
  innovationTerm : O.dynamicsOperator → O.observationMap → O.dynamicsOperator
  estimationError : O.dynamicsOperator → O.observationMap → O.dynamicsOperator
  convergenceCondition : Prop
  stabilityCondition : Prop

structure ObserverGainDesignEvidence {O : ObservationDynamicsPackage}
    (G : ObserverGainDesignPackage O) where
  gainMatrixClosed : G.gainMatrix = G.gainMatrix
  innovationTermClosed : G.innovationTerm = G.innovationTerm
  estimationErrorClosed : G.estimationError = G.estimationError
  convergenceConditionClosed : G.convergenceCondition
  stabilityConditionClosed : G.stabilityCondition

def ObserverGainDesignClosed {O : ObservationDynamicsPackage}
    (G : ObserverGainDesignPackage O) : Prop :=
  G.convergenceCondition ∧ G.stabilityCondition

theorem observer_gain_design_closed_from_evidence {O : ObservationDynamicsPackage}
    (G : ObserverGainDesignPackage O) (E : ObserverGainDesignEvidence G) :
    ObserverGainDesignClosed G := by
  exact And.intro E.convergenceConditionClosed E.stabilityConditionClosed

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse