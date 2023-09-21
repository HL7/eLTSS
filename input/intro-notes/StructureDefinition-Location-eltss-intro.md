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
      <td>Location Name<br/>
US Core</td>
      <td>Name of the location as used by humans. Does not need to be unique.</td>
      <td>Location &#8594; name</td>
      <td>Location<br/>
...name 1</td>
      <td>1) US Core requires a name for the Location.</td>
    </tr>

  </table>