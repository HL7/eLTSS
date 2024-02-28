CONSIDER renaming to Commentary on Task, Procedure and Claim Resources
OR Commentary on use of Procedure Resource by ServiceRequest Recipient
<<we are telling people how they could 
communicate with Task a patient initiated task
use Procedure to communicate actions performed (by anyone) in meeting ServiceRequest
and when Procedure or Task are used how to connect them to Claim (asks for money)
and that ClaimResponse is the correc vechinle in FHIR for detailing actual monies paid (actual payment)

These are capabilities in FHIR but not a proscription on any other method nor a prescribed solution.

The following details...
add some hedging language to the Task stuff --- when Task is used in conjunction with ServiceRequest to smooth communication between LTSS care providers (e.g. care monitor, care planner, care giver) and the originating requester. 


This page is an supplement to the guidance found on the Implementation page. Please review that guidance as well. The guidance on this page is purely for additional navigation of the complexities of FHIR based on recommendations the IG authors would make in associating use of Task with Procedure, when Task is used in conjunction with ServiceRequest to smooth the communication between LTSS care actors and the originating requester. Additionally, further explanation is given in the use of Claim. <<maybe move claim information to another page>>

### Special Topic - Service Recipient (Patient) initiative tracking
Patient empowerment is thought to improve engagement. Engagement of the service recipient (patient) in their eLTSS care is a major goal in eLTSS due to it's linkage with better outcomes. By using instances of Task, SerivceRequest and optionally Procedure which indicate the patient as the author, performer or owner, one could capture service recipient initiation and active participation in their own care.

#### An example
A service recipient (patient) has been told of an identified fall risk. Recognizing what this means for their own care, the service recipient volunteers to install a grab bar in their shower. The service recipient's son will do the installation. Thus, we have an example of non-paid, self-initiated, service recipient led action. This Task/ServiceRequest becomes part of the record of the events performed. The Task.for would reference a US CORE Patient Profile instance that represented the patient. Task.owner and Task.requester would also be used to indicate who is responsible for the Task and who requested it. 

For better discovery a ServiceRequest or Procedure instance connected to the CarePlan can further heighten visibility. Thus the patient could communicate to upstream and downstream providers through their care plan that they have installed a shower grab bar. This communication would allow providers to know both that their has been an action to reduce at home fall risk and that the patient is taking an active interest in their own care. It is important communication that should not be lost, and is common in eLTSS.

### Task used with ServiceRequest
Task is a vehicle to indicate an event happened or needs to happen. The event itself is described using other FHIR Resources such as ServiceRequest or Procedure. Task uses Task.focus to associate with a ServiceRequest.

When appropriate based on business requirements, Task can be used in conjunction with ServiceRequest to report on fullfillment or actions taken. Based on the STU2 version of the Gravity SDOH guide, a flow in eLTSS could be:  
First, a ServiceRequest is sent to the CarePlanner, or created by the CarePlanner, and it is directed to a service provider, service recipient, caregiver or related person to fulfill. Importantly, the ServiceRequest is connected to a CarePlan through the CarePlan.activity.reference field. 

Next, Task FHIR Resource instances, either locally created and maintained, or produced externally but transmitted back to the initiating system, are used to indicate completion of the ServiceRequest. Critically the Task instances refer to the ServiceRequest using the Task.focus field. Task can also be used as a vehicle to deliver Procedure Resource instances of performed processes. These would reference the ServiceRequesst using Procedure.basedOn. 

Importantly: "The ServiceRequest resource allows requesting only a single procedure. If a workflow requires requesting multiple procedures simultaneously, this is done using multiple instances of this resource. These instances can be linked in different ways, depending on the needs of the workflow. For guidance, refer to the Request pattern." from the [ServiceRequest CORE Structure definition](https://hl7.org/fhir/R4/servicerequest.html#scope). One could use a parent ServiceRequest where multiple child service requests need multiple detailed occurrence timing or quantity information (with child ServiceRequests connected to the parent ServiceRequest using ServiceRequest.basedOn). However, one could forgo the parent request and just use the child service requests. The choice is a business decision depending on how the transaction partners wish to capture the details.

In the flow, a Procedure instance, with the Task.outcome referencing the Procedure, and with the Procedure.basedOn referencing the ServiceRequest, can provide granular details on a processes performed. See "A procedure is an activity that is performed on, with, or for a patient as part of the provision of care. Examples include surgical procedures, diagnostic procedures, endoscopic procedures, biopsies, counseling, physiotherapy, personal support services, adult day care services, non-emergency transportation, home modification, exercise, etc. Procedures may be performed by a healthcare professional, a service provider, a friend or relative or in some cases by the patient themselves" from [Procedure FHIR Resource](https://hl7.org/fhir/R4/procedure.html#scope). 

The following illustration indicates how the resources can be connected. Dotted arrows indicate the optional inclusion of a Procedure. In the example above. The ServiceRequest could have been populated by the Care Planner in eLTSS care planning software. The Care Planner's software is likely to create the Patient directed Task as well, to record progress. Once the Task is put into a completed state, a Procedure instance could be added which contains a computable detail of what was done (e.g. a care recipient's Son could be the RelatedPerson doing the Procedure). 

<table><tr><td><img src="eLTSS_Task.png" /></td></tr></table>




### Patient Tasks
A slight variation on the Gravity Patient Task is the suggested use of Task to record/track tasks a patient will be performing or is choosing to be responsible for. 

As an example, see the section in Gravity SDOH which focuses specifically on the subset of tasks around questionnaires [SDOHCC Task For Patient](https://build.fhir.org/ig/HL7/fhir-sdoh-clinicalcare/StructureDefinition-SDOHCC-TaskForPatient.html). 

For general purpose use, the generic Task Resource would be sufficient, but the Task.for would reference a US CORE Patient Profile instance that represented the patient. Task.owner and Task.requester would also be used to indicate who is responsible for the Task and who requested it. 







