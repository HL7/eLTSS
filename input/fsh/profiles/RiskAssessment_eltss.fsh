Profile: RiskAssessment_eltss
Parent: RiskAssessment
Id: RiskAssessment-eltss
Description: "RiskAssessment resource mapping for eLTSS"
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^mustSupport = false
* . ^isModifier = false
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains RiskPlan named riskPlan 0..*
* subject only Reference(Patient_eltss)
* encounter only Reference($us-core-encounter)
* condition only Reference(Condition_eltss)
* performer only Reference(Practitioner_eltss or $us-core-practitionerrole or $us-core-device)
* reasonReference only Reference(Condition_eltss or Observation_eltss or $us-core-diagnosticreport-note or $us-core-documentreference)
* prediction ^short = "Identified Risk"
* prediction ^definition = "An aspect of a person’s life, behavior, environmental exposure, personal characteristic, or barrier that increases the likelihood of  disease, condition,  injury to self or others, or interaction with the criminal justice system."
* prediction ^mustSupport = false
* prediction ^isModifier = false
* mitigation ^short = "Risk Management Plan"
* mitigation ^definition = "Description of planned activities to minimize identified risks that endanger the person's health and safety. This can be included as free text or attachment."
* mitigation ^mustSupport = false
* mitigation ^isModifier = false