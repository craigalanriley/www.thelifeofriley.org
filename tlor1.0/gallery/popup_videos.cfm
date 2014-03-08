<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfparam name="FileName" default="Not Found">

<html>
<cfoutput>
<head>
<title>The Life of Riley - GALLERY: #FileName#</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>


<cfinclude template="../includes/google_leaderboard.cfm">
<br><br>
<table border="0" cellpadding="0" cellspacing="1" align="center" bgcolor="##000000">
	<tr>
		<td align="center">			
		<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=7,0,0,0" width="400" height="400" id="dynVideo" align="middle">
		<param name="allowScriptAccess" value="sameDomain"/>
		<param name="movie" value="../video/dynVideo.swf"/>
		<param name="quality" value="high"/>
		<param name="bgcolor" value="##ffffff"/>
		<Param name="FlashVars" Value="videoFile=#FileName#">
		<embed src="../video/dynVideo.swf" FlashVars="videoFile=#FileName#" quality="high" bgcolor="##ffffff" width="400" height="400" name="dynVideo" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>
		</object>
		
		<!--- <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=7,0,0,0" width="500" height="400" id="videoplayer" align="middle">
		<param name="allowScriptAccess" value="sameDomain" />
		<param name="movie" value="../video/videoplayer.swf" />
		
		<param name="src" value="gtr.mp3">
		<param name="quality" value="high" />
		<param name="bgcolor" value="##ffffff" />
		<embed src="../video/videoplayer.swf" quality="high" bgcolor="##ffffff" width="500" height="400" name="videoplayer" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
		</object>
 		--->			
		</td>
	</tr>
</table>

</body>
</cfoutput>
</html>
