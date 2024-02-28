#### Requesting and Recording payment for Task, Procedure or ServiceRequest
An important step in eLTSS is payment for services. The following highlights basic CORE FHIR associations that can be used, should business requirements request it.

A Claim FHIR Resource provides costing information, this can be a "claim" or "preauthorization" or "predetermination" (indicated with Claim.use).  The claim should be connected to the ServiceRequest with the Claim.referral referencing the ServiceRequest instance. As mentioned, the Procedure Resource can be used to communicate work performed if the business requirements need it. The Procedure can be connected to a Claim using Claim.procedure.procedureReference. Any Task records can be included by referencing using Claim.supportingInfo.

If business rules require it, the FHIR ClaimResponse Resource can be used "to provide the results of the adjudication and/or authorization of a set of healthcare-related products and services for a patient against the patient's insurance coverages, or to respond with what the adjudication would be for a supplied set of products or services should they be actually supplied to the patient." see [FHIR R4 ClaimResponse Resource](https://hl7.org/fhir/R4/claimresponse.html#bnr) In other words, the ClaimResponse Resource is used to respond to a FHIR Claim data instance. The ClaimResponse would detail the actual monies that could or would be paid. 

A final consideration is the use of ClaimResponse.net and Claim.net. They both detail the total cost. Using the total cost and the FHIR ServiceRequest (or FHIR Procedure) frequency and quantity information a system could theoretically calculate the hourly rate for a service requested or approved. This might be less ambiguous and more convenient than requesting entry of the cost per unit.

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
  </table>
