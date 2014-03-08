<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "GALLERY">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet type="text/css" href="../stylesheets/riley.css">
	<script language="javascript" src="../javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderImage="header_hk5.jpg">

<cfinclude template="../includes/header.cfm"> 

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">
		
			<!--- Navigation --->
			<cfinclude template="../includes/box_gallery.cfm">
			<p>		
		
		</td>
		<td><img src="../images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; #ThisPage#</td>
	</tr>
	</cfoutput>	
  	<tr>
    	<td><img src="../images/dotpix.gif" height="150" width="1"></td>
    	<td class="txt" valign="top">					
			
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="550" height="400" id="videoStream" align="middle">
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="movie" value="../video/videoStream.swf" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="#ffffff" />
			<embed src="../video/videoStream.swf" quality="high" bgcolor="#ffffff" width="550" height="400" name="videoStream" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>			
				
		</td>
  	</tr>
	<cfoutput>
	<tr>
		<td bgcolor="##CCCCCC"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td><img src="../images/dotpix.gif" height="20" width="25"></td>
		<td><img src="../images/dotpix.gif" height="1" width="550"></td>
	</tr>
	</cfoutput>
</table>

<cfinclude template="../footer.cfm">	 

</body>
</html>
