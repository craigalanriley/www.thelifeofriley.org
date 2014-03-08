<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "RILEY">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet type="text/css" href="../stylesheets/riley.css">
	<script language="javascript" src="../javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderImage="header_srilanka.jpg">

<cfinclude template="../includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">		
		
			<!--- Navigation --->
			<cfinclude template="../includes/nav_riley.cfm">

			<cfinclude template="../includes/google_rectangle.cfm">		
		
		</td>
		<td><img src="../images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; #ThisPage#</td>
	</tr>
  	<tr>
    	<td><img src="../images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt">
		
		<cfif NOT isDefined("ArticleID")>			
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<cfinvoke component="#Application.CompsPath#/content_photo" method="Display" 
							FileName="monkey.jpg"
							ImageText="I'm the one in the green jacket!">	
				<span class="txt_header">#ThisPage#</span>
				<br>		
				I was born on January the 9th, a Capricorn, in 1974, the year of the Tiger.
				I was born in Grimsby Town, a vary large town but not quite big enough to be called a city 
				(kind of like being the tallest dwarf in the world!).
				Grimsby was once the largest fishing port in the world and to this day despite the near 
				devastation of the fishing industry most people still associate Grimsby with fish!
				<p>
				<i>"Great Grimsby is a market town, a sea-port and parish - 168 miles N from London, 35 NE from Lincoln, 
				and 16 SE from Hull. This place, anciently spelled Grimsbye, is advantageously situate near the mouth of the Humber, 
				and is suppossed to have been the spot where the Danes disembarked, on their first invasion of Britain, 
				towards the close of the eighth century. 
				It is one of the most ancient boroughs in the kingdom - was formerly rich and populous, 
				and possessed a considerable share of foreign commerce and internal traffic."</i><br>
				- Lincolnshire Directory, Pigot & Co., 1841				
				<p>
				Both my mother and father have spent their lives working in the fish industry, my father as a filleter
				and my mother in various factories. Despite these modest surroundings my parents provided me with a great 
				upbringing, even helping me to become one of, if not the first member of my family to go to University.				
				<p>
				I am determined to make my parents proud and make the most of my life. I try to live everyday as though 
				it is my last because I know one day it will be.
				<p>								
				</td>
			</tr>
			<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
			<tr>
				<td>					
				<cfinvoke component="#Application.CompsPath#/news" method="Articles" 
							Datasource="#Application.Datasource#"
							Home="#Application.Home#"
							Front="0" 
							Module="News & Events"
							Section="Riley" 
							Category="Any" 
							HowMany="25" 
							PerPage="25"
							OrderBy="DATE_DISPLAY DESC">	
				</td>
			</tr>
			</table>			
		<cfelse>		
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>						
				<cfinvoke component="#Application.CompsPath#/news" method="ArticleData" 
							Datasource="#Application.Datasource#"
							Home="#Application.Home#"
							ArticleID="#ArticleID#">
							
				<!--- Get Related News Articles - By Date or Category --->
				<cfparam name="DateDepart" default="Any">
				<cfparam name="DateReturn" default="Any">				
				<cfparam name="Category" default="Any">				
				<cfinvoke component="#Application.CompsPath#/news" method="RelatedNews" 
							Datasource="#Application.Datasource#"
							Home="#Application.Home#" 
							ArticleID="#ArticleID#"
							Category="#Category#"
							CountryID="Any"
							DateDepart="Any"
							DateReturn="Any">		
				</td>
			</tr>
			<tr>
				<td align="center"><a href="javascript:history.back()" onmouseover="on('back')" onmouseout="off('back')"><img src="#Application.Home#images/pagenav/back.gif" name="back" width="97" height="30" border="0" alt=" Back "></a></td>
			</tr>	
			</table>									
		</cfif>
				
		</td>
  	</tr>
	<tr>
		<td bgcolor="##CCCCCC"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td><img src="../images/dotpix.gif" height="20" width="25"></td>
		<td><img src="../images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>

<cfinclude template="../footer.cfm">	 

</body></cfoutput>	 


</html>
