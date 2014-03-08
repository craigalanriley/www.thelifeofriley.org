<cfcomponent>

	<cffunction name="ImageSearch" access="remote" returntype="query">
	
		<cfargument name="SectionID" default="0" type="string" required="false">
		<cfargument name="CountryID" default="0" type="string" required="false">
		<cfargument name="FreeText" default="" type="string" required="false">
		<cfargument name="Datasource" default="riley" type="string" required="false">
			
			<cfquery name="GetImages" datasource="#Datasource#" maxrows="5">
				SELECT i.IMAGE_ID, i.FILE_NAME
				FROM images i
				WHERE IMAGE_TYPE_ID = 2
				AND STATUS_ID = 1
				ORDER BY DATE_CREATED DESC
			</cfquery>				
		
		<cfreturn GetImages/>
		
	</cffunction>
	
</cfcomponent>