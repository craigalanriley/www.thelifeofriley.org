<!--text used in the movie
<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="175" height="200" id="clipofthe" align="middle">
<param name="allowScriptAccess" value="sameDomain" />
<param name="movie" value="video/clipofthe.swf" />
<param name="quality" value="high" />
<param name="bgcolor" value="#666666" />
<embed src="video/clipofthe.swf" quality="high" bgcolor="#666666" width="175" height="200" name="clipofthe" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
</object>-->

<cfquery name="GetClip" datasource="#Application.DataSource#" maxrows="1">
	SELECT v.title, v.file_name
	FROM cms_videos v
	WHERE work_flow_id = 1 
	AND front_page = 1
	ORDER BY date_modified desc
</cfquery>	

<cfif GetClip.RecordCount>

	<cfoutput>
	<!--- YouTube --->
	<table width="175" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="###Application.PriHome#">
			<td><img src="#Application.Home#images/titles/title_clipofday.gif" height="20" width="175"></td>
		</tr>
		<tr bgcolor="##FFFFFF">
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
		</tr>
	</table>
	<cfset vName = GetClip.file_name>
	
	<table border="0" cellpadding="0" cellspacing="0"><tr><td><object border="0" width="175" height="150" hspace="0" vspace="0" style="padding:0px 0px 0px 0px"><param name="movie" value="http://www.youtube.com/v/#vName#" style="padding:0px 0px 0px 0px"></param><param name="wmode" value="transparent" style="padding:0px 0px 0px 0px"></param><embed src="http://www.youtube.com/v/#vName#" type="application/x-shockwave-flash" wmode="transparent" width="175" height="150" style="padding:0px 0px 0px 0px"></embed></object></td></tr></table>
	</cfoutput>
	<p>
	<!--- <cfdump var="#GetClip#"> --->
</cfif>
<!--- t3Gl1o1TqVc,QxR6RE3SB-U,JkS2ozKOEhA --->






