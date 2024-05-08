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
	  <!--th class="stu-note">Important change</th-->
    </tr>	
	
	
	<tr >
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
2) code is required by US Core and is a CodeableConcept which per US Core is bound to the extensible Problem Value Set. That value set is based on SNOMED-CT and includes very specific values that do not line up with assessed needs. Per US Core's documentation on extensible CodeableConcepts, the CodeableConcept's text element can be used "if no suitable codes exist", so we can use the text element for the assessed need. Additionally, the Gravity SDOH FHIR IG has a value set of SDOH conditions.<br/>
3) Each assessed need should go into a separate Condition element so each can potentially be linked to a service(s) that addresses it.<br/>
4) Category is required by US Core and is a CodeableConcept which per US Core is bound to the extensible US Core Condition Category Codes value set (http://hl7.org/fhir/ValueSet/condition-category) which has values: problem-list-item, encounter-diagnosis and health-concern. The additional 'assessed-need' code can be used to relate that the Condition instance is about the clinical and/or community-based necessity or desire, as identified through an assessment, that should be addressed by a service. Consider also using the US Core 6.1.0 screening-assessment categories  https://www.hl7.org/fhir/us/core/ValueSet-us-core-screening-assessment-condition-category.html.<br/>
5) An "assessed need" condition can refer to another condition via the condition-dueTo extension.</td>
      <!--td class="stu-note">Now using US CORE Condition Category value set element "Health Concern"</td-->
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
  </table>