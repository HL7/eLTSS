### Care Coordination across IGs

Care Coordination requires the orchestration of many moving parts, that do not move in isolation. In addition to the eLTSS artifacts in this IG and especially the mapping into FHIR spreadsheet, we recommend the following Implementation Guides to supplement the guidance in this guide to meet additional business requirements:

#### [Da Vinci suite of IGs](https://confluence.hl7.org/display/DVP/Da+Vinci+Implementation+Guide+Dashboard)
The Da Vinci IGs focus on claims, prior-auth and other financial data exchange. 
Notable: 
[Patient Cost Transparency](http://hl7.org/fhir/us/davinci-pct/2022Jan/)


#### [Gravity SDOH IG](https://hl7.org/fhir/us/sdoh-clinicalcare/)
The Gravity SDOH IG specializes in communication of SDOH concerns and service fulfillment. It contains a large terminology resource for this space.

The Gravity SDOH IG makes progress on the referral workflow process. Importantly, the guidance is a work in progress and involves collaboration with [BSER](https://build.fhir.org/ig/HL7/bser/) and [360X](https://oncprojectracking.healthit.gov/wiki/display/TechLab360X/360X+Implementation+Guide). As an exploration, Gravity SDOH IG ties Task status updates with the originating ServiceRequest. At a high level, Tasks are created in response to the needs communicated in the ServiceRequest. As the Tasks are completed the system originating the ServiceRequest has an opportunity to know what Task was completed and by whom.

Here is a list of pages from the Gravity SDOH guide that relate to Task and the ongoing work towards defining this space:
* example of a Task, [SDOHCC Task for Referral Management ](https://hl7.org/fhir/us/sdoh-clinicalcare/StructureDefinition-SDOHCC-TaskForReferralManagement.html)
* working with the status of [Task](https://hl7.org/fhir/us/sdoh-clinicalcare/checking_task_status.html)
* referral workflow showing Task used in context: [workflow](https://hl7.org/fhir/us/sdoh-clinicalcare/referral_workflow.html)
* notes on [initiating communication]( https://hl7.org/fhir/us/sdoh-clinicalcare/connecting_applications_with_api_data_sources.html)
Generally, the Task is a way of communicating what is actually being performed in relationship to the requested service. 

Additionally, in Gravity SDOH they introduce a concept of Patient Task. For those eLTSS CarePlan action items we propose that one should consider extending the paradigm of Patient Task to cover those things the patient is asked to do for themselves, or determines is important for them to do for themselves. 

#### [MCC eCare Plan IG (ballot version)](https://hl7.org/fhir/us/mcc/2023Sep/)
The MCC eCare IG focuses on guidance for using FHIR CarePlans in multiple chronic conditions. When the final IG is published it will be accessible at [http://hl7.org/fhir/us/mcc](http://hl7.org/fhir/us/mcc). We reference the most recently available ballot version for accessibility reasons at the time of publishing this IG. There maybe an IG that supersedes this one in the future. 
The CarePlan Resource has a great opportunity to tie together a prospective or retrospective look at care planning. Central to the concept of patient led patient care is the Goal Resource. The MCC eCare IG uses the [resource-pertainsToGoal](http://hl7.org/fhir/R4/extension-resource-pertainstogoal.html)) extension as the major tool to connect care data elements directly to Goals, we suggest following this lead in this guide. Similar to Gravity, in the MCC eCare IG there is also rich set of value sets to aid in discovery of care planning data elements. 

An important feature of the eCare IG is also a consistent theme of caregiver and patient involvement in care planning. You will find Observations meant to be authored by caregivers and patients, in order to communicate how they feel about the condition(s) being addressed and in order to share the status of the caregiver's ability to provide care. The [MCC eCare CareTeam profile]() shows how the two roles are represented on the care team. 

Additionally, the eCare guide has this page on aggregating care plan data: [CarePlan aggregation](http://hl7.org/fhir/us/mcc/2023Sep/careplanAggregation.html)

Finally, the eCare guide also provides important guidance on alignment with the consensus among the HL7 community that CarePlan.activity.detail is not to be used. In R5, this element was removed through consensus. It can cause difficulties in discovery of information and variability in communication. We will discuss more about this in a section that follows.


#### Where does this guide fit in with other implementation guides
The eLTSS IG focuses on being able to package eLTSS data in a CarePlan so that a reader of the data can find all they need to perform their role and function. Da Vinci extends the financial and business transactions found in this guide (primarily seen as a tracking of the signature of various actors). The Gravity SDOH IG works more closely with the Task and ServiceRequest transaction, data components of activities that would be referred to by a CarePlan. The eLTSS IG, by focusing on CarePlan, adds additional opportunity to share other important actives (either as activity.outcomes - things that were done as a result of the activity - or as activity.reference items - things planned to be done).

Please take all these guides into consideration when implementing in the eLTSS space. They provide important guidance on aspects that are not the central purview of this particular guide, but which affect the workflow in which the eLTSS data elements flow. Importantly, these guides use US CORE as a base.


### [Mapping page eLTSS data elements to FHIR](eLTSS_to_FHIR_R4_element.html)
The eLTSS to FHIR mapping page of this IG is the most important section of this IG. It provides identification of the expected location in sending/receiving eLTSS data. Please review it and the profiles in this implementation guide. We elaborate below on a few key points.

### Key Points
#### CarePlan activity - planned and performed activities
The following comes from the [MCC eCare IG](https://hl7.org/fhir/us/mcc/2023Sep/StructureDefinition-mccCarePlan.html#supporting-machine-assisted-dynamic-care-coordinationplanning-with-the-fhir-care-plan-resource-and-fhir-goal-resource), it provides guidance on how to use activity in alignment with R5, and the consensus of HL7.

 *CarePlan.activity is a Backbone element. It identifies an action that has occurred or is a planned action to occur as part of the plan. For example, a medication to be used, lab tests to perform, self-monitoring that has occurred, education etc., within which in R4 can be activity.reference, activity.outcomeCodeableConcept, activity.outcomeReference or activity.progress (annotated note).*
		
 *OUTCOME REFERENCE - activity.outcomeReference (aka PERFORMED ACTIVITY reference): has been renamed in R5 to "CarePlan.performedActivity". To be in line with R5 do not use activity.detail. Also, outcomeReference is not only an outcome but rather an action such as Procedure or an Encounter that was made or occurred or an Observation. Within the target of the CarePlan.activity.outcomeReference, the extension, "resource-pertainsToGoal" **SHALL** be used to reference this activity's related goal. Within the resource referenced within CarePlan.activity.outcomeReference, "xxx.reason" **SHALL** be used to reference the health concern or problem for which the activity is done. CarePlan.outcomeCodeableConcept can also be used to indicate the outcome of an activity, such as patient understanding or lack thereof. It should not duplicate the activity status (e.g., completed or in progress). Simple free text can be used in the OutcomeCodeableConcept if no specific code is available.*

 *ACTIVITY REFERENCE - activity.reference (aka PLANNED ACTIVITY reference): has been renamed in R5 to "CarePlan.plannedActivityReference". To be in line with R5 do not use activity.detail. Within the target of the  CarePlan.activity.reference, the extension, "resource-pertainsToGoal" **SHALL** be used to reference this activity's request's related goal. "xxx.reason" **SHALL** be used to reference the health concern or problem for which the activity is done. Within the referenced Goal resource, goal.address **SHALL** be used to reference the goal's related Condition, Observation, MedicationStatement, NutritionOrder, ServiceRequest or RiskAssessment. Within the referenced Goal resource, Goal.outcomeReference, references the outcome (e.g observations related to the specific goal). Consider using activity.progress, which is an annotation data type, to satisfy the desire in the comment to provide plain free text on progress (in addition to the text, it contains the author and a date-time).*

#### [resource-pertainsToGoal extension](http://hl7.org/fhir/R4/extension-resource-pertainstogoal.html)
This extension is used extensively in the MCC eCare guide to provide a link within FHIR Resources back to the target Goal. A single data point, such as a clinical test observation, can serve for multiple goals. Thus, resource-pertainsToGoal is given 0..* cardinality.

#### Use of Annotation data types and codeableConcept.text 
There are several ways that text can be added in FHIR Resources, for those times when cannot avoid it. The Annotation data type, used in CarePlan.progress, provides a slot for attribution to a creator of the text, a time stamp and a large space for text. For shorter, briefer, clarification or communications (or when you cannot provide an appropriate code) the codeableConcept.text field is useful. Brief comments can be things such as the exact words uttered by the patient. It is worth noting that the use of free text does not make the text as usable as nicely structured data. Use sparingly, ideally you will use structured data elements. 

#### Quantities, UCUM and the Timing data type
It can be helpful to express quantity units using [UCUM](https://ucum.org/ucum#para-37). UCUM is a coding system for units of measure (see an HL7 value set [here](http://hl7.org/fhir/ValueSet/ucum-units)). UCUM uses codes and syntax to create specific codes for use. E.g. 'ml' and 'mg' are milliliter and milligram respectively. A composite code milligram/milliliter can be represented as 'mg/ml'. However, in the eLTSS mapping page an effort has been made to use quantity ratio to represent composite codes like 'mg'/'ml' in a post-coordinated fashion using quantityRatio. This can be attractive especially for composite non-scientific units such as 'dollar/month.' In UCUM this would be '[USD]/mo'. The '[USD]' is a UCUM way of allowing free text, but it is considered in calculations as meaningless. So, a UCUM cognizant system would really see the unit as 'unit/mo' with a numerator label for unit with the free text 'USD.' By using quantityRatio, the eLTSS guide is suggesting an alternative means which would instead look like 'code for USD'/month. The code for USD would be a more reliable way to interoperate instead of a string 'USD' which could be inputted as 'US Dollars', 'dollar', etc.  Some codes for currencies can be seen in the FHIR R4 Currencies value set (https://hl7.org/fhir/R4/valueset-currencies.html). See: [ServiceRequest-service2 example](ServiceRequest-service2.json.html) and [Units mapping] (eLTSS_to_FHIR_R4_element.html#units).

The [Timing](http://hl7.org/fhir/R4/datatypes.html#Timing) data type in FHIR allows for complex representations of Timing. We suggest using Timing for timing information that fluctuates or is sufficiently complex. You will need to calculate end-date, or use occurrenceTiming.boundsPeriod to ascribe a start and end date. E.g. Give ServiceRequest.quantityRatio of 5 USD per day with the occurrenceTiming.boundsPeriod of May 31, 2023 to June 23, 2023 on occurrenceTiming.dayOfWeek = Mon and Wed at occurrenceTiming.timeOfDay = 3 pm.

The [Period](http://hl7.org/fhir/R4/datatypes.html#Period) data type is a much simpler data type best used when the quantity is meant to be performed within a defined, simple start and end date. E.g. For start:May 31,2023 to end:June 10, 2023 give ServiceRequest.quantityRatio of 5 USD per day.

#### Terminology from MCC eCare and Gravity SDOH
There has been a strong effort in both of these IGs to help organize coded concepts for use in specific data elements. The organization aides both discovery and normalization of terms used. It can be a time saver to start with the terminology work done in those two guides. See [https://hl7.org/fhir/us/sdoh-clinicalcare/gravity_terminology.html](https://hl7.org/fhir/us/sdoh-clinicalcare/gravity_terminology.html) and [https://hl7.org/fhir/us/mcc/2023Sep/mcc_value_set_libraries_and_usage.html](https://hl7.org/fhir/us/mcc/2023Sep/mcc_value_set_libraries_and_usage.html)

#### Requesting and Recording payment for Task, Procedure or ServiceRequest
An important step in eLTSS is payment for services. The following highlights basic CORE FHIR associations that can be used, should business requirements request it.

A Claim FHIR Resource provides costing information, this can be a "claim" or "preauthorization" or "predetermination" (indicated with Claim.use).  The claim should be connected to the ServiceRequest with the Claim.referral referencing the ServiceRequest instance. As mentioned, the Procedure Resource can be used to communicate work performed if the business requirements need it. The Procedure can be connected to a Claim using Claim.procedure.procedureReference. Any Task records can be included by referencing using Claim.supportingInfo.

If business rules require it, the FHIR ClaimResponse Resource can be used "to provide the results of the adjudication and/or authorization of a set of healthcare-related products and services for a patient against the patient's insurance coverages, or to respond with what the adjudication would be for a supplied set of products or services should they be actually supplied to the patient." see [FHIR R4 ClaimResponse Resource](https://hl7.org/fhir/R4/claimresponse.html#bnr) In other words, the ClaimResponse Resource is used to respond to a FHIR Claim data instance. The ClaimResponse would detail the actual monies that could or would be paid. 

A final consideration is the use of ClaimResponse.net and Claim.net. They both detail the total cost. Using the total cost and the FHIR ServiceRequest (or FHIR Procedure) frequency and quantity information a system could theoretically calculate the hourly rate for a service requested or approved. This might be less ambiguous and more convenient than requesting entry of the cost per unit. 

### Task used with ServiceRequest
Task is a vehicle to indicate an event happened or needs to happen. The event itself is described using other FHIR Resources such as ServiceRequest or Procedure. Task uses Task.focus to associate with a ServiceRequest.

When appropriate based on business requirements, Task can be used in conjunction with ServiceRequest to report on fullfillment or actions taken. Based on the STU2 version of the Gravity SDOH guide, a flow in eLTSS could be:  
First, a ServiceRequest is sent to the CarePlanner, or created by the CarePlanner, and it is directed to a service provider, service recipient, caregiver or related person to fulfill. Importantly, the ServiceRequest is connected to a CarePlan through the CarePlan.activity.reference field. 

Next, Task FHIR Resource instances, either locally created and maintained, or produced externally but transmitted back to the initiating system, are used to indicate completion of the ServiceRequest. Critically the Task instances refer to the ServiceRequest using the Task.focus field. Task can also be used as a vehicle to deliver Procedure Resource instances of performed processes. These would reference the ServiceRequesst using Procedure.basedOn. 

Importantly: "The ServiceRequest resource allows requesting only a single procedure. If a workflow requires requesting multiple procedures simultaneously, this is done using multiple instances of this resource. These instances can be linked in different ways, depending on the needs of the workflow. For guidance, refer to the Request pattern." from the [ServiceRequest CORE Structure definition](https://hl7.org/fhir/R4/servicerequest.html#scope). One could use a parent ServiceRequest where multiple child service requests need multiple detailed occurrence timing or quantity information (with child ServiceRequests connected to the parent ServiceRequest using ServiceRequest.basedOn). However, one could forgo the parent request and just use the child service requests. The choice is a business decision depending on how the transaction partners wish to capture the details.

In the flow, a Procedure instance, with the Task.outcome referencing the Procedure, and with the Procedure.basedOn referencing the ServiceRequest, can provide granular details on a processes performed. See "A procedure is an activity that is performed on, with, or for a patient as part of the provision of care. Examples include surgical procedures, diagnostic procedures, endoscopic procedures, biopsies, counseling, physiotherapy, personal support services, adult day care services, non-emergency transportation, home modification, exercise, etc. Procedures may be performed by a healthcare professional, a service provider, a friend or relative or in some cases by the patient themselves" from [Procedure FHIR Resource](https://hl7.org/fhir/R4/procedure.html#scope). 

The following illustration indicates how the resources can be connected. Dotted arrows indicate the optional inclusion of a Procedure. In the example above. The ServiceRequest could have been populated by the Care Planner in eLTSS care planning software. The Care Planner's software is likely to create the Patient directed Task as well, to record progress. Once the Task is put into a completed state, a Procedure instance could be added which contains a computable detail of what was done (e.g. a care recipient's Son could be the RelatedPerson doing the Procedure). 

<table><tr><td><img src="eLTSS_Task.png" /></td></tr></table>

### Special Topic - Service Recipient (Patient) initiative tracking
Patient empowerment is thought to improve engagement. Engagement of the service recipient (patient) in their eLTSS care is a major goal in eLTSS due to it's linkage with better outcomes. By using instances of Task, SerivceRequest and optionally Procedure, which indicate the patient as the author, performer or owner, one could capture service recipient initiation and active participation in their own care.

#### An example
A service recipient (patient) has been told of an identified fall risk. Recognizing what this means for their own care, the service recipient volunteers to install a grab bar in their shower. The service recipient's son will do the installation (see [example ServiceRequest-service1](ServiceRequest-service1.html)). Thus, we have an example of non-paid, self-initiated, service recipient led action. This Task/ServiceRequest becomes part of the record of the events performed. The Task.for would reference a US CORE Patient Profile instance that represented the patient. Task.owner and Task.requester would also be used to indicate who is responsible for the Task and who requested it. 

For better discovery a ServiceRequest or Procedure instance connected to the CarePlan can further heighten visibility. Thus the patient could communicate to upstream and downstream providers through their care plan that they have installed a shower grab bar. This communication would allow providers to know both that their has been an action to reduce at home fall risk and that the patient is taking an active interest in their own care. It is important communication that should not be lost, and is common in eLTSS.