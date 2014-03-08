<cfcomponent>
	<cffunction name="WorkFlow" access="public" returntype="query" output="true">
	
		<!--- Required Arguments --->
		<cfargument name="Module" type="string" required="true">
		<cfargument name="UserID" type="numeric" required="true">
	
		<!--- This query returns the work flows that the user has permission for in current module --->
		<cfquery name="GetWorkFlow" datasource="#Application.DataSource#">
			SELECT wf.*
			FROM cms_work_flow wf, cms_work_flow_lookup wfl, cms_user_type_lookup autl, 
				 cms_users au, cms_modules m
			WHERE wf.work_flow_id = wfl.work_flow_id
			AND wfl.work_flow_type_id = autl.work_flow_type_id
			AND autl.admin_user_type_id = au.admin_user_type_id
			AND autl.module_id = m.module_id
			AND m.module = '#arguments.Module#'
			AND au.admin_user_id = #arguments.UserID#
			ORDER BY wf.work_flow_id 
		</cfquery>	
	
		<cfreturn GetWorkFlow>
		
	</cffunction>
</cfcomponent>