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
* extension contains Eltss_directedBy named directedBy 0..* and $resource-pertainsToGoal named resource-pertainsToGoal 0..* MS
* extension[directedBy] ^sliceIsConstraining = false
* extension[resource-pertainsToGoal] ^short = "The resource-pertainsToGoal relates the resource to the goal(s) that pertain to it. Whenever there is a goal associated with a health concern or problem, this extension should be present and populated in activity (event or intent) resources."

//* basedOn MS
* basedOn only Reference(CarePlan_eltss or ServiceRequest_eltss or MedicationRequest)
//* basedOn ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* basedOn ^type.targetProfile[=].extension.valueBoolean = true
//* basedOn ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
//* basedOn ^type.targetProfile[=].extension.valueBoolean = true

* replaces only Reference(ServiceRequest_eltss)

* code ^short = "Service Name"
* code ^definition = "Identifies the paid and/or non-paid service provided to a person. Include the code and display name plus any modifiers when a coding system (e.g., Healthcare Common Procedure Coding System (HCPCS), Home Health Revenue Codes) is used."
* code ^comment = "Use HCPCS (https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo/) code + modifiers or free text."
* code ^isModifier = false
//* code from adverse-event-contributing-factor-vs (example)
//* extension[item].valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-bindingName"
//* extension[item].valueCodeableConcept ^binding.extension.valueString = "AdverseEventContributingFactor"
* code from http://terminology.hl7.org/ValueSet/v3-HealthCareCommonProcedureCodingSystem (preferred)
* code ^binding.description = "Use HCPCS (https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo/) code + modifiers or free text."
* code MS
* code.text MS
* code.coding MS
* code.coding.code MS
* code.coding.system MS

//* eltss contains
//    eltss and
//    eltss
//* eltss ^short = "Service Unit Quantity + Unit Type + Time Interval"
//* eltss ^definition = "The numerical amount/unit or Interval of the service unit being provided."
//* eltss ^comment = "The numerical amount of the service unit being provided for a frequency.  This element is slated to be used in conjunction with Service Quantity Interval and Unit of Service Type elements to form a full description of how often a service is provided. \nOR \nA named quantity in terms of which services are measured or specified, used as a standard measurement of like services.\nOR \nA period of time corresponding to the quantity of service(s) indicated. Values include: per day, per week, per month, per year, one time only, other (free text)."
//* eltss ^mustSupport = false
//* eltss ^isModifier = false
* quantity[x] MS
* quantity[x] ^short = "Service Unit Quantity + Unit Type + Time Interval"
* quantity[x] ^definition = "The numerical amount/unit or Interval of the service unit being provided."
* quantity[x] ^comment = "The numerical amount of the service unit being provided for a frequency.  This element is slated to be used in conjunction with Service Quantity Interval and Unit of Service Type elements to form a full description of how often a service is provided. \nOR \nA named quantity in terms of which services are measured or specified, used as a standard measurement of like services.\nOR \nA period of time corresponding to the quantity of service(s) indicated. Values include: per day, per week, per month, per year, one time only, other (free text)."
* quantity[x] ^isModifier = false 

* quantityQuantity MS
* quantityQuantity.unit MS
* quantityQuantity.code MS
* quantityQuantity.system MS
* quantityQuantity.value MS
* quantityQuantity.unit ^short = "UCUM codes are very useful here. But, if the concept maps to the unity unit in UCUM, then it is likely appropriate to choose a specific concept from another system. Use quanitityRatio when appropriate (such as in sessions per week) instead of quantityQuantity."

* quantityRatio MS
* quantityRatio.numerator MS
* quantityRatio.numerator.value MS
* quantityRatio.numerator.unit MS
* quantityRatio.numerator.code MS
* quantityRatio.numerator.system MS
* quantityRatio.numerator.unit ^short = "UCUM codes are very useful here, but also coded numerators could be used for something like: sessions per week. See the Implementation guidance section"
* quantityRatio MS
* quantityRatio.denominator MS
* quantityRatio.denominator.value MS
* quantityRatio.denominator.unit MS
* quantityRatio.denominator.unit ^short = "UCUM codes are very useful here"
* quantityRatio.denominator.code MS
* quantityRatio.denominator.system MS

* subject MS
* subject only Reference(Patient_eltss or Group or $us-core-device or Device or Location_eltss)
* subject ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* subject ^type.targetProfile[=].extension.valueBoolean = true

* encounter only Reference($us-core-encounter)
//* eltss ^short = "Service Start + End Date"
//* eltss ^definition = "The start and end date of the service being provided."
//* eltss ^mustSupport = false
//* eltss ^isModifier = false
* occurrence[x] MS
* occurrence[x] ^short = "Service Start + End Date"
* occurrence[x] ^definition = "The start and end date of the service being provided."
* occurrence[x] ^isModifier = false
* occurrencePeriod MS
* occurrencePeriod ^short = "Use this when the quantity is meant to be performed within a defined, simple start and end date. E.g. For May 31,2023 to June 10, 2023 give ServicePlan.quantity of 5 [USD]/day."
* occurrenceTiming MS
* occurrenceTiming ^short = "Please consider using this for timing information that fluctuates or is sufficiently complex. You will need to calculate end-date, or use occurrenceTiming.boundsPeriod to ascribe a start and end date. E.g. Give ServicePlan.quantity 5 with unit=[USD]/day with the occurrenceTiming.boundsPeriod of May 31, 2023 to June 23, 2023 on occurrenceTiming.dayOfWeek = Mon and Wed at occurrenceTiming.timeOfDay = 3 pm."
* occurrenceTiming.repeat MS
* occurrenceTiming.repeat.bounds[x] MS
* occurrenceTiming.repeat.boundsPeriod MS
* occurrenceTiming.repeat.boundsPeriod.start MS
* occurrenceTiming.repeat.boundsPeriod.end MS
* authoredOn MS

* requester MS
* requester only Reference(Practitioner_eltss or PractitionerRole_eltss or Patient_eltss or $us-core-organization or RelatedPerson_eltss or $us-core-device or Device)
* requester ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* requester ^type.targetProfile[=].extension.valueBoolean = true
* performer MS
* performer only Reference(Practitioner_eltss or PractitionerRole_eltss or Patient_eltss or $us-core-organization or RelatedPerson_eltss or $us-core-device or Device or $us-core-careteam or HealthcareService)
* performer ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performer ^type.targetProfile[=].extension.valueBoolean = true
* performer ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performer ^type.targetProfile[=].extension.valueBoolean = true
* performer ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performer ^type.targetProfile[=].extension.valueBoolean = true
* performer ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performer ^type.targetProfile[=].extension.valueBoolean = true
* performer ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* performer ^type.targetProfile[=].extension.valueBoolean = true

* performer ^short = "Service Provider Name + Phone + Relationship"
* performer ^definition = "The entity or individual providing the service. For paid services use the organization/agency name, for non-paid services use the first and last name of the individual providing the service."

* performer ^isModifier = false
* locationReference MS
* locationReference only Reference(Location_eltss)
* locationReference ^short = "Service Delivery Address"
* locationReference ^definition = "The address where service delivery will take place if service will not be provided at the person's address."
* locationReference ^isModifier = false
* reasonReference only Reference(Condition_eltss or Observation_eltss or $us-core-diagnosticreport-note or $us-core-documentreference)
* insurance MS
* insurance ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* insurance ^type.targetProfile[=].extension.valueBoolean = true
* insurance ^short = "Service Funding Source"
* insurance ^definition = "The source of payment for the service."
* insurance ^isModifier = false
* note MS
* note ^short = "Service Comment"
* note ^definition = "Additional information related to the service being provided. This field could capture additional information of the frequency of the service, how the person wants the service delivered and only used when the comment provides additional detail of the service not already handled by another element."
* note ^isModifier = false

* supportingInfo MS