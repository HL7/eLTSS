Instance: careplan2
InstanceOf: CarePlan_eltss
Usage: #inline
* partOf = Reference(careplan1)
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p><b>Generated Narrative with Details</b></p><p><b>id</b>: careplan2</p><p><b>meta</b>: </p><p><b>partOf</b>: <a href=\"Bundle-careplan.html#CarePlan_careplan1\">CarePlan/careplan1</a></p><p><b>status</b>: active</p><p><b>intent</b>: plan</p><p><b>category</b>: Assessment and Plan of Treatment <span style=\"background: LightGoldenRodYellow\">(Details : {http://hl7.org/fhir/us/core/CodeSystem/careplan-category code 'assess-plan' = 'Assessment and Plan of Treatment)</span></p><p><b>description</b>: Snow Emergencies: A shelf stable blizzard meal is delivered to Meals On Wheels clients in early winter. It is to be eaten in the unlikely event of cancellation. Blizzard meals are donated by the Sheboygan Service Club.</p><p><b>subject</b>: <a href=\"Bundle-careplan.html#Patient_patient1\">Patient/patient1</a></p></div>"
* text.status = #additional
* status = #active
* intent = #plan
* category = $careplan-category#assess-plan
* description = "Snow Emergencies: A shelf stable blizzard meal is delivered to Meals On Wheels clients in early winter. It is to be eaten in the unlikely event of cancellation. Blizzard meals are donated by the Sheboygan Service Club."
* subject = Reference(patient1)

