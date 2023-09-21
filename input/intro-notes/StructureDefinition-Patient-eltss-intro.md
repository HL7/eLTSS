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
      <td>Patient Administrative Gender<br/>
US Core</td>
      <td>The gender that the patient is considered to have for administration and record keeping purposes.</td>
      <td>Patient &#8594; gender</td>
      <td>Patient<br/>
...gender 1</td>
      <td>1) gender is required by US Core and must use the AdministrativeGender value set. Possible values are: male, female, other, and unknown.</td>
    </tr>

  </table>