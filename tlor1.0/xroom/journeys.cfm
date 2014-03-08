<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfinclude template="includes/loggedin.cfm">

<cfparam name="Message" default="">

<html>
<cfoutput>
<head>
	<title>The Life of Riley</title>
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
		<td bgcolor="##EAEAEA"><span class="txt_header">Journeys</span> <cfif len(trim(Message))><span class="txt_message"> - #Message#</span></cfif></td>
	</tr>
  	<tr>
    	<td bgcolor="##8080C0" valign="top">
		
			<cfinclude template="includes/navigation.cfm">		
		
		</td>
    	<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="1" width="1"></td>
    	<td bgcolor="##EAEAEA" class="txt" valign="top">
		
			<cfquery name="GetJourneys" datasource="#Application.Datasource#">
				SELECT j.JOURNEY_ID, j.REF, j.OPERATOR, j.CLASS, j.DISTANCE, j.DATE_DEPART, j.DATE_ARRIVE, j.STATUS_ID,
					   c1.CITY AS JOURNEY_FROM,
					   c2.CITY AS JOURNEY_TO
				FROM journeys j
				LEFT OUTER JOIN cities c1 ON c1.CITY_ID = j.JOURNEY_FROM 
				LEFT OUTER JOIN cities c2 ON c2.CITY_ID = j.JOURNEY_TO 
				ORDER BY DATE_DEPART DESC
			</cfquery>
			
			<table cellpadding="0" cellspacing="0" width="550" border="0">
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="25"></td>
				<td><img src="../images/dotpix.gif" height="1" width="25"></td>
				<td><img src="../images/dotpix.gif" height="1" width="250"></td>
				<td><img src="../images/dotpix.gif" height="1" width="125"></td>
				<td><img src="../images/dotpix.gif" height="1" width="75"></td>
				<td><img src="../images/dotpix.gif" height="1" width="25"></td>
				<td><img src="../images/dotpix.gif" height="1" width="25"></td>
			</tr>
			<tr bgcolor="##999999">
				<td><img src="../images/dotpix.gif" height="25" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td class="txt_columns">FROM / TO</td>
				<td class="txt_columns">DEPART</td>
				<td class="txt_columns">ARRIVE</td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
			</tr>			
			<cfloop query="GetJourneys">
				<tr>
					<td colspan="7" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
				</tr>
				<tr>
					<td><img src="images/icons/status#STATUS_ID#.gif" width="20" height="20" border="0"></td>
					<td><img src="../images/dotpix.gif" height="1" width="1"></td>
					<td><a href="journey_edit.cfm?ModuleID=#ModuleID#&JourneyID=#JOURNEY_ID#" class="txt_link"><cfif len(JOURNEY_FROM&" <strong>to</strong> "&JOURNEY_TO) GT 40>#LEFT(JOURNEY_FROM&' <strong>to</strong> '&JOURNEY_TO,'40')#...<cfelse>#JOURNEY_FROM# <strong>to</strong> #JOURNEY_TO#</cfif></a></td>
					<td class="txt_date">#DateFormat(DATE_DEPART,"dd-mm-yyyy")#</td>
					<td class="txt_date">#DateFormat(DATE_ARRIVE,"dd-mm-yyyy")#</td>
					<td><a href="journies.cfm?ModuleID=#ModuleID#&JourneyID=#JOURNEY_ID#&Action=Delete" class="txt_link"><img src="images/icons/delete.gif" alt=" DELETE " width="20" height="20" border="0"></a></td>
					<td><a href="journey_edit.cfm?ModuleID=#ModuleID#&JourneyID=#JOURNEY_ID#" class="txt_link"><img src="images/icons/edit.gif" alt=" EDIT " width="20" height="20" border="0"></a></td>
				</tr>			
			</cfloop>
			<tr>
				<td colspan="7" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>
			<tr>
				<td colspan="7" bgcolor="##999999"><img src="../images/dotpix.gif" height="10" width="1"></td>
			</tr>
			<tr>	
				<td colspan="7" align="center">
					
					<table cellpadding="0" cellspacing="10" border="0">
					<cfoutput>
						<form action="journey_edit.cfm" method="post">
						<input type="hidden" name="ModuleID" value="#ModuleID#">
						<tr>
							<td><input value="ADD" type="submit" class="SubmitButton"></td>
						</tr>
						</form>
					</cfoutput>
					</table>
				
				</td>
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
