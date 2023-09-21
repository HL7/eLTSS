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
  </table>

