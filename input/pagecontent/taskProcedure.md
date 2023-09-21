This page is an supplement to the guidance found on the Implementation page. Please review that guidance as well.

### Motivation - Service Recipient (Patient) initiative tracking
Engagement of the service recipient (patient) in their eLTSS care is a major goal in eLTSS due to it's linkage with better outcomes. Patient empowerment is thought to improve engagement. By using Task, SerivceRequest and optionally Procedure, instances that indicate the patient as the author, performer or owner, one can capture service recipient initiation and active participation in their own care. 

### An example
A service recipient (patient) has been told of an identified fall risk. Recognizing what this means for their own care, the service recipient volunteers to install a grab bar in their shower. The service recipient's son will do the installation. Thus, we have an example of non-paid, self-initiated, service recipient led action. This Task/ServiceRequest becomes part of the record of the events performed. 

For better discovery a ServiceRequest or Procedure instance connected to the CarePlan can further heighten visibility. Thus the patient can communicate to upstream and downstream providers through their care plan that they have installed a shower grab bar. This communication allows providers to know both that their has been an action to reduce at home fall risk and that the patient is taking an active interest in their own care. It is important communication that should not be lost, and is common in eLTSS.

### Task use
Task is a vehicle to indicate an event happened or needs to happen. The event itself is described using other FHIR Resources such as ServiceRequest or Procedure. Task uses Task.focus to associate with a ServiceRequest.

The general workflow, based on the STU2 version of the Gravity SDOH guide, is as follows:
The ServiceRequest is sent to the CarePlanner, or created by the CarePlanner, and it is directed to a service provider, service recipient, caregiver or related person. Additionally, the ServiceRequest is connected to CarePlan through the CarePlan.activity.reference field. 

Next, Task FHIR Resource instances, either locally created and maintained, or produced externally but transmitted back to the initiating system, are used to indicate completion of the ServiceRequest. The Task instances refer to the ServiceRequest using the Task.focus field. Task can also be used as a vehicle to deliver Procedure Resource instances of performed processes. These would reference the ServiceRequesst using Procedure.basedOn. 

Importantly: "The ServiceRequest resource allows requesting only a single procedure. If a workflow requires requesting multiple procedures simultaneously, this is done using multiple instances of this resource. These instances can be linked in different ways, depending on the needs of the workflow. For guidance, refer to the Request pattern" FHIR request pattern, comes from ServiceRequest CORE Structure definition
Use a parent ServiceRequest where multiple child service requests (child ServiceRequests connected to the parent ServiceRequest using ServiceRequest.basedOn)need multiple detailed occurrence timing or quantity information. 
However, could forgo the parent request and just use the child service requests. The choice is a business decision depending on how the transaction partners wish to capture the details.

Similarly, Procedure as a Task.outcome --> Procedure with a Procedure.basedOn -> ServiceRequest provides granular details on a process performed. See "A procedure is an activity that is performed on, with, or for a patient as part of the provision of care. Examples include surgical procedures, diagnostic procedures, endoscopic procedures, biopsies, counseling, physiotherapy, personal support services, adult day care services, non-emergency transportation, home modification, exercise, etc. Procedures may be performed by a healthcare professional, a service provider, a friend or relative or in some cases by the patient themselves" from the structure definition on the CORE Procedure FHIR Resource. 

The following illustration indicates how the resources are connected. Dotted arrows indicate the optional inclusion of a Procedure. In the example above. The ServiceRequest could have been populated by the Care Planner in eLTSS care planning software. The Care Planner's software is likely to create the Patient directed Task as well, to record progress. Once the Task is put into a completed state, a Procedure instance could be added which contains a computable detail of what was done (the Son would be the RelatedPerson doing the Procedure). 

<table><tr><td><img src="eLTSS_Task.png" /></td></tr></table>

### Claim
A Claim FHIR Resource provides the costing information, this can be a "claim | preauthorization | predetermination " (indicated with Claim.use).  The claim should be connected to the ServiceRequest with Claim.referral --> ServiceRequest. As mentioned, the Procedure Resource can be used if the business requirements need it. The Procedure can be connected to a Claim using Claim.procedure.procedureReference. Any Task records can be included by referencing using Claim.supportingInfo.


If business rules require it, the FHIR ClaimResponse Resource is used to "to provide the results of the adjudication and/or authorization of a set of healthcare-related products and services for a patient against the patient's insurance coverages, or to respond with what the adjudication would be for a supplied set of products or services should they be actually supplied to the patient." In other words, the ClaimResponse Resource is used to respond to a FHIR Claim data instance. The ClaimResponse would detail the actual monies that could or would be paid. 

Consider use of ClaimResponse.net and Claim.net. They both detail the total cost. Using the total cost and the FHIR ServiceRequest (or FHIR Procedure) frequency and quantity information a system could theoretically calculate the hourly rated requested or approved. This might be less ambiguous and more convenient than requesting entry of the cost per unit. 





