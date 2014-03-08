<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "Training">

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
				<!--- <img src="../../images/copy/poolball.jpg" width="175" height="200" hspace="5" vspace="5" align="right" border="0"> --->
				<span class="txt_header">#ThisPage#</span>
				<br>		
				I have completed the following training courses at various times since starting my web career in 1997. 
				<p>				
				</td>
			</tr>
			<tr><td><img src="../../images/dotpix.gif" height="20" width="1"></td></tr>
			<tr>
				<td>					
					<!--- 
					<cfinvoke component="#Application.CompsPath#/news" method="Articles" 
							Datasource="#Application.Datasource#"
							Home="#Application.Home#"
							Front="0" 
							Module="News & Events"
							Section="Employment" 
							Category="#ThisPage#" 
							HowMany="500" 
							PerPage="5"
							OrderBy="DATE_DISPLAY DESC">	 
					--->
				
					<table border="0" cellpadding="0" cellspacing="5">
					<tr>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><img src="../../images/Employment/intel.jpg" alt=" Intel " width="175" height="180" border="0"></td></tr>
							</table>							
						</td>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><img src="../../images/Employment/autonomy.jpg" alt=" Autonomy " width="175" height="180" border="0"></td></tr>
							</table>							
						</td>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><img src="../../images/Employment/worldpay.jpg" alt=" World Pay " width="175" height="180" border="0"></td></tr>
							</table>							
						</td>
					</tr>		
					<tr>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><img src="../../images/Employment/youramigo.jpg" alt=" Your Amigo " width="175" height="180" border="0"></td></tr>
							</table>							
						</td>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><img src="../../images/Employment/sap.jpg" alt=" SAP " width="175" height="180" border="0"></td></tr>
							</table>							
						</td>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><img src="../../images/Employment/intershop_red.jpg" alt=" Autonomy " width="175" height="180" border="0"></td></tr>
							</table>							
						</td>
					</tr>							
					</table>
				
										
				
				
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
		<td bgcolor="##CCCCCC"><img src="../../images/dotpix.gif" height="1" width="175"></td>
		<td><img src="../../images/dotpix.gif" height="20" width="25"></td>
		<td><img src="../../images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>

<cfinclude template="../../footer.cfm">	 

</body></cfoutput>	 


</html>
