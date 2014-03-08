<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "Sporting Events">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet type="text/css" href="../stylesheets/riley.css">
	<script language="javascript" src="../javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderList="riosurf,ozcricket">

<cfinclude template="../includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">
		
			<!--- Navigation --->
			<cfinclude template="../includes/nav_sport.cfm">
		
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
							FileName="espn.jpg"
							ImageText="Sporting Events">
				<span class="txt_header">#ThisPage#</span>
				<br>		
				Omnis homines, qui sese student praestare ceteris animalibus,
				summa ope niti decet, ne vitam silentio transeant veluti pecora, 
				quae natura prona atque ventri oboedientia finxit. 
				Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis 
				servitio magis utimur; alterum nobis cum dis, alterum cum beluis 
				commune est. 
				<p>
				Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis 
				servitio magis utimur; alterum nobis cum dis, alterum cum beluis 
				commune est. Quo mihi rectius videtur ingeni quam virium opibus 
				gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, 
				memoriam nostri quam maxume longam efficere.
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
							Section="Sport & Leisure" 
							Category="#ThisPage#" 
							HowMany="50" 
							PerPage="5"
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
