Profile: Patient_eltss
Parent: $us-core-patient
Id: Patient-eltss
Description: "Patient resource mapping for eLTSS"
* ^status = #draft
* ^experimental = false
* ^date = "2019-06-01T01:00:00-04:00"
* ^publisher = "HL7 CBCP"
* . ^definition = "The eLTSS Patient Profile is based upon the US Core Patient Resource and designed to meet the applicable patient demographic data elements from the 2015 Edition Common Clinical Data Set.."
//* extension.extension.valueCoding[valueCoding] ^sliceName = "valueCoding"
//* extension.extension.valueCoding[valueCoding] ^sliceName = "valueCoding"
//* extension.extension.valueString[valueString] ^sliceName = "valueString"
//* extension.extension.valueCoding[valueCoding] ^sliceName = "valueCoding"
//* extension.extension.valueCoding[valueCoding] ^sliceName = "valueCoding"
//* extension.extension.valueString[valueString] ^sliceName = "valueString"
//* extension.valueCode[valueCode] ^sliceName = "valueCode"




* identifier ^short = "Person Identifier"
* identifier ^definition = "A string of character(s) used to identify the person whom the plan is for.\n\nThis may be the Medicaid ID number where applicable."
* identifier.type MS
* identifier.type ^short = "Person Identifier Type"
* identifier.type ^definition = "The type of unique identifier used to identify the person whom the plan is for.\nValues include: Medicaid Number (45400-9), State ID, Medical Record Number, Social Security Number (45396-9) or Other (free text)."
* identifier.type ^comment = "Can be one of Medicaid Number, State ID, Medical Record Number, Other (free text)."
* name ^short = "Person Name"
* name ^definition = "The name of the person whom the plan is for."
* name ^comment = "1) given is used for both first name & MI, so need more than one.\n2) family is a string with the person's surname\n3) text is a string that contains the full name of the person."
* name.family 1..1
* name.given 1..*
* telecom ^short = "Person Phone Number"
* telecom ^definition = "The primary phone number of the person whom the plan is for, or his/her legal representative, where applicable."
* telecom ^comment = "For the eLTSS phone number, system should be provided as \"phone\"."
* birthDate ^short = "Person Date of Birth"
* birthDate ^definition = "The birth date of the person whom the plan is for."
* birthDate ^comment = "birthDate is in the form \"1951-06-04\"."
* address ^short = "Person Address"
* address ^definition = "The address of the person whom the plan is for."
* address ^comment = "1) text is the full (not broken out) address.\n2) line includes street name, number and suffix (e.g. 123 Main St.).\n3) Information such as apt #, floor & room #, etc. also go into line, generally as a separate data element. \n4) district covers county."
* contact MS
* contact ^short = "Emergency Contact"
* contact ^definition = "Emergency Contact Name + Phone Number + Relationship."
* contact ^comment = "1) Emergency contact is indicated using a relationship value \"C\".\n2) If contact is provided, relationship needs to be provided to indicate this is an emergency contact.\n3) given is used for both first name & MI, so need more than one.\n4) family is a string with the person's surname\n5) text is a string with the full name of the person."
* contact.relationship 1..* MS
* contact.relationship ^short = "Emergency Contact Relationship"
* contact.relationship ^definition = "The relationship (e.g., spouse, neighbor, guardian, daughter) of the individual identified to contact in case of emergency."
* contact.relationship ^comment = "Recommended Value Set is PatientContactRelationship http://hl7.org/fhir/ValueSet/patient-contactrelationship."
* contact.name ^short = "Emergency Contact Name"
* contact.name ^definition = "The name of the individual or entity identified to contact in case of emergency."
* contact.name.family 1..1
* contact.name.given 1..*
* contact.telecom ^short = "Emergency Contact Phone"
* contact.telecom ^definition = "The primary phone number (and extension when applicable) of the individual or entity identified to contact in case of emergency."
* contact.telecom.value MS
* contact.telecom.system MS
