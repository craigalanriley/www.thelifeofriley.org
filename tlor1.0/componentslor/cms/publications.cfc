<cfcomponent>
		<cffunction name="publicationArticles" access="public" returntype="query" output="true">

		<!--- Optional Arguments --->
		<cfargument name="SectionID" type="string" required="false" default="0">
		<cfargument name="HowMany" type="string" required="false" default="1">
		<cfargument name="WorkFlow" type="string" required="false" default="1">
		
		<!--- Latest News --->
		<cfquery name="GetArticles" datasource="#Application.DataSource#" maxrows="#arguments.HowMany#">
			SELECT a.*
			FROM mod_articles a			
			INNER JOIN cms_modules m ON a.module_id = m.module_id 
			<cfif SectionID>INNER JOIN mod_article_section_lookup asl ON a.article_id = asl.article_id </cfif>
			WHERE m.Module = 'Publications'
			<cfif SectionID>
				AND asl.section_id = #arguments.SectionID#
			</cfif>
			<cfif arguments.WorkFlow>
				AND a.work_flow_id = #arguments.WorkFlow#
			</cfif>
			ORDER BY a.date_display DESC			
		</cfquery>					
		
		<cfreturn GetArticles>
		
	</cffunction>
</cfcomponent>