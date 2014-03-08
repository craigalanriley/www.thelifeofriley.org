<!--  
Design and Technology by Xroom
Built by Craig Riley April 2006
-->

<cfparam name="Message" default="">
<cfparam name="MessageType" default="success">
<cfparam name="Login" default="0">
<cfparam name="PageTitle" default="CMS">
<cfparam name="HowMany" default="10">
<cfparam name="url.Module" default="">

<cfif Login>

	<cfquery name="CheckUser" datasource="#Application.DataSource#">
		select admin_user_id, first_name, family_name
		from cms_users 
		where email = '#FORM.Email#'
		and password = '#FORM.Password#'
	</cfquery>
	
	<cfif CheckUser.RecordCount>
		<cfset Session.UserID = CheckUser.admin_user_id>
		<cfset Message = "Welcome you are logged in as #CheckUser.first_name# #CheckUser.family_name#,1">
	<cfelse>
		<cfset Message = "Sorry - user not found,0">
	</cfif>

</cfif>

<html>
<cfoutput>
<head>
	<title>#Application.SiteName# CMS - #PageTitle#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel="stylesheet" type="text/css" href="#Application.Home#cms/css/cms.css">
	<script language="JavaScript" src="#Application.Home#cms/javascript/rollover.js"></script>
	<script language="JavaScript" src="#Application.Home#cms/javascript/checkbox.js"></script>
	<script language="JavaScript" src="#Application.Home#cms/javascript/simplecalendar.js"></script>	
</head>

<body><!---  --->

<a name="TOP">

<!--- Main Header --->
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">  
<tr>
	<td><img src="#Application.Home#cms/images/dotpix.gif" width="216" height="1" border="0"></td>
	<td><img src="#Application.Home#cms/images/dotpix.gif" width="334" height="1" border="0"></td>
	<td><img src="#Application.Home#cms/images/dotpix.gif" width="200" height="1" border="0"></td>
</tr>
<tr>
    <td><a href="http://www.log1k.com" target="_blank"><img src="#Application.Home#cms/images/logo_log1k.jpg" alt=" Log1k.com " width="216" height="77" border="0" align="left"></a></td>
    <td align="center"><a href="#Application.Home#"><img src="#Application.Home#cms/images/dotpix.gif" width="167" height="100" border="0"></a></td>
    <td align="right">
	<cfif isDefined("Session.UserID")>
		<!--- Generic Nav --->
		<table border="0" cellspacing="0" cellpadding="0">
		  <tr><td align="right"><a href="#Application.Home#cms/index.cfm" class="generic<cfif GetFileFromPath(GetBaseTemplatePath()) EQ "index.cfm">_on</cfif>">Home</a></td></tr>
		  <tr><td align="right"><a href="#Application.Home#cms/workflow.cfm" class="generic<cfif GetFileFromPath(GetBaseTemplatePath()) EQ "workflow.cfm">_on</cfif>">Work Flow</a></td></tr>
		  <tr><td align="right"><a href="##" class="generic" target="_blank">Statistics</a></td></tr>
		  <tr><td align="right"><a href="#Application.Home#cms/index.cfm?LogOut=1" class="generic">Logout</a></td></tr>
		</table>	
	<cfelse>
		&nbsp;
	</cfif>
	</td>
</tr>
</table>

<!--- Primary Nav Bar --->
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
  	<td><img src="#Application.Home#cms/images/dotpix.gif" width="5" height="1" border="0"></td>
	<td><img src="#Application.Home#cms/images/dotpix.gif" width="575" height="1" border="0"></td>
  	<td><img src="#Application.Home#cms/images/dotpix.gif" width="165" height="1" border="0"></td>
	<td><img src="#Application.Home#cms/images/dotpix.gif" width="5" height="1" border="0"></td>
  </tr>
  <tr bgcolor="##000000">
    <td align="left"><img src="#Application.Home#cms/images/dotpix.gif" width="5" height="30" border="0" alt="left"></td>	
    <cfif isDefined("Session.UserID")>
	<td>	
		<!--- 
		Get User Type Module Permissions to determine which module can be accessed: 
		If they have ANY work flow type acces they can view the module but permissions within the 
		module will differ depending on what work flow type permissions they have
		--->		
		<cfquery name="GetCoreModules" datasource="#Application.DataSource#">
			select m.*
			from cms_user_type_lookup autl, cms_users au, cms_modules m
			where au.admin_user_type_id = autl.admin_user_type_id
			AND autl.module_id = m.module_id
			AND m.core = 1
 			AND au.admin_user_id = #session.UserID#
			ORDER BY m.module_id
		</cfquery>	
		<!--- <cfset ModuleList = ValueList(GetModulePermissions.module_id)>	 --->	
		<!--- <cfdump var="#ModuleList#"> --->
		<!--- Primary Nav --->
		<table border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<cfloop query="GetCoreModules">
				<td><cfif Module EQ url.Module><span class="txt_primary_on">#module#</span><cfelse><a href="#template#?Module=#module#"class="txt_primary">#module#</a></cfif></td>
				<td><img src="#Application.Home#cms/images/dotpix.gif" width="12" height="1" border="0"></td>
			</cfloop>
		  </tr>
		</table>
	
	</td>
	<!--- Dynamic Modules --->
	<form name="ModuleForm" method="post" action="?Module=#Module#">
    <td align="right">
		<cfquery name="GetModulePermissions" datasource="#Application.DataSource#">
			select m.*
			from cms_user_type_lookup autl, cms_users au, cms_modules m
			where au.admin_user_type_id = autl.admin_user_type_id
			AND autl.module_id = m.module_id
			AND m.core = 0
 			AND au.admin_user_id = #session.UserID#
			ORDER BY module
		</cfquery>		
		<cfif GetModulePermissions.RecordCount>
			<select name="UserModules" onChange="window.location=document.ModuleForm.UserModules.options[document.ModuleForm.UserModules.selectedIndex].value">
				<option value="?Module=#Module#">-- Select Module --</option>
				<cfloop query="GetModulePermissions">
					<option value="#template#?Module=#Module#" <cfif url.Module EQ module>SELECTED</cfif>>#module#</option>
				</cfloop>
			</select>
		</cfif>
	<!--- <a href="##" class="txt_primary">Modules &gt;</a> --->
	</td>
	</form>
    <cfelse>
		<td colspan="2">&nbsp;</td>
	</cfif>
	<td align="right"><img src="#Application.Home#cms/images/dotpix.gif" width="5" height="30" border="0" alt="right"></td>
  </tr>
</table>  
</cfoutput>
