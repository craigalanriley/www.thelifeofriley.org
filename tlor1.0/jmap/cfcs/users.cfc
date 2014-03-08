<cfcomponent hint="Users Example" output="false" persistent="true"> 
	
    <cfproperty name="iUserID" 	type="numeric" 	fieldtype="id" 	datatype="integer" 	generator="identity"> 
	<cfproperty name="sName" 	type="string" length="255"> 
	<cfproperty name="sEmail" 	type="string" length="255"> 

	<cfproperty name="arrCountries" fieldtype="many-to-many" type="array" cfc="countries" linktable="users_countries" fkcolumn="iUserID" inversejoincolumn="iCountryID">

</cfcomponent>