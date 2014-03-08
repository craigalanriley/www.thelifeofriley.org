
<cfset PageTitle = Module>

<cfinclude template="includes/inc_header.cfm">


<cfif NOT isDefined("Session.UserID")>

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_login.cfm">

<cfelse>

	<cfset Message="Please complete all the * required fields,0">

	<cfset FieldList="document_name,file_name,work_flow_id">
	<cfset ReqList="document_name,file_name,work_flow_id">
	<cfset GetData = QueryNew("#FieldList#")>

	<cfparam name="ID" default="">
	
	<!--- Tab Stuff --->
	<cfset TabArray = ArrayNew(2)>
	<cfset TabArray[1][1] = "#PageTitle#">
	<cfset TabArray[1][2] = "document_manager.cfm?Module=#Module#">
	<cfset TabArray[2][1] = "Edit">
	<cfset TabArray[2][2] = "document_manager_edit.cfm?Module=#Module#&ID=#ID#">	
	<cfset TabArray[3][1] = "Add">
	<cfset TabArray[3][2] = "document_manager_edit.cfm?Module=#Module#">
	
	<cfparam name="DefaultTab" default="3">
	<cfparam name="InactiveTabList" default="2">

	<cfinclude template="includes/inc_action_documentmanager.cfm">

	<!--- If ID get data --->
	<cfif len(trim(ID))>
	
		<cfquery name="GetData" datasource="#Application.DataSource#">
			SELECT d.*
			FROM cms_documents d
			WHERE #FieldID# = #ID#
		</cfquery>
		<!--- Get Document Module ID's and put into a list --->
		<cfquery name="GetDocumentModules" datasource="#Application.DataSource#">
			SELECT dml.module_id
			FROM cms_doc_mod_lookup dml
			WHERE #FieldID# = #ID#
		</cfquery>		
		<cfset DocumentModuleList = ValueList(GetDocumentModules.module_id)>
			
		<!--- If ID set edit tab to be active --->
		<cfset DefaultTab = "2">
		<cfset InactiveTabList = "">
	
	</cfif>
	
	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_tabs.cfm">
	
	<cfoutput>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<form name="frm" method="post" action="" enctype="multipart/form-data">
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
	  <cfset FieldName = "document_name">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Document Name</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td><input type="text" name="#FieldName#" value="#GetData.document_name#" class="frm_txt_xlarge"></td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>     
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "file_name">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">File Name</td>
		<cfif len(trim(ID))>
			<td><img src="images/filetypes/#Right(Evaluate('GetData.' & FieldName),3)#.gif" width="16" height="16" border="0" alt=" #Right(Evaluate('GetData.' & FieldName),4)# File "></td>
			<td><a href="#Application.Home#uploads/documents/#Evaluate('GetData.' & FieldName)#" class="footer" target="_blank">#Evaluate('GetData.' & FieldName)#</a></td>
			<input type="hidden" name="#FieldName#" value="#GetData.file_name#">
		<cfelse>
			<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
			<td><input name="#FieldName#" type="file" class="frm_txt_xlarge"></td> 
		</cfif>		
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>    
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "module_id">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Which Section</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td class="txt">			
			
			<cfquery name="GetModules" datasource="#Application.DataSource#">
				SELECT m.*
				FROM cms_modules m
				WHERE m.documents = 1
				ORDER BY module 
			</cfquery>				
			<table cellpadding="0" cellspacing="0" border="0">
			<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>
			<tr>
			<cfif GetModules.RecordCount>
				<cfparam name="DocumentModuleList" default="">
				<td>
				<select name="#FieldName#" size="5" class="frm_list_multi" multiple>
					<cfloop query="GetModules">
						<option value="#Evaluate(FieldName)#" <cfif ListFind(DocumentModuleList,Evaluate(FieldName))>SELECTED</cfif>>#module#</option>
					</cfloop>
				</select>						
				</td>			
			<cfelse>
				<td class="txt">[ No Modules Require Documents ]</td>
				<input type="hidden" name="#FieldName#" value="0">
			</cfif>		
			</tr>		
			<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>	
			</table>
			
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>     
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr> 
	  <cfset FieldName = "work_flow_id">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Work Flow</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>
			<!--- GetWorkFlow query is in includes/inc_tabs.cfm --->
			<select name="#FieldName#" class="frm_list_select">
				<option value="0">Please Select</option>
				<cfloop query="GetWorkFlow">
					<option value="#Evaluate(FieldName)#" <cfif GetData.work_flow_id EQ Evaluate(FieldName)>SELECTED</cfif>>#work_flow#</option>
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

