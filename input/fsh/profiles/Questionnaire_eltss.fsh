Profile: Questionnaire_eltss
Parent: Questionnaire
Id: Questionnaire-eltss
Description: "Questionnaire resource mapping for eLTSS"
* ^version = "1.0.0"
* ^status = #draft
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^mustSupport = false
* . ^isModifier = false
* derivedFrom only canonical
* derivedFrom ^type.targetProfile = "http://hl7.org/fhir/us/eLTSS/StructureDefinition/Questionnaire-eltss"
* item ^definition = "One of:\nPerson Setting Choice Indicator\nPerson Setting Choice Options\nService Options Given Indicator\nService Selection Indicator\nService Plan Agreement Indicator\nService Provider Options Given Indicator\nService Provider Selection Agreement Indicator."
* item ^mustSupport = false
* item ^isModifier = false
* item.type ^mustSupport = false
* item.type ^isModifier = false