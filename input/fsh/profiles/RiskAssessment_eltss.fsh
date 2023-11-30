Profile: RiskAssessment_eltss
Parent: RiskAssessment
Id: RiskAssessment-eltss
Description: "RiskAssessment resource mapping for eLTSS"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"


* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains RiskPlan named riskPlan 0..* MS and $resource-pertainsToGoal named resource-pertainsToGoal 0..* MS

* extension[resource-pertainsToGoal] ^short = "The resource-pertainsToGoal relates the resource to the goal(s) that pertain to it. Whenever there is a goal associated with a health concern or problem, this extension should be present and populated in activity (event or intent) resources."

* subject only Reference(Patient_eltss)
* encounter only Reference($us-core-encounter)
* condition only Reference(Condition_eltss)
* performer only Reference(Practitioner_eltss or PractitionerRole_eltss or $us-core-device or Device)
* reasonReference only Reference(Condition_eltss or Observation_eltss or $us-core-diagnosticreport-note or $us-core-documentreference)
* prediction ^short = "Identified Risk"
* prediction ^definition = "An aspect of a person’s life, behavior, environmental exposure, personal characteristic, or barrier that increases the likelihood of  disease, condition,  injury to self or others, or interaction with the criminal justice system."
//* prediction.outcome.binding.valueset = "https://example.org"

* prediction.outcome ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
* prediction.outcome ^binding.extension.valueString = "RiskPredictionOutcome"
* prediction.outcome ^binding.description = "The condition or other outcome; e.g. death, remission, amputation, infection, etc."
* prediction.outcome ^binding.valueSet = "http://terminology.hl7.org/ValueSet/v2-0241"

* mitigation MS
* mitigation ^short = "Risk Management Plan"
* mitigation ^definition = "Description of planned activities to minimize identified risks that endanger the person's health and safety. This can be included as free text or attachment."
