<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "Snooker">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet type="text/css" href="../stylesheets/riley.css">
	<script language="javascript" src="../javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<!--- Header Image --->
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr bgcolor="##000000">
		<td><img src="../images/header/header_ozcricket.jpg" alt=" The Life of Riley " width="750" height="250"></td>
  	</tr>
	<tr><td><img src="../images/dotpix.gif" width="1" height="1"></td></tr>
</table>


<!--- Primary Nav --->
<table border="0" cellspacing="0" cellpadding="0" width="750" align="center">
  	<tr bgcolor="##000000">		
		<td><a href="#Application.Home#riley/index.cfm" onmouseover="on('nav_riley')" onmouseout="off('nav_riley')"><img src="../images/nav/nav_riley.gif" alt=" Riley " width="77" height="30" border="0" name="nav_riley"></a></td>
		<td><a href="#Application.Home#education/index.cfm" onmouseover="on('nav_education')" onmouseout="off('nav_education')"><img src="../images/nav/nav_education.gif" alt=" Education " width="104" height="30" border="0" name="nav_education"></a></td>
		<td><a href="#Application.Home#employment/index.cfm" onmouseover="on('nav_employment')" onmouseout="off('nav_employment')"><img src="../images/nav/nav_employment.gif" alt=" Spoloyment " width="120" height="30" border="0" name="nav_employment"></a></td>
		<td><a href="#Application.Home#sport/index.cfm" onmouseover="on('nav_sport')" onmouseout="off('nav_sport')"><img src="../images/nav/nav_sport.gif" alt=" Sport " width="75" height="30" border="0" name="nav_sport"></a></td>
		<td><a href="#Application.Home#travel/index.cfm" onmouseover="on('nav_travel')" onmouseout="off('nav_travel')"><img src="../images/nav/nav_travel.gif" alt=" Travel " width="80" height="30" border="0" name="nav_travel"></a></td>
		<td><a href="#Application.Home#gallery/index.cfm" onmouseover="on('nav_gallery')" onmouseout="off('nav_gallery')"><img src="../images/nav/nav_gallery.gif" alt=" Gallery " width="90" height="30" border="0" name="nav_gallery"></a></td>
		<td><img src="../images/nav/nav_blank.gif" width="139" height="30" border="0"></td>
		<td><a href="#Application.Home#contact.cfm" onmouseover="on('nav_contact')" onmouseout="off('nav_contact')"><img src="../images/nav/nav_contact.gif" alt=" Contact " width="20" height="30" border="0" name="nav_contact"></a></td>
		<td><a href="#Application.Home#sitemap.cfm" onmouseover="on('nav_sitemap')" onmouseout="off('nav_sitemap')"><img src="../images/nav/nav_sitemap.gif" alt=" Site Map " width="20" height="30" border="0" name="nav_sitemap"></a></td>
		<td><a href="#Application.Home#" onmouseover="on('nav_home')" onmouseout="off('nav_home')"><img src="../images/nav/nav_home.gif" alt=" Home " width="25" height="30" border="0" name="nav_home"></a></td>
  	</tr>
	<tr><td colspan="10"><img src="../images/dotpix.gif" width="1" height="1"></td></tr>
	<tr bgcolor="##666666"><td colspan="10"><img src="../images/dotpix.gif" width="1" height="2"></td></tr>
	<tr><td colspan="10"><img src="../images/dotpix.gif" width="1" height="2"></td></tr>
</table>	


<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">
		
			<!--- Navigation --->
			<cfinclude template="../includes/nav_sport.cfm">
		
		</td>
		<td><img src="../images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; <a href="#Application.Home#/sport/" class="bread">SPORT</a> &gt; #ThisPage#</td>
	</tr>
  	<tr>
    	<td><img src="../images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt">
		
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<img src="../images/copy/caricature.jpg" width="175" height="200" hspace="5" vspace="5" align="right" border="0">		
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
				memoriam nostri quam maxume longam efficere. Quoniam vita ipsa, qua fruimur, brevis est, 
				memoriam nostri quam maxume longam efficere. 
				<p>								
				</td>
			</tr>
			<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
			<tr>
				<td>
				<cfif NOT isDefined("ArticleID")>									
				
					<cfinvoke component="#Application.CompsPath#/news" method="Articles" 
								Datasource="#Application.Datasource#"
								Home="#Application.Home#"
								Front="0" 
								Module="News & Events"
								Section="Sport & Leisure" 
								Category="#ThisPage#" 
								HowMany="5" 
								PerPage="5"
								OrderBy="DATE_DISPLAY DESC">	
				
				<cfelse>
				
					<cfinvoke component="#Application.CompsPath#/news" method="ArticleData" 
								Datasource="#Application.Datasource#"
								Home="#Application.Home#"
								ArticleID="#ArticleID#" >
				
				</cfif>								
				</td>
			</tr>
			</table>		
		
		</td>
  	</tr>
	<tr>
		<td bgcolor="##CCCCCC"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td><img src="../images/dotpix.gif" height="20" width="25"></td>
		<td><img src="../images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>

<cfinclude template="../footer.cfm">	 

</cfoutput>	 
</body>

</html>
