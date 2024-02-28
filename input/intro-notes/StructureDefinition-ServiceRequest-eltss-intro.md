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
6) Please also consider occurrencePeriod for use when the quantity is meant to be performed within a defined, simple start and end date. E.g. For May 31,2023 to June 10, 2023 give ServiceRequest.quantityRatio of 5 USD per day. AND, use occurrenceTiming for timing information that fluctuates or is sufficiently complex. The recipient may need to calculate end-date, or one can use occurrenceTiming.boundsPeriod to ascribe a start and end date. E.g. Give ServiceRequest.quantityRatio of 5 USD per day. with the occurrenceTiming.boundsPeriod of May 31, 2023 to June 23, 2023 on occurrenceTiming.dayOfWeek = Mon and Wed at occurrenceTiming.timeOfDay = 3 pm.</td>
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
