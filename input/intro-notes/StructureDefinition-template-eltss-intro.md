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
    <tr>
      <td>Beneficiary Demographics</td>
      <td>Person Name</td>
      <td>The name of the person whom the plan is for.</td>
      <td>CarePlan &#8594; subject(Patient)<br/>
<br/>
Patient &#8594; name &#8594; family<br/>
Patient &#8594; name &#8594; given<br/>
Patient &#8594; name &#8594; text</td>
      <td>CarePlan<br/>
...subject(Patient) 1<br/>
......name 1..*<br/>
.........family 1<br/>
.........given 1..*<br/>
.........text 0..1</td>
      <td>1) Will use CarePlan &#8594; subject to reference the Patient for the care plan being developed. FHIR requires that CarePlan includes a subject.<br/>
2) given is used for both first name &amp; MI, so need more than one.<br/>
3) family is a string with the person's surname.<br/>
4) text is a string that contains the full name of the person.<br/>
5) Per US Core 1.0.1, each Patient must have at least one name, and each name must include family and given.</td>
    </tr>
    <tr>
      <td>Beneficiary Demographics</td>
      <td>Person Identifier</td>
      <td>A string of character(s) used to identify the person whom the plan is for.<br/>
<br/>
This may be the Medicaid ID number where applicable.</td>
      <td>CarePlan &#8594; subject(Patient)<br/>
<br/>
Patient &#8594; identifier &#8594; value</td>
      <td>CarePlan<br/>
...subject(Patient) 1<br/>
......identifier 1..*<br/>
.........value 1<br/>
.........system 1</td>
      <td>1) Will use CarePlan &#8594; subject to reference the Patient for the care plan being developed. FHIR requires that CarePlan includes a subject.<br/>
2) identifier is of type Identifier. value is a text element.<br/>
3) Per US Core 1.0.1, each Patient must have at least 1 identifier, and each identifier must include a value and system. system is the namespace for the identifier value.</td>
    </tr>
    <tr>
      <td>Beneficiary Demographics</td>
      <td>Person Identifier Type</td>
      <td>The type of unique identifier used to identify the person whom the plan is for.<br/>
Values include: Medicaid Number, State ID, Medical Record Number, Other (free text)</td>
      <td>CarePlan &#8594; subject(Patient)<br/>
<br/>
Patient &#8594; identifier &#8594; type</td>
      <td>CarePlan<br/>
...subject(Patient) 1<br/>
......identifier 1..*<br/>
.........type 0..1</td>
      <td>1) Will use CarePlan &#8594; subject to reference the Patient for the care plan being developed. FHIR requires that CarePlan includes a subject.<br/>
2) If we have the identifier, we need to be know the type.<br/>
3) type is a CodeableConcept with an extensible value set with values defined <A href="https://www.hl7.org/fhir/valueset-identifier-type.html">here</A>. <br/>  Medical Record Number is available in the documented code list. LOINC includes Medicaid Number (45400-9) and Social Security Number (45396-9). State ID is covered by the "SB" (Social Beneficiary) code value documented in the FHIR codeset at http://hl7.org/fhir/identifier-type. "Other" can be handled with the text element that is part of the Codeable Concept.</td>
    </tr>
    <tr>
      <td>Beneficiary Demographics</td>
      <td>Person Date of Birth</td>
      <td>The birth date of the person whom the plan is for.</td>
      <td>CarePlan &#8594; subject(Patient)<br/>
<br/>
Patient &#8594; birthDate</td>
      <td>CarePlan<br/>
...subject(Patient) 1<br/>
......birthDate 0..1</td>
      <td>1) Will use CarePlan &#8594; subject to reference the Patient for the care plan being developed. FHIR requires that CarePlan includes a subject.<br/>
2) birthDate is in the form "1951-06-04". </td>
    </tr>
    <tr>
      <td>Beneficiary Demographics</td>
      <td>Person Phone Number</td>
      <td>The primary phone number of the person whom the plan is for, or his/her legal representative, where applicable.</td>
      <td>CarePlan &#8594; subject(Patient)<br/>
<br/>
Patient &#8594; telecom &#8594; system<br/>
Patient &#8594; telecom &#8594; value</td>
      <td>CarePlan<br/>
...subject(Patient) 1<br/>
......telecom 0..*<br/>
.........value 0..1<br/>
.........system 0..1</td>
      <td>1) Will use CarePlan &#8594; subject to reference the Patient for the care plan being developed. FHIR requires that CarePlan includes a subject.<br/>
2) telecom is of type ContactPoint which contains elements to populate for the phone number.<br/>
3) system is required by FHIR if value is provided, and can be: phone | fax | email | pager | url | sms | other. For the eLTSS phone number, system should be provided as "phone".<br/>
4) Per FHIR, phone # should be formatted according to ITU-T E.123, so "(555) 675 5745" or "+22 555 675 5745".</td>
    </tr>
    <tr>
      <td>Beneficiary Demographics</td>
      <td>Person Address</td>
      <td>The address of the person whom the plan is for.</td>
      <td>CarePlan &#8594; subject(Patient)<br/>
<br/>
Patient &#8594; address &#8594; line<br/>
Patient &#8594; address &#8594; city<br/>
Patient &#8594; address &#8594; state<br/>
Patient &#8594; address &#8594; postalCode<br/>
Patient &#8594; address &#8594; district<br/>
Patient &#8594; address &#8594; text</td>
      <td>CarePlan<br/>
...subject(Patient) 1<br/>
......address 0..*<br/>
.........line 0..*<br/>
.........city 0..1<br/>
.........state 0..1<br/>
.........postalCode 0..1<br/>
.........district 0..1<br/>
.........text 0..1</td>
      <td>1) Will use CarePlan &#8594; subject to reference the Patient for the care plan being developed. FHIR requires that CarePlan includes a subject.<br/>
2) text is the full (not broken out) address.<br/>
3) line includes street name, number and suffix (e.g. 123 Main St.).<br/>
4) Information such as apt #, floor &amp; room #, etc. also go into line, generally as a separate data element.<br/>
5) district covers county.</td>
    </tr>
    <tr>
      <td>Beneficiary Demographics</td>
      <td>Emergency <br/>
Contact Name</td>
      <td>The name of the individual or entity identified to contact in case of emergency.</td>
      <td>CarePlan &#8594; subject(Patient)<br/>
<br/>
Patient &#8594; contact &#8594; relationship<br/>
Patient &#8594; contact &#8594; name &#8594; family<br/>
Patient &#8594; contact &#8594; name &#8594; given<br/>
Patient &#8594; contact &#8594; name &#8594; text</td>
      <td>CarePlan<br/>
...subject(Patient) 1<br/>
......contact 0..*<br/>
.........relationship 1..*<br/>
.........name 0..1<br/>
............family 0..1<br/>
............given 0..*<br/>
............text 0..1</td>
      <td>1) Will use CarePlan &#8594; subject to reference the Patient for the care plan being developed. FHIR requires that CarePlan includes a subject.<br/>
2) Emergency contact is indicated using a relationship value "C".<br/>
3) If contact is provided, relationship needs to be provided to indicate this is an emergency contact.<br/>
4) given is used for both first name &amp; MI, so need more than one.<br/>
5) family is a string with the person's surname.<br/>
6) text is a string with the full name of the person.</td>
    </tr>
    <tr>
      <td>Beneficiary Demographics</td>
      <td>Emergency <br/>
Contact Relationship</td>
      <td>The relationship (e.g., spouse, neighbor, guardian, daughter) of the individual identified to contact in case of emergency.</td>
      <td>CarePlan &#8594; subject(Patient)<br/>
<br/>
Patient &#8594; contact &#8594; relationship</td>
      <td>CarePlan<br/>
...subject(Patient) 1<br/>
......contact 0..*<br/>
.........relationship 1..*</td>
      <td>1) Will use CarePlan &#8594; subject to reference the Patient for the care plan being developed. FHIR requires that CarePlan includes a subject.<br/>
2) Emergency contact is indicated using a relationship value "C".<br/>
Other contact codes can be found here: https://www.hl7.org/fhir/v2/0131/index.html<br/>
3) The emergency contact would have two relationship data elements, one to indicate that it is an emergency contact and one to indicate the relationship between the patient and the contact (such as "next-of-kin").<br/>
4) There are other value sets that could be used to provide more detail, for example daughter or neighbor. Can use the value set http://www.hl7.org/implement/standards/fhir/valueset-relatedperson-relationshiptype.html</td>
    </tr>
    <tr>
      <td>Beneficiary Demographics</td>
      <td>Emergency <br/>
Contact Phone Number</td>
      <td>The primary phone number (and extension when applicable) of the individual or entity identified to contact in case of emergency.</td>
      <td>CarePlan &#8594; subject(Patient)<br/>
<br/>
Patient &#8594; contact &#8594; telecom &#8594; system<br/>
Patient &#8594; contact &#8594; telecom &#8594; value</td>
      <td>CarePlan<br/>
...subject(Patient) 1<br/>
......contact 0..*<br/>
.........telecom 0..*<br/>
............value 0..1<br/>
............system 0..1</td>
      <td>1) Will use CarePlan &#8594; subject to reference the Patient for the care plan being developed. FHIR requires that CarePlan includes a subject.<br/>
2) telecom is of type ContactPoint which contains elements to populate for the phone number.<br/>
3) system is required if value is provided, and can be: phone, fax, email, pager, url, sms, or other.<br/>
4) Per FHIR, phone # should be formatted according to ITU-T E.123, so "(555) 675 5745" or "+22 555 675 5745".</td>
    </tr>
    <tr>
      <td>Beneficiary Demographics</td>
      <td>Emergency Backup Plan</td>
      <td>Description of how to address unforeseen events, emergency health events, emergency events, problems with medical equipment and supplies, and unavailable staffing situations for critical services that put the person's health and safety at risk.<br/>
<br/>
This can be included as free text or attachment.</td>
      <td>CarePlan [emergency backup plan]<br/>
         &#8594; subject(Patient)<br/>
CarePlan [emergency backup plan]<br/>
         &#8594; description<br/>
CarePlan [emergency backup plan]<br/>
         &#8594; partOf(CarePlan) ["main" Care Plan]<br/></td>
      <td>CarePlan<br/>
...subject(Patient) 1<br/>
...description 0..1<br/>
...part of(CarePlan) 0..*<br/>
</td>
      <td>1) The CarePlan resource containing the emergency backup plan refers to the "main" CarePlan resource, rather than the other way around, by using the emergency backup plan CarePlan &#8594; partOf data element to reference the "main" CarePlan data element.<br/>
2) FHIR requires that CarePlan includes a subject.<br/>
3) description contains the text of the Emergency Backup Plan if provided as text.<br/>
4) type indicates the kind of document, but the documented preferred LOINC value set does not include anything corresponding to an emergency backup plan. Therefore we can use the Codeable Concept's text data element to indicate "Emergency Backup Plan". (type is mandatory in FHIR 3.0.1, but optional in the R4 draft.)<br/></td>
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
      <td>Person Setting Choice Indicator</td>
      <td>Indicator that reflects the setting in which the person resides is chosen by the individual.</td>
      <td>CarePlan &#8594; supportingInfo(Questionnaire)<br/>
<br/>
Questionnaire &#8594; item &#8594; linkID<br/>
Questionnaire &#8594; item &#8594; text<br/>
Questionnaire &#8594; item &#8594; type<br/>
------------------------------------------<br/>
QuestionnaireResponse<br/>
         &#8594; questionnaire(Questionnaire)<br/>
QuestionnaireResponse &#8594; item &#8594; linkID<br/>
QuestionnaireResponse &#8594; item &#8594; answer<br/>
         &#8594; valueBoolean<br/></td>
      <td>CarePlan<br/>
...supportingInfo(Questionnaire) 0..*<br/>
......item 0..*<br/>
.........linkID 1<br/>
.........text 0..1<br/>
.........type 1<br/>
------------------------<br/>
QuestionnaireResponse<br/>
...questionnaire(Questionnaire) 0..1<br/>
...item 0..*<br/>
......linkID 1<br/>
......answer 0..*<br/>
.........valueBoolean 0..1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Questionnaire for the care plan being developed.<br/>
2) QuestionnaireResponse references the Questionnaire.<br/>
3) QuestionnaireResponse and Questionnaire both include one or more item elements, where each item documents a question or answer to a question.<br/>
4) item includes a mandatory linkID used to link the response to the question it applies to.<br/>
5) valueBoolean is the actual response to the question.<br/>
6) text is the actual text of the question in the Questionnaire.<br/>
7) type is required by FHIR and indicates what kind of question this is. Values must come from the QuestionnaireItemType value set which includes: group, display, boolean, decimal, integer, date, dateTime, etc. The value "boolean" would apply here. Boolean "true" would indicate "yes".</td>
    </tr>
    <tr>
      <td>Person Centered Planning</td>
      <td>Person Setting Choice Options</td>
      <td>The alternative home and community-based settings that were considered by the individual. </td>
      <td>CarePlan &#8594; supportingInfo(Questionnaire)<br/>
<br/>
Questionnaire &#8594; item &#8594; linkID<br/>
Questionnaire &#8594; item &#8594; text<br/>
Questionnaire &#8594; item &#8594; type<br/>
------------------------------------------<br/>
QuestionnaireResponse<br/>
         &#8594; questionnaire(Questionnaire)<br/>
QuestionnaireResponse &#8594; item &#8594; linkID<br/>
QuestionnaireResponse &#8594; item &#8594; answer<br/>
         &#8594; valueString<br/></td>
      <td>CarePlan<br/>
...supportingInfo(Questionnaire) 0..*<br/>
......item 0..*<br/>
.........linkID 1<br/>
.........text 0..1<br/>
.........type 1<br/>
------------------------<br/>
QuestionnaireResponse<br/>
...questionnaire(Questionnaire) 0..1<br/>
...item 0..*<br/>
......linkID 1<br/>
......answer 0..*<br/>
.........valueString 0..1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Questionnaire for the care plan being developed.<br/>
2) QuestionnaireResponse references the Questionnaire.<br/>
3) QuestionnaireResponse and Questionnaire both include one or more item elements, where each item documents a question or answer to a question.<br/>
4) item includes a mandatory linkID used to link the response to the question it applies to.<br/>
5) valueString is the actual text of the response to a question.<br/>
6) text is the actual text of the question in the Questionnaire.<br/>
7) type is required by FHIR and indicates what kind of question this is. Values must come from the QuestionnaireItemType value set which includes: group, display, boolean, decimal, integer, date, dateTime, etc. The values "string" (for a few words or short sentence) or "text" (potentially multi-paragraph) would apply here.</td>
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
      <td>Person Centered Planning</td>
      <td>Service Options Given Indicator</td>
      <td>States whether or not the person was given a choice of services outlined in the plan.</td>
      <td>CarePlan &#8594; supportingInfo(Questionnaire)<br/>
<br/>
Questionnaire &#8594; item &#8594; linkID<br/>
Questionnaire &#8594; item &#8594; text<br/>
Questionnaire &#8594; item &#8594; type<br/>
------------------------------------------<br/>
QuestionnaireResponse<br/>
         &#8594; questionnaire(Questionnaire)<br/>
QuestionnaireResponse &#8594; item &#8594; linkID<br/>
QuestionnaireResponse &#8594; item &#8594; answer<br/>
         &#8594; valueBoolean<br/></td>
      <td>CarePlan<br/>
...supportingInfo(Questionnaire) 0..*<br/>
......item 0..*<br/>
.........linkID 1<br/>
.........text 0..1<br/>
.........type 1<br/>
------------------------<br/>
QuestionnaireResponse<br/>
...questionnaire(Questionnaire) 0..1<br/>
...item 0..*<br/>
......linkID 1<br/>
......answer 0..*<br/>
.........valueBoolean 0..1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Questionnaire for the care plan being developed.<br/>
2) QuestionnaireResponse references the Questionnaire.<br/>
3) QuestionnaireResponse and Questionnaire both include one or more item elements, where each item documents a question or answer to a question.<br/>
4) item includes a mandatory linkID used to link the response to the question it applies to.<br/>
5) valueBoolean is the actual response to the question.<br/>
6) text is the actual text of the question in the Questionnaire.<br/>
7) type is required by FHIR and indicates what kind of question this is. Values must come from the QuestionnaireItemType value set which includes: group, display, boolean, decimal, integer, date, dateTime, etc. The value "boolean" would apply here. Boolean "true" would indicate "yes".</td>
    </tr>
    <tr>
      <td>Person Centered Planning</td>
      <td>Service Selection Indicator</td>
      <td>States whether or not the person participated in the selection of the services outlined in the plan.</td>
      <td>CarePlan &#8594; supportingInfo(Questionnaire)<br/>
<br/>
Questionnaire &#8594; item &#8594; linkID<br/>
Questionnaire &#8594; item &#8594; text<br/>
Questionnaire &#8594; item &#8594; type<br/>
------------------------------------------<br/>
QuestionnaireResponse<br/>
         &#8594; questionnaire(Questionnaire)<br/>
QuestionnaireResponse &#8594; item &#8594; linkID<br/>
QuestionnaireResponse &#8594; item &#8594; answer<br/>
         &#8594; valueBoolean<br/></td>
      <td>CarePlan<br/>
...supportingInfo(Questionnaire) 0..*<br/>
......item 0..*<br/>
.........linkID 1<br/>
.........text 0..1<br/>
.........type 1<br/>
------------------------<br/>
QuestionnaireResponse<br/>
...questionnaire(Questionnaire) 0..1<br/>
...item 0..*<br/>
......linkID 1<br/>
......answer 0..*<br/>
.........valueBoolean 0..1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Questionnaire for the care plan being developed.<br/>
2) QuestionnaireResponse references the Questionnaire.<br/>
3) QuestionnaireResponse and Questionnaire both include one or more item elements, where each item documents a question or answer to a question.<br/>
4) item includes a mandatory linkID used to link the response to the question it applies to.<br/>
5) valueBoolean is the actual response to the question.<br/>
6) text is the actual text of the question in the Questionnaire.<br/>
7) type is required by FHIR and indicates what kind of question this is. Values must come from the QuestionnaireItemType value set which includes: group, display, boolean, decimal, integer, date, dateTime, etc. The value "boolean" would apply here. Boolean "true" would indicate "yes".</td>
    </tr>
    <tr>
      <td>Person Centered Planning</td>
      <td>Service Plan Agreement Indicator</td>
      <td>States whether or not the person agrees to the services outlined in the plan.</td>
      <td>CarePlan &#8594; supportingInfo(Questionnaire)<br/>
<br/>
Questionnaire &#8594; item &#8594; linkID<br/>
Questionnaire &#8594; item &#8594; text<br/>
Questionnaire &#8594; item &#8594; type<br/>
------------------------------------------<br/>
QuestionnaireResponse<br/>
         &#8594; questionnaire(Questionnaire)<br/>
QuestionnaireResponse &#8594; item &#8594; linkID<br/>
QuestionnaireResponse &#8594; item &#8594; answer<br/>
         &#8594; valueBoolean<br/></td>
      <td>CarePlan<br/>
...supportingInfo(Questionnaire) 0..*<br/>
......item 0..*<br/>
.........linkID 1<br/>
.........text 0..1<br/>
.........type 1<br/>
------------------------<br/>
QuestionnaireResponse<br/>
...questionnaire(Questionnaire) 0..1<br/>
...item 0..*<br/>
......linkID 1<br/>
......answer 0..*<br/>
.........valueBoolean 0..1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Questionnaire for the care plan being developed.<br/>
2) QuestionnaireResponse references the Questionnaire.<br/>
3) QuestionnaireResponse and Questionnaire both include one or more item elements, where each item documents a question or answer to a question.<br/>
4) item includes a mandatory linkID used to link the response to the question it applies to.<br/>
5) valueBoolean is the actual response to the question.<br/>
6) text is the actual text of the question in the Questionnaire.<br/>
7) type is required by FHIR and indicates what kind of question this is. Values must come from the QuestionnaireItemType value set which includes: group, display, boolean, decimal, integer, date, dateTime, etc. The value "boolean" would apply here. Boolean "true" would indicate "yes".</td>
    </tr>
    <tr>
      <td>Person Centered Planning</td>
      <td>Service Provider Options Given Indicator</td>
      <td>States whether or not the person was offered a choice of providers for each service.</td>
      <td>CarePlan &#8594; supportingInfo(Questionnaire)<br/>
<br/>
Questionnaire &#8594; item &#8594; linkID<br/>
Questionnaire &#8594; item &#8594; text<br/>
Questionnaire &#8594; item &#8594; type<br/>
------------------------------------------<br/>
QuestionnaireResponse<br/>
         &#8594; questionnaire(Questionnaire)<br/>
QuestionnaireResponse &#8594; item &#8594; linkID<br/>
QuestionnaireResponse &#8594; item &#8594; answer<br/>
         &#8594; valueBoolean<br/></td>
      <td>CarePlan<br/>
...supportingInfo(Questionnaire) 0..*<br/>
......item 0..*<br/>
.........linkID 1<br/>
.........text 0..1<br/>
.........type 1<br/>
------------------------<br/>
QuestionnaireResponse<br/>
...questionnaire(Questionnaire) 0..1<br/>
...item 0..*<br/>
......linkID 1<br/>
......answer 0..*<br/>
.........valueBoolean 0..1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Questionnaire for the care plan being developed.<br/>
2) QuestionnaireResponse references the Questionnaire.<br/>
3) QuestionnaireResponse and Questionnaire both include one or more item elements, where each item documents a question or answer to a question.<br/>
4) item includes a mandatory linkID used to link the response to the question it applies to.<br/>
5) valueBoolean is the actual response to the question.<br/>
6) text is the actual text of the question in the Questionnaire.<br/>
7) type is required by FHIR and indicates what kind of question this is. Values must come from the QuestionnaireItemType value set which includes: group, display, boolean, decimal, integer, date, dateTime, etc. The value "boolean" would apply here. Boolean "true" would indicate "yes".</td>
    </tr>
    <tr>
      <td>Person Centered Planning</td>
      <td>Service Provider Selection Agreement Indicator</td>
      <td>States whether or not the person feels he/she made an informed choice in selecting the provider for each service.</td>
      <td>CarePlan &#8594; supportingInfo(Questionnaire)<br/>
<br/>
Questionnaire &#8594; item &#8594; linkID<br/>
Questionnaire &#8594; item &#8594; text<br/>
Questionnaire &#8594; item &#8594; type<br/>
------------------------------------------<br/>
QuestionnaireResponse<br/>
         &#8594; questionnaire(Questionnaire)<br/>
QuestionnaireResponse &#8594; item &#8594; linkID<br/>
QuestionnaireResponse &#8594; item &#8594; answer<br/>
         &#8594; valueBoolean<br/></td>
      <td>CarePlan<br/>
...supportingInfo(Questionnaire) 0..*<br/>
......item 0..*<br/>
.........linkID 1<br/>
.........text 0..1<br/>
.........type 1<br/>
------------------------<br/>
QuestionnaireResponse<br/>
...questionnaire(Questionnaire) 0..1<br/>
...item 0..*<br/>
......linkID 1<br/>
......answer 0..*<br/>
.........valueBoolean 0..1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Questionnaire for the care plan being developed.<br/>
2) QuestionnaireResponse references the Questionnaire.<br/>
3) QuestionnaireResponse and Questionnaire both include one or more item elements, where each item documents a question or answer to a question.<br/>
4) item includes a mandatory linkID used to link the response to the question it applies to.<br/>
5) valueBoolean is the actual response to the question.<br/>
6) text is the actual text of the question in the Questionnaire.<br/>
7) type is required by FHIR and indicates what kind of question this is. Values must come from the QuestionnaireItemType value set which includes: group, display, boolean, decimal, integer, date, dateTime, etc. The value "boolean" would apply here. Boolean "true" would indicate "yes".</td>
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
      <td>Plan Signatures</td>
      <td>Person Signature</td>
      <td>The depiction of the person's signature as proof of identity and intent for the plan.</td>
      <td>CarePlan &#8594; supportingInfo(Contract)<br/>
<br/>
Contract &#8594; signer &#8594; type<br/>
Contract &#8594; signer &#8594; signature &#8594; data<br/>
Contract &#8594; signer &#8594; signature &#8594; type<br/>
Contract &#8594; signer &#8594; signature<br/>
         &#8594; who(Practitioner | PractitionerRole |<br/>
         RelatedPerson | Patient | Device |<br/>
         Organization)</td>
      <td>CarePlan<br/>
...supportingInfo(Contract) 0..*<br/>
......signer 0..*<br/>
.........type 1<br/>
.........signature 1..*<br/>
............data 0..1<br/>
............type 1<br/>
............who(Practitioner | PractitionerRole |<br/>
            RelatedPerson | Patient | Device |<br/>
            Organization) 1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Contract containing the signatures, names, etc.<br/>
2) Can use a single Contract element to contain all signatures.<br/>
3) signer requires the signature and a type that indicates the contract signatory role.<br/>
4) FHIR includes a preferred coding for contract signatory roles, which map well to the eLTSS signatories. The primary one for the patient/beneficiary is "PAT" (patient), although implementers may use others as well. However, implementers must realize that type may be used to differentiate between the patient, service provider, planner, etc. so there need to be distinct role types utilized.<br/>
5) data is the actual signature content (XML DigSig. JWT, picture, etc.)<br/>
6) signature requires it's own type element that indicates why the entity signed the contract, and FHIR provides a preferred code list. Would probably use "1.2.840.10065.1.12.1.7" which represents "consent signature" in this case.<br/>
7) signature requires a who to indicate who signed, which can be a Patient, Organization, Practitioner, PrationerRole, RelatedPerson or Device, although in this case it would be the Patient.</td>
    </tr>
    <tr>
      <td>Plan Signatures</td>
      <td>Person Printed Name</td>
      <td>The printed or typed name of the person.</td>
      <td>CarePlan &#8594; supportingInfo(Contract)<br/>
<br/>
Contract &#8594; signer &#8594; party(Patient)</td>
      <td>CarePlan<br/>
...supportingInfo(Contract) 0..*<br/>
......signer 0..*<br/>
.........party(Patient) 1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Contract containing the signatures, names, etc.<br/>
2) In this case, party is a reference to the Patient, and Patient is already documented above to include a name.</td>
    </tr>
    <tr>
      <td>Plan Signatures</td>
      <td>Person Signature Date</td>
      <td>The date the person signed the plan.</td>
      <td>CarePlan &#8594; supportingInfo(Contract)<br/>
<br/>
Contract &#8594; signer &#8594; signature &#8594; when</td>
      <td>CarePlan<br/>
...supportingInfo(Contract) 0..*<br/>
......signer 0..*<br/>
.........signature 1..*<br/>
............when 1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Contract containing the signatures, names, etc.<br/>
2) when is required by FHIR, and indicates when the signature was created.<br/>
3) when is an instance type. An instant in time - known at least to the second and always includes a time zone. Note: This is intended for precisely observed times (typically system logs etc.), and not human-reported times - for them, use date and dateTime. instant is a more constrained dateTime.</td>
    </tr>
    <tr>
      <td>Plan Signatures</td>
      <td>Guardian / Legal Representative Signature</td>
      <td>The depiction of the guardian or legally authorized representative's signature as proof of identity and intent for the plan.</td>
      <td>CarePlan &#8594; supportingInfo(Contract)<br/>
<br/>
Contract &#8594; signer &#8594; type<br/>
Contract &#8594; signer &#8594; signature &#8594; data<br/>
Contract &#8594; signer &#8594; signature &#8594; type<br/>
Contract &#8594; signer &#8594; signature<br/>
         &#8594; who(Practitioner | PractitionerRole |<br/>
         RelatedPerson | Patient | Device |<br/>
         Organization)</td>
      <td>CarePlan<br/>
...supportingInfo(Contract) 0..*<br/>
......signer 0..*<br/>
.........type 1<br/>
.........signature 1..*<br/>
............data 0..1<br/>
............type 1<br/>
............who(Practitioner | PractitionerRole |<br/>
            RelatedPerson | Patient | Device |<br/>
            Organization) 1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Contract containing the signatures, names, etc.<br/>
2) Can use a single Contract element to contain all signatures.<br/>
3) signer requires the signature and a type that indicates the contract signatory role.<br/>
4) FHIR includes a preferred coding for contract signatory roles, which map well to the eLTSS signatories. There are multiple values that may be used depending on how states want to map. For example, the list includes: "POWATT" (power of attorney), "GUARD" (guardian), "HPOWATT" (healthcare power of attorney), etc. However, implementers must realize that type may be used to differentiate between the patient, service provider, planner, etc. so there need to be distinct role types utilized.<br/>
5) data is the signature content (XML DigSig. JWT, picture, etc.)<br/>
6) signature requires it's own type element that indicates why the entity signed the contract, and FHIR provides a preferred value set. Would probably use "1.2.840.10065.1.12.1.7" which represents "consent signature" in this case.<br/>
7) signature requires a who  to indicate who signed, which can be a Patient, Organization, Practitioner, PractitionerRole, RelatedPerson or Device although in this case it would be the RelatedPerson.</td>
    </tr>
    <tr>
      <td>Plan Signatures</td>
      <td>Guardian / Legal Representative Printed Name</td>
      <td>The printed or typed name of the guardian or legally authorized representative.</td>
      <td>CarePlan &#8594; supportingInfo(Contract)<br/>
<br/>
Contract &#8594; signer &#8594; party(RelatedPerson)</td>
      <td>CarePlan<br/>
...supportingInfo(Contract) 0..*<br/>
......signer 0..*<br/>
.........party(RelatedPerson) 1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Contract containing the signatures, names, etc.<br/>
2) In this case, party is a reference to a RelatedPerson, and RelatedPatient includes a name.</td>
    </tr>
    <tr>
      <td>Plan Signatures</td>
      <td>Guardian / Legal Representative Signature Date</td>
      <td>The date the guardian or legally authorized representative signed the plan.</td>
      <td>CarePlan &#8594; supportingInfo(Contract)<br/>
<br/>
Contract &#8594; signer &#8594; signature &#8594; when</td>
      <td>CarePlan<br/>
...supportingInfo(Contract) 0..*<br/>
......signer 0..*<br/>
.........signature 1..*<br/>
............when 1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Contract containing the signatures, names, etc.<br/>
2) when is required by FHIR, and indicates when the signature was created.<br/>
3) when is an instance type. An instant in time - known at least to the second and always includes a time zone. Note: This is intended for precisely observed times (typically system logs etc.), and not human-reported times - for them, use date and dateTime. instant is a more constrained dateTime.</td>
    </tr>
    <tr>
      <td>Plan Signatures</td>
      <td>Support Planner Signature</td>
      <td>The depiction of the support planner's signature as proof of identity and intent for the plan.</td>
      <td>CarePlan &#8594; supportingInfo(Contract)<br/>
<br/>
Contract &#8594; signer &#8594; type<br/>
Contract &#8594; signer &#8594; signature &#8594; data<br/>
Contract &#8594; signer &#8594; signature &#8594; type<br/>
Contract &#8594; signer &#8594; signature<br/>
         &#8594; who(Practitioner | PractitionerRole | Organization<br/>
         RelatedPerson | Patient |<br/>
         Organization)</td>
      <td>CarePlan<br/>
...supportingInfo(Contract) 0..*<br/>
......signer 0..*<br/>
.........type 1<br/>
.........signature 1..*<br/>
............data 0..1<br/>
............type 1<br/>
............who(Practitioner |PractitionerRole | Organization<br/>
            RelatedPerson | Patient |<br/>
            Organization) 1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Contract containing the signatures, names, etc.<br/>
2) Can use a single Contract element to contain all signatures.<br/>
3) signer requires the signature and a type that indicates the contract signatory role.<br/>
4) FHIR includes a preferred coding for contract signatory roles, which map well to the eLTSS signatories. There are multiple values that may be used depending on how states want to map. For example, the list includes "AUT" (author) which aligns with author being the support planner for other eLTSS Dataset elements. However other role types may be appropriate as well such as "GUAR" (guarantor). However, implementers must realize that type may be used to differentiate between the patient, service provider, planner, etc. so there need to be distinct role types utilized.<br/>
5) data is the actual signature content (XML DigSig. JWT, picture, etc.)<br/>
6) signature requires it's own type element that indicates why the entity signed the contract, and FHIR provides a preferred value set, in this case could use "1.2.840.10065.1.12.1.1" for "Author's Signature".<br/>
7) signature requires a who to indicate who signed, which can be a Patient, Organization, Practitioner, PractitionerRole, RelatedPerson or Device. </td>
    </tr>
    <tr>
      <td>Plan Signatures</td>
      <td>Support Planner Printed Name</td>
      <td>The printed or typed name of the support planner.</td>
      <td>CarePlan &#8594; supportingInfo(Contract)<br/>
<br/>
Contract &#8594; signer &#8594; party(Practitioner|PractitionerRole|Organization)</td>
      <td>CarePlan<br/>
...supportingInfo(Contract) 0..*<br/>
......signer 0..*<br/>
.........party(Practitioner|PractitionerRole|Organization)</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Contract containing the signatures, names, etc.<br/>
2) In this case, party is a reference to a Practitioner, PractitionerRole or Organization (for cases when the Organization of the SupportPlanner is needed), and Practitioner and Organization includes a name.<br/>
<!--Updated to reflect the resolution of Jira #23058-->
3) The values for Support Planner Name and Support Planner Printed Name would include the same information.</td>
    </tr>
    <tr>
      <td>Plan Signatures</td>
      <td>Support Planner Signature Date</td>
      <td>The date the support planner signed the plan.</td>
      <td>CarePlan &#8594; supportingInfo(Contract)<br/>
<br/>
Contract &#8594; signer &#8594; signature &#8594; when</td>
      <td>CarePlan<br/>
...supportingInfo(Contract) 0..*<br/>
......signer 0..*<br/>
.........signature 1..*<br/>
............when 1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Contract containing the signatures, names, etc.<br/>
2) when is required by FHIR, and indicates when the signature was created.<br/>
3) when is an instance type. An instant in time - known at least to the second and always includes a time zone. Note: This is intended for precisely observed times (typically system logs etc.), and not human-reported times - for them, use date and dateTime. instant is a more constrained dateTime.</td>
    </tr>
    <tr>
      <td>Plan Signatures</td>
      <td>Service Provider Signature</td>
      <td>The depiction of the service provider's signature as proof they agree to the services they will provide.</td>
      <td>CarePlan &#8594; supportingInfo(Contract)<br/>
<br/>
Contract &#8594; signer &#8594; type<br/>
Contract &#8594; signer &#8594; signature &#8594; data<br/>
Contract &#8594; signer &#8594; signature &#8594; type<br/>
Contract &#8594; signer &#8594; signature<br/>
         &#8594; who(Practitioner | PractitionerRole |<br/>
         RelatedPerson | Patient | Device |<br/>
         Organization)</td>
      <td>CarePlan<br/>
...supportingInfo(Contract) 0..*<br/>
......signer 0..*<br/>
.........type 1<br/>
.........signature 1..*<br/>
............data 0..1<br/>
............type 1<br/>
............who(Practitioner |PractitionerRole |<br/>
            RelatedPerson | Patient | Device |<br/>
            Organization) 1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Contract containing the signatures, names, etc.<br/>
2) Can use a single Contract element to contain all signatures.<br/>
3) signer requires the signature and a type that indicates the contract signatory role.<br/>
4) FHIR includes a preferred coding for contract signer roles, which map well to the eLTSS signatories. There are multiple values that may be used depending on how states want to map. The list includes "HPROV" (healthcare provider) which may be the best fit here, although others may be applicable. However, implementers must realize that type may be used to differentiate between the patient, service provider, planner, etc. so there need to be distinct role types utilized.<br/>
5) data is the actual signature content (XML DigSig. JWT, picture, etc.)<br/>
6) signature requires it's own type element that indicates why the entity signed the contract, and FHIR provides a preferred value set. In this case would probably use "1.2.840.10065.1.12.1.3" for "Co-participant's Signature".<br/>
7) signature requires a who  to indicate who signed, which can be a Patient, Organization, Practitioner, PractitionerRole, RelatedPerson or Device.</td>
    </tr>
    <tr>
      <td>Plan Signatures</td>
      <td>Service Provider Printed Name</td>
      <td>The printed or typed name of the service provider.</td>
      <td>CarePlan &#8594; supportingInfo(Contract)<br/>
<br/>
Contract &#8594; signer &#8594; party(Organization |<br/>
         Patient | Practitioner | PractitionerRole | RelatedPerson)</td>
      <td>CarePlan<br/>
...supportingInfo(Contract) 0..*<br/>
......signer 0..*<br/>
.........party(Organization | Patient |<br/>
         Practitioner | PractitionerRole | RelatedPerson) 1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Contract containing the signatures, names, etc.<br/>
2) party is a reference to an Organization, Patient, Practitioner, PractitionerRole or RelatedPerson, all of which include a name. (Patient may not make sense in the context of a service provided by a care plan, but is allowed in FHIR.)<br/>
<!--Updated to reflect resolution of Jira #23059-->
3) The values for Service Provider Name and Service Provider Printed Name would include the same information.</td>
    </tr>
    <tr>
      <td>Plan Signatures</td>
      <td>Service Provider Signature Date</td>
      <td>The date the service provider signed the plan.</td>
      <td>CarePlan &#8594; supportingInfo(Contract)<br/>
<br/>
Contract &#8594; signer &#8594; signature &#8594; when</td>
      <td>CarePlan<br/>
...supportingInfo(Contract) 0..*<br/>
......signer 0..*<br/>
.........signature 1..*<br/>
............when 1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the Contract containing the signatures, names, etc.<br/>
2) when is required by FHIR, and indicates when the signature was created.<br/>
3) when is an instance type. An instant in time - known at least to the second and always includes a time zone. Note: This is intended for precisely observed times (typically system logs etc.), and not human-reported times - for them, use date and dateTime. instant is a more constrained dateTime.</td>
    </tr>
    <tr>
      <td>Risks</td>
      <td>Identified Risk</td>
      <td>An aspect of a person's life, behavior, environmental exposure, personal characteristic, or barrier that increases the likelihood of  disease, condition,  injury to self or others, or interaction with the criminal justice system.</td>
      <td>CarePlan &#8594; supportingInfo(RiskAssessment)<br/>
<br/>
RiskAssessment &#8594; prediction &#8594; outcome<br/>
         &#8594; coding &#8594; code<br/>
RiskAssessment &#8594; prediction &#8594; outcome<br/>
         &#8594; coding &#8594; system<br/>
RiskAssessment &#8594; prediction &#8594; outcome<br/>
         &#8594; text</td>
      <td>CarePlan<br/>
...supportingInfo(RiskAssessment) 0..*<br/>
......prediction 0..*<br/>
.........outcome 0..1<br/>
............coding 0..*<br/>
...............code 0..1<br/>
...............system 0..1<br/>
............text 0..1</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the RiskAssessment containing the Identified Risk.<br/>
2) outcome is a Codeable Concept that includes a text element that can be used for the identified risk itself if no appropriate coding is available. (outcome was mandatory prior to R4 version 3.3.0.)<br/>
3) prediction describes the expected outcome for the subject, and is the "prediction" of the risk.</td>
    </tr>
    <tr>
      <td>Risks</td>
      <td>Risk Management Plan</td>
      <td>Description of planned activities to minimize identified risks that endanger the person's health and safety.<br/>
<br/>
This can be included as free text or attachment.</td>
      <td>CarePlan &#8594; supportingInfo(RiskAssessment)<br/>
<br/>
RiskAssessment &#8594; mitigation<br/>
RiskAssessment &#8594; extension(RiskAssessment Mitigation Plan)<br/>
<br/></td>
      <td>CarePlan<br/>
...supportingInfo(RiskAssessment) 0..*<br/>
......mitigation 0..1<br/>
...RiskAssessment <br/>
...extension(RiskAssessment MitigationPlan)</td>
      <td>1) Will use CarePlan &#8594; supportingInfo to reference the RiskAssessment containing the Risk Management Plan.<br/>
2) mitigation is a string and would contain the free text Risk Management Plan.<br/>
3) The new RiskAssessment -&gt; extension -&gt; RiskAssessment Mitigation Plan which is a DocumentReference resource would be used if the Risk Management Plan is being provided as an attachment rather than as text.</td>
    </tr>
    <tr>
      <td>Service Information</td>
      <td>Service Name</td>
      <td>Identifies the paid and/or non-paid service provided to a person.<br/>
Include the code and display name plus any modifiers when a coding system (e.g., Healthcare Common Procedure Coding System (HCPCS), Home Health Revenue Codes) is used.</td>
      <td>CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; code &#8594; text<br/>
ServiceRequest &#8594; code &#8594; coding &#8594; code<br/>
ServiceRequest &#8594; code &#8594; coding &#8594; system</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest) 0..1<br/>
.........code 0..1<br/>
............text 0..1<br/>
............coding 0..1<br/>
...............code 0..1<br/>
...............system 0..1</td>
      <td>1) activity is part of CarePlan, so no references are required to link the two.<br/>
2) coding &#8594; code is the "code plus any modifiers" described in the eLTSS Dataset data element definition. system identifies the code system from which the code is from. For HCPCS, the system value can be set to "https://www.cms.gov/Medicare/Coding/MedHCPCSGenInfo/".<br/>
3) text is the "display name" described in the eLTSS Dataset data element definition.<br/>
4) Note that modifiers for CPT &amp; HCPCS are appended to the code using a dash. So the entire code plus the modifier is a single string.</td>
    </tr>
    <tr>
      <td>Service Information</td>
      <td>Self-Directed Service Indicator</td>
      <td>Indicates whether the individual chose to self-direct the service.</td>
      <td>CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; extension &#8594; url<br/>
ServiceRequest &#8594; extension<br/>
         &#8594; valueCodeableConcept &#8594; text</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest) 0..1<br/>
.........extension 0..*<br/>
............url 0..1<br/>
............valueCodeableConcept 0..1<br/>
...............text 0..1</td>
      <td>1) activity is part of CarePlan, so no references are required to link the two.<br/>
2) The procedure-directedBy extension is indicated by populating the url data attribute with the value "http://hl7.org/fhir/StructureDefinition/procedure-directedBy".<br/>
3) The text data element can be populated with the value "self" to indicate that this service is self-directed. Other values could be provided to indicate that someone else is directing the service. This is in addition to populating the proper element in the Resource indicated in CarePlan.activity.reference such as Task, Observation etc to indicate who is responsible or carried out the task.</td>
    </tr>
    <tr>
      <td>Service Information</td>
      <td>Service Start Date</td>
      <td>The start date of the service being provided.</td>
      <td>CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; occurrenceTiming<br/>
         &#8594; boundsPeriod &#8594; start</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest) 0..1<br/>
.........occurrenceTiming 0..1<br/>
............boundsPeriod 0..1<br/>
...............start 0..1</td>
      <td>1) activity is part of CarePlan, so no references are required to link the two.<br/>
2) start is in dateTime format which can be date, date-time or partial date (e.g. just year or year + month).</td>
    </tr>
    <tr>
      <td>Service Information</td>
      <td>Service End Date</td>
      <td>The end date of the service being provided.</td>
      <td>CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; occurrenceTiming<br/>
         &#8594; boundsPeriod &#8594; end</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest) 0..1<br/>
.........occurrenceTiming 0..1<br/>
............boundsPeriod 0..1<br/>
...............end 0..1</td>
      <td>1) activity is part of CarePlan, so no references are required to link the two.<br/>
2) end is in dateTime format which can be date, date-time or partial date (e.g. just year or year + month).</td>
    </tr>
    <tr>
      <td>Service Information</td>
      <td>Service Delivery Address</td>
      <td>The address where service delivery will take place if service will not be provided at the person's address.</td>
      <td>CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; locationReference(Location)<br/>
<br/>
Location &#8594; address &#8594; line<br/>
Location &#8594; address &#8594; city<br/>
Location &#8594; address &#8594; district<br/>
Location &#8594; address &#8594; state<br/>
Location &#8594; address &#8594; postalCode<br/>
Location &#8594; address &#8594; text<br/>
Location &#8594; description</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest) 0..1<br/>
.........locationReference(Location) 0..*<br/>
............address 0..*<br/>
...............line 0..*<br/>
...............city 0..1<br/>
...............district 0..1<br/>
...............state 0..1<br/>
...............postalCode 0..1<br/>
...............text 0..1<br/>
............description 0..1</td>
      <td>1) activity is part of CarePlan, so no references are required to link the two.<br/>
2) text is the full (not broken out) address.<br/>
3 line includes street name, number and suffix (e.g. 123 Main St.).<br/>
4) Information such as apt #, floor &amp; room #, etc. also go into line, generally as a separate data element.<br/>
5) district covers county.<br/>
6) description can be used when the location is not a specific address, such as when support is being provided at a general location, such as someone providing assistance wherever the recipient grocery shops.</td>
    </tr>
    <tr>
      <td>Service Information</td>
      <td>Service Comment</td>
      <td>Additional information related to the service being provided. This field could capture additional information of the frequency of the service, how the person wants the service delivered and only used when the comment provides additional detail of the service not already handled by another element.</td>
      <td><br/>
CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; note &#8594; text</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest) 0..1<br/>
.........note 0..*<br/>
............text 1</td>
      <td>1) activity is part of CarePlan, so no references are required to link the two.<br/>
2) text is required by FHIR if note is provided, and is a string.</td>
    </tr>
    <tr>
      <td>Service Information</td>
      <td>Service Funding Source</td>
      <td>The source of payment for the service.</td>
      <td>CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; insurance(Coverage)<br/>
<br/>
Coverage &#8594; payor(Organization | Patient<br/>
             | RelatedPerson)<br/>
<br/>
Organization | Patient | RelatedPerson<br/>
         &#8594; name</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest)  0..1<br/>
.........insurance(Coverage) 0..*<br/>
............payor(Organization | Patient |<br/>
          RelatedPerson) 1..*<br/>
...............name 0..1</td>
      <td>1) Will use CarePlan &#8594; activity &#8594; reference to reference a ServiceRequest, and insurance to reference a Coverage resource, which must include a payor that is a person or an organization.<br/>
2) Coverage resource may be used to register "SelfPay" where an individual or organization other than an insurer is taking responsibility for payment for a portion of the health care cost.</td>
    </tr>
    <tr bgcolor="#fff2ff">
      <td>Service Information</td>
      <td>Service Unit Quantity</td>
      <td>The numerical amount of the service unit being provided for a frequency.<br/>
<br/>
This element is slated to be used in conjunction with Service Quantity Interval and Unit of Service Type elements to form a full description of how often a service is provided. For example, a service being provided 7 units per week, the Service Unit Quantity = "7". For a service being provided 8 hours a day, the Service Unit Value = "8".</td>
      <td>CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; quantityQuantity &#8594; value<br/>
ServiceRequest &#8594; quantityQuantity &#8594; unit<br/>
or<br/>
ServiceRequest &#8594; quantityRatio &#8594; numerator<br/>
         &#8594; value<br/>
ServiceRequest &#8594; quantityRatio &#8594; numerator<br/>
         &#8594; unit<br/>
ServiceRequest &#8594; quantityRatio &#8594; denominator<br/>
         &#8594; value<br/>
ServiceRequest &#8594; quantityRatio &#8594; denominator<br/>
         &#8594; unit</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest)  0..1<br/>
.........quantityQuantity 0..1<br/>
............value 0..1<br/>
............unit 0..1<br/>
.........quantityRatio 0..1<br/>
............numerator 0..1<br/>
...............value 0..1<br/>
...............unit 0..1<br/>
............denominator 0..1<br/>
...............value 0..1<br/>
...............unit 0..1</td>
      <td>1) Will use CarePlan &#8594; activity &#8594; reference to reference a ServiceRequest.<br/>
2) quantityQuantity can be used to represent simple quantities such as "1 installation" or "5 trips". quantityRatio can be used to represent quantities with intervals such as "8 hours a day" or "7 units per week". Either quantityQuantity or quantityRatio can be used, but not both for the same ServiceRequest.<br/>
3) value is a decimal, and unit is a string.<br/>
4) numerator and denominator are used to represent a quantity with an interval. For example, to represent 8 hours a day, numerator &#8594; value would be "8" and numerator &#8594; unit would be "hour", while denominator &#8594; value would be "1" and denominator &#8594; unit would be "day".<br/>
5) See the "qty-unit-interval examples" worksheet in this spreadsheet for additional details.<br/>
6) Please also consider occurrencePeriod for use when the quantity is meant to be performed within a defined, simple start and end date. E.g. For May 31,2023 to June 10, 2023 give ServicePlan.quantity of 5 [USD]/day. AND, use occurrenceTiming for timing information that fluctuates or is sufficiently complex. The recipient may need to calculate end-date, or one can use occurrenceTiming.boundsPeriod to ascribe a start and end date. E.g. Give ServicePlan.quantity 5 with unit=[USD]/day with the occuranceTiming.boundsPeriod of May 31, 2023 to June 23, 2023 on occuranceTiming.dayOfWeek = Mon and Wed at occuranceTiming.timeOfDay = 3 pm.</td>
	<td class="stu-note">Added guidance on ServiceRequest.occurrenceTiming and ServiceRequest.occurrencePeriod</td>
    </tr>
    <tr>
      <td>Service Information</td>
      <td>Unit of Service Type</td>
      <td>A named quantity in terms of which services are measured or specified, used as a standard measurement of like services. Values include: minute(s), 8 hour(s), quarter hour(s), hour(s), half day(s), full day(s), day(s), week(s), month(s), dollar(s), meal(s), mile(s), visit(s)/session(s), installation(s), none, other (free text).<br/>
<br/>
This element is slated to be used in conjunction with Service Unit Quantity interval and Service Unit Quantity elements to form a full description of how often a service is provided. For example, a service being provided 7 units per week, the Unit of Service Type = "units". For a service being provided 8 hours a day, the Unit of Service Type = "hours".</td>
      <td>see above</td>
      <td>see above</td>
      <td>see above</td>
    </tr>
    <tr>
      <td>Service Information</td>
      <td>Service Unit Quantity Interval</td>
      <td>A period of time corresponding to the quantity of service(s) indicated. Values include: per day, per week, per month, per year, one time only, other (free text).<br/>
<br/>
This element is slated to be used in conjunction with Unit of Service Type and Service Unit Quantity elements to form a full description of how often a service is provided. For example, a service being provided 7 units per week, the Service Unit Quantity Interval = "per week". For a service being provided 8 hours a day, the Service Unit Quantity Interval = "per day".</td>
      <td>see above</td>
      <td>see above</td>
      <td>see above</td>
    </tr>
    <tr>
      <td>Service Information</td>
      <td>Service Rate per Unit</td>
      <td>The rate of one unit for a service.</td>
      <td>CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; supportingInfo(Claim)<br/>
<br/>
Claim &#8594; item &#8594; unitPrice</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest)  0..1<br/>
.........supportingInfo(Claim) 0..*<br/>
............item 0..*<br/>
...............unitPrice 0..1</td>
      <td>1) Will use CarePlan &#8594; activity &#8594; reference to reference a ServiceRequest, and supportingInfo to reference a Claim.<br/>
2) item maps to a service.<br/>
3) unitPrice contains the charge or cost per point, which maps to the cost per one unit of the service.<br/>
4) unitPrice is of type Money, which is a descendant of the Quantity complex type and inherits value, unit, system, code, and comparator.<br/>
5) Workgroup in charge of ServiceRequest wants to work with the Claim workgroup to determine best approach. One potential approach is to update the scope of ClaimResponse since that reflects what has been approved rather than what is being asked for.</td>
    </tr>
    <tr>
      <td>Service Information</td>
      <td>Total Cost of Service</td>
      <td>The total cost of a service for the plan.</td>
      <td>CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; supportingInfo(Claim)<br/>
<br/>
Claim &#8594; item &#8594; net</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest)  0..1<br/>
.........supportingInfo(Claim) 0..*<br/>
............item 0..*<br/>
...............net 0..1</td>
      <td>1) Will use CarePlan &#8594; activity &#8594; reference to reference a ServiceRequest, and supportingInfo to reference a Claim.<br/>
2) item maps to a service.<br/>
3) net is the total cost of an item, which in this case is the total cost for the service.<br/>
4) net is of type Money, which is a descendant of the Quantity complex type and inherits value, unit, system, code, and comparator.<br/>
5) See above.</td>
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
    <tr>
      <td>Service Provider Information</td>
      <td>Service Provider Name</td>
      <td>The name of the entity or individual providing the service.<br/>
<br/>
For paid services use the organization/agency name, for non-paid services use the first and last name of the individual providing the service.</td>
      <td>CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; performer(Practitioner<br/>
            | PractitionerRole | Organization<br/>
            | Patient | Device | RelatedPerson<br/>
            | HealthcareService | CareTeam)<br/>
<br/>
Practitioner | PractitionerRole | CareTeam<br/>
             | Organization | Patient | Device<br/>
             | RelatedPerson | HealthcareService<br/>
         &#8594; name</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest) 0..1<br/>
.........performer(Practitioner |<br/>
         PractitionerRole | Patient |<br/>
         Device | RelatedPerson |<br/>
         HealthcareService | CareTeam) 0..*<br/>
............name 0..1<br/>
----------------------------------<br/>
.........performer(Organization) 0..*<br/>
............name 1</td>
      <td>1) Will use CarePlan &#8594; activity &#8594; reference to reference a ServiceRequest, and performer to reference a RelatedPerson, Organization or HealthcareService. Other options listed are available in FHIR, but may not be appropriate here.<br/>
2) Per eLTSS Dataset element definition, performer would reference an Organization or HealthcareService for paid services, and RelatedPerson for a non-paid service.<br/>
3) Organization &#8594; name and HealthcareService &#8594; name are strings with the organization's name.<br/>
4) RelatedPerson &#8594; name is a complex data element that includes strings for the person's surname and first name.<br/>
6) name is required by US Core for Organization.<br/>
<!--Updated to reflect resolution for Jira #23059-->
7) The values for Service Provider Name and Service Provider Printed Name would include the same information.</td>
    </tr>
    <tr>
      <td>Service Provider Information</td>
      <td>Service Provider Phone Number</td>
      <td>The primary phone number (and extension when applicable) of the service provider.</td>
      <td><br/>
CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; performer(Practitioner<br/>
            | PractitionerRole | Organization<br/>
            | Patient | Device | RelatedPerson<br/>
            | HealthcareService | CareTeam)<br/>
<br/>
Practitioner | PractitionerRole | CareTeam<br/>
             | Organization | Patient | Device<br/>
             | RelatedPerson | HealthcareService<br/>
          &#8594; telecom &#8594; system<br/>
Practitioner | PractitionerRole | CareTeam<br/>
             | Organization | Patient | Device<br/>
             | RelatedPerson | HealthcareService<br/>
         &#8594; telecom &#8594; value</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest) 0..1<br/>
.........performer(Practitioner |<br/>
         PractitionerRole | Patient |<br/>
         Device | RelatedPerson |<br/>
         HealthcareService | CareTeam) 0..*<br/>
............telecom 0..*<br/>
.............system 0..1<br/>
.............value 0..1<br/>
----------------------------------<br/>
.........performer(Organization) 0..*<br/>
............telecom 1..*<br/>
.............system 0..1<br/>
.............value 1</td>
      <td>1) Will use CarePlan &#8594; activity &#8594; reference to reference a ServiceRequest, and performer to reference a RelatedPerson, Organization or HealthcareService. Other options listed are available in FHIR, but may not be appropriate here.<br/>
2) Per eLTSS Dataset element definition, performer would reference an Organization or HealthcareService for paid services, and RelatedPerson for a non-paid service.<br/>
3) telecom is of type ContactPoint (https://www.hl7.org/fhir/datatypes.html#contactpoint) which contains elements to populate for the phone number.<br/>
4) system is required if value is provided, and can be: phone, fax, email, pager, url, sms, other.<br/>
5) Per FHIR, phone # should be formatted according to ITU-T E.123, so "(555) 675 5745" or "+22 555 675 5745".<br/>
6) US Core requires at least one contact be provided in telecom for an Organization.</td>
    </tr>
    <tr>
      <td>Service Provider Information</td>
      <td>Non-Paid Service Provider Relationship</td>
      <td>The relationship (e.g., spouse, neighbor, guardian, daughter) of the individual providing a non-paid service or support to the person.</td>
      <td>CarePlan &#8594; activity<br/>
         &#8594; reference(ServiceRequest)<br/>
<br/>
ServiceRequest &#8594; performer(RelatedPerson)<br/>
<br/>
RelatedPerson &#8594; relationship</td>
      <td>CarePlan<br/>
...activity 0..*<br/>
......reference(ServiceRequest) 0..1<br/>
.........performer(RelatedPerson) 0..*<br/>
...........relationship 0.*</td>
      <td>1) Will use CarePlan &#8594; activity &#8594; reference to reference a ServiceRequest, and performer to reference a RelatedPerson.<br/>
2) Per eLTSS Dataset element definition, performer would reference a RelatedPerson for a non-paid service.<br/>
3) relationship is a CodeableConcept, and FHIR provides a preferred value set whose values can be found in the PatientRelationshipType here: https://www.hl7.org/fhir/relatedperson.html. The list is very long and detailed, for example including not only sister, but stepsister, half-sister, twin sister, natural sister, and identical twin sister.</td>
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
    <tr>
      <td>CareTeam Status<br/>
US Core</td>
      <td>Indicates the current state of the care team.</td>
      <td>CareTeam &#8594; status</td>
      <td>CareTeam<br/>
...status 1</td>
      <td>1) status is required by US Core, and must use the CareTeamStatus value set. Possible values are: proposed, active, suspended, inactive, and entered-in-error.</td>
    </tr>
    <tr>
      <td>CareTeam Subject<br/>
US Core</td>
      <td>Who care team is for.</td>
      <td>CareTeam &#8594; subject(Patient)</td>
      <td>CareTeam<br/>
...subject 1</td>
      <td>1) US Core requires one reference to a Patient using subject.</td>
    </tr>
    <tr>
      <td>CareTeam Member<br/>
US Core</td>
      <td>Identifies all people and organizations who are expected to be involved in the care team.</td>
      <td>CareTeam &#8594; participant &#8594; member</td>
      <td>CareTeam<br/>
...participant 1..*<br/>
......member 1</td>
      <td>1) US Core requires care team members be listed in CareTeam &#8594; participant &#8594; member.<br/>
2) Note that the Plan Monitor eLTSS Dataset data element utilizes a participant &#8594; member as well, and this is documented in the eLTSS element mapping.</td>
    </tr>
    <tr>
      <td>CareTeam Participant Role<br/>
US Core</td>
      <td>Indicates specific responsibility of an individual within the care team, such as "Primary care physician", "Trained social worker counselor", "Caregiver", etc.</td>
      <td>CareTeam &#8594; participant &#8594; role</td>
      <td>CareTeam<br/>
...participant 1..*<br/>
......role 1</td>
      <td>1) US Core requires each participant in the CareTeam have a role defined in the "CareTeam Provider Role Value Set" which includes values from NUCC Health Care Provider Taxonomy Code Set for providers and SNOMED-CT for non-clinical and organization roles.<br/>
2) Note that the Plan Monitor eLTSS Dataset data element utilizes a participant role as well, and this is documented in the eLTSS element mapping.</td>
    </tr>
    <tr>
      <td>Claim Created<br/>
FHIR</td>
      <td>The date this resource was created.</td>
      <td>Claim &#8594; created</td>
      <td>Claim<br/>
...created 1</td>
      <td>1) created is required by FHIR. Could use date signers signed or agency authorized. Suggest using date/time that signers signed.</td>
    </tr>
    <tr>
      <td>Claim Insurance<br/>
FHIR</td>
      <td>Financial instruments for reimbursement for the health care products and services specified on the claim.</td>
      <td>Claim &#8594; insurance</td>
      <td>Claim<br/>
...insurance 1</td>
      <td>1) insurance is required by FHIR.</td>
    </tr>
    <tr>
      <td>Claim Insurance Sequence<br/>
FHIR</td>
      <td>A number to uniquely identify insurance entries and provide a sequence of coverages to convey coordination of benefit order.</td>
      <td>Claim &#8594; insurance &#8594; sequence</td>
      <td>Claim<br/>
...insurance 1<br/>
......sequence 1</td>
      <td>1) sequence is required by FHIR and is a positiveInt. Suggest using "1".</td>
    </tr>
    <tr>
      <td>Claim Insurance Focal<br/>
FHIR</td>
      <td>A flag to indicate that this Coverage is to be used for adjudication of this claim when set to true.</td>
      <td>Claim &#8594; insurance &#8594; focal</td>
      <td>Claim<br/>
...insurance 1<br/>
......focal 1</td>
      <td>1) focal is required by FHIR and is a boolean. Suggest using "true".</td>
    </tr>
    <tr>
      <td>Claim Insurance Coverage<br/>
FHIR</td>
      <td>Reference to the insurance card level information contained in the Coverage resource. The coverage issuing insurer will use these details to locate the patient's actual coverage within the insurer's information system.</td>
      <td>Claim &#8594; insurance &#8594; coverage</td>
      <td>Claim<br/>
...insurance 1<br/>
......coverage 1</td>
      <td>1) coverage is required by FHIR and references Coverage.</td>
    </tr>
    <tr>
      <td>Claim Item ProductOrService<br/>
FHIR</td>
      <td>When the value is a group code then this item collects a set of related claim details, otherwise this contains the product, service, drug or other billing code for the item.</td>
      <td>Claim &#8594; item &#8594; productOrService</td>
      <td>Claim<br/>
...item 0..*<br/>
......productOrService 1</td>
      <td>1) productOrService is required by FHIR and must use the USCLS Codes value set (http://hl7.org/fhir/valueset-service-uscls.html). Suggest using the value "99555" for expense.</td>
    </tr>
    <tr>
      <td>Claim Patient<br/>
FHIR</td>
      <td>The party to whom the professional services and/or products have been supplied or are being considered and for whom actual or forecast reimbursement is sought.</td>
      <td>Claim &#8594; patient</td>
      <td>Claim<br/>
...patient 1</td>
      <td>1) patient is required by FHIR and references Patient.</td>
    </tr>
    <tr>
      <td>Claim Priority<br/>
FHIR</td>
      <td>The provider-required urgency of processing the request. </td>
      <td>Claim &#8594; priority</td>
      <td>Claim<br/>
...priority 1</td>
      <td>1) priority is required by FHIR and must use the Process Priority Codes value set (http://hl7.org/fhir/valueset-process-priority.html). Possible values are: stat, normal, deferred. Suggest using "normal".</td>
    </tr>
    <tr>
      <td>Claim Provider<br/>
FHIR</td>
      <td>The provider which is responsible for the claim, predetermination or preauthorization.</td>
      <td>Claim &#8594; provider</td>
      <td>Claim<br/>
...provider 1</td>
      <td>1) provider is required by FHIR and references Practitioner, PractitionerRole, Organization. Suggest using Practitioner or Organization.</td>
    </tr>
    <tr>
      <td>Claim Status<br/>
FHIR</td>
      <td>The status of the resource instance.</td>
      <td>Claim &#8594; status</td>
      <td>Claim<br/>
...status 1</td>
      <td>1) status is required by FHIR, and must use the Financial Resource Status Codes value set (http://hl7.org/fhir/valueset-fm-status.html). Possible values are: active, cancelled, draft, entered-in-error. Suggest using "active".</td>
    </tr>
    <tr>
      <td>Claim Type<br/>
FHIR</td>
      <td>The category of claim, e.g. oral, pharmacy, vision, institutional, professional.</td>
      <td>Claim &#8594; type</td>
      <td>Claim<br/>
...type 1</td>
      <td>1) type is required by FHIR, and contains the extensible Claim Type Codes value set (http://hl7.org/fhir/valueset-claim-type.html). Possible values are: institutional, oral, pharmacy, professional, vision. Could use "professional", could extend code list, or could use text data element that is part of codeable concept. </td>
    </tr>
    <tr>
      <td>Claim Use<br/>
FHIR</td>
      <td>A code to indicate whether the nature of the request is: to request adjudication of products and services previously rendered; or requesting authorization and adjudication for provision in the future; or requesting the non-binding adjudication of the listed products and services which could be provided in the future.</td>
      <td>Claim &#8594; use</td>
      <td>Claim<br/>
...use 1</td>
      <td>1) use is required by FHIR, and must use the Use value set (http://hl7.org/fhir/valueset-claim-use.html). Possible values are: claim, preauthorization, predetermination. Suggest using "preauthorization"</td>
    </tr>
    <tr>
      <td>Claim Item Sequence<br/>
FHIR</td>
      <td>A number to uniquely identify item entries</td>
      <td>Claim &#8594; item &#8594; sequence</td>
      <td>Claim<br/>
...item 0..*<br/>
......sequence 1</td>
      <td>1) sequence is required by FHIR, and is a positive integer.</td>
    </tr>
    <tr>
      <td>Condition Verification Status<br/>
US Core</td>
      <td>The verification status to support the clinical status of the condition.</td>
      <td>Condition &#8594; verificationStatus</td>
      <td>Condition<br/>
...verificationStatus 1</td>
      <td>1) verificationStatus is required by US Core, and must use the ConditionVerificationStatus value set. Possible values are: provisional, differential, confirmed, refuted, entered-in-error, and unknown.</td>
    </tr>
    <tr>
      <td>Condition Clinical Status<br/>
US Core</td>
      <td>The clinical status of the condition.</td>
      <td>Condition &#8594; clinicalStatus</td>
      <td>Condition<br/>
...clinicalStatus 1</td>
      <td>1) clinicalStatus is required by US Core if the value of verificationStatus is not "entered-in-error". FHIR requires that the values come from the Condition Clinical Status Codes value set, which has values: active, recurrence, inactive, remission, and resolved.</td>
    </tr>
    <tr>
      <td>Condition Subject<br/>
US Core</td>
      <td> Who has the condition.</td>
      <td>Condition &#8594; subject(Patient)</td>
      <td>Condition<br/>
...subject 1</td>
      <td>1) subject is required by US Core, and is a reference to a Patient.</td>
    </tr>
    <tr>
      <td>Coverage Beneficiary<br/>
FHIR</td>
      <td>The party who benefits from the insurance coverage; the patient when products and/or services are provided.</td>
      <td>Coverage &#8594; beneficiary</td>
      <td>Coverage<br/>
...beneficiary 1</td>
      <td>1) beneficiary is required by FHIR, and is a reference to a Patient.</td>
    </tr>
    <tr>
      <td>Coverage Payor<br/>
FHIR</td>
      <td>The program or plan underwriter or payor including both insurance and non-insurance agreements, such as patient-pay agreements.</td>
      <td>Coverage &#8594; payor</td>
      <td>Coverage<br/>
...payor 1</td>
      <td>1) payor is required by FHIR, and is a reference to a Organization, Patient, RelatedPerson.</td>
    </tr>
    <tr>
      <td>Coverage Status<br/>
FHIR</td>
      <td>The status of the resource instance.</td>
      <td>Coverage &#8594; status</td>
      <td>Coverage<br/>
...status 1</td>
      <td>1) status is required by FHIR and must use the Financial Resource Status Codes (http://hl7.org/fhir/valueset-fm-status.html). Values include: active, cancelled, draft, entered-in-error. Suggest using active.</td>
    </tr>
    <tr>
      <td>DocumentReference Status<br/>
FHIR</td>
      <td>The status of this document reference.</td>
      <td>DocumentReference &#8594; status</td>
      <td>DocumentReference<br/>
...status 1</td>
      <td>1) status is required by FHIR and must use the DocumentReferenceStatus value set. Possible values are: current, superseded, and entered-in-error.</td>
    </tr>
    <tr>
      <td>Encounter<br/>
Status<br/>
FHIR</td>
      <td>Indicates the status of the encounter.</td>
      <td>Encounter &#8594; status</td>
      <td>Encounter<br/>
...status 1</td>
      <td>1) status is required by FHIR, and must use the EncounterStatus value set. Possible values are: planned, arrived, triaged, in-progress, onleave, finished, cancelled, entered-in-error, and unknown.</td>
    </tr>
    <tr>
      <td>Encounter<br/>
Class<br/>
FHIR</td>
      <td>Indicates the classification of patient encounter.</td>
      <td>Encounter &#8594; class &#8594; code</td>
      <td>Encounter<br/>
...class 1<br/>
......code 0..1</td>
      <td>1) class is required by FHIR, and is defined to use the extensible V3 Value SetActEncounterCode value set. Possible values are: ambulatory, emergency, field, home health, inpatient encounter, inpatient acute,  inpatient non-acute, observation encounter, pre-admission, short stay, and virtual. </td>
    </tr>
    <tr>
      <td>Encounter Type <br/> FHIR</td>
      <td>Specific type of encounter (e.g. e-mail consultation, surgical day-care, skilled nursing, rehabilitation).</td>
      <td>Encounter -&gt; type</td>
      <td>Encounter<br/>...type 1</td>
      <td>1) type is required by US Core and codes SHALL be taken from US Core Encounter Type; other codes may be used where these codes are not suitable. </td>
    </tr>
    <tr>
      <td>EpisodeOfCare Status<br/>
FHIR</td>
      <td>Indicates the status of the episode of care.</td>
      <td>EpisodeOfCare &#8594; status</td>
      <td>EpisodeOfCare<br/>
...status 0..1</td>
      <td>1) status is required by FHIR, and must use the EpisodeOfCareStatus value set. Possible values are: planned, waitlist, active, onhold, finished, and cancelled.</td>
    </tr>
    <tr>
      <td>EpisodeOfCare Patient<br/>
FHIR</td>
      <td>The patient who is the focus of this episode of care.</td>
      <td>EpisodeOfCare &#8594; patient(Patient)</td>
      <td>EpisodeOfCare<br/>
...patient 0..1</td>
      <td>1) patient is required by FHIR, and is a reference to a Patient.</td>
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
    <tr>
      <td>Location Name<br/>
US Core</td>
      <td>Name of the location as used by humans. Does not need to be unique.</td>
      <td>Location &#8594; name</td>
      <td>Location<br/>
...name 1</td>
      <td>1) US Core requires a name for the Location.</td>
    </tr>
    <tr>
      <td>Observation Status<br/>
FHIR</td>
      <td>The status of the result value.</td>
      <td>Observation &#8594; status</td>
      <td>Observation<br/>
...status 1</td>
      <td>1) status is required by FHIR, and the values are: final, preliminary, registered, cancelled, amended, corrected, entered-in-error, and unknown.</td>
    </tr>
    <tr>
      <td>Organization Identifier<br/>
US Core</td>
      <td> Identifier for the organization that is used to identify the organization across multiple disparate systems.</td>
      <td>Organization &#8594; identifier</td>
      <td>Organization<br/>
...identifier 1..*</td>
      <td>1) At least one identifier is required by US Core. NPI is preferred. Tax id is allowed. Local id is allowed in addition to 'authoritative' identifier.</td>
    </tr>
    <tr>
      <td>Organization Active Indicator<br/>
US Core</td>
      <td>Whether the organization's record is still in active use.</td>
      <td>Organization &#8594; active</td>
      <td>Organization<br/>
...active 1</td>
      <td>1) US Core requires one boolean value in active.</td>
    </tr>
    <tr>
      <td>Organization Address<br/>
US Core</td>
      <td>An address for the organization.</td>
      <td>Organization &#8594; address</td>
      <td>Organization<br/>
...address 1..*</td>
      <td>1) US Core requires at least one address. The contents of address are not specified by US Core. </td>
    </tr>
    <tr>
      <td>Patient Administrative Gender<br/>
US Core</td>
      <td>The gender that the patient is considered to have for administration and record keeping purposes.</td>
      <td>Patient &#8594; gender</td>
      <td>Patient<br/>
...gender 1</td>
      <td>1) gender is required by US Core and must use the AdministrativeGender value set. Possible values are: male, female, other, and unknown.</td>
    </tr>
    <tr>
      <td>Practitioner Identifier<br/>
US Core</td>
      <td>An identifier that applies to this person in this role.</td>
      <td>Practitioner &#8594; identifier</td>
      <td>Practitioner<br/>
...identifier 1..*</td>
      <td>1) At least one identifier is required by US Core. NPI is preferred. Tax id is allowed. Local id is allowed in addition to 'authoritative' identifier.</td>
    </tr>
    <tr>
      <td>Practitioner Name<br/>
US Core</td>
      <td>The name(s) associated with the practitioner.</td>
      <td>Practitioner &#8594; name</td>
      <td>Practitioner<br/>
...name 1</td>
      <td>1) US Core requires one name for a Practitioner.</td>
    </tr>
    <tr>
      <td>QuestionnaireResponse Status<br/>
FHIR</td>
      <td>The position of the questionnaire response within its overall lifecycle.</td>
      <td>QuestionnaireResponse &#8594; status</td>
      <td>QuestionnaireResponse<br/>
...status 1</td>
      <td>1) status is required by FHIR and must use the QuestionnaireResponseStatus value set. Possible values are: in-progress, completed, amended, entered-in-error, and stopped.</td>
    </tr>
    <tr>
      <td>Questionnaire Status<br/>
FHIR</td>
      <td>The status of this questionnaire. Enables tracking the life-cycle of the content.</td>
      <td>Questionnaire &#8594; status</td>
      <td>Questionnaire<br/>
...status 1</td>
      <td>1) status is required by FHIR and must use the PublicationStatus value set. Possible values are: draft, active, retired, and unknown.</td>
    </tr>
    <tr>
      <td>RelatedPerson Patient<br/>
FHIR</td>
      <td>The patient this person is related to.</td>
      <td>RelatedPerson &#8594; patient(Patient)</td>
      <td>RelatedPerson<br/>
...patient 1</td>
      <td>1) patient is required by FHIR.</td>
    </tr>
    <tr>
      <td>RiskAssessment Status<br/>
FHIR</td>
      <td>The status of the RiskAssessment, using the same statuses as an Observation.</td>
      <td>RiskAssessment &#8594; status</td>
      <td>RiskAssessment<br/>
...status 1</td>
      <td>1) status is required by FHIR, and must use the ObservationStatus value set. Possible values are: registered, preliminary, final, amended, corrected, cancelled, entered-in-error and unknown.</td>
    </tr>
    <tr>
      <td>RiskAssessment Subject<br/>
FHIR</td>
      <td>Identifies the patient, group or organization for whom the goal is being established.</td>
      <td>RiskAssessment &#8594; subject(Patient)</td>
      <td>RiskAssessment<br/>
...subject 1</td>
      <td>1) subject is required by FHIR, and is a reference to a Patient. (Optional prior to R4 version 3.4.0.)</td>
    </tr>
    <tr>
      <td>ServiceRequest Intent<br/>
FHIR</td>
      <td>Whether the request is a proposal, plan, an original order or a reflex order.</td>
      <td>ServiceRequest &#8594; intent</td>
      <td>ServiceRequest<br/>
...intent 1</td>
      <td>1) intent is required by FHIR, and must use the RequestIntent value set. Possible values are: proposal, plan, order, original-order, reflex-order, filler-order, instance-order and option.</td>
    </tr>
    <tr>
      <td>ServiceRequest Status<br/>
FHIR</td>
      <td>The status of the request.</td>
      <td>ServiceRequest &#8594; status</td>
      <td>ServiceRequest<br/>
...status 0..1</td>
      <td>1) status is required by FHIR, and must use the RequestStatus value set which has values: draft, active, suspended, completed, entered-in-error, and cancelled.</td>
    </tr>
    <tr>
      <td>ServiceRequest Subject<br/>
FHIR</td>
      <td>On whom or what the service is to be performed.</td>
      <td>ServiceRequest &#8594; subject(Patient)</td>
      <td>ServiceRequest<br/>
...subject 0..1</td>
      <td>1) subject is required by FHIR, and is a reference to a Patient.</td>
    </tr>
    <tr>
      <td/>
      <td/>
      <td/>
      <td/>
      <td/>
    </tr>
  </table>









A Care Plan is a consensus-driven dynamic plan that represents a patient’s and Care Team Members’ prioritized concerns, goals, and planned interventions. It serves as a blueprint shared by all Care Team Members (including the patient, their caregivers, and providers), to guide the patient’s care. A Care Plan integrates multiple interventions proposed by multiple providers and disciplines for multiple conditions. A Care Plan may represent one or more Care Plans and serves to reconcile and resolve conflicts between the various plans developed for a specific patient by different providers. It supports the following use cases:
 
* Query for patient data across providers and compile into a consolidated care plan representation.
* Encourage capture of and communication of a patient's health concerns and related goals, interventions, and outcomes.
* Gather and aggregate patient data for uses beyond the point of care (e.g. public health, population health, quality measurement, risk adjustment, quality improvement, and research.)

### Standards Supported Care Planning and Coordination Process

The vision of this implementation guide (IG), with the FHIR Care Plan profile as its framework,  is to define a profile on the FHIR Care Plan resource that describes how it can be implemented and leveraged to support machine assisted care coordination between systems. It is assumed that clinician and patient facing SMART on FHIR Apps can be designed off of this guide to achieve that goal. The IG will also inform EHR systems on how to implement a structured encoded Care Plan.

The dynamic care plan process diagram shows Care Plan Cornerstones as they exist within the clinical world and elements and attributes from the FHIR Care Plan resource structure that support the process. In order to encourage reuse and dynamic, machine assisted care coordination, the Care Plan profile design leverages referrencing profiles wherever possible, especially within CarePlan.Activity. 

#### High Level Dynamic Care Plan Process Diagram
<table><tr><td><img src="CarePlanProcessCornerstones.png" /></td></tr></table>

This profile on the [FHIR Care Plan Resource](http://hl7.org/fhir/R4/careplan.html) describes rules and contraints to record, search, and fetch care plan data associated with a patient with multiple chronic conditions. It identifies which profiles, core elements, extensions, vocabularies and value sets **SHALL** be present in the resource when using this profile. Care plan data may or may not be tagged in an EHR as part of a care plan, but is also useful to retrieve data such as goals, problems, medications etc. and their time stamps from EHRs and other health system records to bring into an aggegated plan. This includes care plans that may be authored by a patient.


#### Multiple Chronic Condition FHIR Care Plan Profile Relationship Diagram
<table><tr><td><img width="975px" height="975px" src="carePlanProfileRelationshipDiagram.svg" /></td></tr></table>

### Supporting Machine Assisted Dynamic Care Coordination/Planning with the FHIR Care Plan Resource and FHIR Goal Resource

The machine assisted dynamic care planning/coordination is supported in FHIR by leveraging together the Care Plan resource, the Goal resource, resource referencing and available extensions within those resources to “link together the health concern or problem, and it’s associated goals, interventions and outcomes. The intention is to re-use data entered in the EHR, whether it is in a Care Plan Application, or elsewhere in the EHR or other information system, rather than having a care plan be a double documentation burden. For example, if a procedure is ordered and performed and the health concern or problem reason for that procedure is asserted in the ordering workflow or documentation workflow - this information can be pulled into the Care Plan. If a goal is asserted for a patient outside of a care plan, along with the reason for that goal, this also can be pulled into a care plan. The Care Plan profile relies on referencing of profiles rather than “in-line” representation or documentation to enable a dynamic workflow and to be able to pull in and aggregate care coordination activities from disparate systems to provide a comprehensive care coordination view for patients

CarePlan.Activity" is a Backbone element.
It identifies an action that has occurred or is a planned action to occur as part of the plan. 
For example, a medication to be used, lab tests to perform, self-monitoring that has occurred, education etc., within which in R4 can be OutcomeCodeableConcept, OutcomeReference, Progress Note when using activity.reference. 
		
OUTCOME REFERENCE (aka PERFORMED ACTIVITY reference): to be renamed in R5 to "CarePlan.performedActivity". Please see https://jira.hl7.org/browse/FHIR-26064.) OutcomeReference is not only an outcome but rather an action such as Procedure or an Encounter that was made or occurred or an Observation. Within CarePlan.performedActivity, the extension, "resource-pertainsToGoal" **SHALL** be used to reference this activity's related goal. Within the resource referenced within performedActivity, "Procedure.reason" **SHALL** be used to reference the health concern or problem for which the activity is done.

ACTIVITY REFERENCE (aka PLANNED ACTIVITY reference): to be renamed in R5 to "PlannedActivityReference". Please see https://jira.hl7.org/browse/FHIR-26064.) Within plannedActivityReference, the extension, "resource-pertainsToGoal" **SHALL** be used to reference this activity's request's related goal. "xxx.Request.reason" **SHALL** be used to reference the health concern or problem for which the activity is done. Within the referenced Goal resource, goal.address **SHALL** be used to reference the goal's related Condition, Observation, MedicationStatement, NutritionOrder, ServiceRequest or RiskAssessment. Within the referenced Goal resource, Goal.outcomeReference, references the outcome (e.g observations related to the goal).


**Health Concerns** represented with:

 - CarePlan.addresses
 - CarePlan.suppportingInfo
 - CarePlan.addresses (from within referenced goal)
 - Goal.addresses
 - activity.reason.reference

**Goals** represented with:
 - CarePlan.goal (for entire plan)
 - resource-pertainsToGoal
 - CarePlan.activity.outcomeReference.MCC Goal Profile

**Interventions** represented with:

 - CarePlan.plannedActivityReference (aka activity.reference)
 - CarePlan.performedActivityReference (aka activity.outcome.reference)

**Outcomes** represented with:

 - CarePlan.ActivityOutcome
 - Goal.outcome.reference

#### Instanciated FHIR Supported Dynamic Care Planning and Coordination
<table><tr><td><img src="InstanciatedFHIRSuppportedDynamicCarePlanning.png" /></td></tr></table>