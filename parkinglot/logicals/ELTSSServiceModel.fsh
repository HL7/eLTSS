Logical: ELTSSServiceModel
Parent: Element
Id: eLTSSServiceModel
Title: "eLTSS Service Logical Model"
Description: "Service data included in the eLTSS Dataset."
//* ^identifier.system = "http://hl7.org/fhir/us/eLTSS/STU1"
//* ^identifier.system = "http://hl7.org/fhir/us/eLTSS"
//* ^identifier.value = "eLTSS.Service"
* ^status = #draft
* ^date = "2019-02-09T00:00:00-05:00"
* ^publisher = "The HL7 Community Based Care and Privacy Workgroup"
//* ^type = "eLTSSServiceModel"
//* . ^definition = "eLTSS Dataset Service data."
//* . ^base.path = "eLTSSServiceModel"
//* . ^base.min = 0
//* . ^base.max = "*"
//* . ^mustSupport = false
//* . ^isModifier = false
//* . ^isSummary = false
//removed MS tag from name
* name 0..1 SU string "Identifies the paid and/or non-paid service provided to a person." "Identifies the paid and/or non-paid service provided to a person. Include the code and display name plus any modifiers when a coding system (e.g., Healthcare Common Procedure Coding System (HCPCS), Home Health Revenue Codes) is used."
* name ^base.path = "eLTSSServiceModel.name"
* name ^base.min = 0
* name ^base.max = "1"
* name ^isModifier = false
//removed MS tag from startDate
* startDate 0..1 SU date "The start date of the service being provided." "The start date of the service being provided."
* startDate ^base.path = "eLTSSServiceModel.startDate"
* startDate ^base.min = 0
* startDate ^base.max = "1"
* startDate ^isModifier = false
//removed MS tag from endDate
* endDate 0..1 SU date "The end date of the service being provided." "The end date of the service being provided."
* endDate ^base.path = "eLTSSServiceModel.endDate"
* endDate ^base.min = 0
* endDate ^base.max = "1"
* endDate ^isModifier = false
* provider 0..1 SU string "The entity or individual providing the service." "The entity or individual providing the service."
* provider ^base.path = "eLTSSServiceModel.provider"
* provider ^base.min = 0
* provider ^base.max = "1"
* provider ^mustSupport = false
* provider ^isModifier = false
* provider.name 0..1 string "The name of the entity or individual providing the service." "The name of the entity or individual providing the service. For paid services use the organization/agency name, for non-paid services use the first and last name of the individual providing the service."
* provider.name ^base.path = "eLTSSServiceModel.provider.name"
* provider.name ^base.min = 0
* provider.name ^base.max = "1"
* provider.name ^mustSupport = false
* provider.name ^isModifier = false
* provider.name ^isSummary = false
* provider.phoneNumber 0..* string "The primary phone number (and extension when applicable) of the service provider." "The primary phone number (and extension when applicable) of the service provider."
* provider.phoneNumber ^base.path = "eLTSSServiceModel.provider.phoneNumber"
* provider.phoneNumber ^base.min = 0
* provider.phoneNumber ^base.max = "*"
* provider.phoneNumber ^mustSupport = false
* provider.phoneNumber ^isModifier = false
* provider.phoneNumber ^isSummary = false
* provider.nonPaidRelationship 0..* string "The relationship (e.g., spouse, neighbor, guardian, daughter) of the individual providing a non-paid service or support to the person." "The relationship (e.g., spouse, neighbor, guardian, daughter) of the individual providing a non-paid service or support to the person."
* provider.nonPaidRelationship ^base.path = "eLTSSServiceModel.provider.nonPaidRelationship"
* provider.nonPaidRelationship ^base.min = 0
* provider.nonPaidRelationship ^base.max = "*"
* provider.nonPaidRelationship ^mustSupport = false
* provider.nonPaidRelationship ^isModifier = false
* provider.nonPaidRelationship ^isSummary = false
* deliveryAddress 0..* SU string "The address where service delivery will take place if service will not be provided at the person’s address." "The address where service delivery will take place if service will not be provided at the person’s address."
* deliveryAddress ^base.path = "eLTSSServiceModel.deliveryAddress"
* deliveryAddress ^base.min = 0
* deliveryAddress ^base.max = "*"
* deliveryAddress ^mustSupport = false
* deliveryAddress ^isModifier = false
* fundingSource 0..* string "The source of payment for the service." "The source of payment for the service."
* fundingSource ^base.path = "eLTSSServiceModel.fundingSource"
* fundingSource ^base.min = 0
* fundingSource ^base.max = "*"
* fundingSource ^mustSupport = false
* fundingSource ^isModifier = false
* fundingSource ^isSummary = false
* unitQuantity 0..1 SU integer "The numerical amount of the service unit being provided for a frequency." "The numerical amount of the service unit being provided for a frequency. This element is slated to be used in conjunction with Service Quantity Interval and Unit of Service Type elements to form a full description of how often a service is provided. For example, a service being provided 7 units per week, the Service Unit Quantity = 7. For a service being provided 8 hours a day, the Service Unit Value = 8."
* unitQuantity ^base.path = "eLTSSServiceModel.unitQuantity"
* unitQuantity ^base.min = 0
* unitQuantity ^base.max = "1"
* unitQuantity ^mustSupport = false
* unitQuantity ^isModifier = false
* unitType 0..1 SU string "A named quantity in terms of which services are measured or specified, used as a standard measurement of like services." "A named quantity in terms of which services are measured or specified, used as a standard measurement of like services. Values include: minute(s), 8 hour(s), quarter hour(s), hour(s), half day(s), full day(s), day(s), week(s), month(s), dollar(s), meal(s), mile(s), visit(s)/session(s), installation(s), none, other (free text). This element is slated to be used in conjunction with Service Unit Quantity interval and Service Unit Quantity elements to form a full description of how often a service is provided. For example, a service being provided 7 units per week, the Unit of Service Type = units. For a service being provided 8 hours a day, the Unit of Service Type = hours."
* unitType ^base.path = "eLTSSServiceModel.unitType"
* unitType ^base.min = 0
* unitType ^base.max = "1"
* unitType ^mustSupport = false
* unitType ^isModifier = false
* unitQuantityInterval 0..1 SU string "A period of time corresponding to the quantity of service(s) indicated." "A period of time corresponding to the quantity of service(s) indicated. Values include: per day, per week, per month, per year, one time only, other (free text). This element is slated to be used in conjunction with Unit of Service Type and Service Unit Quantity elements to form a full description of how often a service is provided. For example, a service being provided 7 units per week, the Service Unit Quantity Interval = per week. For a service being provided 8 hours a day, the Service Unit Quantity Interval = per day."
* unitQuantityInterval ^base.path = "eLTSSServiceModel.unitQuantityInterval"
* unitQuantityInterval ^base.min = 0
* unitQuantityInterval ^base.max = "1"
* unitQuantityInterval ^mustSupport = false
* unitQuantityInterval ^isModifier = false
* unitRate 0..1 decimal "The rate of one unit for a service." "The rate of one unit for a service."
* unitRate ^base.path = "eLTSSServiceModel.unitRate"
* unitRate ^base.min = 0
* unitRate ^base.max = "1"
* unitRate ^mustSupport = false
* unitRate ^isModifier = false
* unitRate ^isSummary = false
* totalCost 0..1 decimal "The total cost of a service for the plan." "The total cost of a service for the plan."
* totalCost ^base.path = "eLTSSServiceModel.totalCost"
* totalCost ^base.min = 0
* totalCost ^base.max = "1"
* totalCost ^mustSupport = false
* totalCost ^isModifier = false
* totalCost ^isSummary = false
* stepOrAction 0..* string "A planned measurable step or action that needs to be taken to accomplish a goal identified by the person." "A planned measurable step or action that needs to be taken to accomplish a goal identified by the person."
* stepOrAction ^base.path = "eLTSSServiceModel.stepOrAction"
* stepOrAction ^base.min = 0
* stepOrAction ^base.max = "*"
* stepOrAction ^mustSupport = false
* stepOrAction ^isModifier = false
* stepOrAction ^isSummary = false
* comment 0..* string "Additional information related to the service being provided." "Additional information related to the service being provided. This field could capture additional information of the frequency of the service, how the person wants the service delivered and only used when the comment provides additional detail of the service not already handled by another element."
* comment ^base.path = "eLTSSServiceModel.comment"
* comment ^base.min = 0
* comment ^base.max = "*"
* comment ^mustSupport = false
* comment ^isModifier = false
* comment ^isSummary = false