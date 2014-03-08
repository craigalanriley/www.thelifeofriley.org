<cfcomponent>
	<cffunction name="dynFields" access="public" returntype="string" output="true">
	
		<!--- Required Arguments --->
		<cfargument name="UserID" type="numeric" required="true">
		<cfargument name="FieldList" type="string" required="true">
		<cfargument name="ReqList" type="string" required="true">
		<cfargument name="Module" type="string" required="true">
		<cfargument name="Home" type="string" required="true">
		<!--- Not Required Arguments --->
		<cfargument name="ID" type="string" required="false" default="">
		<cfargument name="ShowRelated" type="string" required="false" default="1">
		<cfargument name="ShowSections" type="string" required="false" default="1">
		
		<cfset GetData = QueryNew("#arguments.FieldList#")>

		<!--- If ID get data --->
		<cfif len(trim(arguments.ID))>
		
			<cfquery name="GetData" datasource="#Application.DataSource#">
				SELECT a.*
				FROM mod_articles a
				WHERE article_id = #arguments.ID#
			</cfquery>
			<!--- Get Document's that have been selected and put into list --->
			<cfquery name="GetDocuments" datasource="#Application.DataSource#">
				SELECT adl.document_id
				FROM mod_article_doc_lookup adl
				WHERE article_id = #arguments.ID#
			</cfquery>		
			<cfset DocumentList = ValueList(GetDocuments.document_id)>
			<!--- Get Section's that have been selected and put into list --->
			<cfquery name="GetSections" datasource="#Application.DataSource#">
				SELECT asl.section_id
				FROM mod_article_section_lookup asl
				WHERE article_id = #arguments.ID#
			</cfquery>		
			<cfset SectionList = ValueList(GetSections.section_id)>
		
		</cfif>

		<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
		<cfoutput>
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
		  <cfset FieldName = "title">
		  <cfset FieldHint = "">
		  <cfif ListFind(arguments.FieldList,"#FieldName#")>
			  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC" id="#FieldName#">
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">Title</td>
				<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
				<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_xlarge"></td> 
				<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
				<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
			  </tr>
		  <cfelse>		  	  
			  <input type="hidden" name="#FieldName#" value="">
		  </cfif>
		  <cfset FieldName = "summary">
		  <cfset FieldHint = "">
		  <cfif ListFind(arguments.FieldList,"#FieldName#")>
			  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC" id="#FieldName#">
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">Summary</td>
				<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
				<td>										
				<!--- Call AE4 cfc --->
				<cfinvoke component="#Application.CFC#AE4" method="GUI" returnvariable="FieldName" 
							FieldName="#FieldName#"
							FieldData="#Evaluate('GetData.' & FieldName)#"
							ImageURL="#Application.Home#uploads/images,#Module#"
							ImagePath="#ExpandPath('../uploads/images/')#"
							BaseURL="#Application.Home#"
							StyleSheet="#Application.Home#cms/css/cms.css"
							ToolBar="cut,copy,paste,|,bold,italic,underline,|,subscript,superscript,|,strike,removeformat,replace,|,bullets,justifyleft,|,hyperlink,specialchars,|,redo,undo,|,help"
							Height="200">		
				
					<!--- <table cellpadding="0" cellspacing="0" border="0">
					<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>
					<tr>
						<td><textarea name="#FieldName#"  class="frm_txtarea_summary">#Evaluate('GetData.' & FieldName)#</textarea></td> 
					</tr>		
					<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>	
					</table>	 --->
				
				<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
				<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
			  </tr>
		  <cfelse>		  	  
			  <input type="hidden" name="#FieldName#" value="">
		  </cfif>
		  <cfset FieldName = "copy">
		  <cfset FieldHint = "">
		  <cfif ListFind(arguments.FieldList,"#FieldName#")>
			  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC" id="#FieldName#">
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">Article Copy</td>
				<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
				<td>										
				<!--- Call AE4 cfc --->
				<cfinvoke component="#Application.CFC#AE4" method="GUI" returnvariable="FieldName" 
							FieldName="#FieldName#"
							FieldData="#Evaluate('GetData.' & FieldName)#"
							ImageURL="#Application.Home#uploads/images,#Module#"
							ImagePath="#ExpandPath('../uploads/images/')#"
							BaseURL="#Application.Home#"
							StyleSheet="#Application.Home#cms/css/cms.css"
							Height="500">								
				</td> 
				<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>    
				<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
			  </tr>
		  <cfelse>		  	  
			  <input type="hidden" name="#FieldName#" value="0">
		  </cfif>
		  <cfset FieldName = "contact">
		  <cfset FieldHint = "">
		  <cfif ListFind(arguments.FieldList,"#FieldName#")>
			  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC" id="#FieldName#">
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">Contact</td>
				<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
				<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_large"></td> 
				<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
				<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
			  </tr>
		  <cfelse>		  	  
			  <input type="hidden" name="#FieldName#" value="">
		  </cfif>
		  <cfset FieldName = "email">
		  <cfset FieldHint = "">
		  <cfif ListFind(arguments.FieldList,"#FieldName#")>
			  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC" id="#FieldName#">
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">Email</td>
				<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
				<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_large"></td>
				<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
				<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
			  </tr>
		  <cfelse>		  	  
			  <input type="hidden" name="#FieldName#" value="">
		  </cfif>
		  <cfset FieldName = "web">
		  <cfset FieldHint = "">
		  <cfif ListFind(arguments.FieldList,"#FieldName#")>
			  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC" id="#FieldName#">
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">Web URL</td>
				<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
				<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_xlarge"></td> 
				<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
				<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
			  </tr>
		  <cfelse>		  	  
			  <input type="hidden" name="#FieldName#" value="">
		  </cfif>
		  <cfset FieldName = "web_desc">
		  <cfset FieldHint = "">
		  <cfif ListFind(arguments.FieldList,"#FieldName#")>
			  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC" id="#FieldName#">
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">Web Description</td>
				<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
				<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_large"></td> 
				<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
				<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
			  </tr>
		  <cfelse>		  	  
			  <input type="hidden" name="#FieldName#" value="">
		  </cfif>
		  <cfset FieldName = "thumb_id">
		  <cfset FieldHint = "">
		  <cfif ListFind(arguments.FieldList,"#FieldName#")>
			  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC" id="#FieldName#">
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">Thumb Image</td>
				<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
				<td class="txt">			
					
					<cfquery name="GetModuleImages" datasource="#Application.DataSource#">
						SELECT i.*
						FROM cms_images i, cms_img_mod_lookup iml, cms_modules m
						WHERE iml.image_id = i.image_id
						AND iml.module_id = m.module_id
						AND m.module = '#arguments.Module#'  
						AND i.work_flow_id = 1
						ORDER BY image_name 
					</cfquery>				
					<table cellpadding="0" cellspacing="0" border="0">
					<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>
					<tr>
					<cfif GetModuleImages.RecordCount>
						<td>
						<select name="#FieldName#" class="frm_list_select">
							<option value="0">-- No Thumb Image --</option>
							<cfloop query="GetModuleImages">
								<option value="#image_id#" <cfif image_id EQ Evaluate('GetData.' & FieldName)>SELECTED</cfif>>#image_name#<!---  [ #file_name# ] ---></option>
							</cfloop>
						</select>						
						</td>			
					<cfelse>
						<td class="txt">[ No Images ]</td>
					</cfif>		
					</tr>		
					<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>	
					</table>
					
				</td> 
				<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
				<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
			  </tr> 
		  <cfelse>		  	  
			  <input type="hidden" name="#FieldName#" value="">
		  </cfif>
		  <!--- Check if module has cms_documents --->
		  <cfquery name="ShowDocs" datasource="#Application.DataSource#">
			SELECT m.documents
			FROM cms_modules m
			WHERE m.module = '#arguments.Module#'
		  </cfquery>					
		  <cfset FieldHint = "">  
		  <cfif ShowDocs.documents>
			  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC" id="document_id">
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">Documents</td>
				<td class="txt" align="center"><cfif ListFind(ReqList,"document_id")>*<cfelse>&nbsp;</cfif></td>
				<td class="txt">			
					
					<cfquery name="GetModuleDocuments" datasource="#Application.DataSource#">
						SELECT d.*
						FROM cms_documents d, cms_doc_mod_lookup dml, cms_modules m
						WHERE dml.document_id = d.document_id
						AND dml.module_id = m.module_id
						AND m.module = '#arguments.Module#' 
						AND d.work_flow_id = 1
						ORDER BY document_name 
					</cfquery>				
					<table cellpadding="0" cellspacing="0" border="0">
					<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>
					<tr>
					<cfif GetModuleDocuments.RecordCount>
						<cfparam name="DocumentList" default="">
						<td>
						<select name="document_id" size="5" class="frm_list_multi" multiple>
							<cfloop query="GetModuleDocuments">
								<option value="#document_id#" <cfif ListFind(DocumentList,document_id)>SELECTED</cfif>>#document_name#<!---  [ #file_name# ] ---></option>
							</cfloop>
						</select>						
						</td>			
					<cfelse>
						<td class="txt">[ No Documents ]</td>
					</cfif>		
					</tr>		
					<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>	
					</table>
					
				</td> 
				<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
				<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
			  </tr> 
		  </cfif>
		  <cfset FieldHint = "Select which section(s) of the site you want the article to appear on.">
		  <cfif arguments.ShowSections>
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
							<td><input type="checkbox" name="section_id" value="#section_id#" class="frm_check_box" <cfif ListFind(SectionList,section_id)>CHECKED</cfif>></td> 
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
		  </cfif>
		  <cfset FieldName = "on_home_page">
		  <cfset FieldHint = "Select yes if you want the article to appear on the front page of the site.">
		  <cfif ListFind(arguments.FieldList,"#FieldName#")>
			  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC" id="#FieldName#">
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">Feature Article</td>
				<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
				<td>
			
					<table cellpadding="0" cellspacing="0" border="0">
					<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>
					<tr>
						<td><input type="radio" name="#FieldName#" class="frm_radio_box" value="1" <cfif Evaluate('GetData.' & FieldName) EQ 1>CHECKED</cfif>></td> 
						<td class="txt">Yes</td> 
						<td><img src="images/dotpix.gif" width="10" height="1" border="0"></td>
						<td><input type="radio" name="#FieldName#" class="frm_radio_box" value="0" <cfif Evaluate('GetData.' & FieldName) EQ 0>CHECKED</cfif>></td> 
						<td class="txt">No</td> 
						<td><img src="images/dotpix.gif" width="10" height="1" border="0"></td>
					</tr>		
					<tr><td><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>	
					</table>	
				
				<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
				<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
			  </tr>
		  <cfelse>		  	  
			  <input type="hidden" name="#FieldName#" value="0">
		  </cfif>
		  <cfset FieldName = "date_event">
		  <cfset FieldHint = "The start date of the event">
		  <cfif ListFind(arguments.FieldList,"#FieldName#")>
			  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC" id="#FieldName#">
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">Event Date</td>
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
		  <cfelse>		  	  
			  <input type="hidden" name="#FieldName#" value="">
		  </cfif>
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
					<td><input type="text" name="#FieldName#" value="#DateFormat(ThisDate,'dd-mmm-yyyy')#" class="frm_txt_date" readonly></td>
					<td><img src="images/dotpix.gif" width="3" height="1" border="0"></td>
					<td><a href="javascript: void(0);" onmouseover="if (timeoutId) clearTimeout(timeoutId);window.status='Show Calendar';return true;" onmouseout="if (timeoutDelay) calendarTimeout();window.status='';" onclick="g_Calendar.show(event,'frm.#FieldName#',false); return false;"><img src="images/calender/calendar.gif" name="imgCalendar" width="34" height="21" border="0"></a></td>
				</tr>
				</table>		
			
			</td> 
				<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>  
			<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		  </tr>
		  <cfset FieldHint = "">
		  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
		  <tr bgcolor="##CCCCCC" id="work_flow_id">
			<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
			<td class="txt">Work Flow</td>
			<td class="txt" align="center"><cfif ListFind(ReqList,"work_flow_id")>*<cfelse>&nbsp;</cfif></td>
			<td>
			
				<!--- Call work flow cfc --->
				<cfinvoke component="#Application.CFC#workflow" method="WorkFlow" returnvariable="GetWorkFlow" 
							Module="#arguments.Module#"
							UserID="#arguments.UserID#">			
			
				<!--- GetWorkFlow query is in includes/inc_tabs.cfm --->
				<select name="work_flow_id" class="frm_list_select">
					<option value="0">Please Select</option>
					<cfloop query="GetWorkFlow">
						<option value="#work_flow_id#" <cfif GetData.work_flow_id EQ work_flow_id>SELECTED</cfif>>#work_flow#</option>
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
					<input type="submit" value="DELETE" class="form_button" onclick="if(! confirm('Are you sure you want to delete this record?')) return false">
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
		</cfoutput>
		</table>
		
	</cffunction>
</cfcomponent>