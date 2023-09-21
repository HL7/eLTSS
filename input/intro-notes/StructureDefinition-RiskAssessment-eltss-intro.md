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

  </table>
