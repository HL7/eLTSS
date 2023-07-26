Logical: ELTSSPersonModel
Parent: Element
Id: eLTSSPersonModel
Title: "eLTSS Person Logical Model"
Description: "Person data included in the eLTSS Dataset."
//* ^identifier.system = "http://hl7.org/fhir/us/eLTSS/STU1"
//* ^identifier.system = "http://hl7.org/fhir/us/eLTSS"
//* ^identifier.value = "eLTSS.Person"
* ^status = #draft
* ^date = "2019-02-07T00:00:00-05:00"
* ^publisher = "The HL7 Community Based Care and Privacy Workgroup"
//* ^type = "eLTSSPersonModel"
//* . ^definition = "eLTSS Dataset Person data."
//* . ^base.path = "eLTSSPersonModel"
//* . ^base.min = 0
//* . ^base.max = "*"
//* . ^mustSupport = false
//* . ^isModifier = false
//* . ^isSummary = false
* identifier 1..* SU string "An identifier for the person." "An identifier for the person."
* identifier ^base.path = "eLTSSPersonModel.identifier"
* identifier ^base.min = 1
* identifier ^base.max = "*"
* identifier ^mustSupport = false
* identifier ^isModifier = false
* name 1..* SU string "The name of the person." "The name of the person."
* name ^base.path = "eLTSSPersonModel.name"
* name ^base.min = 1
* name ^base.max = "*"
* name ^mustSupport = false
* name ^isModifier = false
* dateOfBirth 1..* SU string "The birth date of the person." "The birth date of the person."
* dateOfBirth ^base.path = "eLTSSPersonModel.dateOfBirth"
* dateOfBirth ^base.min = 1
* dateOfBirth ^base.max = "*"
* dateOfBirth ^mustSupport = false
* dateOfBirth ^isModifier = false
* phoneNumber 1..* SU string "The primary phone number of the person whom the plan is for." "The primary phone number of the person whom the plan is for, or his/her legal representative, where applicable."
* phoneNumber ^base.path = "eLTSSPersonModel.phoneNumber"
* phoneNumber ^base.min = 1
* phoneNumber ^base.max = "*"
* phoneNumber ^mustSupport = false
* phoneNumber ^isModifier = false
* address 1..* SU string "The address of the person." "The address of the person."
* address ^base.path = "eLTSSPersonModel.address"
* address ^base.min = 1
* address ^base.max = "*"
* address ^mustSupport = false
* address ^isModifier = false
* emergencyContact 0..* BackboneElement "The individual or entity identified to contact in case of emergency." "The individual or entity identified to contact in case of emergency."
* emergencyContact ^base.path = "eLTSSPersonModel.emergencyContact"
* emergencyContact ^base.min = 0
* emergencyContact ^base.max = "*"
* emergencyContact ^mustSupport = false
* emergencyContact ^isModifier = false
* emergencyContact ^isSummary = false
* emergencyContact.name 0..* string "The name of the individual or entity identified to contact in case of emergency." "The name of the individual or entity identified to contact in case of emergency."
* emergencyContact.name ^base.path = "eLTSSPersonModel.emergencyContact.name"
* emergencyContact.name ^base.min = 0
* emergencyContact.name ^base.max = "*"
* emergencyContact.name ^mustSupport = false
* emergencyContact.name ^isModifier = false
* emergencyContact.name ^isSummary = false
* emergencyContact.relationship 0..* string "The relationship of the individual identified to contact in case of emergency." "The relationship (e.g. spouse, neighbor, guardian, daughter) of the individual identified to contact in case of emergency."
* emergencyContact.relationship ^base.path = "eLTSSPersonModel.emergencyContact.relationship"
* emergencyContact.relationship ^base.min = 0
* emergencyContact.relationship ^base.max = "*"
* emergencyContact.relationship ^mustSupport = false
* emergencyContact.relationship ^isModifier = false
* emergencyContact.relationship ^isSummary = false
* emergencyContact.phoneNumber 0..* string "The primary phone number of the individual identified to contact in case of emergency." "The primary phone number (and extension when applicable) of the individual identified to contact in case of emergency."
* emergencyContact.phoneNumber ^base.path = "eLTSSPersonModel.emergencyContact.phoneNumber"
* emergencyContact.phoneNumber ^base.min = 0
* emergencyContact.phoneNumber ^base.max = "*"
* emergencyContact.phoneNumber ^mustSupport = false
* emergencyContact.phoneNumber ^isModifier = false
* emergencyContact.phoneNumber ^isSummary = false