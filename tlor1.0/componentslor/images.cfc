<cfcomponent>

	<cffunction name="GetThumbs" access="remote" returntype="query">
	
		<cfargument name="FreeText" default="" type="string" required="false">
		<cfargument name="SectionID" default="0" type="string" required="false">
		<cfargument name="CountryID" default="0" type="string" required="false">
		<cfargument name="Video" default="Any" type="string" required="false">
		<cfargument name="MaxRows" default="10000" type="string" required="false">
		<cfargument name="FrontPage" default="1" type="string" required="false">
				
			<cfquery name="GetThumbs" datasource="#Application.Datasource#" maxrows="#arguments.MaxRows#">
				SELECT v.video_id, v.title, v.file_name
				FROM cms_videos v
				WHERE status_id = 1
				<cfif arguments.Video NEQ "Any">
					AND VIDEO = #arguments.Video#
				</cfif>
				<cfif arguments.FrontPage NEQ "Any">
					AND FRONT_PAGE = #arguments.FrontPage#
				</cfif>
				<cfif len(trim(arguments.FreeText))>
					AND i.SUMMARY LIKE '%#arguments.FreeText#%'
				</cfif>
				<cfif arguments.SectionID GT 0>
					AND i.IMAGE_ID = isl.IMAGE_ID
					AND isl.SECTION_ID = #arguments.SectionID#
				</cfif>
				<cfif arguments.CountryID GT 0>
					AND i.COUNTRY_ID = #arguments.CountryID#
				</cfif>
				ORDER BY DATE_CREATED DESC
			</cfquery>
		
		<cfreturn GetThumbs/>
		
	</cffunction>

	<cffunction name="ImageSearch" access="remote" returntype="query">
	
		<cfargument name="ArticleID" default="0" type="string" required="false">
		<cfargument name="FrontPage" default="0" type="numeric" required="false">
		<cfargument name="SectionID" default="0" type="string" required="false">
		<cfargument name="MaxRows" default="1000" type="string" required="false">
		<cfargument name="Datasource" default="riley" type="string" required="false">
				
			<cfquery name="GetImages" datasource="#Datasource#" maxrows="#arguments.MaxRows#">
				SELECT i.IMAGE_ID, i.FILE_NAME, i.IMAGE_NAME
				FROM images i<cfif arguments.ArticleID>, article_image_lookup ail</cfif>
				WHERE STATUS_ID = 1
				<cfif arguments.FrontPage>AND FRONT_PAGE = 1</cfif>
				<cfif arguments.ArticleID>
					AND ail.ARTICLE_ID = #arguments.ArticleID#
					AND i.IMAGE_ID = ail.IMAGE_ID
				</cfif>
				AND IMAGE_TYPE_ID = 2
				ORDER BY DATE_CREATED DESC
			</cfquery>
		
		<cfreturn GetImages/>
		
	</cffunction>
	
</cfcomponent>