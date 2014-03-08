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
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="FFFFFF">
	<tr>
		<td bgcolor="##8080C0"><img src="images/dotpix.gif" height="1" width="175"></td>
		<td bgcolor="##EAEAEA"><img src="images/dotpix.gif" height="30" width="1"></td>
		<td bgcolor="##EAEAEA"><span class="txt_header">Top Breaks</span> <cfif len(trim(Message))><span class="txt_message"> - #Message#</span></cfif></td>
	</tr>
  	<tr>
    	<td bgcolor="##8080C0" valign="top">
		
			<cfinclude template="includes/navigation.cfm">		
		
		</td>
    	<td bgcolor="##EAEAEA"><img src="images/dotpix.gif" height="1" width="1"></td>
    	<td bgcolor="##EAEAEA" class="txt" valign="top">
		
			<cfquery name="GetBreaks" datasource="#Application.Datasource#">
				SELECT b.BREAK_ID, b.TITLE, b.DATE_DISPLAY, b.BREAK_TYPE_ID, b.STATUS_ID, bt.BREAK_TYPE
				FROM breaks b
				LEFT OUTER JOIN break_types bt ON bt.BREAK_TYPE_ID = b.BREAK_TYPE_ID
				ORDER BY b.DATE_DISPLAY DESC, TITLE
			</cfquery>
			
			<table cellpadding="0" cellspacing="0" width="550" border="0">
			<tr>
				<td><img src="images/dotpix.gif" height="1" width="25"></td>
				<td><img src="images/dotpix.gif" height="1" width="25"></td>
				<td><img src="images/dotpix.gif" height="1" width="250"></td>
				<td><img src="images/dotpix.gif" height="1" width="125"></td>
				<td><img src="images/dotpix.gif" height="1" width="75"></td>
				<td><img src="images/dotpix.gif" height="1" width="25"></td>
				<td><img src="images/dotpix.gif" height="1" width="25"></td>
			</tr>
			<tr bgcolor="##999999">
				<td><img src="images/dotpix.gif" height="25" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td class="txt_columns">TITLE</td>
				<td class="txt_columns">CATEGORY</td>
				<td class="txt_columns">DATE</td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
				<td><img src="images/dotpix.gif" height="1" width="1"></td>
			</tr>			
			<cfloop query="GetBreaks">
				<tr>
					<td colspan="7" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
				</tr>
				<tr>
					<td><img src="images/icons/status#STATUS_ID#.gif" width="20" height="20" border="0"></td>
					<td><img src="images/dotpix.gif" height="25" width="1"></td>
					<td><a href="breaks_edit.cfm?ModuleID=#ModuleID#&BreakID=#BREAK_ID#" class="txt_link">#TITLE#</a></td>
					<td>#BREAK_TYPE#</td>
					<td>#DateFormat(DATE_DISPLAY,"dd-mm-yyyy")#</td>
					<td><a href="breaks.cfm?ModuleID=#ModuleID#&BreakID=#BREAK_ID#&Action=Delete" class="txt_link"><img src="images/icons/delete.gif" alt=" DELETE " width="20" height="20" border="0"></a></td>
					<td><a href="breaks_edit.cfm?ModuleID=#ModuleID#&BreakID=#BREAK_ID#" class="txt_link"><img src="images/icons/edit.gif" alt=" EDIT " width="20" height="20" border="0"></a></td>
				</tr>			
			</cfloop>
			<tr>
				<td colspan="7" bgcolor="##FFFFFF"><img src="images/dotpix.gif" height="2" width="1"></td>
			</tr>
			<tr>
				<td colspan="7" bgcolor="##999999"><img src="images/dotpix.gif" height="10" width="1"></td>
			</tr>
			<tr>	
				<td colspan="7" align="center">
					
					<table cellpadding="0" cellspacing="10" border="0">
						<form action="breaks_edit.cfm" method="post">
						<input type="hidden" name="ModuleID" value="#ModuleID#">
						<tr>
							<td><input value="ADD" type="submit" class="SubmitButton"></td>
						</tr>
						</form>
					</table>
				
				</td>
			</tr>				
			</table>
				
		</td>
  	</tr>
	<tr>
		<td bgcolor="##8080C0"><img src="images/dotpix.gif" height="1" width="175"></td>
		<td bgcolor="##EAEAEA"><img src="images/dotpix.gif" height="20" width="25"></td>
		<td bgcolor="##EAEAEA"><img src="images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>

<cfinclude template="../footer.cfm">	 

</body>
</cfoutput>
</html>
