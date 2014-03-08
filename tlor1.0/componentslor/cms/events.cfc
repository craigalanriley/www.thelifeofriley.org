<cfcomponent>
		<cffunction name="eventsArticles" access="public" returntype="query" output="true">
		
		<!--- Optional Arguments --->
		<cfargument name="ID" type="numeric" required="false" default="0">
		<cfargument name="SectionID" type="string" required="false" default="0">
		<cfargument name="OnHomePage" type="string" required="false" default="0">
		<cfargument name="HowMany" type="string" required="false" default="1">
		<cfargument name="WorkFlow" type="string" required="false" default="1">
		<cfargument name="WhichDate" type="string" required="false" default="Any">
		<cfargument name="OrderBy" type="string" required="false" default="date_event">
		
		<!--- Latest News --->
		<cfquery name="GetArticles" datasource="#Application.DataSource#" maxrows="#arguments.HowMany#">
			SELECT a.*, cms_images.file_name, cms_images.image_name
			FROM mod_articles a
			INNER JOIN cms_modules m ON a.module_id = m.module_id 
			<cfif SectionID>INNER JOIN mod_article_section_lookup asl ON a.article_id = asl.article_id</cfif>
			LEFT OUTER JOIN cms_images ON a.thumb_id = cms_images.image_id		
			WHERE m.Module = 'Events'
			<cfif SectionID>
				AND asl.section_id = #arguments.SectionID#
			</cfif>
			<cfif arguments.OnHomePage>
				AND a.on_home_page = 1
			</cfif>
			<cfif CompareNoCase(WhichDate,"Any")>
				AND a.date_event >= #CreateODBCDate(arguments.WhichDate)#
			</cfif>
			<cfif arguments.WorkFlow>
				AND a.work_flow_id = #arguments.WorkFlow#
			</cfif>
			<cfif arguments.ID>
				AND a.article_id = #arguments.ID#
			</cfif>
			ORDER BY #arguments.OrderBy#
		</cfquery>			
		
		<cfreturn GetArticles>
		
	</cffunction>
</cfcomponent>