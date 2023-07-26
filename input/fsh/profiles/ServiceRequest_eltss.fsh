Profile: ServiceRequest_eltss
Parent: ServiceRequest
//Parent: $us-core-servicerequest
Id: ServiceRequest-eltss
Description: "ServiceRequest resource mapping for eLTSS"
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
* extension contains Eltss_directedBy named directedBy 0..*
* extension[directedBy] ^sliceIsConstraining = false
* basedOn only Reference(CarePlan_eltss or ServiceRequest_eltss or MedicationRequest)
* replaces only Reference(ServiceRequest_eltss)
* code ^short = "Service Name"
* code ^definition = "Identifies the paid and/or non-paid service provided to a person. Include the code and display name plus any modifiers when a coding system (e.g., Healthcare Common Procedure Coding System (HCPCS), Home Health Revenue Codes) is used."
* code ^comment = "Use HCPCS (https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo/) code + modifiers or free text."
* code ^mustSupport = false
* code ^isModifier = false
//* code from adverse-event-contributing-factor-vs (example)
//* extension[item].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
//* extension[item].valueCodeableConcept ^binding.extension.valueString = "AdverseEventContributingFactor"
* code from http://terminology.hl7.org/ValueSet/v3-HealthCareCommonProcedureCodingSystem (preferred)
* code ^binding.description = "Use HCPCS (https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo/) code + modifiers or free text."
//* eltss contains
//    eltss and
//    eltss
//* eltss ^short = "Service Unit Quantity + Unit Type + Time Interval"
//* eltss ^definition = "The numerical amount/unit or Interval of the service unit being provided."
//* eltss ^comment = "The numerical amount of the service unit being provided for a frequency.  This element is slated to be used in conjunction with Service Quantity Interval and Unit of Service Type elements to form a full description of how often a service is provided. \nOR \nA named quantity in terms of which services are measured or specified, used as a standard measurement of like services.\nOR \nA period of time corresponding to the quantity of service(s) indicated. Values include: per day, per week, per month, per year, one time only, other (free text)."
//* eltss ^mustSupport = false
//* eltss ^isModifier = false
* quantity[x] ^short = "Service Unit Quantity + Unit Type + Time Interval"
* quantity[x] ^definition = "The numerical amount/unit or Interval of the service unit being provided."
* quantity[x] ^comment = "The numerical amount of the service unit being provided for a frequency.  This element is slated to be used in conjunction with Service Quantity Interval and Unit of Service Type elements to form a full description of how often a service is provided. \nOR \nA named quantity in terms of which services are measured or specified, used as a standard measurement of like services.\nOR \nA period of time corresponding to the quantity of service(s) indicated. Values include: per day, per week, per month, per year, one time only, other (free text)."
* quantity[x] ^mustSupport = false
* quantity[x] ^isModifier = false 

* subject only Reference(Patient_eltss or Group or $us-core-device or Device or Location_eltss)
* encounter only Reference($us-core-encounter)
//* eltss ^short = "Service Start + End Date"
//* eltss ^definition = "The start and end date of the service being provided."
//* eltss ^mustSupport = false
//* eltss ^isModifier = false
* occurrence[x] ^short = "Service Start + End Date"
* occurrence[x] ^definition = "The start and end date of the service being provided."
* occurrence[x] ^mustSupport = false
* occurrence[x] ^isModifier = false
* requester only Reference(Practitioner_eltss or $us-core-practitionerrole or Patient_eltss or $us-core-organization or RelatedPerson or $us-core-device or Device)
* performer only Reference(Practitioner_eltss or $us-core-practitionerrole or Patient_eltss or $us-core-organization or RelatedPerson or $us-core-device or Device or $us-core-careteam or HealthcareService)
* performer ^short = "Service Provider Name + Phone + Relationship"
* performer ^definition = "The entity or individual providing the service. For paid services use the organization/agency name, for non-paid services use the first and last name of the individual providing the service."
* performer ^mustSupport = false
* performer ^isModifier = false
* locationReference only Reference(Location_eltss)
* locationReference ^short = "Service Delivery Address"
* locationReference ^definition = "The address where service delivery will take place if service will not be provided at the person's address."
* locationReference ^mustSupport = false
* locationReference ^isModifier = false
* reasonReference only Reference(Condition_eltss or Observation_eltss or $us-core-diagnosticreport-note or $us-core-documentreference)
* insurance ^short = "Service Funding Source"
* insurance ^definition = "The source of payment for the service."
* insurance ^mustSupport = false
* insurance ^isModifier = false
* note ^short = "Service Comment"
* note ^definition = "Additional information related to the service being provided. This field could capture additional information of the frequency of the service, how the person wants the service delivered and only used when the comment provides additional detail of the service not already handled by another element."
* note ^mustSupport = false
* note ^isModifier = false