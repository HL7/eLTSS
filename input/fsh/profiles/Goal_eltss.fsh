Profile: Goal_eltss
Parent: $us-core-goal
Id: Goal-eltss
Description: "Goal resource mapping for eLTSS"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^definition = "The eLTSS Goal Profile is based upon the US Core FHIR Goal Resource and created to meet the 2015 Edition Common Clinical Data Set 'Goals' requirements."
* description ^short = "Goal"
* description ^definition = "A statement of a desired result that the person wants to achieve."
* subject only Reference(Patient_eltss)
//* target.eltss contains eltss
//slicing on dueby[x] no restriction but putting duration back in
//* target.eltss ^sliceName = "eltss"
* target.dueDuration 0..1 MS

* expressedBy only Reference(Patient_eltss or Practitioner or $us-core-practitionerrole or RelatedPerson)
* expressedBy ^mustSupport = false
* expressedBy ^isModifier = false
* addresses only Reference(Condition_eltss or Observation_eltss or ServiceRequest_eltss or RiskAssessment or NutritionOrder or MedicationStatement)
* addresses ^mustSupport = false
* addresses ^isModifier = false
* outcomeReference only Reference(Observation)
* outcomeReference ^mustSupport = false
* outcomeReference ^isModifier = false