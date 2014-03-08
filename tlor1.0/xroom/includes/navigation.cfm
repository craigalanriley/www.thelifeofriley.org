			<!--- Navigation --->
			<table width="95%" cellspacing="0" cellpadding="0" border="0" align="center">
			<cfoutput>
			<tr>
				<td><a href="#Application.Home#xroom/home.cfm" class="TextNavPri">HOME</a></td>
			</tr>
			<!--- 		
			<tr>
				<td><a href="users.cfm" class="TextNavPri">Admin Users</a></td>
			</tr>
			<tr>
				<td><a href="usertypes.cfm" class="TextNavPri">Admin User Types</a></td>
			</tr> 
			--->
			<tr>
				<td><a href="index.cfm" class="TextNavPri">LOG OUT</a></td>
			</tr>
			<tr>
				<td><img src="images/dotpix.gif" width="1" height="8" border="0"></td>
			</tr>	
			</cfoutput>
			<cfquery name="GetRecordTypes" datasource="#Application.Datasource#">
				SELECT MODULE_ID, MODULE, TEMPLATE 
				FROM modules
				WHERE ACTIVE = 1
				ORDER BY MODULE_ID
			</cfquery>			
			<cfoutput query="GetRecordTypes">
				<cfquery name="GetPermission" datasource="#Application.Datasource#">
					SELECT STATUS_LOOKUP_ID
					FROM admin_status_lookup
					WHERE USER_TYPE_ID = #Session.UserTypeID#
					AND MODULE_ID = #MODULE_ID#
				</cfquery>	
				<cfif GetPermission.RecordCount>
					<tr>
						<td><a href="#TEMPLATE#?ModuleID=#MODULE_ID#" class="TextNavPri">#MODULE#</a></td>
					</tr>			
					<cfif ModuleID EQ "4" AND MODULE_ID EQ 4>	
						<cfquery name="GetCategories" datasource="#Application.Datasource#">
							SELECT CATEGORY_ID, CATEGORY
							FROM categories
							WHERE TOP_10 = 0
							ORDER BY CATEGORY
						</cfquery>		
						<cfloop query="GetCategories">		
						<tr>
							<td><a href="news.cfm?ModuleID=4&CategoryID=#CATEGORY_ID#" class="TextNavPri">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;#CATEGORY#</a></td>
						</tr>
						</cfloop>
					</cfif>
				</cfif>
			</cfoutput>
			<tr>
				<td><img src="images/dotpix.gif" width="1" height="8" border="0"></td>
			</tr>			
			</table>
