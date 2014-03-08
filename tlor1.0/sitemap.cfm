<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "SITE MAP">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta name="keywords" content="Craig,Riley,the life of riley,Snooker,Pool,8 Ball,Grimsby,Sydney,Australia,Coldfusion,Web Developer," />
	<meta name="description" content="The Life of Riley is the personal website of Craig Riley, Web Developer and Pool Hustler"/>
	<meta http-equiv="content-type" content="text/html;charset=iso-8859-1"/>
	<link rel=stylesheet type="text/css" href="stylesheets/riley.css">
	<script language="javascript" src="javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderImage="header_riosugarloaf.jpg">

<cfinclude template="includes/header.cfm">


<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">
		
			<!--- <cfinclude template="includes/box_thisday.cfm"> --->
	
			<!--- <cfinclude template="includes/box_clipofday.cfm"> --->
			
			<!--- <cfinclude template="includes/box_snooker.cfm"> --->
							
			<cfinclude template="includes/box_gallerysearch.cfm">			

			<cfinclude template="includes/google_rectangle.cfm">		
		
		</td>
		<td><img src="images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; #ThisPage#</td>
	</tr>
  	<tr>
    	<td><img src="images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt" valign="top">
		
		<span class="txt_header">#ThisPage#</span>
		<br>		
		This page contains a link to all the pages contained within the site.
		<p>		
		<table width="550" border="0" cellspacing="0" cellpadding="0">
		<tr bgcolor="##333333">
			<td><img src="#Application.Home#images/dotpix.gif" height="20" width="5"></td>
			<td width="100%"><a href="#Application.Home#" class="txt_boxtitle">HOME</a></td>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
		</tr>
		<tr bgcolor="##666666">
			<td><img src="#Application.Home#images/dotpix.gif" height="20" width="5"></td>
			<td width="100%"><a href="#Application.Home#sitemap.cfm" class="txt_boxtitle">SITE MAP</a></td>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
		</tr>
		<tr bgcolor="##999999">
			<td><img src="#Application.Home#images/dotpix.gif" height="20" width="5"></td>
			<td width="100%"><a href="#Application.Home#contact.cfm" class="txt_boxtitle">CONTACT</a></td>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
		</tr>
		</table>		
		
		<img src="images/dotpix.gif" height="10" width="1"><br>
	
		<!--- ### RILEY NAV ### --->
		<cfinclude template="includes/nav_riley.cfm">
	
		<img src="images/dotpix.gif" height="10" width="1"><br>
	
		<!--- ### RILEY NAV ### --->
		<cfinclude template="includes/nav_education.cfm">
		
		<img src="images/dotpix.gif" height="10" width="1"><br>
	
		<!--- ### RILEY NAV ### --->
		<cfinclude template="includes/nav_employment.cfm">		
		
		<img src="images/dotpix.gif" height="10" width="1"><br>
	
		<!--- ### RILEY NAV ### --->
		<cfinclude template="includes/nav_sport.cfm">	
		
		<img src="images/dotpix.gif" height="10" width="1"><br>
	
		<!--- ### RILEY NAV ### --->
		<cfinclude template="includes/nav_travel.cfm">	
		
		<img src="images/dotpix.gif" height="10" width="1"><br>
	
		<!--- ### RILEY NAV ### --->
		<cfinclude template="includes/nav_gallery.cfm">	
		
		
		</td>
  	</tr>
	<tr>
		<td bgcolor="##CCCCCC"><img src="images/dotpix.gif" height="1" width="175"></td>
		<td><img src="images/dotpix.gif" height="20" width="25"></td>
		<td><img src="images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>

<cfinclude template="footer.cfm">	 

</body></cfoutput>	 


</html>
