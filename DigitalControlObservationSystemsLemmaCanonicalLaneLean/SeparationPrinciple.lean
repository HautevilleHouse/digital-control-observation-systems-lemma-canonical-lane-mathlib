import canonicals.Lemma.ObserverGainDesign

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure SeparationPrinciplePackage {O : ObservationDynamicsPackage}
    {G : ObserverGainDesignPackage O} where
  controllerStateFeedback : Type u
  controlLaw : O.dynamicsOperator → O.observationMap → O.dynamicsOperator
  closedLoopDynamics : O.dynamicsOperator → O.observationMap → O.dynamicsOperator
  separationHolds : Prop
  polePlacementAchieved : Prop

structure SeparationPrincipleEvidence {O : ObservationDynamicsPackage}
    {G : ObserverGainDesignPackage O} (S : SeparationPrinciplePackage G) where
  controllerStateFeedbackClosed : S.controllerStateFeedback = S.controllerStateFeedback
  controlLawClosed : S.controlLaw = S.controlLaw
  closedLoopDynamicsClosed : S.closedLoopDynamics = S.closedLoopDynamics
  separationHoldsClosed : S.separationHolds
  polePlacementAchievedClosed : S.polePlacementAchieved

def SeparationPrincipleClosed {O : ObservationDynamicsPackage}
    {G : ObserverGainDesignPackage O} (S : SeparationPrinciplePackage G) : Prop :=
  S.separationHolds ∧ S.polePlacementAchieved

theorem separation_principle_closed_from_evidence {O : ObservationDynamicsPackage}
    {G : ObserverGainDesignPackage O} (S : SeparationPrinciplePackage G)
    (E : SeparationPrincipleEvidence S) : SeparationPrincipleClosed S := by
  exact And.intro E.separationHoldsClosed E.polePlacementAchievedClosed

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse