Profile: Condition_eltss
Parent: $us-core-condition
Id: Condition-eltss
Description: "Condition for eLTSS"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^definition = "The eLTSS Condition Profile is based upon the US Core FHIR Condition Resource and created to meet the 2015 Edition Common Clinical Data Set 'Problems' and 'Health Concerns' requirements."
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains ELTSS_dueTo named dueTo 0..*
* extension[dueTo] ^sliceIsConstraining = false
* category ^code.system = "http://hl7.org/fhir/us/eLTSS/ValueSet/eltss-condition-category-code"
* category ^short = "Assessed Need Category"
* category ^comment = "Could use the value \"problem-list-item\" to indicate the underlying condition, and extend the value set to add the value \"assessed-need\"."
* code ^short = "Assessed Need Code"
* code ^definition = "The clinical and/or community-based necessity or desire as identified byan assessment that should be addressed by a service."
* subject only Reference(Patient_eltss)
* recorder only Reference(Practitioner or $us-core-practitionerrole or Patient_eltss or RelatedPerson)
* asserter only Reference(Practitioner or $us-core-practitionerrole or Patient_eltss or RelatedPerson)
* stage.assessment only Reference(Observation_eltss or ClinicalImpression or DiagnosticReport)