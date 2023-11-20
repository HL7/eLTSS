Profile: CarePlan_eltss
Parent: $us-core-careplan
Id: CarePlan-eltss
Description: "CarePlan for eLTSS"
* ^status = #draft
* ^experimental = false
* ^date = "2019-06-01T01:00:00-04:00"
* ^publisher = "HL7 CBCP"
* . ^short = "eLTSS Healthcare plan for patient or group"
* instantiatesCanonical only canonical
* instantiatesCanonical ^type.targetProfile[0] = "http://hl7.org/fhir/StructureDefinition/PlanDefinition"
* instantiatesCanonical ^type.targetProfile[+] = "http://hl7.org/fhir/us/eltss/StructureDefinition/Questionnaire-eltss"
* instantiatesCanonical ^type.targetProfile[+] = "http://hl7.org/fhir/StructureDefinition/Measure"
* instantiatesCanonical ^type.targetProfile[+] = "http://hl7.org/fhir/StructureDefinition/ActivityDefinition"
* instantiatesCanonical ^type.targetProfile[+] = "http://hl7.org/fhir/StructureDefinition/OperationDefinition"
//* instantiatesCanonical ^mustSupport = false
* instantiatesCanonical ^isModifier = false
* basedOn only Reference(CarePlan_eltss)
* basedOn ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy"
* basedOn ^type.extension.valueBoolean = true
* basedOn ^mustSupport = false
* basedOn ^isModifier = false
* replaces only Reference(CarePlan_eltss)
* replaces ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy"
* replaces ^type.extension.valueBoolean = true
//* replaces ^mustSupport = false
* replaces ^isModifier = false
* partOf only Reference(CarePlan_eltss)
* partOf ^short = "Emergency Backup Plan"
* partOf ^definition = "Description of how to address unforeseen events, emergency health events, emergency events, problems with medical equipment and supplies, and unavailable staffing situations for critical services that put the person’s health and safety at risk.\n\nThis can be included as free text or attachment."
* partOf ^comment = "The CarePlan resource containing the emergency backup plan refers to the \"main\" CarePlan resource, rather than the other way around, by using the emergency backup plan CarePlan -> partOf data element to reference the \"main\" CarePlan data element."
* partOf ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy"
* partOf ^type.extension.valueBoolean = true
* partOf ^mustSupport = true
* partOf ^isModifier = false
* subject only Reference(Patient_eltss)
* subject ^short = "CarePlan Subject"
* subject ^definition = "Referencing the Person from CarePlan."
* subject ^comment = "Reference the Patient for the care plan being developed."
* encounter MS
* period MS
* period ^short = "Plan Effective Date"
* period ^definition = "The date upon which the plan goes into effect. Start date is required, end date is optional."
* period ^isModifier = false
* period.start 1..1 MS
* period.end 0..1 MS
* author MS
* author only Reference(Patient_eltss or Practitioner_eltss or PractitionerRole_eltss or RelatedPerson_eltss or $us-core-organization or $us-core-careteam)
* author ^short = "Support Planner"
* author ^definition = "The  person (e.g., Case Manager, Care Coordinator, Plan Coordinator) who helped develop the plan."
* author ^comment = "Support Planner Name + Phone."
* author ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* author ^type.targetProfile[=].extension.valueBoolean = false
* author ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* author ^type.targetProfile[=].extension.valueBoolean = true
* author ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* author ^type.targetProfile[=].extension.valueBoolean = true
* author ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* author ^type.targetProfile[=].extension.valueBoolean = false
* author ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* author ^type.targetProfile[=].extension.valueBoolean = false
* author ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* author ^type.targetProfile[=].extension.valueBoolean = false


* contributor only Reference(Patient_eltss or Practitioner_eltss or PractitionerRole_eltss or RelatedPerson_eltss or $us-core-organization or $us-core-careteam)
//* contributor ^mustSupport = false
* contributor ^isModifier = false
* addresses only Reference(Condition_eltss)
* addresses MS
* addresses ^short = "Assessed Need"
* addresses ^definition = "The clinical and/or community-based necessity or desire as identified through an assessment that should be addressed by a service."
* addresses ^comment = "Each assessed need should go into a separate Condition element so each can potentially be linked to a service(s) that addresses it."
* addresses ^isModifier = false
* supportingInfo ^definition = "Identifies portions of the patient's record that  specifically influenced the formation of the plan.  These might include comorbidities, recent procedures, limitations, recent assessments, etc.  This includes the RiskAssessment/Risk Management Plan"
* goal only Reference(Goal_eltss)
* goal ^mustSupport = true
* goal ^isModifier = false
* supportingInfo MS
* activity ^short = "Action to occur as part of a plan"
* activity ^definition = "A planned measurable step or action that needs to be taken to accomplish a goal identified by the person."
* activity ^comment = "Note that a stated goal may lead directly to a service, and not necessarily to an explicit Step or Action. For example, a person's goal could be to attend church regularly, and this would be achieved through a transportation service."
* activity ^mustSupport = true
* activity ^isModifier = false
* activity.reference MS
* activity.reference only Reference(Appointment or CommunicationRequest or DeviceRequest or MedicationRequest or NutritionOrder or Task or ServiceRequest_eltss or VisionPrescription or RequestGroup)
* activity.reference ^type.targetProfile[0].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* activity.reference ^type.targetProfile[=].extension.valueBoolean = true
* activity.reference ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* activity.reference ^type.targetProfile[=].extension.valueBoolean = false
* activity.reference ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* activity.reference ^type.targetProfile[=].extension.valueBoolean = false
* activity.reference ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* activity.reference ^type.targetProfile[=].extension.valueBoolean = false
* activity.reference ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* activity.reference ^type.targetProfile[=].extension.valueBoolean = false
* activity.reference ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* activity.reference ^type.targetProfile[=].extension.valueBoolean = true
* activity.reference ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* activity.reference ^type.targetProfile[=].extension.valueBoolean = true
* activity.reference ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* activity.reference ^type.targetProfile[=].extension.valueBoolean = false
* activity.reference ^type.targetProfile[+].extension.url = "http://hl7.org/fhir/StructureDefinition/elementdefinition-type-must-support"
* activity.reference ^type.targetProfile[=].extension.valueBoolean = false

* activity.reference ^isModifier = false
* activity.detail 0..0
//* activity.detail ^short = "Plan Step or Action"
//* activity.detail ^definition = "A planned measurable step or action that needs to be taken to accomplish a goal identified by the person."
//* activity.detail ^mustSupport = false
//* activity.detail ^isModifier = false
//* activity.detail.instantiatesCanonical only canonical
//* activity.detail.instantiatesCanonical ^type.targetProfile[0] = "http://hl7.org/fhir/StructureDefinition/PlanDefinition"
//* activity.detail.instantiatesCanonical ^type.targetProfile[+] = "http://hl7.org/fhir/us/eltss/StructureDefinition/Questionnaire-eltss"
//* activity.detail.instantiatesCanonical ^type.targetProfile[+] = "http://hl7.org/fhir/StructureDefinition/Measure"
//* activity.detail.instantiatesCanonical ^type.targetProfile[+] = "http://hl7.org/fhir/StructureDefinition/ActivityDefinition"
//* activity.detail.instantiatesCanonical ^type.targetProfile[+] = "http://hl7.org/fhir/StructureDefinition/OperationDefinition"
//* activity.detail.instantiatesCanonical ^mustSupport = false
//* activity.detail.instantiatesCanonical ^isModifier = false
//* activity.detail.reasonReference only Reference(Condition_eltss or Observation_eltss )//or MedicationStatement or NutritionOrder)
//* activity.detail.reasonReference ^mustSupport = false
//* activity.detail.reasonReference ^isModifier = false
//* activity.detail.goal only Reference(Goal_eltss)
//* activity.detail.goal ^mustSupport = false
//* activity.detail.goal ^isModifier = false
//* activity.detail.location only Reference(Location_eltss)
//* activity.detail.location ^mustSupport = false
//* activity.detail.location ^isModifier = false
//* activity.detail.performer only Reference(Practitioner_eltss or PractitionerRole_eltss or RelatedPerson_eltss or Patient_eltss or $us-core-organization or $us-core-careteam or HealthcareService or $us-core-device or Device)
//* activity.detail.performer ^mustSupport = false
//* activity.detail.performer ^isModifier = false
* note MS