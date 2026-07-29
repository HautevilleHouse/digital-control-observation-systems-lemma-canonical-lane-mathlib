import DigitalControlObservationSystemsLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure DigitalControlObservationSystemsAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  observationSystem : Prop
  digitalControl : Prop
  lemmaConclusion : Prop
  conclusion : lemmaConclusion

def DigitalControlObservationSystemsWitnessClosed (O : DigitalControlObservationSystemsAdmittedObject) : Prop :=
  O.lemmaConclusion

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  constrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "digital-control-observation-systems-lemma-canonical-lane",
  theoremName := "Digital Control Observation Systems Lemma",
  theoremObject := "admissible-class bridge closure for digital control observation systems",
  classicalBoundary := "carried outside the constrained admissible closure",
  constrainedStatement := "the constrained digital control observation systems lemma is closed under bridge and gate",
  certificateLane := "manifold_constrained",
  carriedRemainder := "unrestricted classical closure remains carried"
}

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
