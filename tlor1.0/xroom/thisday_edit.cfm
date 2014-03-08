<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfinclude template="includes/loggedin.cfm">

<cfparam name="Message" default="">
<cfparam name="ModuleID" default="">
<cfparam name="ErrorList" default="">
<cfparam name="ImageList" default="">
<cfparam name="CategoryList" default="">
<cfparam name="FRONT_PAGE" default="0">
<cfparam name="STATUS_ID" default="0">

<cfset MustList="SUMMARY,DATE_DISPLAY,STATUS_ID">
<cfset FieldList="SUMMARY,CITY_ID,ARTICLE_ID,DATE_DISPLAY,STATUS_ID">
<cfset GetData = QueryNew("#FieldList#")>

<cfif isDefined("Action")>
	
	<cfif CompareNoCase(Action,"Delete")>

		<!--- Preserve state / Validate Module 
		<cfmodule template="cfmodules/validate.cfm" 
					FieldList = "#FieldList#"
					MustList = "#MustList#">--->
						
		<cfif NOT len(trim(ErrorList))>

			<cfswitch expression="#Action#">	
				<cfcase value="Create">

					<cfquery name="Create" datasource="#Application.Datasource#">
						INSERT INTO thisday(#FieldList#,DATE_EDITED,DATE_CREATED)							
						VALUES('#SUMMARY#',#CITY_ID#,#ARTICLE_ID#,#CreateODBCDateTime(DATE_DISPLAY)#,#STATUS_ID#,#CreateODBCDateTime(Now())#,#CreateODBCDateTime(Now())#)
					</cfquery>
					<cfquery name="GetLatestID" datasource="#Application.Datasource#">
						SELECT MAX(THIS_DAY_ID) AS ThisDayID							
						FROM thisday
					</cfquery>
					<cfset ThisDayID = GetLatestID.ThisDayID>																
					<cfset Message = "The record has been created">
				
				</cfcase>
				<cfcase value="Update">
					
					<cftransaction>
					<!--- Update Article Data --->
					<cfquery name="Update" datasource="#Application.Datasource#">
						UPDATE thisday
						SET SUMMARY = '#SUMMARY#',
						    CITY_ID = '#CITY_ID#',
							ARTICLE_ID = #ARTICLE_ID#,
						    DATE_DISPLAY = #CreateODBCDateTime(DATE_DISPLAY)#,
						    DATE_EDITED = #CreateODBCDateTime(now())#,
							STATUS_ID = #STATUS_ID#
						WHERE THIS_DAY_ID = #ThisDayID#
					</cfquery>						
					
					<cfset Message = "The record has been updated">			
				
					</cftransaction>
					
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
<cfoutput>
<head>
	<title>The Life of Riley - Xroom</title>
	<meta name="keywords" content="Craig,Riley,the life of riley,Snooker,Pool,8 Ball,Grimsby,Sydney,Australia,Coldfusion,Web Developer," />
	<meta name="description" content="The Life of Riley is the personal website of Craig Riley, Web Developer and Pool Hustler"/>
	<meta http-equiv="content-type" content="text/html;charset=iso-8859-1"/>
	<link rel=stylesheet type="text/css" href="stylesheets/xroom.css">
	<script language="javascript" src="javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfinclude template="includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##8080C0"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="30" width="1"></td>
		<td bgcolor="##EAEAEA"><span class="txt_header">On This Day</span> <cfif len(trim(Message))><span class="txt_message"> - #Message#</span></cfif></td>
	</tr>
  	<tr>
    	<td bgcolor="##8080C0" valign="top">
		
			<cfinclude template="includes/navigation.cfm">		
		
		</td>
    	<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="1" width="1"></td>
    	<td bgcolor="##EAEAEA" class="txt" valign="top">
		
			<cfif isDefined("ThisDayID")>
		
				<cfquery name="GetData" datasource="#Application.Datasource#">
					SELECT td.THIS_DAY_ID, td.SUMMARY, td.CITY_ID, td.DATE_DISPLAY, td.ARTICLE_ID, td.STATUS_ID
					FROM thisday td
					WHERE THIS_DAY_ID = #ThisDayID#
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
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>	
			<form action="thisday_edit.cfm" method="post">		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>SUMMARY</td>
				<td><textarea name="SUMMARY" cols="40" rows="5">#GetData.SUMMARY#</textarea></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"SUMMARY")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>			
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>CITY</td>
				<td>
				<cfquery name="GetCities" datasource="#Application.Datasource#">
					SELECT CITY_ID, CITY
					FROM cities
					ORDER BY CITY
				</cfquery>				
				<select name="CITY_ID">
					<option value="0">PLEASE SELECT</option>
					<cfloop query="GetCities">
					<option value="#CITY_ID#" <cfif GetData.CITY_ID EQ CITY_ID>SELECTED</cfif>>#CITY#</option>
					</cfloop>
				</select>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"CITY_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>			
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>ARTICLE</td>
				<td>
				<cfquery name="GetArticles" datasource="#Application.Datasource#">
					SELECT ARTICLE_ID, TITLE
					FROM articles
					WHERE STATUS_ID = 1
					ORDER BY TITLE
				</cfquery>				
				<select name="ARTICLE_ID">
					<option value="0">PLEASE SELECT</option>
					<cfloop query="GetArticles">
					<option value="#ARTICLE_ID#" <cfif GetData.ARTICLE_ID EQ ARTICLE_ID>SELECTED</cfif>>#TITLE#</option>
					</cfloop>
				</select>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"CITY_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
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
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
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
				<td></td>
				<td>
				
					<table cellpadding="2" cellspacing="0" border="0">
					<tr>
						<cfif isDefined("ThisDayID")>
							<td>
							<input type="hidden" name="ThisDayID" value="#ThisDayID#">
							<input type="hidden" name="ModuleID" value="#ModuleID#">
							<input type="hidden" name="Action" value="Update">
							<input value="UPDATE" type="submit" class="SubmitButton">
							</td>
							</form>
						<cfelse>
							<td>
							<input type="hidden" name="ModuleID" value="#ModuleID#">
							<input type="hidden" name="Action" value="Create">
							<input value="CREATE" type="submit" class="SubmitButton">					
							</td>
							</form>	
						</cfif>
						<form action="?" method="post">
						<td>
						<input value="ADD" type="submit" class="SubmitButton">										
						</td>
						</form>	
					</tr>					
					</table>
				
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>
			</table>
				
		</td>
  	</tr>
	<tr>
		<td bgcolor="##8080C0"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="20" width="25"></td>
		<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="1" width="550"></td>
	</tr>	
</table>

<cfinclude template="../footer.cfm">	 

</body>
</cfoutput>
</html>
