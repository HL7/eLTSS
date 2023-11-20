//Alias: $sdc-questionnaireresponse = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse

Profile: QuestionnaireResponse_eltss
Parent: QuestionnaireResponse
Id: QuestionnaireResponse-eltss
Title: "US Core QuestionnaireResponse Profile"
Description: "To promote interoperability and adoption through common implementation, this profile sets minimum expectations for the QuestionnaireResponse resource to record, search, and fetch retrieve captures the responses to form/survey and assessment tools such as the *Protocol for Responding to and Assessing Patients’ Assets, Risks, and Experiences (PRAPARE) Survey*.   This profile is based on the [Structured Data Capture (SDC) Questionnaire Response Profile](http://hl7.org/fhir/uv/sdc/STU3/StructureDefinition-sdc-questionnaireresponse.html) and identifies the *additional* core elements, extensions, vocabularies and value sets **SHALL** be present in the resource and constrains the way the elements are used when using this profile. It provides the floor for standards development for specific uses cases."
* ^date = "2023-10-17"
* . ^short = "US Core Profile based on SDC QuestionnaireResponse"
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