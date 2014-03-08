<!--- Navigation --->
<cfoutput>
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="###Application.SecEmp#">
<tr bgcolor="###Application.PriEmp#">
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><a href="#Application.Home#employment/" class="txt_boxtitle">EMPLOYMENT</a></td>
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
	<td><a href="#Application.Home#employment/web/index.cfm" class="nav_employment<cfif CGI.PATH_TRANSLATED CONTAINS "web">_on</cfif>">Web Development</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<cfif CGI.PATH_TRANSLATED CONTAINS "web" OR CGI.PATH_TRANSLATED CONTAINS "sitemap">
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1" border="0"></td>
	<td>
	
		<table width="165" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="10"><img src="#Application.Home#images/dotpix.gif" height="1" width="10" border="0"></td>
			<td width="155"><img src="#Application.Home#images/dotpix.gif" height="1" width="155" border="0"></td>
		</tr>
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="#Application.Home#employment/web/portfolio.cfm" class="nav_employment<cfif CGI.PATH_TRANSLATED CONTAINS "portfolio">_on</cfif>">My Portfolio</a></td>
		</tr>
		<tr>
			<td colspan="2"><img src="#Application.Home#images/dotpix.gif" height="5" width="1" border="0"></td>
		</tr>
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="#Application.Home#employment/web/training.cfm" class="nav_employment<cfif CGI.PATH_TRANSLATED CONTAINS "training">_on</cfif>">Training</a></td>
		</tr>
		<tr>
			<td colspan="2"><img src="#Application.Home#images/dotpix.gif" height="5" width="1" border="0"></td>
		</tr>
		</table>	
 	
	</td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" widt	h="1" border="0"></td>
</tr>
</cfif>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><a href="#Application.Home#employment/casual.cfm" class="nav_employment<cfif CGI.PATH_TRANSLATED CONTAINS "casual">_on</cfif>">Casual Work</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><a href="#Application.Home#employment/biz/index.cfm" class="nav_employment<cfif CGI.PATH_TRANSLATED CONTAINS "biz">_on</cfif>">Business</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<!--- <cfif CGI.PATH_TRANSLATED CONTAINS "biz">
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1" border="0"></td>
	<td>
	
		<table width="165" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="10"><img src="#Application.Home#images/dotpix.gif" height="1" width="10" border="0"></td>
			<td width="155"><img src="#Application.Home#images/dotpix.gif" height="1" width="155" border="0"></td>
		</tr>
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="#Application.Home#employment/biz/domains.cfm" class="nav_employment<cfif CGI.PATH_TRANSLATED CONTAINS "domains">_on</cfif>">My Domains</a></td>
		</tr>
		<tr>
			<td colspan="2"><img src="#Application.Home#images/dotpix.gif" height="5" width="1" border="0"></td>
		</tr>
		</table>	
 	
	</td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" widt	h="1" border="0"></td>
</tr>
</cfif> --->
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr bgcolor="###Application.PriEmp#">
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="3" width="1"></td>
</tr>
</table>
</cfoutput>
