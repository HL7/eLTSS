Logical: ELTSSServicePlanModel
Parent: Element
Id: eLTSSServicePlanModel
Title: "eLTSS Service Plan Logical Model"
Description: "ServicePlan data included in the eLTSS Dataset."
//* ^identifier.system = "http://hl7.org/fhir/us/eLTSS/STU1"
//* ^identifier.system = "http://hl7.org/fhir/us/eLTSS"
//* ^identifier.value = "eLTSS.ServicePlan"
* ^status = #draft
* ^date = "2019-02-07T00:00:00-05:00"
* ^publisher = "The HL7 Community Based Care and Privacy Workgroup"
//resourceType
//* ^type = "eLTSSServicePlanModel"
//* . ^definition = "eLTSS Dataset ServicePlan data."
//* . ^base.path = "eLTSSServicePlanModel"
//* . ^base.min = 0
//* . ^base.max = "*"
//* . ^mustSupport = false
//* . ^isModifier = false
//* . ^isSummary = false
//http://hl7.org/fhir/us/eLTSS/StructureDefinition/eLTSSPersonModel
* beneficiary 1..1 SU Reference(eLTSSPersonModel) "The person for whom the plan is for." "The person for whom the plan is for."
* beneficiary ^base.path = "eLTSSServicePlanModel.beneficiary"
* beneficiary ^base.min = 1
* beneficiary ^base.max = "1"
* beneficiary ^mustSupport = false
* beneficiary ^isModifier = false
//removed MS tag from effectiveDate
* effectiveDate 0..1 SU Period "The date upon which the plan goes into effect. Start date is required, end date is optional." "The date upon which the plan goes into effect. Start date is required, end date is optional."
* effectiveDate ^base.path = "eLTSSServicePlanModel.effectiveDate"
* effectiveDate ^base.min = 0
* effectiveDate ^base.max = "1"
* effectiveDate ^isModifier = false
* supportPlanner 0..1 BackboneElement "The person (e.g., Case Manager, Care Coordinator, Plan Coordinator) who helped develop the plan." "The person (e.g., Case Manager, Care Coordinator, Plan Coordinator) who helped develop the plan."
* supportPlanner ^base.path = "eLTSSServicePlanModel.supportPlanner"
* supportPlanner ^base.min = 0
* supportPlanner ^base.max = "1"
* supportPlanner ^mustSupport = false
* supportPlanner ^isModifier = false
* supportPlanner ^isSummary = false
* supportPlanner.name 0..1 string "The name of the person (e.g., Case Manager, Care Coordinator, Plan Coordinator) who helped develop the plan." "The name of the person (e.g., Case Manager, Care Coordinator, Plan Coordinator) who helped develop the plan."
* supportPlanner.name ^base.path = "eLTSSServicePlanModel.supportPlanner.name"
* supportPlanner.name ^base.min = 0
* supportPlanner.name ^base.max = "1"
* supportPlanner.name ^mustSupport = false
* supportPlanner.name ^isModifier = false
* supportPlanner.name ^isSummary = false
* supportPlanner.phoneNumber 0..* string "The primary phone number (and extension when applicable) of the support planner." "The primary phone number (and extension when applicable) of the support planner."
* supportPlanner.phoneNumber ^base.path = "eLTSSServicePlanModel.supportPlanner.phoneNumber"
* supportPlanner.phoneNumber ^base.min = 0
* supportPlanner.phoneNumber ^base.max = "*"
* supportPlanner.phoneNumber ^mustSupport = false
* supportPlanner.phoneNumber ^isModifier = false
* supportPlanner.phoneNumber ^isSummary = false
* planMonitor 0..1 SU BackboneElement "The person responsible for monitoring the plan." "The person responsible for monitoring the plan."
* planMonitor ^base.path = "eLTSSServicePlanModel.planMonitor"
* planMonitor ^base.min = 0
* planMonitor ^base.max = "1"
* planMonitor ^mustSupport = false
* planMonitor ^isModifier = false
* planMonitor.name 0..1 string "The name of the person responsible for monitoring the plan." "The name of the person responsible for monitoring the plan."
* planMonitor.name ^base.path = "eLTSSServicePlanModel.planMonitor.name"
* planMonitor.name ^base.min = 0
* planMonitor.name ^base.max = "1"
* planMonitor.name ^mustSupport = false
* planMonitor.name ^isModifier = false
* planMonitor.name ^isSummary = false
* planMonitor.phoneNumber 0..* string "The primary phone number (and extension when applicable) of the plan monitor." "The primary phone number (and extension when applicable) of the plan monitor."
* planMonitor.phoneNumber ^base.path = "eLTSSServicePlanModel.planMonitor.phoneNumber"
* planMonitor.phoneNumber ^base.min = 0
* planMonitor.phoneNumber ^base.max = "*"
* planMonitor.phoneNumber ^mustSupport = false
* planMonitor.phoneNumber ^isModifier = false
* planMonitor.phoneNumber ^isSummary = false
* emergencyBackupPlan 0..* string "Description of how to address unforeseen events." "Description of how to address unforeseen events, emergency health events, emergency events, problems with medical equipment and supplies, and unavailable staffing situations for critical services that put the person’s health and safety at risk."
* emergencyBackupPlan ^base.path = "eLTSSServicePlanModel.emergencyBackupPlan"
* emergencyBackupPlan ^base.min = 0
* emergencyBackupPlan ^base.max = "*"
* emergencyBackupPlan ^mustSupport = false
* emergencyBackupPlan ^isModifier = false
* emergencyBackupPlan ^isSummary = false
//removed MS tag from goal
* goal 0..* SU string "A statement of a desired result that the person wants to achieve." "A statement of a desired result that the person wants to achieve."
* goal ^base.path = "eLTSSServicePlanModel.goal"
* goal ^base.min = 0
* goal ^base.max = "*"
* goal ^isModifier = false
* preference 0..* SU string "Presents the person’s personal thoughts about something he or she feels is relevant to his or her life experience and may be pertinent when planning." "Presents the person’s personal thoughts about something he or she feels is relevant to his or her life experience and may be pertinent when planning."
* preference ^base.path = "eLTSSServicePlanModel.preference"
* preference ^base.min = 0
* preference ^base.max = "*"
* preference ^mustSupport = false
* preference ^isModifier = false
* strength 0..* SU string "A favorable attribute of the person, his/her support network, environment and/or elements of his/her life." "A favorable attribute of the person, his/her support network, environment and/or elements of his/her life."
* strength ^base.path = "eLTSSServicePlanModel.strength"
* strength ^base.min = 0
* strength ^base.max = "*"
* strength ^mustSupport = false
* strength ^isModifier = false
//removed MS tag from assessedNeed
* assessedNeed 0..* SU string "The clinical and/or community-based necessity or desire as identified through an assessment that should be addressed by a service." "The clinical and/or community-based necessity or desire as identified through an assessment that should be addressed by a service."
* assessedNeed ^base.path = "eLTSSServicePlanModel.assessedNeed"
* assessedNeed ^base.min = 0
* assessedNeed ^base.max = "*"
* assessedNeed ^isModifier = false
* identifiedRisk 0..* string "An aspect of a person’s life, behavior, environmental exposure, personal characteristic, or barrier that increases the likelihood of disease, condition, injury to self or others, or interaction with the criminal justice system." "An aspect of a person’s life, behavior, environmental exposure, personal characteristic, or barrier that increases the likelihood of disease, condition, injury to self or others, or interaction with the criminal justice system."
* identifiedRisk ^base.path = "eLTSSServicePlanModel.identifiedRisk"
* identifiedRisk ^base.min = 0
* identifiedRisk ^base.max = "*"
* identifiedRisk ^mustSupport = false
* identifiedRisk ^isModifier = false
* identifiedRisk ^isSummary = false
* riskManagementPlan 0..* string "Description of planned activities to minimize identified risks that endanger the person’s health and safety." "Description of planned activities to minimize identified risks that endanger the person’s health and safety. This can be included\tas free text or\tattachment."
* riskManagementPlan ^base.path = "eLTSSServicePlanModel.identifiedRisk"
* riskManagementPlan ^base.min = 0
* riskManagementPlan ^base.max = "*"
* riskManagementPlan ^mustSupport = false
* riskManagementPlan ^isModifier = false
* riskManagementPlan ^isSummary = false
* service 0..* Reference(http://hl7.org/fhir/us/eLTSS/StructureDefinition/eLTSSServiceModel) "A service provided under this plan." "A service provided under this plan."
* service ^base.path = "eLTSSServicePlanModel.service"
* service ^base.min = 0
* service ^base.max = "*"
* service ^mustSupport = false
* service ^isModifier = false
* service ^isSummary = false
* serviceOptionsGivenIndicator 0..1 boolean "States whether or not the person was given a choice of services outlined in the plan." "States whether or not the person was given a choice of services outlined in the plan."
* serviceOptionsGivenIndicator ^base.path = "eLTSSServicePlanModel.serviceOptionsGivenIndicator"
* serviceOptionsGivenIndicator ^base.min = 0
* serviceOptionsGivenIndicator ^base.max = "1"
* serviceOptionsGivenIndicator ^mustSupport = false
* serviceOptionsGivenIndicator ^isModifier = false
* serviceOptionsGivenIndicator ^isSummary = false
* serviceSelectionIndicator 0..1 boolean "States whether or not the person participated in the selection of the services outlined in the plan." "States whether or not the person participated in the selection of the services outlined in the plan."
* serviceSelectionIndicator ^base.path = "eLTSSServicePlanModel.serviceSelectionIndicator"
* serviceSelectionIndicator ^base.min = 0
* serviceSelectionIndicator ^base.max = "1"
* serviceSelectionIndicator ^mustSupport = false
* serviceSelectionIndicator ^isModifier = false
* serviceSelectionIndicator ^isSummary = false
* agreementIndicator 0..1 boolean "States whether or not the person agrees to the services outlined in the plan." "States whether or not the person agrees to the services outlined in the plan."
* agreementIndicator ^base.path = "eLTSSServicePlanModel.agreementIndicator"
* agreementIndicator ^base.min = 0
* agreementIndicator ^base.max = "1"
* agreementIndicator ^mustSupport = false
* agreementIndicator ^isModifier = false
* agreementIndicator ^isSummary = false
* serviceProviderOptionsGivenIndicator 0..1 boolean "States whether or not the person was offered a choice of providers for each service." "States whether or not the person was offered a choice of providers for each service."
* serviceProviderOptionsGivenIndicator ^base.path = "eLTSSServicePlanModel.serviceProviderOptionsGivenIndicator"
* serviceProviderOptionsGivenIndicator ^base.min = 0
* serviceProviderOptionsGivenIndicator ^base.max = "1"
* serviceProviderOptionsGivenIndicator ^mustSupport = false
* serviceProviderOptionsGivenIndicator ^isModifier = false
* serviceProviderOptionsGivenIndicator ^isSummary = false
* serviceProviderSelectionAgreementIndicator 0..1 boolean "States whether or not the person feels he/she made an informed choice in selecting the provider for each service." "States whether or not the person feels he/she made an informed choice in selecting the provider for each service."
* serviceProviderSelectionAgreementIndicator ^base.path = "eLTSSServicePlanModel.serviceProviderSelectionAgreementIndicator"
* serviceProviderSelectionAgreementIndicator ^base.min = 0
* serviceProviderSelectionAgreementIndicator ^base.max = "1"
* serviceProviderSelectionAgreementIndicator ^mustSupport = false
* serviceProviderSelectionAgreementIndicator ^isModifier = false
* serviceProviderSelectionAgreementIndicator ^isSummary = false
* personSettingChoiceIndicator 0..1 boolean "Indicator that reflects the setting in which the person resides is chosen by the individual." "Indicator that reflects the setting in which the person resides is chosen by the individual."
* personSettingChoiceIndicator ^base.path = "eLTSSServicePlanModel.personSettingChoiceIndicator"
* personSettingChoiceIndicator ^base.min = 0
* personSettingChoiceIndicator ^base.max = "1"
* personSettingChoiceIndicator ^mustSupport = false
* personSettingChoiceIndicator ^isModifier = false
* personSettingChoiceIndicator ^isSummary = false
* personSettingChoiceOptions 0..1 string "The alternative home and community-based settings that were considered by the individual." "The alternative home and community-based settings that were considered by the individual."
* personSettingChoiceOptions ^base.path = "eLTSSServicePlanModel.personSettingChoiceOptions"
* personSettingChoiceOptions ^base.min = 0
* personSettingChoiceOptions ^base.max = "1"
* personSettingChoiceOptions ^mustSupport = false
* personSettingChoiceOptions ^isModifier = false
* personSettingChoiceOptions ^isSummary = false
* personSignature 0..1 BackboneElement "The person's signature as proof of identify and intent for the plan." "The person's signature as proof of identify and intent for the plan."
* personSignature ^base.path = "eLTSSServicePlanModel.personSignature"
* personSignature ^base.min = 0
* personSignature ^base.max = "1"
* personSignature ^mustSupport = false
* personSignature ^isModifier = false
* personSignature ^isSummary = false
* personSignature.value 0..1 base64Binary "The depiction of the person's signature as proof of identify and intent for the plan." "The depiction of the person's signature as proof of identify and intent for the plan."
* personSignature.value ^base.path = "eLTSSServicePlanModel.personSignature.value"
* personSignature.value ^base.min = 0
* personSignature.value ^base.max = "1"
* personSignature.value ^mustSupport = false
* personSignature.value ^isModifier = false
* personSignature.value ^isSummary = false
* personSignature.printedName 0..1 string "The printed or typed name of the person." "The printed or typed name of the person."
* personSignature.printedName ^base.path = "eLTSSServicePlanModel.personSignature.printedName"
* personSignature.printedName ^base.min = 0
* personSignature.printedName ^base.max = "1"
* personSignature.printedName ^mustSupport = false
* personSignature.printedName ^isModifier = false
* personSignature.printedName ^isSummary = false
* personSignature.date 0..1 date "The date the person signed the plan." "The date the person signed the plan."
* personSignature.date ^base.path = "eLTSSServicePlanModel.personSignature.date"
* personSignature.date ^base.min = 0
* personSignature.date ^base.max = "1"
* personSignature.date ^mustSupport = false
* personSignature.date ^isModifier = false
* personSignature.date ^isSummary = false
* representativeSignature 0..* BackboneElement "The guardian or legally authorized representative’s signature as proof of identity and intent for the plan." "The guardian or legally authorized representative’s signature as proof of identity and intent for the plan."
* representativeSignature ^base.path = "eLTSSServicePlanModel.representativeSignature"
* representativeSignature ^base.min = 0
* representativeSignature ^base.max = "*"
* representativeSignature ^mustSupport = false
* representativeSignature ^isModifier = false
* representativeSignature ^isSummary = false
* representativeSignature.value 0..1 base64Binary "The depiction of the guardian or legally authorized representative’s signature as proof of identity and intent for the plan." "The depiction of the guardian or legally authorized representative’s signature as proof of identity and intent for the plan."
* representativeSignature.value ^base.path = "eLTSSServicePlanModel.representativeSignature.value"
* representativeSignature.value ^base.min = 0
* representativeSignature.value ^base.max = "1"
* representativeSignature.value ^mustSupport = false
* representativeSignature.value ^isModifier = false
* representativeSignature.value ^isSummary = false
* representativeSignature.printedName 0..1 string "The printed or typed name of the guardian or legally authorized representative." "The printed or typed name of the guardian or legally authorized representative."
* representativeSignature.printedName ^base.path = "eLTSSServicePlanModel.representativeSignature.printedName"
* representativeSignature.printedName ^base.min = 0
* representativeSignature.printedName ^base.max = "1"
* representativeSignature.printedName ^mustSupport = false
* representativeSignature.printedName ^isModifier = false
* representativeSignature.printedName ^isSummary = false
* representativeSignature.date 0..1 date "The date the guardian or legally authorized representative signed the plan." "The date the guardian or legally authorized representative signed the plan."
* representativeSignature.date ^base.path = "eLTSSServicePlanModel.representativeSignature.date"
* representativeSignature.date ^base.min = 0
* representativeSignature.date ^base.max = "1"
* representativeSignature.date ^mustSupport = false
* representativeSignature.date ^isModifier = false
* representativeSignature.date ^isSummary = false
* supportPlannerSignature 0..1 BackboneElement "The support planner’s signature as proof of identity and intent for the plan." "The support planner’s signature as proof of identity and intent for the plan."
* supportPlannerSignature ^base.path = "eLTSSServicePlanModel.supportPlannerSignature"
* supportPlannerSignature ^base.min = 0
* supportPlannerSignature ^base.max = "1"
* supportPlannerSignature ^mustSupport = false
* supportPlannerSignature ^isModifier = false
* supportPlannerSignature ^isSummary = false
* supportPlannerSignature.value 0..1 base64Binary "The depiction of the support planner’s signature as proof of identity and intent for the plan." "The depiction of the support planner’s signature as proof of identity and intent for the plan."
* supportPlannerSignature.value ^base.path = "eLTSSServicePlanModel.supportPlannerSignature.value"
* supportPlannerSignature.value ^base.min = 0
* supportPlannerSignature.value ^base.max = "1"
* supportPlannerSignature.value ^mustSupport = false
* supportPlannerSignature.value ^isModifier = false
* supportPlannerSignature.value ^isSummary = false
* supportPlannerSignature.printedName 0..1 string "The printed or typed name of the support planner." "The printed or typed name of the support planner."
* supportPlannerSignature.printedName ^base.path = "eLTSSServicePlanModel.supportPlannerSignature.printedName"
* supportPlannerSignature.printedName ^base.min = 0
* supportPlannerSignature.printedName ^base.max = "1"
* supportPlannerSignature.printedName ^mustSupport = false
* supportPlannerSignature.printedName ^isModifier = false
* supportPlannerSignature.printedName ^isSummary = false
* supportPlannerSignature.date 0..1 date "The date the support planner signed the plan." "The date the support planner signed the plan."
* supportPlannerSignature.date ^base.path = "eLTSSServicePlanModel.supportPlannerSignature.date"
* supportPlannerSignature.date ^base.min = 0
* supportPlannerSignature.date ^base.max = "1"
* supportPlannerSignature.date ^mustSupport = false
* supportPlannerSignature.date ^isModifier = false
* supportPlannerSignature.date ^isSummary = false
* serviceProviderSignature 0..* BackboneElement "The service provider’s signature as proof they agree to the services they will provide." "The service provider’s signature as proof they agree to the services they will provide."
* serviceProviderSignature ^base.path = "eLTSSServicePlanModel.serviceProviderSignature"
* serviceProviderSignature ^base.min = 0
* serviceProviderSignature ^base.max = "*"
* serviceProviderSignature ^mustSupport = false
* serviceProviderSignature ^isModifier = false
* serviceProviderSignature ^isSummary = false
* serviceProviderSignature.value 0..1 base64Binary "The depiction of the service provider’s signature as proof they agree to the services they will provide." "The depiction of the service provider’s signature as proof they agree to the services they will provide."
* serviceProviderSignature.value ^base.path = "eLTSSServicePlanModel.serviceProviderSignature.value"
* serviceProviderSignature.value ^base.min = 0
* serviceProviderSignature.value ^base.max = "1"
* serviceProviderSignature.value ^mustSupport = false
* serviceProviderSignature.value ^isModifier = false
* serviceProviderSignature.value ^isSummary = false
* serviceProviderSignature.printedName 0..1 string "The printed or typed name of the service provider." "The printed or typed name of the service provider."
* serviceProviderSignature.printedName ^base.path = "eLTSSServicePlanModel.serviceProviderSignature.printedName"
* serviceProviderSignature.printedName ^base.min = 0
* serviceProviderSignature.printedName ^base.max = "1"
* serviceProviderSignature.printedName ^mustSupport = false
* serviceProviderSignature.printedName ^isModifier = false
* serviceProviderSignature.printedName ^isSummary = false
* serviceProviderSignature.date 0..1 string "The date the service provider signed the plan." "The date the service provider signed the plan."
* serviceProviderSignature.date ^base.path = "eLTSSServicePlanModel.serviceProviderSignature.date"
* serviceProviderSignature.date ^base.min = 0
* serviceProviderSignature.date ^base.max = "1"
* serviceProviderSignature.date ^mustSupport = false
* serviceProviderSignature.date ^isModifier = false
* serviceProviderSignature.date ^isSummary = false