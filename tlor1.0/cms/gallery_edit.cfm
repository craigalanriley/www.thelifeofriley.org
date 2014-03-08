
<cfset PageTitle = Module>

<cfinclude template="includes/inc_header.cfm">


<cfif NOT isDefined("Session.UserID")>

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_login.cfm">

<cfelse>

	<cfset Message="Please complete all the * required fields,0">

	<cfset FieldList="title,summary,file_small,file_large,section_id,country_id,front_page,date_display,work_flow_id">
	<cfset ReqList="title,file_large,country_id,date_display,work_flow_id">
	<cfset GetData = QueryNew("#FieldList#")>

	<cfparam name="ID" default="0">
	<cfparam name="SectionList" default="">
	
	<!--- Tab Stuff --->
	<cfset TabArray = ArrayNew(2)>
	<cfset TabArray[1][1] = "#PageTitle#">
	<cfset TabArray[1][2] = "gallery.cfm?Module=#Module#">
	<cfset TabArray[2][1] = "Edit">
	<cfset TabArray[2][2] = "gallery_edit.cfm?Module=#Module#&ID=#ID#">	
	<cfset TabArray[3][1] = "Add">
	<cfset TabArray[3][2] = "gallery_edit.cfm?Module=#Module#">
	
	<cfparam name="DefaultTab" default="3">
	<cfparam name="InactiveTabList" default="2">
	<cfparam name="front_page" default="0">

	<cfinclude template="includes/inc_action_gallery.cfm">

	<!--- If ID get data --->
	<cfif ID>
	
		<cfquery name="GetData" datasource="#Application.DataSource#">
			SELECT g.*
			FROM mod_gallery g
			WHERE #FieldID# = #ID#
		</cfquery>
		
		<!--- Get Section's that have been selected and put into list --->
		<cfquery name="GetSections" datasource="#Application.DataSource#">
			SELECT section_id
			FROM mod_gallery_section_lookup
			WHERE #FieldID# = #ID#
		</cfquery>		
		<cfset SectionList = ValueList(GetSections.section_id)>
		
		<!--- If ID set edit tab to be active --->
		<cfset DefaultTab = "2">
		<cfset InactiveTabList = "">
	
	</cfif>
	
	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_tabs.cfm">
	
	<cfoutput>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<form name="frm" method="post" enctype="multipart/form-data" action="">
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
	  <cfset FieldName = "title">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Image Title</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_xlarge"></td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "summary">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Summary (Alt Tag)</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>
		
			<table cellpadding="0" cellspacing="0" border="0">
			<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>
			<tr>
				<td><textarea name="#FieldName#" class="frm_txtarea_summary">#Evaluate('GetData.' & FieldName)#</textarea></td> 
			</tr>		
			<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>	
			</table>	
		
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfif ID>
		  <cfset FieldName = "file_small">
		  <cfset FieldHint = "">
		  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
		  <tr bgcolor="##CCCCCC" id="#FieldName#">
			<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
			<td class="txt">Thumb Image</td>
			<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
			<td class="txt">
			
				<img src="#Application.Home#uploads/images/#Evaluate('GetData.' & FieldName)#" name=" #GetData.title# ">				
			
			</td> 
			<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
			<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		  </tr> 
	  </cfif>
	  <cfset FieldName = "file_large">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Large Image</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td class="txt">						
		<cfif ID>
			<IFRAME SRC="#Application.Home#uploads/images/#Evaluate('GetData.' & FieldName)#" TITLE="The Famous Recipe" width="550" height="300">
			<!-- Alternate content for non-supporting browsers -->			
			<img src="#Application.Home#uploads/images/#Evaluate('GetData.' & FieldName)#" name=" #GetData.title# ">
			</IFRAME>		
			<input type="hidden" name="#FieldName#" value="hidden">
		<cfelse>
			<input type="file" name="#FieldName#" class="frm_txt_xlarge">
		</cfif>
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>	
	  <!--- 
	  <cfset FieldHint = "Select which section(s) of the site you want the image to appear on.">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="section_id">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Site Section</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"section_id")>*<cfelse>&nbsp;</cfif></td>
		<td>
			<cfquery name="GetSections" datasource="#Application.DataSource#">
				SELECT s.*
				FROM cms_sections s
				ORDER BY section_id 
			</cfquery>			
			<table cellpadding="0" cellspacing="0" border="0">
			<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>
			<tr>
			<cfif GetSections.RecordCount>
				<cfparam name="SectionList" default="">
				<cfloop query="GetSections">
					<td><input type="checkbox" name="section_id" class="frm_check_box" value="#section_id#" <cfif ListFind(SectionList,section_id)>CHECKED</cfif>></td> 
					<td class="txt">#section_name#</td> 
					<td><img src="images/dotpix.gif" width="10" height="1" border="0"></td>
				</cfloop>
			<cfelse>
				<td class="txt">[ No Sections ]</td>			
			</cfif> 
			</tr>		
			<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>	
			</table>	
		
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr> 
	  --->
	  <cfset FieldName = "country_id">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Country</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>			
			<cfquery name="AllCountries" datasource="#Application.DataSource#">
				SELECT c.*
				FROM countries c
				WHERE status_id =1
				ORDER BY country
			</cfquery>
			<select name="#FieldName#" class="frm_list_select">
				<option value="0">Please Select</option><!---  --->
				<cfloop query="AllCountries">
					<option value="#Evaluate(FieldName)#" <cfif evaluate('GetData.' & FieldName) EQ country_id>SELECTED</cfif>>#country#</option>
				</cfloop>
			</select>		
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>    
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "section_id">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Section</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>			
			<cfquery name="AllSections" datasource="#Application.DataSource#">
				SELECT cs.*
				FROM cms_sections cs
			</cfquery>
			<select name="#FieldName#" class="frm_list_select" multiple size="5">
				<!--- <option value="0">Please Select</option> --->
				<cfloop query="AllSections">
					<option value="#Evaluate(FieldName)#" <cfif ListFind(SectionList,section_id)>SELECTED</cfif>>#section_name#</option>
				</cfloop>
			</select>		
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>    
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "front_page">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Front Page</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td><input type="checkbox" name="#FieldName#" value="1" <cfif Evaluate('GetData.' & FieldName) EQ 1>checked</cfif>></td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "date_display">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Image Date</td>
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
				<td><input type="text" name="#FieldName#" value="#DateFormat(ThisDate,'dd-mmm-yyyy')#" class="frm_txt_date" readonly></td>
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
				<!--- <option value="0">Please Select</option> --->
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
			<cfif NOT ID>	
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

