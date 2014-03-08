<cfcomponent hint="Continents Example" output="false" persistent="true"> 
	
    <cfproperty name="iContinentID"	type="numeric" 	fieldtype="id" 	datatype="integer" 	generator="identity"> 
	<cfproperty name="sContinent" 	type="string" 	length="255"> 
    
	<!--- <cfproperty name="arrCountries" type="array" fieldtype="one-to-many" cfc="countries" fkcolumn="iCountryID"> --->

</cfcomponent>