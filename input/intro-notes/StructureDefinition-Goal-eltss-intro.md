#### Implementer mapping guidance
The following aids in finding the location of eLTSS data elements. See [R4 FHIR Mapping page](eLTSS_to_FHIR_R4_element.html) for complete guidance, here we are providing a subset of fields for convenience. 

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
      <td>Goal</td>
      <td>A statement of a desired result that the person wants to achieve.</td>
      <td>CarePlan &#8594; goal(Goal)<br/>
<br/>
Goal &#8594; description &#8594; text</td>
      <td>CarePlan<br/>
...goal(Goal) 0..*<br/>
......description 1<br/>
.........text 1<br/>
......subject(Patient) 1</td>
      <td>1) Will use CarePlan &#8594; goal to reference the Goal for the care plan being developed.<br/>
2) description is required by both FHIR and US Core, and is a CodableConcept whose text element, per US Core, must include a text description of the goal.<br/>
3) Each goal should go into a separate Goal element so each can potentially reference a step or action(s), or a service(s) that addresses the goal.<br/>
<!--Updated 4) in response to JIRA #23047 and matching XLS-->
4) A Goal can be referenced from a Step or Action or from a service. For a goal related to a step or action, use extension(pertainsToGoal). For a service request specific goal, also use extension(pertainsToGoal). Logically, these goals are exclusive to each other and the same goal isn't duplicated at both levels.<br/>
5) US Core requires the use of Goal &#8594; Subject to reference back to the Patient. </td>
<td class="stu-note">Replaced use of CarePlan.activity.detail, and emphasized the extension pertainsToGoal</td>
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
2) ServiceRequest would be used when the Step or Action is a task under a service. If the Step or Action is an informal support or an activity being undertaken by the beneficiary the Task Resource, similar to a Patient Task used in the Gravity SDOH IG, can be used.<br/>
3) activity &#8594; reference(Resource) is linked to the Goal the step or action addresses through the pertainsToGoal Extension in the referenced activity.<br/>
4) activity &#8594; reference(Resource) includes a performer, author, participant with type or other data element that can be used to reference who is responsible for performing the step or action, such as to indicate that the person or a related person is responsible.<br/>
5) text is where the Step or Action text would be provided.<br/>
6) text is required by FHIR if note is provided.<br/>
7) Note that a stated goal may lead directly to a service, and not necessarily to an explicit Step or Action. For example, a person's goal could be to attend church regularly, and this would be achieved through a transportation service.</td>
	<td class="stu-note">Replaced use of CarePlan.activity.detail, and emphasized the extension pertainsToGoal</td>
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
      <td>Goal LifecycleStatus<br/>
FHIR<br/>
US Core</td>
      <td>The state of the goal throughout its lifecycle.</td>
      <td>Goal &#8594; lifecycleStatus</td>
      <td>Goal 0..*<br/>
...lifecycleStatus 1</td>
      <td>1) lifecycleStatus is required by both FHIR and US Core, and must use the GoalStatus value set which has values: proposed, accepted, in-progress, etc.</td>
    </tr>
    <tr>
      <td>Goal Subject<br/>
FHIR<br/>
US Core</td>
      <td>Identifies the patient, group or organization for whom the goal is being established.</td>
      <td>Goal &#8594; subject(Patient)</td>
      <td>Goal<br/>
...subject 1</td>
      <td>1) subject is required by both FHIR and US Core, and is a reference to a Patient.</td>
    </tr>
	
  </table>
