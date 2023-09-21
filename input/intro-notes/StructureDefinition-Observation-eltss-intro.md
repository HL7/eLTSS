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
      <td>Observation Status<br/>
FHIR</td>
      <td>The status of the result value.</td>
      <td>Observation &#8594; status</td>
      <td>Observation<br/>
...status 1</td>
      <td>1) status is required by FHIR, and the values are: final, preliminary, registered, cancelled, amended, corrected, entered-in-error, and unknown.</td>
    </tr>

  </table>