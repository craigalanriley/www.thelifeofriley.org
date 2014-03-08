<!--- Navigation --->
<cfoutput>
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="###Application.SecRil#">
<tr bgcolor="###Application.PriRil#">
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><a href="#Application.Home#riley/" class="txt_boxtitle">RILEY</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr bgcolor="##FFFFFF">
	<td width="5"><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
	<td width="100%"><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
	<td width="5"><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
</tr>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><a href="#Application.Home#riley/biography.cfm" class="nav_riley<cfif CGI.PATH_TRANSLATED CONTAINS "biography">_on</cfif>">Biography</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><a href="#Application.Home#riley/family.cfm" class="nav_riley<cfif CGI.PATH_TRANSLATED CONTAINS "family">_on</cfif>">Family</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><a href="#Application.Home#riley/genealogy.cfm" class="nav_riley<cfif CGI.PATH_TRANSLATED CONTAINS "genealogy">_on</cfif>">Genealogy</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr bgcolor="###Application.PriRil#">
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="3" width="1"></td>
</tr>
</table>
</cfoutput>
