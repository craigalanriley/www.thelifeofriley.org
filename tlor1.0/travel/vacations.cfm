<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "VACATIONS">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet type="text/css" href="../stylesheets/riley.css">
	<script language="javascript" src="../javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderImage="header_manhattan.jpg">

<cfinclude template="../includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">
		
			<!--- Navigation --->
			<cfinclude template="../includes/nav_travel.cfm">
			<p>
		
		</td>
		<td><img src="../images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; <a href="#Application.Home#travel/" class="bread">TRAVEL</a> &gt; #ThisPage#</td>
	</tr>
  	<tr>
    	<td><img src="../images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt">
		
		<cfif NOT isDefined("ArticleID")>			
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<cfinvoke component="#Application.CompsPath#/content_photo" method="Display" 
							FileName="maldives.jpg"
							ImageText="Paradise Island, Maldives">
				<span class="txt_header">#ThisPage#</span>
				<br>		
				I once wrote on my CV that my ambition was to visit every country in the world before I die, I also dreamnt of
				visiting space. I was convinced that one day commercial space travel would become affordable and I could think 
				of nothing better to do to celebrate visiting my final country than viewing the earth from space!	
				<p>
				Sadly too many countries (mostly in Africa) are war torn and suffer from extreeme poverty and disease. 
				Also I have gotten a little older and although it would be great to visit them all, I am now just hoping to visit the
				ones with something truly special to see. 
				<p>
				I have visted a great number of countries already but there is still so much more to see. 
				One things for sure though I still haven't given up on making a trip to space one day!
				<p>								
				</td>
			</tr>
			<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
			<tr>
				<td>					
				<cfinvoke component="#Application.CompsPath#/vacations" method="Articles" 
							Datasource="#Application.Datasource#"
							Home="#Application.Home#"
							Front="0" 
							Module="Vacations"
							HowMany="100" 
							PerPage="25"
							OrderBy="DATE_DISPLAY DESC">	
				</td>
			</tr>
			</table>			
		<cfelse>		
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>						
				<cfinvoke component="#Application.CompsPath#/vacations" method="ArticleData" 
							Datasource="#Application.Datasource#"
							Home="#Application.Home#" 
							ArticleID="#ArticleID#">
							
				<!--- Get Related Journeys - By Date or Country --->
				<cfparam name="DateDepart" default="Any">
				<cfparam name="DateReturn" default="Any">				
				<cfinvoke component="#Application.CompsPath#/journeys" method="RelatedJourneys" 
							Datasource="#Application.Datasource#"
							Home="#Application.Home#" 
							Country="Any"
							DateDepart="#DateDepart#"
							DateReturn="#DateReturn#">
							
				<!--- Get Related News Articles - By Date or Category --->
				<cfparam name="DateDepart" default="Any">
				<cfparam name="DateReturn" default="Any">				
				<cfinvoke component="#Application.CompsPath#/news" method="RelatedNews" 
							Datasource="#Application.Datasource#"
							Home="#Application.Home#" 
							ArticleID="#ArticleID#"
							Category="Any"
							DateDepart="#DateDepart#"
							DateReturn="#DateReturn#">
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

</body>
</cfoutput>	 
</html>
