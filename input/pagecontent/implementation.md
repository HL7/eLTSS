## Care Coordination across IGs

Care Coordination requires the orchestration of many moving parts, that do not move in isolation. In addition to the eLTSS artifacts in this IG and especially the mapping into FHIR spreadsheet, we recommend the following Implementation Guides to supplement the guidance in this guide:

### [Divinci suite of IGs](https://confluence.hl7.org/display/DVP/Da+Vinci+Implementation+Guide+Dashboard)
The Divinci IGs focus on claims, prior-auth and other financial data exchange. 
Notable: 
[Patient Cost Transparency](http://hl7.org/fhir/us/davinci-pct/2022Jan/)


### [Gravity SDOH IG](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/)
The Gravity SDOH IG specializes in communication of SDOH concerns and service fulfillment. It contains a large terminology resource for this space, and, importantly has a focus on the ServiceRequest-Task data workflow. We recommend taking a close look at how the Gravity SDOH IG ties Task status updates with the originating ServiceRequest. At a high level, Tasks are created in response to the needs communicated in the ServiceRequest. As the Tasks are completed the system originating the ServiceRequest has an opportunity to know what Task was completed and by whom.

Additionally, in Gravity SDOH they introduce a concept of Patient Task. For those eLTSS CarePlan action items we propose that one should extend the paradigm of Patient Task to cover those things the patient is asked to do for themselves, or determines is important for them to do for themselves. 

### [MCC eCare Plan IG](https://build.fhir.org/ig/HL7/fhir-us-mcc/index.html)
The CarePlan Resource has a great opportunity to tie together a prospective or retrospective look at care planning. Central to the concept of patient led patient care is the Goal Resource. The MCC eCare IG uses the [pertainsToGoal]() extension as the major tool to connect care data elements directly to Goals, we suggest following this lead in this guide. Similar to Gravity, in the MCC eCare IG there is also rich set of value sets to aid in discovery of care planning data elements. 

An important feature of the eCare IG is also a consistent theme of caregiver and patient involvement in care planning. You will find Observations meant to be authored by care givers and patients, in order to communicate how they feel about the condition(s) being addressed and in order to share the status of the care giver's ability to provide care. The [MCC eCare CareTeam profile]() shows how the two roles are represented on the care team. 

Additionally, the eCare guide has this page on aggregating care plan data: https://build.fhir.org/ig/HL7/fhir-us-mcc/careplanAggregation.html 

Finally, the eCare guide also provides important guidance on alignment with the consensus among the HL7 community that CarePlan.activity.detail is not to be used. In R5, this element was removed through consensus. It can cause difficulties in discovery of information and variability in communication. We will discuss more about this in a section that follows.


### Where does this guide fit in
The eLTSS IG focuses on being able to package eLTSS data in a CarePlan so that a reader of the data can find all they need to perform their role and function. Divinci extends the financial and business transactions found in this guide (primarily seen as a tracking of the signature of various actors). The Gravity SDOH IG works more closely with the Task and ServiceRequest transaction, data components of activities that would be refer to by a CarePlan. The eLTSS, by focusing on CarePlan, adds additional opportunity to share other important actives (either as activity.outcomes - things that were done as a result of the activity - or as activity.reference items - things planned to be done).

Please take all these guides into consideration when implementing in the eLTSS space. They provide important guidance on aspects that are not the central purview of this particular guide, but which effect the workflow which the eLTSS data elements flow. Importantly, these guides us US CORE as a base.


## [Mapping page eLTSS data elements to FHIR](eLTSS_to_FHIR_R4_element.html)
The eLTSS to FHIR mapping page of this IG is the most important section of this IG. It provides identification of the expected location in sending/receiving eLTSS data. Please review it. We will elaborate further on a few key points.

### CarePlan activity - planned and performed activities
The following comes from the [MCC eCare IG](https://build.fhir.org/ig/HL7/fhir-us-mcc/StructureDefinition-mccCarePlan.html#supporting-machine-assisted-dynamic-care-coordinationplanning-with-the-fhir-care-plan-resource-and-fhir-goal-resource), it provides guidance on how to use activity in alignment with R5, and the consensus of HL7.

 *CarePlan.activity is a Backbone element. It identifies an action that has occurred or is a planned action to occur as part of the plan. For example, a medication to be used, lab tests to perform, self-monitoring that has occurred, education etc., within which in R4 can be activity.reference, activity.outcomeCodeableConcept, activity.outcomeReference or activity.progress (annotated note).*
		
 *OUTCOME REFERENCE - activity.outcomeReference (aka PERFORMED ACTIVITY reference): has been renamed in R5 to "CarePlan.performedActivity". To be in line with R5 do not use activity.detail. Also, outcomeReference is not only an outcome but rather an action such as Procedure or an Encounter that was made or occurred or an Observation. Within the target of the CarePlan.activity.outcomeReference, the extension, "resource-pertainsToGoal" **SHALL** be used to reference this activity's related goal. Within the resource referenced within CarePlan.activity.outcomeReference, "xxx.reason" **SHALL** be used to reference the health concern or problem for which the activity is done. CarePlan.outcomeCodeableConcept can also be used to indicate the outcome of an activity, such as patient understanding or lack thereof. It should not duplicate the activity status (e.g., completed or in progress). Simple free text can be used in the OutcomeCodeableConcept if no specific code is available.*

 *ACTIVITY REFERENCE - activity.reference (aka PLANNED ACTIVITY reference): has been renamed in R5 to "CarePlan.plannedActivityReference". To be in line with R5 do not use activity.detail. Within the target of the  CarePlan.activity.reference, the extension, "resource-pertainsToGoal" **SHALL** be used to reference this activity's request's related goal. "xxx.reason" **SHALL** be used to reference the health concern or problem for which the activity is done. Within the referenced Goal resource, goal.address **SHALL** be used to reference the goal's related Condition, Observation, MedicationStatement, NutritionOrder, ServiceRequest or RiskAssessment. Within the referenced Goal resource, Goal.outcomeReference, references the outcome (e.g observations related to the specific goal). Consider using activity.progress, which is an annotation data type, to satisfy the desire in the comment to provide plain free text on progress (in addition to the text, it contains the author and a date-time).*

### [pertainsToGoal extension](http://hl7.org/fhir/R4/extension-resource-pertainstogoal.html)
This extension is used extensively in the MCC eCare guide to provide a link within FHIR Resources back to the target Goal. A single data point, such as a clinical test observation, can serve for multiple goals. Thus, pertainsToGoal is given 0..* cardinality.

### Workflow Task and ServiceRequest following Gravity SDOH
The guidance from Gravity is to extensive to fit into a single paragraph. The SDOHCC Task for Referral Management  Here is a list of important pages from the Gravity SDOH guide:
* example of a Task, SDOHCC Task for Referral Management http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-TaskForReferralManagement.html
* working with the status of Task http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/checking_task_status.html
* referral workflow showing Task used in context http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/referral_workflow.html
* notes on initiating communication http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/connecting_applications_with_api_data_sources.html
Generally, the Task is a way of communicating what is actually being performed in relationship to the requested service. 

### Patient Tasks
A slight variation on the Gravity Patient Task is the suggested use of Task to record/track tasks a patient will be performing or is choosing to be responsible for. As an example, see the section in Gravity SDOH which focuses specifically on the subset of tasks around questionnaires [SDOHCC Task For Patient](https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-TaskForPatient.html). 

For general purpose use, the generic Task Resource would be sufficient, but the Task.for would reference a US CORE Patient Profile instance that represented the Patient. Task.owner and Task.requester would also be used to indicate who is responsible for the Task and who requested it. 


### Use of Annotation data types and codeableConcept.text 
There are several ways that text can be added in FHIR Resources, for those times when you absolutely need to. The Annotation data type, used in CarePlan.progress, provides a slot for attribution to a creator of the text, a time stamp and a large space for text. For shorter briefer clarification or communications (or when you cannot provide an appropriate code)m the codeableConcept.text field is useful. Brief comments can be things like the words uttered by the patient. It is worth noting that the use of text does not make the text as usable as nicely structured data. Use sparingly, ideally you will use structured data elements. 

### Quantities, UCUM and the Timing data type
Quantities can 
[UCUM](https://ucum.org/ucum#para-37) is a coding system for units of measure. There is an HL7 value set [here](https://build.fhir.org/valueset-ucum-units.html). 

### Terminology from MCC eCare and Gravity SDOH
There has been a strong effort in both of these IGs to help organize coded concepts for use in specific data elements. The organization aides both discovery and normalization of terms used. It can be a time saver to start with the terminology work done in those two guides. See http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/gravity_terminology.html and https://build.fhir.org/ig/HL7/fhir-us-mcc/mcc_value_set_libraries_and_usage.html

## Server Capability Statement
The Capability Statement in this guide reflects the guidance above by requiring eLTSS compliant servers to support these IGs.