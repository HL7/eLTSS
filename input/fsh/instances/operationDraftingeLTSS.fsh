Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm

//Use example URL: [base]/CarePlan/[id]/$all-eltss-careplan

Instance: all-eltss-careplan
InstanceOf: OperationDefinition
Usage: #definition
* name = "AllEltssCareplan"
* title = "All Eltss Careplan"
* status = #draft
* kind = #operation
* experimental = true
//* date = "2023-07-25T14:43:25+00:00"

* description = "Provide all eLTSS data for a given Patient's CarePlan. Given a CarePlan with a specific Patient and ID, this operation will return all the referenced artifacts necessary to satisfy the eLTSS data element set found in the DAM. The Operation reduces the number of queries that a client must make. This operation definition is in draft and should be revised in subsequent versions of this IG."
* jurisdiction = $m49.htm#001 "World"
* code = #all-eltss-careplan
* comment = "Use example URL: [base]/CarePlan/[id]/$all-eltss-careplan \n Resources which should be returned:
\nCarePlan         \nPractitioner         \nObservation         \nRiskAssessment         \nHealthcareService         \nOrganization         \nCoverage         \nClaim                 \nContract                \nTask         \nServiceRequest         \nPatient         \nGoal         \nCondition         \nCareTeam         \nEncounter         \nEpisodeOfCare         \nLocation  \nQuestionnaireResponse                \nQuestionnaire                \nRelatedPerson         \nPractitionerRole                \n  \n \nExample Request Parameters that this Operation is to form as one action: \n \nCarePlan?_id=68 \n&_include=CarePlan%3Aactivity-reference \n \n&_include=CarePlan%3Acare-team \n \n&_include=CarePlan%3Acondition \n \n&_include=CarePlan%3Aencounter \n \n&_include=CarePlan%3Agoal \n \n&_include=CarePlan%3Aperformer \n \n&_include=CarePlan%3Asubject \n \n&_profile=http%3A%2F%2Fhl7.org%2Ffhir%2Fus%2FeLTSS%2FStructureDefinition%2FCarePlan-eltss \n \nFollowed by individual requests for: \n \nPractitioner?_id=80827658-9560-4ed5-8ff6-0cc93de6214d            \nObservation?_id=28291 \nObservation?_id=28303 \nObservation?_id=28304 \nRiskAssessment?_id=28357         \nRiskAssessment?_id=28358         \nHealthcareService?_id=28364    \nHealthcareService?_id=28289    \nHealthcareService?_id=28359    \nOrganization?_id=28295               \nHealthcareService?_id=28414    \nCoverage?_id=28366&_include=Coverage%3Apayor        \nCoverage?_id=28361&_include=Coverage%3Apayor        \nCoverage?_id=28297&_include=Coverage%3Apayor        \nClaim?_id=28367              Claim?_id=28362              \nClaim?_id=28298              \nPatient?_id=CMS2023-patientBSJ1 \n"

* affectsState = false
* resource = #CarePlan
* system = false
* type = false
* instance = true

* parameter[0].name = #eLTSSdata
* parameter[=].documentation = "eLTSS data will come as a FHIR bundle."
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The Server may wish to enable paging of the output for large bundles."
* parameter[=].type = #Bundle