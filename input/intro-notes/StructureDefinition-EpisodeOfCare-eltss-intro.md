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
  </table>
