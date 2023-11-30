Profile: Location_eltss
Parent: $us-core-location
Id: Location-eltss
Description: "Location for eLTSS. This profile should only be used for Service Delivery Address when the service or support is provided outside the person's home address. Use Person.address when service or support is provided in the person's residence."
* ^status = #active
* ^experimental = false
* ^date = "2019-02-17T00:00:00-05:00"
* ^publisher = "HL7 CBCP"
* . ^definition = "Details and position information for a physical place where services are provided and resources and participants may be stored, found, contained, and/or accommodated."

* extension ^label = "Label"
* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open
* extension contains
    $resource-pertainsToGoal named resource-pertainsToGoal 0..* MS
* extension[resource-pertainsToGoal] ^short = "The resource-pertainsToGoal relates the resource to the goal(s) that pertain to it. Whenever there is a goal associated with a health concern or problem, this extension should be present and populated in activity (event or intent) resources."
* description MS
* address ^definition = "Physical or geographical location."
* address.type ^comment = "The definition of Address states that \"address is intended to describe postal addresses, not physical locations\". However, many applications track whether an address has a dual purpose of being a location that can be visited as well as being a valid delivery destination, and Postal addresses are often used as proxies for physical locations (also see the Location resource)."
* address.district MS
* address.district ^short = "County"
* address.district ^definition = "Country where service is provided."

* partOf only Reference(Location_eltss)
* partOf ^type.extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-hierarchy"
* partOf ^type.extension.valueBoolean = true