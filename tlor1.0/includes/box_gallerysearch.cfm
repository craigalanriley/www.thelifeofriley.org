<!--- Gallery Search --->
<cfparam name="FreeText" default="">
<cfparam name="SectionID" default="">
<cfparam name="CountryID" default="">

<cfoutput>
<table width="175" border="0" cellspacing="0" cellpadding="0" bgcolor="###Application.SecHome#">
<form name="GallerySearch" action="#Application.Home#gallery/index.cfm">
<input type="hidden" name="FrontPage" value="Any">
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
	<td align="left"><input name="FreeText" type="text" value="#FreeText#" size="15" class="Form"></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr>
	<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
	<td align="left">
	<cfquery name="GetSections" datasource="#Application.Datasource#">
		SELECT section_id, section_name
		FROM cms_sections
	</cfquery>				
	<select name="SectionID" style="width:160px">
		<option value="Any">Any Section</option>
		<cfloop query="GetSections">
			<option value="#section_id#" <cfif section_id EQ SectionID>SELECTED</cfif>>#section_name#</option>
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
	<td align="left">
	<cfquery name="GetCountries" datasource="#Application.Datasource#">
		SELECT COUNTRY_ID, COUNTRY
		FROM countries
		WHERE STATUS_ID = 1
		ORDER BY COUNTRY
	</cfquery>				
	<select name="CountryID" style="width:160px">
		<option value="Any">Any Country</option>
		<cfloop query="GetCountries">
			<option value="#COUNTRY_ID#" <cfif COUNTRY_ID EQ CountryID>SELECTED</cfif>>#COUNTRY#</option>
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
	<td class="txt" align="left">	
	<!--- <input type="radio" name="GalleryType" value="Any" > Any --->
	<input type="radio" name="GalleryType" value="0" checked> Photos
	<input type="radio" name="GalleryType" value="1"> Videos
	</td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr>
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td>
</tr>
<tr bgcolor="##FFFFFF">
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr bgcolor="###Application.PriHome#">
	<td><img src="#Application.Home#images/dotpix.gif" height="15" width="1"></td>
	<td align="right"><a href="javascript:document.GallerySearch.submit();" class="txt_box_more">Search &gt;&gt;</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
</form>
</table>
<p>
</cfoutput>
