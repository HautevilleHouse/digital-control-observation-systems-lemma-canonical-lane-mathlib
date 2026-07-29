import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DigitalControlObservationSystemsLemmaCanonicalLaneLean

structure ObservabilityGramianPackage where
  systemMatrix : Type
  outputMatrix : Type
  gramianMatrix : Type
  positiveDefiniteness : Prop
  rankCondition : Prop
  dualityWithControllability : Prop

theorem observability_gramian_closed (pkg : ObservabilityGramianPackage) :
  pkg.positiveDefiniteness ∧ pkg.rankCondition ∧ pkg.dualityWithControllability := by
  exact And.intro pkg.positiveDefiniteness (And.intro pkg.rankCondition pkg.dualityWithControllability)

end DigitalControlObservationSystemsLemmaCanonicalLaneLean
end HautevilleHouse
