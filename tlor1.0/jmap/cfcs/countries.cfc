<cfcomponent hint="Countries Example" output="false" persistent="true"> 
	
    <cfproperty name="iCountryID" 		type="numeric" 	fieldtype="id" 	datatype="integer" 	generator="identity"> 
	<cfproperty name="sCountry" 		type="string" 	length="255"> 
	<cfproperty name="sCountryCode"		type="string" 	length="255"> 
	<cfproperty name="iContinentID"		type="numeric" 	fieldtype="many-to-one" cfc="continents" fkcolumn="iContinentID"> 
    
	<!--- <cfproperty name="arrUsers" fieldtype="many-to-many" type="array" cfc="users" linktable="users_countries" fkcolumn="iCountryID" inversejoincolumn="iUserID"> --->

</cfcomponent>