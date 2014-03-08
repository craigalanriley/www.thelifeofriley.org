
<cfset PageTitle = Module>

<cfinclude template="includes/inc_header.cfm">

<cfif NOT isDefined("Session.UserID")>

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_login.cfm">

<cfelse>

	<cfparam name="ToggleOrder" default="0">	
	<cfparam name="OrderBy" default="au.date_modified">
	<cfparam name="OrderDirection" default=" DESC">
	
	<cfif ToggleOrder>
		<cfif OrderDirection EQ " DESC">
			<cfset OrderDirection = "">
		<cfelse>
			<cfset OrderDirection = " DESC">
		</cfif>		
	</cfif>
	<cfset OrderString = OrderBy & OrderDirection>

	<cfquery name="GetRecords" datasource="#Application.DataSource#">
		SELECT au.*, aut.admin_user_type, wf.work_flow
		FROM cms_users au
		LEFT OUTER JOIN cms_user_types aut ON aut.admin_user_type_id = au.admin_user_type_id
		LEFT OUTER JOIN cms_work_flow wf ON wf.work_flow_id = au.work_flow_id
		<cfif NOT Session.UserID EQ 1>
			WHERE admin_user_id > 1
		</cfif>
		ORDER BY #OrderString#
	</cfquery>	
	<!--- If no other message has been set then set default showing records message --->
	<cfif ListLen(Message) LT 2>
		<cfif GetRecords.RecordCount LT HowMany>
			<cfset RC = GetRecords.RecordCount>
		<cfelse>
			<cfset RC = HowMany>
		</cfif>
		<cfset Message="Showing Records 1 to #RC# (out of #GetRecords.RecordCount#),1">
	</cfif>


	<cfset TabArray = ArrayNew(2)>
	<cfset TabArray[1][1] = "#PageTitle#">
	<cfset TabArray[1][2] = "admin_users.cfm?Module=#Module#">
	<cfset TabArray[2][1] = "Edit">
	<cfset TabArray[2][2] = "admin_users_edit.cfm?Module=#Module#">	
	<cfset TabArray[3][1] = "Add">
	<cfset TabArray[3][2] = "admin_users_edit.cfm?Module=#Module#">
	
	<cfset DefaultTab = "1">	
	<cfset InactiveTabList = "2">

	<cfinclude template="includes/inc_action_adminusers.cfm">

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_tabs.cfm">
	
	<cfoutput>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	  <tr>
		<td><img src="images/dotpix.gif" width="20" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="20" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="15" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="300" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="15" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="170" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="15" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="115" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="15" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="15" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="25" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="25" height="1" border="0"></td>
	  </tr>
	  <tr bgcolor="##CC6600">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><cfif OrderBy CONTAINS 'family_name'><img src="images/order_<cfif NOT len(trim(OrderDirection))>up<cfelse>down</cfif>.gif" width="15" height="20" border="0"><cfelse>&nbsp;</cfif></td>
		<td><a href="?HowMany=#HowMany#&Module=#Module#&OrderDirection=#OrderDirection#&OrderBy=family_name&ToggleOrder=1" class="txt_column">NAME</a></td>
		<td><cfif OrderBy CONTAINS 'admin_user_type'><img src="images/order_<cfif NOT len(trim(OrderDirection))>up<cfelse>down</cfif>.gif" width="15" height="20" border="0"><cfelse>&nbsp;</cfif></td>
		<td><a href="?HowMany=#HowMany#&Module=#Module#&OrderDirection=#OrderDirection#&OrderBy=admin_user_type&ToggleOrder=1" class="txt_column">USER TYPE</a></td>		
		<td><cfif OrderBy CONTAINS 'date_modified'><img src="images/order_<cfif NOT len(trim(OrderDirection))>up<cfelse>down</cfif>.gif" width="15" height="20" border="0"><cfelse>&nbsp;</cfif></td>
		<td><a href="?HowMany=#HowMany#&Module=#Module#&OrderDirection=#OrderDirection#&OrderBy=au.date_modified&ToggleOrder=1" class="txt_column">DATE MODIFIED</a></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfif GetRecords.RecordCount>
		  <form method="post" action="?OrderBy=#OrderBy#&HowMany=#HowMany#&Module=#Module#&OrderDirection=#OrderDirection#"> 	  
		  <cfloop query="GetRecords" endrow="#HowMany#">
			  <tr bgcolor="##FFFFFF"><td colspan="12"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC">
				<td align="center"><input type="checkbox" id="TR_#Evaluate(FieldID)#" name="ID" value="#Evaluate(FieldID)#"<cfif NOT ListFind(WorkFlowList,work_flow_id)> disabled</cfif> onClick="javascript:colorRow(this);"></td>
				<td align="center"><img src="images/wf_#work_flow_id#.gif" alt=" #work_flow# " width="13" height="13" border="0"></td>
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">#family_name#, #first_name#</td>
				<td>&nbsp;</td>
				<td class="txt"><cfif len(admin_user_type) GT 25>#left(admin_user_type,"25")#...<cfelse>#admin_user_type#</cfif></td>
				<td>&nbsp;</td>
				<td class="txt">#DateFormat(date_modified,"dd-mm-yyyy")# @ #TimeFormat(date_modified,"HH:mm")#</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td align="center"><cfif CanDelete><a href="#TabArray[1][2]#&HowMany=#HowMany#&OrderBy=#OrderBy#&OrderDirection=#OrderDirection#&Action=delete&ID=#Evaluate(FieldID)#" onClick="if(! confirm('Are you sure you want to delete this record?')) return false"><img src="images/delete.gif" alt=" Delete " width="18" height="18" border="0"></a><cfelse><img src="images/delete_off.gif" alt=" Delete - No Access " width="18" height="18" border="0"></cfif></td>
				<td align="center"><cfif ListFind(WorkFlowList,work_flow_id)><a href="#TabArray[2][2]#&ID=#Evaluate(FieldID)#"><img src="images/edit.gif" alt=" Edit " width="18" height="18" border="0"></a><cfelse><img src="images/edit_off.gif" alt=" Edit - No Access " width="18" height="18" border="0"></cfif></td>
			  </tr>
		  </cfloop>
		  <cfinclude template="includes/inc_batch_howmany.cfm">  
	  <cfelse>
	  	  <!--- If no results --->
	   	  <tr bgcolor="##FFFFFF"><td colspan="12"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
		  <tr bgcolor="##CCCCCC"><td colspan="12"><img src="images/dotpix.gif" width="1" height="50" border="0"></td></tr>
		  <tr bgcolor="##CCCCCC"><td colspan="12" class="txt" align="center">No Records</td></tr>
		  <tr bgcolor="##CCCCCC"><td colspan="12"><img src="images/dotpix.gif" width="1" height="50" border="0"></td></tr>
	  </cfif> 	  
	  <tr bgcolor="##333333"><td colspan="12"><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>  
	</table>
	</cfoutput>
	
</cfif>


<cfinclude template="includes/inc_footer.cfm">
