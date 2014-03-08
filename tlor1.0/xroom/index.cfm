<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfparam name="Message" default="">
<cfparam name="UserName" default="">
<cfparam name="Password" default="">

<cfif isDefined("Action")>

	<cfif UserName EQ "" OR Password EQ "">
		<cfset Message = "You must complete both the fields">
	<cfelse>
	
		<cfquery name="GetUser" datasource="#Application.Datasource#">
			SELECT USER_TYPE_ID,USERNAME,PASSWORD
			FROM admin_users
			WHERE USERNAME = '#UserName#'
			AND PASSWORD = '#Password#'
		</cfquery>	
		
		<cfif GetUser.RecordCount>
			<cfset Session.UserTypeID = GetUser.USER_TYPE_ID>			
			<cflocation url="home.cfm" addtoken="No">
		<cfelse>
			<cfset Message = "That user doesnt exist, please try again">
		</cfif>
	
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
		<td bgcolor="##8080C0"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td><img src="../images/dotpix.gif" height="30" width="1"></td>
		<td><span class="txt_header">Xroom</span> <cfif len(trim(Message))><span class="txt_message"> - #Message#</span></cfif></td>
	</tr>
  	<tr>
    	<td bgcolor="##8080C0" valign="top">
		
			<!--- Nested Login Table --->
			<table cellspacing="3" cellpadding="0" border="0" align="center">
			<form action="index.cfm" method="post">
			<input type="hidden" name="Action" value="1">
			<tr>
				<td class="txt">User:</td>
				<td><img src="images/spacer.gif" width="1" height="1" border="0"></td>
				<td align="center"><input type="text" name="UserName" size="10" class="Form" value="#UserName#"></td>
			</tr>
			<tr>
				<td class="txt">Password:</td>
				<td><img src="images/spacer.gif" width="1" height="1" border="0"></td>
				<td align="center"><input type="password" name="Password" size="10" class="Form" value="#Password#"></td>
			</tr>
			<tr>
				<td><img src="images/spacer.gif" width="1" height="1" border="0"></td>
				<td><img src="images/spacer.gif" width="1" height="1" border="0"></td>
				<td><img src="images/spacer.gif" width="1" height="1" border="0"><input type="submit" value="LOGIN" class="SubmitButton"></td>
			</tr>				
			</form>
			</table>		
		
		</td>
    	<td><img src="../images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt" valign="top">		
		Xroom is a new Content Management System (CMS) developed by myself. I have developed at least 3 different 
		CMS's in recent years. I have used this experience to create a new bread of CMS that offers functionality 
		and usability never before seen. 
		<p>
		<img src="../images/dotpix.gif" height="100" width="1">	
				
		</td>
  	</tr>
	<tr>
		<td bgcolor="##8080C0"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td><img src="../images/dotpix.gif" height="20" width="25"></td>
		<td><img src="../images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>

<cfinclude template="../footer.cfm">	 

</cfoutput>	 
</body>

</html>
