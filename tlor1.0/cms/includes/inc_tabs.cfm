<!--- Tab Bar --->
<cfset TabOnColor = "CC6600">
<cfset TabOffColor = "333333">

<cfparam name="CanCreate" default="0"> 
<cfparam name="CanDelete" default="0">  

<!--- Call work flow cfc --->
<cfinvoke component="#Application.CFC#workflow" method="WorkFlow" returnvariable="GetWorkFlow" 
			Module="#Module#"
			UserID="#Session.UserID#">		
<cfset WorkFlowList = ValueList(GetWorkFlow.work_flow_id)>


<!--- Get User Access Permissions (Add/Delete) for module --->
<cfquery name="GetAccessPermissions" datasource="#Application.DataSource#">
	select wft.can_delete, wft.can_create
	from cms_work_flow_types wft, cms_user_type_lookup autl, cms_modules m, cms_users au
	where wft.work_flow_type_id = autl.work_flow_type_id
	and autl.module_id = m.module_id
	and m.module = '#Module#'
	and autl.admin_user_type_id = au.admin_user_type_id
	and au.admin_user_id = #Session.UserID#
</cfquery>
<cfif GetAccessPermissions.RecordCount>
	<cfset CanDelete = GetAccessPermissions.can_delete>
	<cfset CanCreate = GetAccessPermissions.can_create>
</cfif>
<!--- <cfdump var="#GetAccessPermissions#"> --->

<cfif NOT CanCreate>
	<cfset InactiveTabList = ListAppend(InactiveTabList,ArrayLen(TabArray))>
</cfif>
	

<cfoutput>
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
  	<td>		
  		<!--- Left Tabs --->
		<table border="0" cellspacing="0" cellpadding="0">
		<tr>
		<cfloop from="1" to="#arrayLen(TabArray)-1#" index="t">
			<cfif DefaultTab EQ t>
				<cfset TabColor = TabOnColor>
				<cfset TabEnd = "or">
			<cfelse>
				<cfset TabColor = TabOffColor>			
				<cfset TabEnd = "dg">	
			</cfif>
			<td><img src="images/tab_#TabEnd#_left.gif" width="6" height="20" border="0"></td>
			<td bgcolor="###TabColor#"><cfif ListFind(InactiveTabList,t)><span class="txt_tab">#TabArray[t][1]#</span><cfelse><a href="#TabArray[t][2]#" class="txt_tab">#TabArray[t][1]#</a></cfif></td>
			<td><img src="images/tab_#TabEnd#_right.gif" width="6" height="20" border="0"></td>
			<td bgcolor="##FFFFFF"><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		</cfloop>			
		</tr>
		</table>
	
	</td>
  	<td>
	
  		<!--- Right Tab --->
		<table border="0" cellspacing="0" cellpadding="0" align="right">
		<tr>
			<cfif DefaultTab EQ arrayLen(TabArray)>
				<cfset TabColor = TabOnColor>
				<cfset TabEnd = "or">
			<cfelse>
				<cfset TabColor = TabOffColor>			
				<cfset TabEnd = "dg">	
			</cfif>
			<td><img src="images/tab_#TabEnd#_left.gif" width="6" height="20" border="0"></td>			
			<td bgcolor="###TabColor#"><cfif ListFind(InactiveTabList,arrayLen(TabArray))><span class="txt_tab">#TabArray[arrayLen(TabArray)][1]#</span><cfelse><a href="#TabArray[t][2]#" class="txt_tab">#TabArray[arrayLen(TabArray)][1]#</a></cfif></td>
			<td><img src="images/tab_#TabEnd#_right.gif" width="6" height="20" border="0"></td>	
		</tr>
		</table>	
	
	</td>
  </tr>
</table>
</cfoutput>
