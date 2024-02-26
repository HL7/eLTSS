//Alias: $sdc-questionnaireresponse = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse

Profile: QuestionnaireResponse_eltss
Parent: QuestionnaireResponse
Id: QuestionnaireResponse-eltss
Title: "eLTSS QuestionnaireResponse Profile"
Description: "This profile is consistent with the USCORE QuestionnaireResponse Profile, which is itself related to the SDCQuestionnaireResponse Profile. It supports core elements, vocabularies and value sets from the resource that are used to communicate eLTSS data elements."
* ^status = #active
* ^experimental = false
* ^date = "2023-10-17"
* . ^short = "eLTSS QuestionnaireResponse Profile is based on USCORE version 7."
* . ^definition = "\\-"
* . ^comment = "\\-"
* identifier MS
* questionnaire MS
* questionnaire ^type.targetProfile = "http://hl7.org/fhir/us/eltss/StructureDefinition/Questionnaire-eltss"
* status MS
* subject 1.. MS
* subject only Reference(Patient_eltss or Resource)
* subject ^comment = "-"
* subject ^type[0].targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type[=].targetProfile[=].extension.valueBoolean = true
* authored MS
* author MS

* item.linkId MS
* item.answer MS
* item.answer.value[x] 0..1 MS
* item.answer.value[x] only boolean or date or dateTime or time or decimal or integer or string or Coding or uri or Quantity or Attachment or Reference
* item.answer.value[x] ^type[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* item.answer.value[x] ^type[=].extension.valueBoolean = true
* item.answer.value[x] ^type[4].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* item.answer.value[x] ^type[=].extension.valueBoolean = true
* item.answer.value[x] ^type[6].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* item.answer.value[x] ^type[=].extension.valueBoolean = true
* item.answer.value[x] ^type[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* item.answer.value[x] ^type[=].extension.valueBoolean = true
* item.answer.item MS
* item MS