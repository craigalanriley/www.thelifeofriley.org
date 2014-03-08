<cfcomponent>
	<cffunction name="reorder" access="public" returntype="string">
	
		<!--- Required Arguments --->
		<cfargument name="ParentID" type="numeric" required="true">
		
		<!--- get all cms_menus on same level  --->		
		<cfquery name="GetSameParent" datasource="#Application.DataSource#">
			SELECT menu_id, menu_order	
			FROM cms_menus
			WHERE parent_id = #arguments.ParentID#
		</cfquery>			
		<cfif GetSameParent.RecordCount GTE 1>
			<!--- If there are one or more records loop over them and reset order sequentially --->
			<cfset Order = 0>
			<cfloop query="GetSameParent">
				<cfset Order = Order + 1>
				<cfquery name="UpdateOrder" datasource="#Application.DataSource#">
					UPDATE cms_menus
					SET menu_order = #Order#
					WHERE menu_id = #menu_id#
				</cfquery>								
			</cfloop>		
		</cfif>		
		
		<cfreturn>
		
	</cffunction>
	<cffunction name="move" access="public" returntype="string">
	
		<!--- Required Arguments --->
		<cfargument name="ID" type="numeric" required="true">
		<cfargument name="Action" type="string" required="true">
		
		<!--- Get parent ID --->	
		<cfquery name="GetMenuInfo" datasource="#Application.DataSource#">
			SELECT parent_id, menu_order				
			FROM cms_menus
			WHERE menu_id = #arguments.ID#
		</cfquery>	
		<cfset ParentID = GetMenuInfo.parent_id>
		<cfset CurrentPosition = GetMenuInfo.menu_order>
		
		<!--- get all cms_menus on same level  --->		
		<cfquery name="GetMenuOrder" datasource="#Application.DataSource#">
			SELECT menu_id, menu_order	
			FROM cms_menus
			WHERE parent_id = #ParentID#
		</cfquery>	
		<!--- check if only one record --->		
		<cfif GetMenuOrder.RecordCount GT 1>
								
			<cfswitch expression="#arguments.Action#">	
				<cfcase value="Down">
				
					<!--- check if record is already at the bottom --->
					<cfif GetMenuOrder.RecordCount EQ CurrentPosition>						
						<cfset Message = "The record is already at the bottom,0">				
					<cfelse>
						<!--- Set new position --->
						<cfset NewPosition = CurrentPosition + 1>
						<cfloop query="GetMenuOrder">
							<!--- loop old orders, and toggle positions --->
							<cfif menu_order EQ NewPosition>
								<cfquery name="UpdateOldOrder" datasource="#Application.DataSource#">
									UPDATE  cms_menus
									SET menu_order = #CurrentPosition#
									WHERE menu_id = #menu_id#
								</cfquery>		
							</cfif>
							<!--- update new position --->
							<cfquery name="UpdateNewOrder" datasource="#Application.DataSource#">
								UPDATE  cms_menus
								SET menu_order = #NewPosition#
								WHERE menu_id = #ID#
							</cfquery>	
							
						</cfloop>					
						<cfset Message = "The record has been moved down,1">
					
					</cfif>
				
				</cfcase>
				<cfcase value="Up">		
				
					<!--- check if record is already at the top --->
					<cfif CurrentPosition EQ 1>						
						<cfset Message = "The record is already at the top,0">				
					<cfelse>
						<!--- Set new position --->
						<cfset NewPosition = CurrentPosition - 1>
						<cfloop query="GetMenuOrder">
							<!--- loop old orders, and toggle positions --->
							<cfif menu_order EQ NewPosition>
								<cfquery name="UpdateOldOrder" datasource="#Application.DataSource#">
									UPDATE  cms_menus
									SET menu_order = #CurrentPosition#
									WHERE menu_id = #menu_id#
								</cfquery>		
							</cfif>
							<!--- update new position --->
							<cfquery name="UpdateNewOrder" datasource="#Application.DataSource#">
								UPDATE  cms_menus
								SET menu_order = #NewPosition#
								WHERE menu_id = #ID#
							</cfquery>	
							
						</cfloop>					
						<cfset Message = "The record has been moved up,1">		
					
					</cfif>					
				
				</cfcase>	
			</cfswitch>
			
		<cfelse>
	
			<cfset Message = "There is only one menu item under that parent,0">
	
		</cfif>		
		
		<cfreturn Message>
		
	</cffunction>
</cfcomponent>