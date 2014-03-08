<cfcomponent>

	<cffunction name="GetThumbs" access="remote" returntype="query">
	
		<cfargument name="FreeText" default="" type="string" required="false">
		<cfargument name="SectionID" default="0" type="string" required="false">
		<cfargument name="CountryID" default="0" type="string" required="false">
		<cfargument name="Video" default="Any" type="string" required="false">
		<cfargument name="MaxRows" default="10000" type="string" required="false">
		<cfargument name="FrontPage" default="Any" type="string" required="false">
				
			<cfquery name="GetThumbs" datasource="#Application.Datasource#" maxrows="#arguments.MaxRows#">
				SELECT v.video_id, v.title, v.file_name
				FROM cms_videos v
				WHERE work_flow_id = 1
				<cfif arguments.FrontPage NEQ "Any">
					AND front_page = #arguments.FrontPage#
				</cfif>
				<cfif len(trim(arguments.FreeText))>
					AND mg.summary LIKE '%#arguments.FreeText#%' OR mg.title LIKE '%#arguments.FreeText#%'
				</cfif>
				ORDER BY date_modified DESC
			</cfquery>
		
		<cfreturn GetThumbs/>
		
	</cffunction>
	
</cfcomponent>