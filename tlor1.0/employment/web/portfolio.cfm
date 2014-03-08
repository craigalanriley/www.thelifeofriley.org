<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "Web Portfolio">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet type="text/css" href="../../stylesheets/riley.css">
	<script language="javascript" src="../../javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderImage="header_vegasview1.jpg">

<cfinclude template="../../includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">
		
			<!--- Navigation --->
			<cfinclude template="../../includes/nav_employment.cfm">
		
		</td>
		<td><img src="../../images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; <a href="#Application.Home#employment/" class="bread">EMPLOYMENT</a> &gt; <a href="#Application.Home#employment/web/" class="bread">WEB DEVELOPMENT</a> &gt; #ThisPage#</td>
	</tr>
  	<tr>
    	<td><img src="../../images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt">
		
		<cfif NOT isDefined("ArticleID")>			
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<cfinvoke component="#Application.CompsPath#/content_photo" method="Display" 
							FileName="degree.jpg"
							ImageText="1999 Unniversity Graduation">
				<span class="txt_header">#ThisPage#</span>
				<br>		
				This page contains a list of many of the web sites that I have worked on in some capacity since I built my first website in 1997. It was during my sandwich year at University that I really caught the web development bug. I was lucky enough to win a placement at Compaq Computers as a product engineer, but this role didn’t really offer me the chance to do much coding. Therefore Compaq allowed me to borrow a computer so I could work at home on my passion for web development in my spare time. 
				<p>
				I wasted little time teaching myself the basics and it was not long before I built me first website, Discount World! A friend and I had decided to sell software CD’s on the internet, I built the website and my partner posted out the CD’s. We got thousands of hits from various links on popular gaming websites and we where soon receiving envelopes of cash from all around the world!
				<p>
				This page is still a work in progress unfortunately but I hope to provide an in depth case study of some of the bigger projects I have worked on soon. I am also using various methods such as the web archive and contacting ex employers to try and locate the missing screenshots.
				</td>
			</tr>
			<tr><td><img src="../../images/dotpix.gif" height="10" width="1"></td></tr>
			<tr>
				<td>								
		
				<cfparam name="FreeText" default="">
				<cfparam name="Employers" default="0">
				<cfparam name="WebTechs" default="0">		
				
				<p><a name="results"></a></p>
				
				<!--- Search Box --->
				<cfparam name="FreeText" default="">
				<table width="550" border="0" cellspacing="1" cellpadding="5" bgcolor="##000000">
				<form name="frm" action="portfolio.cfm?##results" method="post">
				<tr bgcolor="##CCCCCC">
					<td align="center">
					<input type="text" name="FreeText" value="#FreeText#">
					
					<cfquery name="GetEmployers" datasource="#Application.DataSource#">
						SELECT e.*
						FROM employers e	
					</cfquery>		
					<select name="Employers">
						<option value="0">Any Employer</option>
						<cfloop query="GetEmployers">
							<option value="#EMPLOYER_ID#" <cfif Employers EQ EMPLOYER_ID>SELECTED</cfif>>#EMPLOYER#</option>
						</cfloop>
					</select>	
					
					<cfquery name="GetWebTechs" datasource="#Application.DataSource#">
						SELECT DISTINCT(wt.TECH_ID), wt.TECH_NAME
						FROM web_techs wt		
						INNER JOIN article_webtech_lookup awtl
						ON wt.TECH_ID = awtl.TECH_ID
						ORDER BY wt.ORDER_BY
					</cfquery>		
					<select name="WebTechs">
						<option value="0">Any Technology</option>
						<cfloop query="GetWebTechs">
							<option value="#TECH_ID#" <cfif WebTechs EQ TECH_ID>SELECTED</cfif>>#TECH_NAME#</option>
						</cfloop>
					</select>			
					
					<input type="submit" value=" Search ">
					</td>
				</tr>
				</form>
				</table>	
					
				<cfinvoke component="#Application.CompsPath#/portfolio" method="Articles" 
							Datasource="#Application.Datasource#"
							Home="#Application.Home#"
							Front="0" 
							Module="Web Portfolio"
							HowMany="500" 
							PerPage="5"
							OrderBy="a.DATE_DISPLAY DESC"
							FreeText="#FreeText#"
							Employers="#Employers#"
							WebTechs="#WebTechs#">	
				</td>
			</tr>
			</table>			
		<cfelse>		
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>						
				<cfinvoke component="#Application.CompsPath#/portfolio" method="ArticleData" 
							Datasource="#Application.Datasource#"
							Home="#Application.Home#"
							ArticleID="#ArticleID#">
							
				<!--- Get Related News Articles - By Date or Category --->
				<cfparam name="DateDepart" default="Any">
				<cfparam name="DateReturn" default="Any">				
				<cfparam name="Category" default="Any">				
				<cfinvoke component="#Application.CompsPath#/portfolio" method="RelatedNews" 
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
		<td bgcolor="##CCCCCC"><img src="../../images/dotpix.gif" height="1" width="175"></td>
		<td><img src="../../images/dotpix.gif" height="20" width="25"></td>
		<td><img src="../../images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>

<cfinclude template="../../footer.cfm">	 

</body></cfoutput>	 


</html>
