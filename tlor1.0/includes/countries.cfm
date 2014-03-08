<cfparam name="Front" default="0">
<cfparam name="SectionID" default="0">
<cfparam name="HowMany" default="3">

<!--- News --->
<cfquery name="GetCountries" datasource="#Application.Datasource#">
	SELECT c.COUNTRY_ID, c.VISITS, c.COUNTRY, c.SUMMARY, c.CONTENT, c.DATE_CREATED, ct.CONTINENT, i.FILE_NAME, i.IMAGE_NAME
	FROM countries c
	LEFT OUTER JOIN images i ON i.IMAGE_ID = c.THUMB_ID
	LEFT OUTER JOIN continents ct ON ct.CONTINENT_ID = c.CONTINENT_ID
	WHERE c.THUMB_ID = i.IMAGE_ID
	AND c.STATUS_ID = 1
	ORDER BY COUNTRY
</cfquery>

<span class="txt">I have visited the following <cfoutput>#GetCountries.Recordcount#</cfoutput> countries:</span>
<p>
<table width="550" border="0" cellspacing="0" cellpadding="0">
	<cfoutput query="GetCountries">
	<tr>
		<td valign="top"><img src="#Application.Home#uploads/images/#FILE_NAME#" width="75" height="50" border="1" alt=" #IMAGE_NAME# "></td>
		<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
		<td valign="top">
		<span class="txt_title">#COUNTRY#</span>
		<br>
		On <span class="txt_date">#DateFormat(DATE_CREATED,"dd mmmm yyyy")#</span> I visited to #COUNTRY# for the first time. 
		<cfif VISITS GT 1>I have been to #COUNTRY# a total of #VISITS# times.<cfelse>I have not managed to return since then.</cfif><br>
		<cfif len(trim(CONTENT))><a href="##" class="more">More &gt;&gt;</a></cfif>						
		</td>
	</tr>	
	<tr>
		<td><img src="#Application.Home#images/dotpix.gif" height="10" width="80" border="0"></td>
		<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5" border="0"></td>
		<td><img src="#Application.Home#images/dotpix.gif" height="1" width="465" border="0"></td>
	</tr>
	</cfoutput>	
</table>
