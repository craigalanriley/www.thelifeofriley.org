
<cfset PageTitle = Module>

<cfinclude template="includes/inc_header.cfm">


<cfif NOT isDefined("Session.UserID")>

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_login.cfm">

<cfelse>

	<cfset Message="Please complete all the * required fields,0">
	
	<cfset FieldList="label,template_id,parent_id,page_id,meta_data,container_id,on_home_page,date_display,work_flow_id">
	<cfset ReqList="label,template_id,page_id,on_home_page,date_display,work_flow_id">
	<cfset GetData = QueryNew("#FieldList#")>

	<cfparam name="ID" default="">
	
	<!--- Tab Stuff --->
	<cfset TabArray = ArrayNew(2)>
	<cfset TabArray[1][1] = "#PageTitle#">
	<cfset TabArray[1][2] = "menu_manager.cfm?Module=#Module#">
	<cfset TabArray[2][1] = "Menu Tree">
	<cfset TabArray[2][2] = "menu_manager_tree.cfm?Module=#Module#">
	<cfset TabArray[3][1] = "Edit">
	<cfset TabArray[3][2] = "menu_manager_edit.cfm?Module=#Module#&ID=#ID#">	
	<cfset TabArray[4][1] = "Add">
	<cfset TabArray[4][2] = "menu_manager_edit.cfm?Module=#Module#">
	
	<cfparam name="DefaultTab" default="4">
	<cfparam name="InactiveTabList" default="3">
	<cfparam name="MenuLevel" default="0">

	<cfinclude template="includes/inc_action_menumanager.cfm">

	<!--- If ID get data --->
	<cfif len(trim(ID))>

		<cfquery name="GetData" datasource="#Application.DataSource#">
			SELECT m.*, m2.label as parent
			FROM cms_menus m
			LEFT OUTER JOIN cms_menus m2 ON m.parent_id = m2.menu_id
			WHERE m.#FieldID# = #ID#
		</cfquery>
		<cfset MenuLevel = GetData.menu_level>
		
		<cfquery name="GetDocuments" datasource="#Application.DataSource#">
			SELECT mdl.document_id
			FROM cms_menu_doc_lookup mdl
			WHERE #FieldID# = #ID#
		</cfquery>		
		<cfset DocumentList = ValueList(GetDocuments.document_id)>		
		
		<!--- If ID set edit tab to be active --->
		<cfset DefaultTab = "3">
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
	  <cfset FieldName = "parent_id">
	  <cfset FieldHint = "">
	  <cfif len(trim(ID))>
		  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
		  <tr bgcolor="##CCCCCC" id="#FieldName#">
			<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
			<td class="txt">Parent Menu</td>
			<td class="txt" align="center">&nbsp;</td>
			<td class="txt"><cfif GetData.parent_id>#GetData.parent#<cfelse>[ Top Level ]</cfif></td> 
			<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>    
			<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		  </tr>
		  <input type="hidden" name="parent_id" value="#GetData.parent_id#">
	  <cfelse>	  
		  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
		  <tr bgcolor="##CCCCCC" id="#FieldName#">
			<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
			<td class="txt">Parent Menu</td>
			<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
			<td class="txt">					
			<cfinvoke component="#Application.CFC#dyn_menus" method="navArray" returnvariable="arrNav"
						ParentID="0"
						ApprovedOnly="0"
						Maxlevels="2">
					
			<select name="#FieldName#" class="frm_list_select">			
				<!--- If user is admin support allow them to add primary nav --->
				<cfif Session.UserID EQ 1><option value="0">-- Primary --</option></cfif>
				<cfloop from="1" to="#ArrayLen(arrNav)#" index="x">
					<cfinvoke component="#Application.CFC#dyn_menus" method="navFormat" returnvariable="Menu" MenuLevel="#arrNav[x][3]#">
					<option value="#arrNav[x][1]#" class="#Menu.Class#" <cfif Evaluate('GetData.' & FieldName) EQ arrNav[x][1]>SELECTED</cfif>>#Menu.Indent##Menu.Icon##arrNav[x][2]#</option>
				</cfloop>
			</select>	
			</td> 
			<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>    
			<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		  </tr>
	  </cfif>  
	  <!--- </cfif> --->
	  <cfset FieldName = "label">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Menu Label</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_xlarge"></td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "meta_data">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Meta Data</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>
		
			<!--- Spacing Table --->
			<table cellpadding="0" cellspacing="0" border="0">
			<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>
			<tr>
				<td><textarea name="#FieldName#" class="frm_txtarea_summary">#Evaluate('GetData.' & FieldName)#</textarea></td>	
			</tr>		
			<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>	
			</table>	
			
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "template_id">
	  <cfset FieldHint = "By selecting different templates you can change the way the page will appear">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Template</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>
		
			<cfquery name="GetTemplates" datasource="#Application.DataSource#">
				SELECT t.*
				FROM cms_templates t
				ORDER BY template_id 
			</cfquery>		
			<select name="#FieldName#" class="frm_list_select">
				<!--- <option value="0">-- Please Select --</option> --->
				<cfloop query="GetTemplates">
					<option value="#Evaluate(FieldName)#" <cfif Evaluate('GetData.' & FieldName) EQ Evaluate(FieldName)>SELECTED</cfif>>#template_name#</option>
				</cfloop>
			</select>	
		
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>     
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "page_id">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Page</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>
		
			<cfquery name="GetPages" datasource="#Application.DataSource#">
				SELECT p.*
				FROM cms_pages p
				WHERE work_flow_id = 1
				ORDER BY page_title 
			</cfquery>		
			<select name="#FieldName#" class="frm_list_select">
				<option value="0">-- Please Select --</option>
				<cfloop query="GetPages">
					<option value="#Evaluate(FieldName)#" <cfif Evaluate('GetData.' & FieldName) EQ Evaluate(FieldName)>SELECTED</cfif>>#page_title#</option>
				</cfloop>
			</select>	
		
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>     
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "container_id">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Container</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>		
		
			<cfquery name="GetContainers" datasource="#Application.DataSource#">
				SELECT c.*
				FROM cms_containers c
				ORDER BY container 
			</cfquery>		
			<select name="#FieldName#" class="frm_list_select">
				<option value="0">-- No Container --</option>
				<cfloop query="GetContainers">
				<option value="#Evaluate(FieldName)#" <cfif Evaluate('GetData.' & FieldName) EQ Evaluate(FieldName)>SELECTED</cfif>>#container#</option>
				</cfloop>
			</select>			
		
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>    
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "document_id">
	  <cfset FieldHint = "Hold [ctrl] key to select multiple related cms_documents">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Related Documents</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td class="txt">			
			
			<cfquery name="GetModuleDocuments" datasource="#Application.DataSource#">
				SELECT d.*
				FROM cms_documents d, cms_doc_mod_lookup dml, cms_modules m
				WHERE dml.document_id = d.document_id
				AND dml.module_id = m.module_id
				AND m.module = '#Module#' 
				AND d.work_flow_id = 1
				ORDER BY document_name 
			</cfquery>				
			<table cellpadding="0" cellspacing="0" border="0">
			<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>
			<tr>
			<cfif GetModuleDocuments.RecordCount>
				<cfparam name="DocumentList" default="">
				<td>
				<select name="#FieldName#" size="5" class="frm_list_multi" multiple>
					<cfloop query="GetModuleDocuments">
						<option value="#Evaluate(FieldName)#" <cfif ListFind(DocumentList,Evaluate(FieldName))>SELECTED</cfif>>#document_name#<!---  [ #file_name# ] ---></option>
					</cfloop>
				</select>						
				</td>			
			<cfelse>
				<input type="hidden" name="#FieldName#" value="0">
				<td class="txt">[ No Documents ]</td>
			</cfif>		
			</tr>		
			<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>	
			</table>
			
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "on_home_page">
	  <cfset FieldHint = "Select yes if you want this page to appear in the quick links section on the front page of the site.">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Feature Quick Link</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>

			<table cellpadding="0" cellspacing="0" border="0">
			<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>
			<tr>
				<td><input type="radio" name="#FieldName#" class="frm_radio_box" value="1" <cfif Evaluate('GetData.' & FieldName) EQ 1>CHECKED</cfif>></td> 
				<td class="txt">Yes</td> 
				<td><img src="images/dotpix.gif" width="10" height="1" border="0"></td>
				<td><input type="radio" name="#FieldName#" class="frm_radio_box" value="0" <cfif NOT len(trim(Evaluate('GetData.' & FieldName))) OR Evaluate('GetData.' & FieldName) EQ 0>CHECKED</cfif>></td> 
				<td class="txt">No</td> 
				<td><img src="images/dotpix.gif" width="10" height="1" border="0"></td>
			</tr>		
			<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>	
			</table>
			
		</td>
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "date_display">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Article Date</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>
			<!--- Set Date to today's if not defined (eg new article)--->		
			<cfif len(trim(Evaluate('GetData.' & FieldName)))>
				<cfset ThisDate = Evaluate('GetData.' & FieldName)>
			<cfelse>
				<cfset ThisDate = now()>
			</cfif>
			<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td><input type="text" name="#FieldName#" value="#DateFormat(ThisDate,'dd-mmm-yyyy')#" size="10" class="form_field" readonly></td>
				<td><img src="images/dotpix.gif" width="3" height="1" border="0"></td>
				<td><a href="javascript: void(0);" onmouseover="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onmouseout="if (timeoutDelay) calendarTimeout();window.status='';" onclick="g_Calendar.show(event,'frm.#FieldName#',false); return false;"><img src="images/calender/calendar.gif" name="imgCalendar" width="34" height="21" border="0"></a></td>
			</tr>
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
			<!--- If Menu Level is primary can only be approved --->
			<cfif MenuLevel NEQ 1>
				<option value="0">-- Please Select --</option>
				<cfloop query="GetWorkFlow">
					<option value="#Evaluate(FieldName)#" <cfif Evaluate('GetData.' & FieldName) EQ Evaluate(FieldName)>SELECTED</cfif>>#work_flow#</option>
				</cfloop>
			<cfelse>
				<option value="1">Approved</option>
			</cfif>
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
				<form action="#Application.Home#dyncontent.cfm?MenuID=#ID#" method="post" target="_blank">
				<td>
				<input type="hidden" name="Preview" value="1">
				<input type="submit" value="PREVIEW" class="form_button">
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
	</table>
	<cfinclude template="includes/inc_validation.cfm">
	</cfoutput>	

</cfif>


<cfinclude template="includes/inc_footer.cfm">

