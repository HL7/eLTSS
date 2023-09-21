Task.focus --> ServiceRequest

Task is a vehicle to indicate an event happened or needs to happen. The event itself is described using other FHIR Resources such as ServiceRequest or Procedure.

The general workflow, based on the STU2 version of the Gravity SDOH guide, is as follows:
The ServiceRequest is sent to the CarePlanner, or created by the CarePlanner, and it is directed to a service provider, service recipient, caregiver or related person. Additionally, the ServiceRequest is connected to CarePlan through the CarePlan.activity.reference field. 

Next, Task FHIR Resource instances, either locally created and maintained, or produced externally but transmitted back to the initiating system, are used to indicate completion of the ServiceRequest. The Task instances refer to the ServiceRequest using the Task.focus field. Task can also be used as a vehicle to deliver Procedure Resource instances of performed processes. These would reference the ServiceRequesst using Procedure.basedOn. 

Importantly: "The ServiceRequest resource allows requesting only a single procedure. If a workflow requires requesting multiple procedures simultaneously, this is done using multiple instances of this resource. These instances can be linked in different ways, depending on the needs of the workflow. For guidance, refer to the Request pattern" FHIR request pattern, comes from ServiceRequest CORE Structure definition
Use a parent ServiceRequest where multiple child service requests (child ServiceRequests connected to the parent ServiceRequest using ServiceRequest.basedOn)need multiple detailed occurrence timing or quantity information. 
However, could forgo the parent request and just use the child service requests. The choice is a business decision depending on how the transaction partners wish to capture the details.

Similarly, Procedure as a Task.outcome --> Procedure with a Procedure.basedOn -> ServiceRequest provides granular details on a process performed. See "A procedure is an activity that is performed on, with, or for a patient as part of the provision of care. Examples include surgical procedures, diagnostic procedures, endoscopic procedures, biopsies, counseling, physiotherapy, personal support services, adult day care services, non-emergency transportation, home modification, exercise, etc. Procedures may be performed by a healthcare professional, a service provider, a friend or relative or in some cases by the patient themselves" from the structure definition on the CORE Procedure FHIR Resource. 


A Claim FHIR Resource provides the costing information, this can be a "claim | preauthorization | predetermination " (indicated with Claim.use)
The claim should be connected to the ServiceRequest with Claim.referral --> ServiceRequest.
As mentioned, the Procedure Resource can be used if the business requirements need it. The Procedure can be connected to a Claim using Claim.procedure.procedureReference. Any Task records can be included by referencing using Claim.supportingInfo.




If business rules require it, the FHIR ClaimResponse Resource is used to "to provide the results of the adjudication and/or authorization of a set of healthcare-related products and services for a patient against the patient's insurance coverages, or to respond with what the adjudication would be for a supplied set of products or services should they be actually supplied to the patient." In other words, the ClaimResponse Resource is used to respond to a FHIR Claim data instance. The ClaimResponse would detail the actual monies to be paid. I suggest focusing on ClaimResponse.net and Claim.net, which detail the total cost. Using the total cost and the FHIR ServiceRequest (or FHIR Procedure) frequency and quantity information a system can calculate the hourly rated requested or approved. This might be less ambiguous than using the cost per unit.


### Motivation: Service Recipient (Patient) initiative tracking
Engagement of the service recipient (patient) in their eLTSS care is a major goal*better word* in eLTSS due to it's linkage with better outcomes. Patient empowerment is another concept*better word* thought to improve engagement. By using Task, and perhaps Procedure, instances pointing to the patient, one can capture patient initiation and active participation in their own care. 

We have placed an example in the examples provided in this guide. The service recipient has been told of an identified fall risk and recognizing what this means for their own care. The patient volunteers to install a grab bar in their shower. The service recipient's son will do the installation. Thus, we have an example of non-paid, self-initiation, service recipient led action. This Task/ServiceRequest becomes part of the record of the events performed. For better discovery a ServiceRequest or Procedure instance connected to the CarePlan can further heighten visibility. Thus the patient can communicate to upstream and downstream providers through their care plan that they have installed a shower grab bar. This communication allows providers to know both that their has been an action to reduce at home fall risk and that the patient is taking an active interest in their own care. It is important communication that should not be lost, and is common in eLTSS.





-----

### [Gravity SDOH IG](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/)
The Gravity SDOH IG specializes in communication of SDOH concerns and service fulfillment. It contains a large terminology resource for this space, and, importantly has a focus on the ServiceRequest-Task data workflow. We recommend taking a close look at how the Gravity SDOH IG ties Task status updates with the originating ServiceRequest. At a high level, Tasks are created in response to the needs communicated in the ServiceRequest. As the Tasks are completed the system originating the ServiceRequest has an opportunity to know what Task was completed and by whom.

Additionally, in Gravity SDOH they introduce a concept of Patient Task. For those eLTSS CarePlan action items we propose that one should extend the paradigm of Patient Task to cover those things the patient is asked to do for themselves, or determines is important for them to do for themselves. 


### Workflow Task and ServiceRequest following Gravity SDOH
The guidance from Gravity is too extensive to fit into a single paragraph. The SDOHCC Task for Referral Management  Here is a list of important pages from the Gravity SDOH guide:
* example of a Task, [SDOHCC Task for Referral Management ](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-TaskForReferralManagement.html)
* working with the status of [Task](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/checking_task_status.html)
* referral workflow showing Task used in context: [workflow](http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/referral_workflow.html)
* notes on [initiating communication]( http://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/connecting_applications_with_api_data_sources.html)
Generally, the Task is a way of communicating what is actually being performed in relationship to the requested service. 

### Patient Tasks
A slight variation on the Gravity Patient Task is the suggested use of Task to record/track tasks a patient will be performing or is choosing to be responsible for. As an example, see the section in Gravity SDOH which focuses specifically on the subset of tasks around questionnaires [SDOHCC Task For Patient](https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-TaskForPatient.html). 

For general purpose use, the generic Task Resource would be sufficient, but the Task.for would reference a US CORE Patient Profile instance that represented the patient. Task.owner and Task.requester would also be used to indicate who is responsible for the Task and who requested it. 


### Use of Annotation data types and codeableConcept.text 
There are several ways that text can be added in FHIR Resources, for those times when you absolutely need to. The Annotation data type, used in CarePlan.progress, provides a slot for attribution to a creator of the text, a time stamp and a large space for text. For shorter briefer clarification or communications (or when you cannot provide an appropriate code) the codeableConcept.text field is useful. Brief comments can be things like the words uttered by the patient. It is worth noting that the use of text does not make the text as usable as nicely structured data. Use sparingly, ideally you will use structured data elements. 

