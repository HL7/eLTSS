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
  </table>
