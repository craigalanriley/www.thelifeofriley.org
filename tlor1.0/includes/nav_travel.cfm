<!--- Navigation --->
<cfoutput>
<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="###Application.SecTra#">
<tr bgcolor="###Application.PriTra#">
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><a href="#Application.Home#travel/" class="txt_boxtitle">TRAVEL</a></td>
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
	<td><a href="#Application.Home#travel/countries.cfm" class="nav_travel<cfif CGI.PATH_TRANSLATED CONTAINS "countries">_on</cfif>">Countries</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><a href="#Application.Home#travel/vacations.cfm" class="nav_travel<cfif CGI.PATH_TRANSLATED CONTAINS "vacations">_on</cfif>">Vacations</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><a href="#Application.Home#travel/journeys" class="nav_travel<cfif CGI.PATH_TRANSLATED CONTAINS "journeys">_on</cfif>">Journeys</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<cfif CGI.PATH_TRANSLATED CONTAINS "journeys" OR CGI.PATH_TRANSLATED CONTAINS "sitemap">
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
			<td><a href="#Application.Home#travel/journeys/flights.cfm" class="nav_travel<cfif CGI.PATH_TRANSLATED CONTAINS "flights">_on</cfif>">Plane</a></td>
		</tr>
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="#Application.Home#travel/journeys/helicopter.cfm" class="nav_travel<cfif CGI.PATH_TRANSLATED CONTAINS "helicopter">_on</cfif>">Helicopter</a></td>
		</tr>
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="#Application.Home#travel/journeys/train.cfm" class="nav_travel<cfif CGI.PATH_TRANSLATED CONTAINS "train">_on</cfif>">Train</a></td>
		</tr>
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="#Application.Home#travel/journeys/bus.cfm" class="nav_travel<cfif CGI.PATH_TRANSLATED CONTAINS "bus">_on</cfif>">Bus</a></td>
		</tr>
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="#Application.Home#travel/journeys/boat.cfm" class="nav_travel<cfif CGI.PATH_TRANSLATED CONTAINS "boat">_on</cfif>">Boat</a></td>
		</tr>
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="#Application.Home#travel/journeys/car.cfm" class="nav_travel<cfif CGI.PATH_TRANSLATED CONTAINS "car">_on</cfif>">Car</a></td>
		</tr>
		<tr>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
			<td><a href="#Application.Home#travel/journeys/other.cfm" class="nav_travel<cfif CGI.PATH_TRANSLATED CONTAINS "other">_on</cfif>">Other</a></td>
		</tr>
		<tr>
			<td colspan="2"><img src="#Application.Home#images/dotpix.gif" height="5" width="1" border="0"></td>
		</tr>
		</table>	
 	
	</td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
</tr>
</cfif>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr bgcolor="###Application.PriTra#">
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="3" width="1"></td>
</tr>
</table>
</cfoutput>
