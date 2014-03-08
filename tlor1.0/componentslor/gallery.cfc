<cfcomponent>

	<cffunction name="GetThumbs" access="remote" returntype="query" output="true">
	
		<cfargument name="FreeText" type="string" required="false" default="">
		<cfargument name="SectionID" type="numeric" required="true" default="0">
		<cfargument name="CountryID" type="numeric" required="true" default="0">
		<cfargument name="GalleryType" type="string" required="false" default="Any">
		<cfargument name="MaxRows" type="string" required="false" default="10000">
		<cfargument name="FrontPage" type="string" required="false" default="1">
						
			<cfquery name="GetThumbs" datasource="#Application.Datasource#" maxrows="#arguments.MaxRows#">
				SELECT mg.gallery_id, mg.title, mg.file_small, mg.file_large, mg.date_created,
					   mg.summary, mg.country_id, mg.section_id, mg.gallery_type, mg.front_page
				FROM mod_gallery mg<cfif arguments.SectionID>, mod_gallery_section_lookup mgsl</cfif>
				WHERE work_flow_id = 1
				<cfif arguments.GalleryType NEQ "Any">
					AND gallery_type = #arguments.GalleryType#
				</cfif>
				<cfif arguments.FrontPage NEQ "Any">
					AND front_page = #arguments.FrontPage#
				</cfif>
				<cfif arguments.SectionID>
					AND mg.gallery_id = mgsl.gallery_id
					AND mgsl.section_id = #arguments.SectionID#
				</cfif> 
				<cfif arguments.CountryID>
					AND mg.country_id = #arguments.CountryID#
				</cfif>
				<cfif len(trim(arguments.FreeText))>
					AND mg.summary LIKE '%#arguments.FreeText#%' OR mg.title LIKE '%#arguments.FreeText#%'
				</cfif>
				ORDER BY date_display DESC
			</cfquery>	
		
		<cfreturn GetThumbs/>
		
	</cffunction>

	<cffunction name="ImageSearch" access="remote" returntype="query">
	
		<cfargument name="ArticleID" default="0" type="string" required="false">
		<cfargument name="FrontPage" default="0" type="numeric" required="false">
		<cfargument name="SectionID" default="0" type="string" required="false">
		<cfargument name="MaxRows" default="1000" type="string" required="false">
				
			<cfquery name="GetImages" datasource="#Application.Datasource#" maxrows="#arguments.MaxRows#">
				SELECT i.gallery_id, i.file_large, i.title
				FROM images i<cfif arguments.ArticleID>, article_image_lookup ail</cfif>
				WHERE work_flow_id = 1
				<cfif arguments.FrontPage>AND front_page = 1</cfif>
				<cfif arguments.ArticleID>
					AND ail.ARTICLE_ID = #arguments.ArticleID#
					AND i.gallery_id = ail.gallery_id
				</cfif>
				ORDER BY date_created DESC
			</cfquery>
		
		<cfreturn GetImages/>
		
	</cffunction>
	
</cfcomponent>