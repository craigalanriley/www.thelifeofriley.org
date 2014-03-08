<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfinclude template="includes/loggedin.cfm">

<cfparam name="Message" default="">
<cfparam name="ModuleID" default="">
<cfparam name="ErrorList" default="">
<cfset MustList="TITLE,BREAK_TYPE_ID,DATE_DISPLAY,STATUS_ID">
<cfset FieldList="TITLE,SUMMARY,WHO,LOCATION,BREAK_TYPE_ID,DATE_DISPLAY,STATUS_ID">
<cfset GetData = QueryNew("#FieldList#")>

<cfif isDefined("Action")>
	
	<cfif CompareNoCase(Action,"Delete")>

		<!--- Preserve state / Validate Module 
		<cfmodule template="../cfmodules/validate.cfm" 
					FieldList = "#FieldList#"
					MustList = "#MustList#"
					ErrorList = "#ErrorList#">--->
						
		<cfif NOT len(trim(ErrorList))>

			<cfswitch expression="#Action#">	
				<cfcase value="Create">
				
					<cfquery name="Create" datasource="#Application.Datasource#">
						INSERT INTO breaks(#FieldList#,DATE_EDITED,DATE_CREATED)							
						VALUES('#TITLE#','#SUMMARY#','#WHO#','#LOCATION#','#BREAK_TYPE_ID#',#CreateODBCDate(DATE_DISPLAY)#,#STATUS_ID#,#CreateODBCDate(Now())#,#CreateODBCDate(Now())#)
					</cfquery>
					<cfquery name="GetLatestID" datasource="#Application.Datasource#">
						SELECT MAX(BREAK_ID) AS BreakID							
						FROM breaks
					</cfquery>
					<cfset BreakID = GetLatestID.BreakID>							
					<cfset Message = "The record has been created">
				
				</cfcase>
				<cfcase value="Update">
					
					<cfquery name="Update" datasource="#Application.Datasource#">
						UPDATE breaks
						SET TITLE = '#TITLE#',
							SUMMARY = '#SUMMARY#',
						    WHO = '#WHO#',
						    LOCATION = '#LOCATION#',
						    BREAK_TYPE_ID = #BREAK_TYPE_ID#,
						    DATE_DISPLAY = #CreateODBCDate(DATE_DISPLAY)#,
						    DATE_EDITED = #CreateODBCDate(now())#,
						    STATUS_ID = '#STATUS_ID#'
						WHERE BREAK_ID = #BreakID#
					</cfquery>
					<cfset Message = "The record has been updated">			
				
				</cfcase>			
			</cfswitch>
		<cfelse>
			<cfset Message = "You must complete all the highlighted fields">
		</cfif>		
		
	<cfelse>
	
		<cfset Message = "The records have been deleted">
	
	</cfif>

</cfif>

<html>
<head>
	<title>The Life of Riley</title>
	<meta name="keywords" content="Craig,Riley,the life of riley,Snooker,Pool,8 Ball,Grimsby,Sydney,Australia,Coldfusion,Web Developer," />
	<meta name="description" content="The Life of Riley is the personal website of Craig Riley, Web Developer and Pool Hustler"/>
	<meta http-equiv="content-type" content="text/html;charset=iso-8859-1"/>
	<link rel=stylesheet type="text/css" href="stylesheets/xroom.css">
	<script language="javascript" src="javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">
<cfoutput>

<cfinclude template="includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##8080C0"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="30" width="1"></td>
		<td bgcolor="##EAEAEA"><span class="txt_header">Top Breaks</span> <cfif len(trim(Message))><span class="txt_message"> - #Message#</span></cfif></td>
	</tr>
  	<tr>
    	<td bgcolor="##8080C0" valign="top">
		
			<cfinclude template="includes/navigation.cfm">		
		
		</td>
    	<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="1" width="1"></td>
    	<td bgcolor="##EAEAEA" class="txt" valign="top">
		
			<cfif isDefined("BreakID")>
		
				<cfquery name="GetData" datasource="#Application.Datasource#">
					SELECT b.BREAK_ID, b.TITLE, b.SUMMARY, b.DATE_DISPLAY, b.BREAK_TYPE_ID, b.WHO, b.LOCATION, b.STATUS_ID
					FROM breaks b
					WHERE b.BREAK_ID = #BreakID#
				</cfquery>
			
			</cfif>
			
			<table cellpadding="0" cellspacing="0" width="550" border="0">
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="25"></td>
				<td><img src="../images/dotpix.gif" height="1" width="25"></td>
				<td><img src="../images/dotpix.gif" height="1" width="75"></td>
				<td><img src="../images/dotpix.gif" height="1" width="375"></td>
				<td><img src="../images/dotpix.gif" height="1" width="25"></td>
				<td><img src="../images/dotpix.gif" height="1" width="25"></td>
			</tr>
			<tr bgcolor="##999999">
				<td><img src="../images/dotpix.gif" height="25" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td class="txt_columns">FIELD</td>
				<td class="txt_columns">DATA</td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
			</tr>
			<tr>
				<td  colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>	
			<form action="breaks_edit.cfm" method="post">
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>BREAK(S)</td>
				<td><input name="TITLE" value="#GetData.TITLE#" type="text" size="25" class="Form"></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"TITLE")>*</cfif></td>
			</tr>
			<tr>
				<td  colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>			
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>SUMMARY</td>
				<td><textarea name="SUMMARY" cols="40" rows="5">#GetData.SUMMARY#</textarea></td>		
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"SUMMARY")>*</cfif></td>
			</tr>
			<tr>
				<td  colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>	
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>OPONENT</td>
				<td><input name="WHO" value="#GetData.WHO#" type="text" size="25" class="Form"></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"WHO")>*</cfif></td>
			</tr>
			<tr>
				<td  colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>LOCATION</td>
				<td><input name="LOCATION" value="#GetData.LOCATION#" type="text" size="25" class="Form"></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"LOCATION")>*</cfif></td>
			</tr>
			<tr>
				<td  colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>TYPE</td>
				<td>
				<cfquery name="GetBreakTypes" datasource="#Application.Datasource#">
					SELECT BREAK_TYPE_ID, BREAK_TYPE
					FROM break_types
				</cfquery>				
				<select name="BREAK_TYPE_ID">
					<option value="0">PLEASE SELECT</option>
					<cfloop query="GetBreakTypes">
					<option value="#BREAK_TYPE_ID#" <cfif GetData.BREAK_TYPE_ID EQ BREAK_TYPE_ID>SELECTED</cfif>>#BREAK_TYPE#</option>
					</cfloop>
				</select>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"BREAK_TYPE_ID")>*</cfif></td>
			</tr>
			<tr>
				<td  colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>DATE</td>
				<td><input name="DATE_DISPLAY" value="<cfif NOT len(trim(GetData.DATE_DISPLAY))>#DateFormat(Now(),"dd mmm yyyy")#<cfelse>#DateFormat(GetData.DATE_DISPLAY,"dd mmm yyyy")#</cfif>" type="text" size="25" class="Form"></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"DATE_DISPLAY")>*</cfif></td>
			</tr>
			<tr>
				<td  colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>STATUS</td>
				<td>
				<cfquery name="GetStatuses" datasource="#Application.Datasource#">
					SELECT STATUS_ID, STATUS
					FROM statuses
				</cfquery>				
				<select name="STATUS_ID">
					<option value="0">PLEASE SELECT</option>
					<cfloop query="GetStatuses">
					<option value="#STATUS_ID#" <cfif GetData.STATUS_ID EQ STATUS_ID>SELECTED</cfif>>#STATUS#</option>
					</cfloop>
				</select>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"STATUS_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>
				<cfif isDefined("BreakID")>
					<input type="hidden" name="BreakID" value="#BreakID#">
					<input type="hidden" name="ModuleID" value="#ModuleID#">
					<input type="hidden" name="Action" value="Update">
					<input value="UPDATE" type="submit" class="SubmitButton">
				<cfelse>
					<input type="hidden" name="ModuleID" value="#ModuleID#">
					<input type="hidden" name="Action" value="Create">
					<input value="CREATE" type="submit" class="SubmitButton">
				</cfif>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
			</tr>
			<tr>
				<td  colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>
			</form>	
			</table>
				
		</td>
  	</tr>
	<tr>
		<td bgcolor="##8080C0"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="20" width="25"></td>
		<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="1" width="550"></td>
	</tr>	
</cfoutput>
</table>

<cfinclude template="../footer.cfm">	 

</body>

</html>
