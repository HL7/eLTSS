#### Implementer mapping guidance
The following aids in finding the location of eLTSS data elements. See [R4 FHIR Mapping page](eLTSS_to_FHIR_R4_element.html) for complete guidance, here we are providing a subset of fields for convenience. The CarePlan Resource links to all eLTSS data elements, while specific elements are provided below the implementer should review all the guidance on [R4 FHIR Mapping page](eLTSS_to_FHIR_R4_element.html). This is especially imporant for ServiceRequest related items, Person Centered Planning concepts such as "Person Setting Choice Options," risk assessments, signatures and financial data.

<table border="1">
    <tr>
      <th>eLTSS Grouping</th>
      <th>eLTSS Data Element Name</th>
      <th>Data Element Definition (includes examples, expected list of values and usage note where applicable)</th>
      <th>FHIR R4 Resource Element(s)</th>
      <th>FHIR R4 Resource Element Cardinality (with US Core Constraints)</th>
      <th>Additional Mapping Details</th>
	  <th class="stu-note">Important change</th>
    </tr>

    <tr bgcolor="#fff2ff">
      <td>Goals &amp; Strengths</td>
      <td>Step or Action</td>
      <td>A planned measurable step or action that needs to be taken to accomplish a goal identified by the person.</td>
	  <td>
CarePlan &#8594; activity<br/>
         &#8594; reference(Resource) &#8594; note<br/>
         &#8594; text
		 &#8594; extension(pertainsToGoal)</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(Resource) 0..1<br/>
.........note 0..*<br/>
............text 1<br/>
.........extension(pertainsToGoal)</td>
      <td>1) CarePlan includes activity &#8594; reference, which can be a reference to ServiceRequest, Task or other Resource.<br/>
2) ServiceRequest would be used when the Step or Action is a task under a service. If the Step or Action is an informal support or an activity being undertaken by the patient/care recipient, the Task Resource, similar to a Patient Task used in the Gravity SDOH IG, can be used.<br/>
3) activity &#8594; reference(Resource) is linked to the Goal the step or action addresses through the pertainsToGoal Extension in the referenced activity.<br/>
4) activity &#8594; reference(Resource) includes a performer, author, participant with type or other data element that can be used to reference who is responsible for performing the step or action, such as to indicate that the person or a related person is responsible.<br/>
5) text is where the Step or Action text would be provided.<br/>
6) text is required by FHIR if note is provided.<br/>
7) Note that a stated goal may lead directly to a service, and not necessarily to an explicit Step or Action. For example, a person's goal could be to attend church regularly, and this would be achieved through a transportation service.</td>
	<td class="stu-note">Replaced use of CarePlan.activity.detail, and emphasized the extension pertainsToGoal</td>
    </tr>
    <tr>
      <td>Goals &amp; Strengths</td>
      <td>Strength</td>
      <td>A favorable attribute of oneself, his/her support network, environment and/or elements of his/her life.</td>
      <td>CarePlan &#8594; supportingInfo(Observation)<br/>
<br/>
Observation &#8594; valueString<br/>
Observation &#8594; code &#8594; coding &#8594; code
Observation &#8594; code &#8594; coding &#8594; system</td>
      <td>
      CarePlan<br/>
...supportingInfo(Observation) 0..*<br/>
......valueString 0..1<br/>
......code 1<br/>
........coding 0..*<br/>
..........code 0..1<br/>
............system 0..1<br/>
</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Observation containing the Strength.<br/>
2) code is required by FHIR, and is a CodeableConcept where coding &#8594; code can be set to "Strength" with the corresponding NEW code &#8594; system "http://hl7.org/us/eLTSS/CodeSystem/eltss-observation-code".<br/>
3) valueString is where the Strength text would be provided.</td>
    </tr>
    <tr>
      <td>Person Centered Planning</td>
      <td>Assessed Need</td>
      <td>The clinical and/or community-based necessity or desire as identified through an assessment that should be addressed by a service. </td>
      <td>CarePlan &#8594; addresses(Condition)<br/>
<br/>
Condition &#8594; code &#8594; text<br/>
Condition &#8594; category</td>
      <td>CarePlan<br/>
...addresses(Condition) 0..*<br/>
......code 1<br/>
.........text 0..1<br/>
......category 1..*</td>
      <td>1) Will use CarePlan &#8594; addresses to reference the Condition(s) for the care plan being developed.<br/>
2) code is required by US Core and is a CodeableConcept which per US Core is bound to the extensible Problem Value Set. That value set is based on SNOMED-CT and includes very specific values that do not line up with assessed needs. Per US Core's documentation on extensible CodeableConcepts, the CodeableConcept's text element can be used "if no suitable codes exist", so we can use the text element for the assessed need.<br/>
3) Each assessed need should go into a separate Condition element so each can potentially be linked to a service(s) that addresses it.<br/>
4) category is required by US Core and is a CodeableConcept which per US Core is bound to the extensible US Core Condition Category Codes value set (http://hl7.org/fhir/ValueSet/condition-category) which has values: problem-list-item, encounter-diagnosis. Could use the value "problem-list-item" to indicate the underlying condition, and extend the value set to add the value "assessed-need".<br/>
5) An "assessed need" condition can refer to another condition via the condition-dueTo extension.</td>
    </tr>

    <tr>
      <td>Person Centered Planning</td>
      <td>Plan Monitor Name</td>
      <td>The name of the person responsible for monitoring the plan.</td>
      <td>CarePlan &#8594; encounter (Encounter)<br/>
<br/>
Encounter &#8594; episodeOfCare(EpisodeOfCare)<br/>
<br/>
EpisodeOfCare &#8594; careManager(Practitioner)<br/>
<br/>
Practitioner &#8594; name &#8594; family<br/>
Practitioner &#8594; name &#8594; given<br/>
Practitioner &#8594; name &#8594; text</td>
      <td>CarePlan<br/>
...encounter(Encounter) 0..1<br/>
...... episodeOfCare(EpisodeOfCare)0..1<br/>
.........careManager(Practitioner) 0..1<br/>
............name 0..*<br/>
...............family 0-1<br/>
................given 0-*<br/>
................text 0-1</td>
      <td>1) Will use CarePlan &#8594; encounter to reference the EpisodeOfCare that defines the plan monitor (care manager) for the plan.<br/>
2) EpisodeOfCare &#8594; careManager references the Practitioner who is monitoring the plan.<br/>
3) given is used for both first name &amp; MI, so need more than one.<br/>
4) family is a string with the person's surname.<br/>
5) text is a string that contains the full name of the person.<br/>
6) The values for Plan Monitor Name and Plan Monitor Printed Name would include the same information.</td>
    </tr>
    <tr>
      <td>Person Centered Planning</td>
      <td>Plan Monitor Phone Number</td>
      <td>The primary phone number (and extension when applicable) of the plan monitor.</td>
      <td>CarePlan &#8594; encounter (Encounter)<br/>
<br/>
Encounter &#8594; episodeOfCare(EpisodeOfCare)<br/>
<br/>
EpisodeOfCare &#8594; careManager(Practitioner)<br/>
<br/>
Practitioner &#8594; telecom &#8594; system<br/>
Practitioner &#8594; telecom &#8594; value</td>
      <td>CarePlan<br/>
...encounter(Encounter) 0..1<br/>
...... episodeOfCare(EpisodeOfCare)0..1<br/>
.........careManager(Practitioner) 0..1<br/>
............telecom 0..*<br/>
...............system 0..1<br/>
................value 0..1</td>
      <td>1) Will use CarePlan &#8594; encounter to reference the EpisodeOfCare that defines the plan monitor (care manager) for the plan.<br/>
2) EpisodeOfCare &#8594; careManager references the Practitioner who is monitoring the plan.<br/>
3) telecom is of type ContactPoint (https://www.hl7.org/fhir/datatypes.html#contactpoint) which contains elements to populate for the phone number.<br/>
4) system is required if value is provided, and can be: phone, fax, email, pager, url, sms, other.<br/>
5) Per FHIR, phone # should be formatted according to ITU-T E.123, so "(555) 675 5745" or "+22 555 675 5745".</td>
    </tr>
    <tr>
      <td>Person Centered Planning</td>
      <td>Preference</td>
      <td>Presents the person's personal thoughts about something he or she feels is relevant to his or her life experience and may be pertinent when planning.</td>
      <td>CarePlan &#8594; supportingInfo(Observation)<br/>
<br/>
Observation &#8594; valueString<br/>
Observation &#8594; code &#8594; coding &#8594; code<br/>
Observation &#8594; code &#8594; coding &#8594; system<br/></td>
      <td>CarePlan<br/>
...supportingInfo(Observation) 0..*<br/>
......valueString 0..1<br/>
......code 1<br/>
.........coding 0..*<br/>
............code 0..1<br/>
............system 0..1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Observation containing the Preference.<br/>
2) code is required by FHIR and is a CodeableConcept where coding &#8594; code can be set to "Preference" with the corresponding NEW code -&gt; system "http://hl7.org/us/eLTSS/CodeSystem/eltss-observation-code".<br/>
3) valueString is where the Preference text would be provided.</td>
    </tr>
	
    <tr>
      <td>Plan Information</td>
      <td>Plan Effective Date</td>
      <td>The date upon which the plan goes into effect.<br/>
<br/>
Start date is required, end date is optional.</td>
      <td>CarePlan &#8594; period &#8594; start<br/>
CarePlan &#8594; period &#8594; end</td>
      <td>CarePlan 0..*<br/>
...period 0..1<br/>
......start 1<br/>
......end 0..1</td>
      <td>1) period includes a start and an end element, which are both dateTime formats which can be date, date-time or partial date (e.g. just year or year + month).<br/>
2) start is required by eLTSS.</td>
    </tr>
	
    <tr>
      <td>Service Provider Information</td>
      <td>Support Planner Name</td>
      <td>The name of the person (e.g., Case Manager, Care Coordinator, Plan Coordinator) who helped develop the plan.</td>
      <td>CarePlan &#8594; author(Patient | Practitioner | PractitionerRole |  RelatedPerson | Organization | CareTeam)<br/>
<br/>
Practitioner | Patient | RelatedPerson<br/>
         &#8594; name &#8594; family<br/>
Practitioner | Patient | RelatedPerson<br/>
         &#8594; name &#8594; given<br/>
Practitioner | Patient | RelatedPerson<br/>
         &#8594; name &#8594; text<br/>
         Organization | CareTeam &#8594; name
         </td>
      <td>CarePlan<br/>
...author(Patient | Practitioner | RelatedPerson ) 0..1<br/>
......name 0..*<br/>
.........family 0..1<br/>
.........given 0..*<br/>
.........text 0..1<br />
CarePlan<br />
…author(Organization | CareTeam ) 0..1<br />
......name 0..1</td>
      <td>1) Will use CarePlan &#8594; author to reference a Practitioner, PractitionerRole, RelatedPerson, Organization, CareTeam or Patient (in self-directed plans) who is the primary author of the care plan being developed.<br/>
2) Practitioner, Organization, CareTeam, RelatedPerson and Patient all include name.<br/>
3) PractitionerRole should be used when the Organization for whom the Practitioner works for is also needed. <br />
4) given is used for both first name &amp; MI, so need more than one.<br/>
5) family is a string with the person's surname.<br/>
6) text is a string that contains the full name of the person.<br/>
<!--Updated to reflect resolution of Jira #23058-->
7) The values for Support Planner Name and Support Planner Printed Name would include the same information.</td>
    </tr>
    <tr>
      <td>Service Provider Information</td>
      <td>Support Planner Phone Number</td>
      <td>The primary phone number (and extension when applicable) of the support planner.</td>
      <td>CarePlan &#8594; author(Patient | Practitioner | PractitionerRole |  RelatedPerson | Organization | CareTeam )<br/>
<br/>
Patient | Practitioner | PractitionerRole |  RelatedPerson | Organization | CareTeam <br/>
         &#8594; telecom &#8594; system<br/>
Patient | Practitioner | PractitionerRole |  RelatedPerson | Organization | CareTeam <br/>
         &#8594; telecom &#8594; value</td>
      <td>CarePlan<br/>
...author(Patient | Practitioner | PractitionerRole |  RelatedPerson | Organization | CareTeam ) 0..1<br/>
......telecom 0..*<br/>
.........system 0..1<br/>
.........value 0..1</td>
      <td>1) Will use CarePlan &#8594; author to reference a Practitioner, PractitionerRole, RelatedPerson, Organization, CareTeam or Patient (in self-directed plan) who is the primary author of the care plan being developed.<br/>
2) Practitioner, PractitionerRole, RelatedPerson, Organization, CareTeam and Patient all include telecom.<br/>
3) PractitionerRole should be used when the Organization for whom the Practitioner works for is also needed.<br />
4) telecom is of type <A href="https://www.hl7.org/fhir/datatypes.html#contactpoint">ContactPoint</A> which contains elements to populate for the phone number.<br/>
5) system is required if value is provided, and can be: phone, fax, email, pager, url, sms, other.<br/>
6) Per FHIR, phone # should be formatted according to ITU-T E.123, so "(555) 675 5745" or "+22 555 675 5745".</td>
    </tr>

  </table>
  
  <table border="1">
    <tr>
      <th colspan="5">Data Requirements Not Specific to eLTSS Dataset Data Elements<br/>
This section documents data elements that are mandatory per FHIR XML schemas or US Core requirements, but that do not align with individual eLTSS Dataset data elements.</th>
    </tr>
    <tr>
      <th>FHIR Data Element Name<br/>
Requirement Source</th>
      <th>Data Element Definition</th>
      <th>FHIR R4 Resource Element(s)</th>
      <th>FHIR R4 Resource Element Cardinality (with US Core Constraints)</th>
      <th>Additional Mapping Details</th>
    </tr>
    <tr>
      <td>CarePlan Status<br/>
FHIR<br/>
US Core</td>
      <td>Indicates whether the plan is currently being acted upon, represents future intentions or is now a historical record.</td>
      <td>CarePlan &#8594; status</td>
      <td>CarePlan<br/>
...status 1</td>
      <td>1) status is required by both FHIR and US Core, and must use the RequestStatus value set (http://hl7.org/fhir/valueset-request-status.html). Possible values are: draft, active, suspended, completed, entered-in-error, cancelled, and unknown.</td>
    </tr>
    <tr>
      <td>CarePlan Intent<br/>
FHIR<br/>
US Core </td>
      <td>Indicates the level of authority/intentionality associated with the care plan and where the care plan fits into the workflow chain.</td>
      <td>CarePlan &#8594; intent</td>
      <td>CarePlan<br/>
...intent 1</td>
      <td>1) intent is required by both FHIR and US Core, and must use the CarePlanIntent value set (http://hl7.org/fhir/valueset-care-plan-intent.html). Possible values are: proposal, plan, order, and option.</td>
    </tr>
    <tr>
      <td>CarePlan Narrative Summary<br/>
US Core</td>
      <td>Text summary of the resource, for human interpretation. The narrative is an XHTML fragment with a flag to indicate its relationship to the data.</td>
      <td>CarePlan &#8594; text &#8594; status<br/>
CarePlan &#8594; text &#8594; div</td>
      <td>CarePlan<br/>
...text 1<br/>
......status 1<br/>
......div 1</td>
      <td>1) text is required by US Core.<br/>
2) status is required by FHIR and must use the NarrativeStatus value set (http://hl7.org/fhir/us/core/2019Jan/ValueSet-us-core-narrative-status.html). Possible values are: generated, additional.<br/>
3) div is required by FHIR and contains limited xhtml content that contains only the basic html formatting elements and attributes.</td>
    </tr>
    <tr>
      <td>CarePlan Category<br/>
US Core</td>
      <td>Identifies what "kind" of plan this is to support differentiation between multiple co-existing plans; e.g. "Home health", "psychiatric", "asthma", "disease management", "wellness plan", etc.</td>
      <td>CarePlan &#8594; category &#8594; coding &#8594; system<br/>
CarePlan &#8594; category &#8594; coding &#8594; code</td>
      <td>CarePlan<br/>
...category 1..*<br/>
......coding 1..*<br/>
.........system 1<br/>
.........code 1</td>
      <td>1) Per US Core, one category must appear, and must include system with the value "http://hl7.org/fhir/us/core/CodeSystem/careplan-category" and  code with the value "assess-plan".<br/>
2) US Core does not restrict the number of additional category elements that may appear.</td>
    </tr>
    <tr bgcolor="#fff2ff">
      <td>CarePlan Activity Status<br/>
FHIR</td>
      <td>Identifies what progress is being made for the specific activity.</td>
      <td>CarePlan &#8594; activity &#8594; reference(Resource) &#8594; status<br/>
			and<br/>
			CarePlan&#8594; activity &#8594; progress</td>
      <td>CarePlan<br/>
...activity<br/>
......reference(Resource)<br/>
.........status 1<br/>
and
CarePlan<br/>
...activity<br/>
......progress<br/>
</td>
      <td>1) status is required by FHIR in Resources Reference by CarePlan.activity.reference. Possible values are: not-started, scheduled, in-progress, on-hold, completed, cancelled, stopped, unknown, and entered-in-error.<br/>
	  2) There is also CarePlan.activity.progress to add a free-text description of the progress, or note. CarePlan.activity.progress is an Annotation data type in FHIR, this means it can be dated and contain the identification of the person who uttered the text. This might be used, for example, when the status stays in the same state, i.e. 'in-progress,' but where there is a evolution of that progress.</td>	  
	<td class="stu-note">Replaced use of CarePlan.activity.detail, and emphasized the use of the status element in the referenced activity and CarePlan.activity.progress free-text annotation</td>
    </tr>
	
  </table>