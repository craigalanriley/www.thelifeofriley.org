
<cfset PageTitle = Module>

<cfinclude template="includes/inc_header.cfm">


<cfif NOT isDefined("Session.UserID")>

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_login.cfm">

<cfelse>

	<cfset Message="Please complete all the * required fields,0">

	<cfset FieldList="admin_user_type,work_flow_id">
	<cfset ReqList="admin_user_type,work_flow_id">
	<cfset GetData = QueryNew("#FieldList#")>
	
	<cfparam name="ID" default="">
	
	<!--- Tab Stuff --->
	<cfset TabArray = ArrayNew(2)>
	<cfset TabArray[1][1] = "#PageTitle#">
	<cfset TabArray[1][2] = "admin_user_types.cfm?Module=#Module#">
	<cfset TabArray[2][1] = "Edit">
	<cfset TabArray[2][2] = "admin_user_types_edit.cfm?Module=#Module#&ID=#ID#">	
	<cfset TabArray[3][1] = "Add">
	<cfset TabArray[3][2] = "admin_user_types_edit.cfm?Module=#Module#">
	
	<cfparam name="DefaultTab" default="3">
	<cfparam name="InactiveTabList" default="2">
	
	<cfinclude template="includes/inc_action_usertypes.cfm">

	<!--- If ID get data --->
	<cfif len(trim(ID))>
	
		<cfquery name="GetData" datasource="#Application.DataSource#">
			SELECT aut.*
			FROM cms_user_types aut
			WHERE #FieldID# = #ID#
		</cfquery>
		
		<!--- If ID set edit tab to be active --->
		<cfset DefaultTab = "2">
		<cfset InactiveTabList = "">
	
	</cfif>
	
	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_tabs.cfm">
	
	<cfoutput>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<form name="frm" method="post" action="">
	  <tr>
		<td><img src="images/dotpix.gif" width="10" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="125" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="20" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="565" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="20" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="10" height="1" border="0"></td>
	  </tr>
	  <tr bgcolor="##CC6600">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt_column"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td class="txt_column"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "admin_user_type">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">User Type</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_large"></td>
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <cfquery name="GetModules" datasource="#Application.DataSource#">
		SELECT m.*
		FROM cms_modules m
		ORDER BY module_id
	  </cfquery>		
	  <cfset ModuleList = ValueList(GetModules.module_id)>
	  <input type="hidden" name="ModuleList" value="#ModuleList#">
	  <cfloop query="GetModules">	  
		  <tr bgcolor="##CCCCCC">
			<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
			<td class="txt">#module#</td>
			<td class="txt" align="center"><cfif ListFind(ReqList,"work_flow_type_id")>*<cfelse>&nbsp;</cfif></td>
			<td>
			
				<cfif len(trim(ID))>
					<cfquery name="GetSelected" datasource="#Application.DataSource#">
						SELECT autl.work_flow_type_id
						FROM cms_user_type_lookup autl
						WHERE admin_user_type_id = #ID#
						AND module_id = #module_id#
					</cfquery>			
					<cfset SelectedID = GetSelected.work_flow_type_id>
				</cfif>
				<cfparam name="SelectedID" default="0">				
				
				<cfquery name="GetWorkFlowTypes" datasource="#Application.DataSource#">
					SELECT wft.*
					FROM cms_work_flow_types wft
					ORDER BY work_flow_type_id 
				</cfquery>		
				<select name="work_flow_type_id" class="frm_list_select">
					<option value="0">-- No Access --</option>
					<cfloop query="GetWorkFlowTypes">
					<option value="#work_flow_type_id#" <cfif work_flow_type_id EQ SelectedID>SELECTED</cfif>>#work_flow_type#</option>
					</cfloop>
				</select>	
			
			</td> 
			<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>   
			<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		  </tr>
		  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  </cfloop>
	  <cfset FieldName = "work_flow_id">
	  <cfset FieldHint = "">
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Work Flow</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>		
			
			<!--- GetWorkFlow query is in includes/inc_tabs.cfm --->
			<select name="#FieldName#" class="frm_list_select">
				<option value="0">-- Please Select --</option>
				<cfloop query="GetWorkFlow">
				<option value="#Evaluate(FieldName)#" <cfif Evaluate('GetData.' & FieldName) EQ Evaluate(FieldName)>SELECTED</cfif>>#work_flow#</option>
				</cfloop>
			</select>
		
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##666666">
		<td><img src="images/dotpix.gif" width="1" height="30" border="0"></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>
		
			<table cellpadding="0" cellspacing="0" border="0">
			<input type="hidden" name="Module" value="#Module#">
			<tr>
			<cfif NOT len(trim(ID))>	
				<td>
				<input type="hidden" name="Action" value="Create">
				<input type="submit" value="CREATE" class="form_button" onclick="return submitform(this.form);">
				</td>
				</form>
			<cfelse>		
				<td>
				<input type="hidden" name="Action" value="Edit">
				<input type="hidden" name="ID" value="#ID#">
				<input type="submit" value="SAVE" class="form_button" onclick="return submitform(this.form);">					
				</td>		
				</form>
				<td><img src="images/dotpix.gif" width="5" height="1" border="0"></td>
				<form action="" method="post">
				<td>
				<input type="hidden" name="ID" value="#ID#">
				<input type="hidden" name="Action" value="Delete">
				<input type="submit" value="DELETE" class="form_button" onClick="if(! confirm('Are you sure you want to delete this record?')) return false">
				</td>
				</form>
			</cfif>	
			</tr>			
			</table>			
			
		</td> 
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <tr bgcolor="##333333"><td colspan="6"><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>
	</form>
	</table>
	<cfinclude template="includes/inc_validation.cfm">	
	</cfoutput>		

</cfif>


<cfinclude template="includes/inc_footer.cfm">

