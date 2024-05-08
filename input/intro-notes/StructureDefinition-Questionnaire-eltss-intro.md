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
  </table>
