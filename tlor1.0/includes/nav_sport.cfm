<!--- Navigation --->
<cfoutput>
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="###Application.SecSpo#">
<tr bgcolor="###Application.PriSpo#">
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1" border="0"></td>
	<td><a href="#Application.Home#sport/" class="txt_boxtitle">SPORT &amp; LEISURE</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr>
<tr bgcolor="##FFFFFF">
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5" border="0"></td>
	<td width="100%"><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5" border="0"></td>
</tr>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1" border="0"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1" border="0"></td>
	<td><a href="#Application.Home#sport/snooker/index.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "snooker">_on</cfif>">Snooker</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr>
<cfif CGI.PATH_TRANSLATED CONTAINS "snooker" OR CGI.PATH_TRANSLATED CONTAINS "sitemap">
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1" border="0"></td>
	<td>
	
		<table width="165" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="10"><img src="#Application.Home#images/dotpix.gif" height="1" width="10" border="0"></td>
			<td width="155"><img src="#Application.Home#images/dotpix.gif" height="1" width="155" border="0"></td>
		</tr>		
		<!--- <tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="yts.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "yts">_on</cfif>">Youth Training Scheme</a></td>
		</tr>
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="honours.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "honours">_on</cfif>">Honours</a></td>
		</tr> --->
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="#Application.Home#sport/snooker/breaks.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "breaks">_on</cfif>">Highest Breaks</a></td>
		</tr>
		<!--- <tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="press.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "press">_on</cfif>">Press</a></td>
		</tr>	 --->
		<tr>
			<td colspan="2"><img src="#Application.Home#images/dotpix.gif" height="5" width="1" border="0"></td>
		</tr>
		</table>	
 	
	</td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr>
</cfif>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1" border="0"></td>
	<td><a href="#Application.Home#sport/8ball/index.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "8ball">_on</cfif>">8 Ball Pool</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr>
<!--- 
<cfif CGI.PATH_TRANSLATED CONTAINS "8ball">
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
			<td><a href="honours.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "honours">_on</cfif>">Honours</a></td>
		</tr>		
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="money.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "money">_on</cfif>">Money Matches</a></td>
		</tr>
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="press.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "press">_on</cfif>">Press</a></td>
		</tr> 
		<tr>
			<td colspan="2"><img src="#Application.Home#images/dotpix.gif" height="5" width="1" border="0"></td>
		</tr>
		</table>	
 	
	</td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr>
</cfif>--->
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1" border="0"></td>
	<td><a href="#Application.Home#sport/9ball/index.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "9ball">_on</cfif>">9 Ball Pool</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr>
<!--- <cfif CGI.PATH_TRANSLATED CONTAINS "9ball">
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
			<td><a href="honours.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "honours">_on</cfif>">Honours</a></td>
		</tr>
		<tr>
			<td colspan="2"><img src="#Application.Home#images/dotpix.gif" height="5" width="1" border="0"></td>
		</tr>
		</table>	
 	
	</td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr>
</cfif> --->
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1" border="0"></td>
	<td><a href="#Application.Home#sport/football.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "football">_on</cfif>">Football</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1" border="0"></td>
	<td><a href="#Application.Home#sport/sportingevents.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "sporting">_on</cfif>">Sporting Events</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1" border="0"></td>
	<td><a href="#Application.Home#sport/concertsandshows.cfm" class="nav_sport<cfif CGI.PATH_TRANSLATED CONTAINS "concerts">_on</cfif>">Concerts &amp; Shows</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr>
<!--- 
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1" border="0"></td>
	<td><a href="##" class="nav_sport">Athletics</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1" border="0"></td>
	<td><a href="##" class="nav_sport">Swimming</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr> 
--->
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1" border="0"></td>
</tr>
<tr bgcolor="###Application.PriSpo#">
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="3" width="1" border="0"></td>
</tr>
</table>
</cfoutput>
