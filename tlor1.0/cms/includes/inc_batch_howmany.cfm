<cfoutput>
<tr bgcolor="##FFFFFF"><td colspan="12"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
<tr bgcolor="##666666">
	<td><input type="checkbox" name="cbxSelectAll" value="1" onclick="javascript:checkAll(this.form);"></td>
	<td colspan="4">
	
		<!--- Batch Update --->
		<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td><img src="images/dotpix.gif" width="2" height="1" border="0"></td>
			<td class="txt_column">SELECT ALL</td>
			<td><img src="images/dotpix.gif" width="5" height="1" border="0"></td>
			<td>
			<!--- GetWorkFlow query is in includes/inc_tabs.cfm --->
			<cfparam name="form.work_flow_id" default="0">
			<select name="work_flow_id" onChange="this.form.submit()">
				<option value="0">-- Batch Update --</option>
				<cfloop query="GetWorkFlow">
					<option value="#work_flow_id#" <cfif work_flow_id EQ form.work_flow_id>SELECTED</cfif>>#work_flow#</option>
				</cfloop>
			</select>				
			</td>
		</tr>
		<input type="hidden" name="Action" value="Batch">
		</form>
		</table>
	
	</td>
	<td><img src="images/dotpix.gif" width="1" height="30" border="0"></td>
	<td colspan="7">
	
		<!--- Number of Records --->
		<cfparam name="HowMany" default="25">
		<table border="0" cellspacing="0" cellpadding="0" align="right">
		<form method="post" action="?OrderBy=#OrderBy#&Module=#Module#&OrderDirection=#OrderDirection#">
		<tr>
			<td class="txt_column">SHOWING</td>
			<td><img src="images/dotpix.gif" width="5" height="1" border="0"></td>
			<td>
			<!--- this controls number of records displayed on page --->
			<select name="HowMany" onChange="this.form.submit()">
				<option value="10000">ALL</option>
				<option value="10" <cfif HowMany EQ 10>SELECTED</cfif>>10</option>
				<option value="25" <cfif HowMany EQ 25>SELECTED</cfif>>25</option>
				<option value="50" <cfif HowMany EQ 50>SELECTED</cfif>>50</option>
			</select>					
			</td>
			<td><img src="images/dotpix.gif" width="5" height="1" border="0"></td>
			<td class="txt_column">RECORDS</td>
			<td><img src="images/dotpix.gif" width="5" height="1" border="0"></td>
		</tr>
		</form>
		</table>		
	
	</td>
</tr>		
</cfoutput>
