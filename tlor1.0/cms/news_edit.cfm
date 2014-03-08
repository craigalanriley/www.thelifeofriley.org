
<cfset PageTitle = Module>

<cfinclude template="includes/inc_header.cfm">


<cfif NOT isDefined("Session.UserID")>

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_login.cfm">

<cfelse>

	<cfset Message="Please complete all the * required fields,0">

	<cfparam name="ID" default="">
		
	<cfset ReqList="title,summary,section_id,work_flow_id">
	<cfset FieldList="TITLE,SUMMARY,CONTENT,LOCATION,ENTRANTS,RESULT,PRIZE,HIGH_RUN,COUNTRY_ID,FRONT_PAGE,THUMB_ID,SECTION_ID,work_flow_id">
	<cfset GetData = QueryNew("#FieldList#")>
	
	
	<!--- Tab Stuff --->
	<cfset TabArray = ArrayNew(2)>
	<cfset TabArray[1][1] = "#PageTitle#">
	<cfset TabArray[1][2] = "news.cfm?Module=#Module#">
	<cfset TabArray[2][1] = "Edit">
	<cfset TabArray[2][2] = "news_edit.cfm?Module=#Module#&ID=#ID#">	
	<cfset TabArray[3][1] = "Add">
	<cfset TabArray[3][2] = "news_edit.cfm?Module=#Module#">
	
	<cfparam name="DefaultTab" default="3">
	<cfparam name="InactiveTabList" default="2">
	<!--- If ID set edit tab to be active --->
	<cfif len(trim(ID))>
		<cfset DefaultTab = "2">
		<cfset InactiveTabList = "">
	</cfif>
	
	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_tabs.cfm">

	<!--- If ID get data --->
	<cfif len(trim(ID))>
	
		<cfquery name="GetData" datasource="#Application.DataSource#">
			SELECT a.*
			FROM articles a
			WHERE article_id = #ID#
		</cfquery>
			
		<!--- If ID set edit tab to be active --->
		<cfset DefaultTab = "2">
		<cfset InactiveTabList = "">
	
	</cfif>
	
	<cfinclude template="includes/inc_action_news.cfm">
	
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
	  <cfset FieldName = "title">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Title</td>
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
		<td class="txt">Summary</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>					
				
			<cfinclude template="includes/inc_tinyMCE.cfm">	
					
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>    
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "content">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Content</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>					
				
			<cfinclude template="includes/inc_tinyMCE.cfm">	
					
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>    
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "entrants">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Entrants</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_small"></td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "result">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Result</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_small"></td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "prize">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Prize</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_small"></td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "high_run">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">High Run</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_small"></td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "location">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Location</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td><input type="text" name="#FieldName#" value="#Evaluate('GetData.' & FieldName)#" class="frm_txt_medium"></td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "country_id">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Country</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>	
		
			<cfquery name="GetCountries" datasource="#Application.Datasource#">
				SELECT COUNTRY_ID, COUNTRY
				FROM countries
				WHERE STATUS_ID = 1
				ORDER BY COUNTRY
			</cfquery>				
			<select name="#FieldName#" class="frm_list_select">
				<option value="0">PLEASE SELECT</option>
				<cfloop query="GetCountries">
				<option value="#COUNTRY_ID#" <cfif GetData.COUNTRY_ID EQ COUNTRY_ID>SELECTED</cfif>>#COUNTRY#</option>
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
		
			<cfquery name="GetSections" datasource="#Application.Datasource#">
				SELECT SECTION_ID, SECTION
				FROM sections
			</cfquery>				
			<select name="#FieldName#" class="frm_list_select">
				<option value="0">PLEASE SELECT</option>
				<cfloop query="GetSections">
				<option value="#SECTION_ID#" <cfif GetData.SECTION_ID EQ SECTION_ID>SELECTED</cfif>>#SECTION#</option>
				</cfloop>
			</select>
		
		</td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "thumb_id">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Thumb Image</td>
		<td class="txt" align="center"><cfif ListFind(ReqList,"#FieldName#")>*<cfelse>&nbsp;</cfif></td>
		<td>		

			<cfquery name="GetThumbs" datasource="#Application.Datasource#">
				SELECT IMAGE_ID, IMAGE_NAME, FILE_NAME
				FROM images
				WHERE IMAGE_TYPE_ID = 1
				AND STATUS_ID = 1
				ORDER BY IMAGE_NAME
			</cfquery>				
			<select name="THUMB_ID" class="frm_list_select">
				<option value="0">NO IMAGE</option>
				<cfloop query="GetThumbs">
				<option value="#IMAGE_ID#" <cfif GetData.THUMB_ID EQ IMAGE_ID>SELECTED</cfif>>#IMAGE_NAME# - [#FILE_NAME#]</option>
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
		<td><input name="FRONT_PAGE" type="checkbox" value="1" <cfif GetData.FRONT_PAGE EQ 1>checked</cfif>></td> 
		<td><cfif len(trim(FieldHint))><img src="images/atp_hint.gif" width="20" height="20" border="0" alt="#FieldHint#"><cfelse>&nbsp;</cfif></td>   
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfset FieldName = "date_display">
	  <cfset FieldHint = "">
	  <tr bgcolor="##FFFFFF"><td colspan="6"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
	  <tr bgcolor="##CCCCCC" id="#FieldName#">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td class="txt">Display Date</td>
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
			<option value="0">Please Select</option>
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

