<cfparam name="HeaderImage" default="header_firedance3.jpg">
<cfparam name="ModuleID" default="0">

<cfoutput>
<!--- Header Image --->
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr bgcolor="##000000">
		<td><a href="../"><img src="../images/header/#HeaderImage#" alt=" The Life of Riley " width="750" height="250" border="0"></a></td>
  	</tr>
	<tr><td><img src="../images/dotpix.gif" width="1" height="1"></td></tr>
</table>


<!--- Primary Nav --->
<table border="0" cellspacing="0" cellpadding="0" width="750" align="center">
  	<tr bgcolor="##000000">		
		<td><a href="../riley/index.cfm" onmouseover="on('nav_riley')" onmouseout="off('nav_riley')"><img src="../images/nav/nav_riley.gif" alt=" Riley " width="77" height="30" border="0" name="nav_riley"></a></td>
		<td><a href="../education/index.cfm" onmouseover="on('nav_education')" onmouseout="off('nav_education')"><img src="../images/nav/nav_education.gif" alt=" Education " width="104" height="30" border="0" name="nav_education"></a></td>
		<td><a href="../employment/index.cfm" onmouseover="on('nav_employment')" onmouseout="off('nav_employment')"><img src="../images/nav/nav_employment.gif" alt=" Employment " width="120" height="30" border="0" name="nav_employment"></a></td>
		<td><a href="../sport/index.cfm" onmouseover="on('nav_sport')" onmouseout="off('nav_sport')"><img src="../images/nav/nav_sport.gif" alt=" Sport &amp; Leisure " width="145" height="30" border="0" name="nav_sport"></a></td>
		<td><a href="../travel/index.cfm" onmouseover="on('nav_travel')" onmouseout="off('nav_travel')"><img src="../images/nav/nav_travel.gif" alt=" Travel " width="80" height="30" border="0" name="nav_travel"></a></td>
		<td><a href="../gallery/index.cfm" onmouseover="on('nav_gallery')" onmouseout="off('nav_gallery')"><img src="../images/nav/nav_gallery.gif" alt=" Gallery " width="90" height="30" border="0" name="nav_gallery"></a></td>
		<td><img src="../images/nav/nav_blank.gif" width="70" height="30" border="0"></td>
		<td><a href="../contact.cfm" onmouseover="on('nav_contact')" onmouseout="off('nav_contact')"><img src="../images/nav/nav_contact.gif" alt=" Contact " width="20" height="30" border="0" name="nav_contact"></a></td>
		<td><a href="../sitemap.cfm" onmouseover="on('nav_sitemap')" onmouseout="off('nav_sitemap')"><img src="../images/nav/nav_sitemap.gif" alt=" Site Map " width="20" height="30" border="0" name="nav_sitemap"></a></td>
		<td><a href="../" onmouseover="on('nav_home')" onmouseout="off('nav_home')"><img src="../images/nav/nav_home.gif" alt=" Home " width="25" height="30" border="0" name="nav_home"></a></td>
  	</tr>
	<tr><td colspan="10"><img src="../images/dotpix.gif" width="1" height="1"></td></tr>
	<tr bgcolor="##666666"><td colspan="10"><img src="../images/dotpix.gif" width="1" height="2"></td></tr>
	<tr><td colspan="10"><img src="../images/dotpix.gif" width="1" height="2"></td></tr>
</table>	
</cfoutput>
