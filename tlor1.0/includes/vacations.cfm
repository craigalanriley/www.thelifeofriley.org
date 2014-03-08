<cfparam name="Front" default="0">
<cfparam name="SectionID" default="0">
<cfparam name="HowMany" default="3">

<!--- News --->
<cfquery name="GetNews" datasource="#Application.Datasource#" maxrows="#HowMany#">
	SELECT a.ARTICLE_ID, a.TITLE, a.SUMMARY, a.CONTENT, a.DATE_DISPLAY, i.FILE_NAME, i.IMAGE_NAME
	FROM articles a
	LEFT OUTER JOIN images i ON a.THUMB_ID = i.IMAGE_ID
	WHERE MODULE_ID = 6
	AND a.STATUS_ID = 1
	ORDER BY DATE_DISPLAY DESC
</cfquery>

<table width="550" border="0" cellspacing="0" cellpadding="0">
	<cfoutput query="GetNews">
	<tr>
		<cfif len(trim(FILE_NAME))>
			<td valign="top"><img src="#Application.Home#uploads/images/#FILE_NAME#" alt=" #IMAGE_NAME# "></td>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
		</cfif>
		<td valign="top">
		<span class="txt_title">#TITLE#</span> - <span class="txt_date">#DateFormat(DATE_DISPLAY,"dd mmmm yyyy")#</span>
		<br>
		#SUMMARY#<br>
		<cfif len(trim(CONTENT))><a href="##" class="more">More &gt;&gt;</a></cfif>						
		</td>
	</tr>	
	<tr><td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="10" width="1"></td></tr>
	</cfoutput>	
</table>
