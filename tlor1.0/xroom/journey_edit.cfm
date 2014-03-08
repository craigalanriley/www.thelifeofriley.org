<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfinclude template="includes/loggedin.cfm">

<cfparam name="Message" default="">
<cfparam name="ModuleID" default="">
<cfparam name="ErrorList" default="">
<cfparam name="FRONT_PAGE" default="0">
<cfparam name="STATUS_ID" default="0">

<cfset MustList="JOURNEY_TYPE_ID,JOURNEY_FROM,JOURNEY_TO,DATE_DEPART,DATE_ARRIVE,STATUS_ID">
<cfset FieldList="JOURNEY_TYPE_ID,JOURNEY_FROM,JOURNEY_TO,SUMMARY,REF,OPERATOR,CLASS,DISTANCE,DATE_DEPART,DATE_ARRIVE,STATUS_ID">
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
						INSERT INTO journeys(#FieldList#,DATE_EDITED,DATE_CREATED)							
						VALUES('#JOURNEY_TYPE_ID#','#JOURNEY_FROM#','#JOURNEY_TO#','#SUMMARY#','#REF#','#OPERATOR#','#CLASS#','#DISTANCE#',#CreateODBCDateTime(DATE_DEPART)#,#CreateODBCDateTime(DATE_ARRIVE)#,#STATUS_ID#,#CreateODBCDateTime(Now())#,#CreateODBCDateTime(Now())#)
					</cfquery>
					<cfquery name="GetLatestID" datasource="#Application.Datasource#">
						SELECT MAX(JOURNEY_ID) AS JourneyID							
						FROM journeys
					</cfquery>
					<cfset JourneyID = GetLatestID.JourneyID>							
					<cfset Message = "The record has been created">
				
				</cfcase>
				<cfcase value="Update">

					<cfquery name="Update" datasource="#Application.Datasource#">
						UPDATE journeys
						SET JOURNEY_TYPE_ID = #JOURNEY_TYPE_ID#,
							JOURNEY_FROM = '#JOURNEY_FROM#',
						    JOURNEY_TO = '#JOURNEY_TO#',
							SUMMARY = '#SUMMARY#',
						    REF = '#REF#',
						    OPERATOR = '#OPERATOR#',
						    CLASS = '#CLASS#',
						    DISTANCE = '#DISTANCE#',
						    DATE_DEPART = #CreateODBCDateTime(DATE_DEPART)#,
						    DATE_ARRIVE = #CreateODBCDateTime(DATE_ARRIVE)#,
						    DATE_EDITED = #CreateODBCDateTime(now())#,
							STATUS_ID = #STATUS_ID#
						WHERE JOURNEY_ID = #JourneyID#
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

<body bgcolor="#FFFFFF" topmargin="25" onload="preload();">
<cfoutput>

<cfinclude template="includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##8080C0"><img src="images/dotpix.gif" height="1" width="175"></td>
		<td bgcolor="##EAEAEA"><img src="images/dotpix.gif" height="30" width="1"></td>
		<td bgcolor="##EAEAEA"><span class="txt_header">Journeys</span> <cfif len(trim(Message))><span class="txt_message"> - #Message#</span></cfif></td>
	</tr>
  	<tr>
    	<td bgcolor="##8080C0" valign="top">
		
			<cfinclude template="includes/navigation.cfm">		
		
		</td>
    	<td bgcolor="##EAEAEA"><img src="images/dotpix.gif" height="1" width="1"></td>
    	<td bgcolor="##EAEAEA" class="txt" valign="top">
		
			<cfif isDefined("JourneyID")>
		
				<cfquery name="GetData" datasource="#Application.Datasource#">
					SELECT j.JOURNEY_TYPE_ID, j.JOURNEY_ID, j.JOURNEY_FROM, j.SUMMARY, j.JOURNEY_TO, j.REF, j.OPERATOR, j.CLASS, j.DISTANCE, j.DATE_DEPART, j.DATE_ARRIVE, j.STATUS_ID
					FROM journeys j
					WHERE JOURNEY_ID = #JourneyID#
				</cfquery>
			
			</cfif>
			
			<table cellpadding="0" cellspacing="0" width="550" border="0">
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="25"></td>
				<td><img src="images/dotpix.gif" height="1" width="25"></td>
				<td><img src="images/dotpix.gif" height="1" width="75"></td>
				<td><img src="images/dotpix.gif" height="1" width="375"></td>
				<td><img src="images/dotpix.gif" height="1" width="25"></td>
				<td><img src="images/dotpix.gif" height="1" width="25"></td>
			</tr>
			<tr bgcolor="##999999">
				<td><img src="images/dotpix.gif" height="25" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt_columns">FIELD</td>
				<td class="txt_columns">DATA</td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>	
			<form action="journey_edit.cfm" method="post">
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">IMAGE TYPE</td>
				<td>
					<cfquery name="GetJourneyTypes" datasource="#Application.Datasource#">
						SELECT JOURNEY_TYPE_ID, JOURNEY_TYPE
						FROM journey_types
						ORDER BY JOURNEY_TYPE_ID
					</cfquery>
					
					<cfif NOT len(trim(GetData.JOURNEY_TYPE_ID))><cfset GetData.JOURNEY_TYPE_ID = 1></cfif>
					<table border="0" cellpadding="0" cellspacing="2">
						<tr>
						<cfloop query="GetJourneyTypes">
					  		<td><input name="JOURNEY_TYPE_ID" type="radio" value="#JOURNEY_TYPE_ID#" <cfif JOURNEY_TYPE_ID EQ GetData.JOURNEY_TYPE_ID>checked</cfif>> #JOURNEY_TYPE# </td>
					  	</cfloop>	
						</tr>
					</table>					
				</td>
				<td><img src="images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"JOURNEY_TYPE_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">FROM</td>
				<td>
				<cfquery name="GetCities" datasource="#Application.Datasource#">
					SELECT CITY_ID, CITY
					FROM cities
					ORDER BY CITY
				</cfquery>				
				<select name="JOURNEY_FROM">
					<cfloop query="GetCities">
					<option value="#CITY_ID#" <cfif GetData.JOURNEY_FROM EQ CITY_ID>SELECTED</cfif>>#CITY#</option>
					</cfloop>
				</select>
				</td>
				<td><img src="images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"JOURNEY_FROM")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">TO</td>
				<td>
				<cfquery name="GetCities" datasource="#Application.Datasource#">
					SELECT CITY_ID, CITY
					FROM cities
					ORDER BY CITY
				</cfquery>				
				<select name="JOURNEY_TO">
					<cfloop query="GetCities">
					<option value="#CITY_ID#" <cfif GetData.JOURNEY_TO EQ CITY_ID>SELECTED</cfif>>#CITY#</option>
					</cfloop>
				</select>
				</td>
				<td><img src="images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"JOURNEY_TO")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">SUMMARY</td>
				<td><textarea name="SUMMARY" cols="40" rows="5">#GetData.SUMMARY#</textarea></td>
				<td><img src="images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"SUMMARY")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">REF</td>
				<td><input name="REF" value="#GetData.REF#" type="text" size="10" class="Form"></td>
				<td><img src="images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"REF")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">OPERATOR</td>
				<td><input name="OPERATOR" value="#GetData.OPERATOR#" type="text" size="40" class="Form"></td>
				<td><img src="images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"OPERATOR")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">CLASS</td>
				<td><input name="CLASS" value="#GetData.CLASS#" type="text" size="40" class="Form"></td>
				<td><img src="images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"CLASS")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">DISTANCE</td>
				<td><input name="DISTANCE" value="#GetData.DISTANCE#" type="text" size="10" class="Form"></td>
				<td><img src="images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"DISTANCE")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">DEPART</td>
				<td><input name="DATE_DEPART" value="<cfif NOT len(trim(GetData.DATE_DEPART))>#DateFormat(Now(),"dd mmm yyyy")# #TimeFormat(Now(),"HH:MM")#<cfelse>#DateFormat(GetData.DATE_DEPART,"dd mmm yyyy")# #TimeFormat(GetData.DATE_DEPART,"HH:MM")#</cfif>" type="text" size="25" class="Form"></td>
				<td><img src="images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"DATE_DEPART")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">ARRIVE</td>
				<td><input name="DATE_ARRIVE" value="<cfif NOT len(trim(GetData.DATE_ARRIVE))>#DateFormat(Now(),"dd mmm yyyy")# #TimeFormat(Now(),"HH:MM")#<cfelse>#DateFormat(GetData.DATE_ARRIVE,"dd mmm yyyy")# #TimeFormat(GetData.DATE_ARRIVE,"HH:MM")#</cfif>" type="text" size="25" class="Form"></td>
				<td><img src="images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"DATE_ARRIVE")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">STATUS</td>
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
				<td><img src="images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"STATUS_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td>
				
					<table cellpadding="2" cellspacing="0" border="0">
					<tr>
						<cfif isDefined("JourneyID")>
							<td>
							<input type="hidden" name="JourneyID" value="#JourneyID#">
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
				<td><img src="images/dotpix.gif" height="30" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>
			</table>
				
		</td>
  	</tr>
	<tr>
		<td bgcolor="##8080C0"><img src="images/dotpix.gif" height="1" width="175"></td>
		<td bgcolor="##EAEAEA"><img src="images/dotpix.gif" height="20" width="25"></td>
		<td bgcolor="##EAEAEA"><img src="images/dotpix.gif" height="1" width="550"></td>
	</tr>	
</cfoutput>
</table>

<cfinclude template="../footer.cfm">	 

</body>

</html>
