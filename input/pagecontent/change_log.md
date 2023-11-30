
#### Changes in this update:
<div>
  <ul>
    <li>Deprecation of CarePlan.activity.detail, reduces opportunity for variability in delivery of data elements</li>
    <li>Recommendations on use of Task and the <a href="implementation.html#pertainstogoal-extension">extension:pertainsToGoal</a></li>
	<li>Clarification on occurrenceTiming</li>
	<li>See, <a href="eLTSS_to_FHIR_R4_element.html">changes to Mapping eLTSS to FHIR</a>, <a href="StructureDefinition-ServiceRequest-eltss.html">ServiceRequest.occurrence[x]</a>, <a href="implementation.html">Implementation topics</a>, <a href="StructureDefinition-CarePlan-eltss.html">CarePlan removal of CarePlan.activity.detail</a></li>
	<li>USCORE version is 3.1.1</li>
	<li>Add <a href="eLTSS_to_FHIR_R4_element.html#units">non-ucum coded units and ucum units</a> as examples for use in quantities</li>
	<li>Removed US CORE mapping page as the data is now redundant through Profiling of USCORE Profiles</li>
	<li>Added <a href="taskProcedure.html">Task Guidance page </a>and  <a href="artifacts.html#other">examples</a> of Task</li>
	<li>Added simulated example of CarePlan and associated artifacts to aid implementers <a href="artifacts.html#example-example-instances">here</a> and <a href="artifacts.html#other">here</a></li>
	<li>Added page on <a href="testing.html">Testing</a>	</li>
	<li>Added draft for new <a href="OperationDefinition-all-eltss-careplan.html">FHIR Operation</a> for retrieving all eLTSS data associated with a CarePlan</li>
	<li>Enhanced server capability statement to make the expectations more clear <a href="CapabilityStatement-eltss-client.html">eLTSS USCORE Capability Statement</a></li>
	<li>Increased clarity of FHIR data elements to support for eLTSS data exchange through additional Must Support (MS) in <a href="profiles.html">all Profiles</a></li>
	<li>Extended guidance with new profiles for <a href="StructureDefinition-PractitionerRole-eltss.html">PractitionerRole</a>, <a href="StructureDefinition-QuestionnaireResponse-eltss.html">QuestionnaireResponse</a> and <a href="StructureDefinition-RelatedPerson-eltss.html">RelatedPerson</a></li>
	<li><a href="StructureDefinition-Condition-eltss.html">Condition category</a> now using "Health Concern" from USCORE</li>
	<li>eLTSS Observation <a href="ValueSet-eltss-observation-code.html">value set for Preference and Strength</a> now using LOINC code for "Care experience Preference"</li>	
  </ul>
</div>
