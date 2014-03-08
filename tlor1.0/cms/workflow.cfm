<cfparam name="LogOut" default="0">

<cfif LogOut>
	<cfloop collection="#session#" item="i">
		<cfset StructDelete(session,i)>
	</cfloop>
</cfif>


<cfinclude template="includes/inc_header.cfm">
<cfinclude template="includes/inc_message.cfm">


<cfif NOT isDefined("Session.UserID")>

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_login.cfm">

<cfelse>

	<cfquery name="GetWFTypes" datasource="#Application.DataSource#">
		SELECT wft.*
		FROM cms_work_flow_types wft
		ORDER BY work_flow_type_id
	</cfquery>
	<p>
	<table border="0" cellspacing="1" cellpadding="5" align="center" bgcolor="#000000" width="600">
	<cfoutput>
	<tr bgcolor="##CC6600">
		<td class="txt_column" width="20%">Work Flow</td>
		<cfloop query="GetWFTypes">
			<td class="txt_column" width="20%" align="center">#work_flow_type#</td>
		</cfloop>
	</tr>
	<cfquery name="GetWorkFlow" datasource="#Application.DataSource#">
		SELECT wf.*
		FROM cms_work_flow wf
	</cfquery>
	<cfloop query="GetWorkFlow">
		<cfset WorkFlowID = GetWorkFlow.work_flow_id>
		<tr bgcolor="##CCCCCC">	
			<td class="txt"><img src="images/wf_#work_flow_id#.gif" alt=" #work_flow# "> #work_flow#</td>
			<cfloop query="GetWFTypes">
				<cfset WFTypeID = GetWFTypes.work_flow_type_id>
				<cfquery name="GetPermission" datasource="#Application.DataSource#">
					SELECT wfl.*
					FROM cms_work_flow_lookup wfl
					WHERE work_flow_type_id = #WFTypeID#
					AND work_flow_id = #WorkFlowID#
				</cfquery>			
				<cfif GetPermission.Recordcount>
					<td class="txt" align="center" bgcolor="##E6B380">Yes</td>
				<cfelse>
					<td class="txt" align="center">No</td>
				</cfif>
			</cfloop>
		</tr>
	</cfloop>
	</cfoutput>
	</table>
	<p>
</cfif>


<cfinclude template="includes/inc_footer.cfm">

