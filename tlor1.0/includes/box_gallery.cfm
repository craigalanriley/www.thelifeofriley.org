<!--- Gallery Search --->
<cfparam name="FreeText" default="">
<cfparam name="SectionID" default="">
<cfparam name="CountryID" default="">

<cfoutput>
<table width="175" border="0" cellspacing="0" cellpadding="0" bgcolor="###Application.SecHome#">
<form action="#Application.Home#gallery/index.cfm">
<tr bgcolor="###Application.PriGal#">
	<td colspan="3"><img src="#Application.Home#images/titles/title_gallerysearch.gif" height="20" width="175"></td>
</tr>
<tr bgcolor="##FFFFFF">
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="165"></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
</tr>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><input name="FreeText" type="text" value="#FreeText#" size="18" class="Form"></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td>
	<cfquery name="GetSections" datasource="#Application.Datasource#">
		SELECT SECTION_ID, SECTION
		FROM sections
	</cfquery>				
	<select name="SectionID">
		<option value="0">Any Category</option>
		<option value="">---------------------------------</option>	
		<cfloop query="GetSections">
		<option value="#SECTION_ID#" <cfif SECTION_ID EQ SectionID>SELECTED</cfif>>#SECTION#</option>
		</cfloop>
	</select>	
	</td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td>
	<cfquery name="GetCountries" datasource="#Application.Datasource#">
		SELECT COUNTRY_ID, COUNTRY
		FROM countries
		WHERE STATUS_ID = 1
		ORDER BY COUNTRY
	</cfquery>				
	<select name="CountryID">
		<option value="0">Any Country</option>
		<option value="">---------------------------------</option>
		<cfloop query="GetCountries">
		<option value="#COUNTRY_ID#" <cfif COUNTRY_ID EQ CountryID>SELECTED</cfif>>#COUNTRY#</option>
		</cfloop>
	</select>	
	</td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td>	
	<input type=""	
	</td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td><input value="SEARCH >>" type="submit" class="Form"></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr bgcolor="##FFFFFF">
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr bgcolor="###Application.PriHome#">
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="15" width="1"></td>
</tr>
</form>
</table>
<p>
</cfoutput>
