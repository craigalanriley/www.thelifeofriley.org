<!--- Gallery Search --->
<cfparam name="FreeText" default="">
<cfparam name="SectionID" default="">

<cfoutput>
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="###Application.SecGal#">
<form action="#Application.Home#gallery/index.cfm">
<tr bgcolor="###Application.PriGal#">
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td class="txt_boxtitle">GALLERY</td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr bgcolor="##FFFFFF">
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
	<td width="100%"><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
</tr>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><a href="#Application.Home#gallery/pictures.cfm" class="nav_gallery<cfif CGI.PATH_TRANSLATED CONTAINS "pictures">_on</cfif>">Pictures</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><a href="#Application.Home#gallery/videos.cfm" class="nav_gallery<cfif CGI.PATH_TRANSLATED CONTAINS "videos">_on</cfif>">Videos</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr bgcolor="###Application.PriGal#">
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="3" width="1"></td>
</tr>
</form>
</table>
</cfoutput>
