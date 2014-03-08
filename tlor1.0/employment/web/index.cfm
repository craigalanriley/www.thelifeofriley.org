<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "Web Development">

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
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; <a href="#Application.Home#employment/" class="bread">EMPLOYMENT</a> &gt; #ThisPage#</td>
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
				Omnis homines, qui sese student praestare ceteris animalibus,
				summa ope niti decet, ne vitam silentio transeant veluti pecora, 
				quae natura prona atque ventri oboedientia finxit. 
				Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis 
				servitio magis utimur; alterum nobis cum dis, alterum cum beluis 
				commune est. 
				<p>						
				</td>
			</tr>
			<tr><td><img src="../../images/dotpix.gif" height="20" width="1"></td></tr>
			<tr>
				<td>					
				<!--- <cfinvoke component="#Application.CompsPath#/news" method="Articles" 
							Datasource="#Application.Datasource#"
							Home="#Application.Home#"
							Front="0" 
							Module="News & Events"
							Section="Employment" 
							Category="#ThisPage#" 
							HowMany="500" 
							PerPage="5"
							OrderBy="DATE_DISPLAY DESC"> --->	
							
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><a href="http://www.log1k.com" target="_blank"><img src="../../images/Employment/log1k.jpg" alt=" Log1k.com " width="175" height="180" border="0"></a></td></tr>
							</table>							
						</td>
						<td><img src="../../images/dotpix.gif" height="1" width="10"></td>
						<td valign="top">
						<span class="txt_date">Apr 2007 - Present<!--- Dec 2005 ---></span><br>
						<span class="txt_title">Log1k.com - Global Freelance</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis 
						servitio magis utimur; alterum nobis cum dis, alterum cum beluis 
						commune est. 
						<p>
						<div align="right"><a href="portfolio.cfm?Employers=1##results" class="more">View Portfolio &gt;&gt;</a></div>
						</td>
					</tr>
					<tr><td colspan="3"><img src="../../images/dotpix.gif" height="10" width="1"></td></tr>
					<tr>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><a href="http://www.soukdigital.com" target="_blank"><img src="../../images/Employment/souk.jpg" alt=" Souk Digital " width="175" height="180" border="0"></a></td></tr>
							</table>							
						</td>
						<td><img src="../../images/dotpix.gif" height="1" width="10"></td>
						<td valign="top">
						<span class="txt_date">Dec 2005 - Apr 2007<!--- Dec 2005 ---></span><br>
						<span class="txt_title">Souk Digital - Nottingham, England</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis 
						servitio magis utimur; alterum nobis cum dis, alterum cum beluis 
						commune est. 
						<p>
						<div align="right"><a href="portfolio.cfm?Employers=8##results" class="more">View Portfolio &gt;&gt;</a></div>
						</td>
					</tr>
					<tr><td colspan="3"><img src="../../images/dotpix.gif" height="10" width="1"></td></tr>
					<tr>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><a href="http://www.log1k.com" target="_blank"><img src="../../images/Employment/log1k.jpg" alt=" Log1k.com " width="175" height="180" border="0"></a></td></tr>
							</table>							
						</td>
						<td><img src="../../images/dotpix.gif" height="1" width="10"></td>
						<td valign="top">
						<span class="txt_date">Jan 2006 - Dec 2006<!--- Dec 2005 ---></span><br>
						<span class="txt_title">Log1k.com - Global Freelance</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis 
						servitio magis utimur; alterum nobis cum dis, alterum cum beluis 
						commune est. 
						<p>
						<div align="right"><a href="portfolio.cfm?Employers=1##results" class="more">View Portfolio &gt;&gt;</a></div>
						</td>
					</tr>
					<tr><td colspan="3"><img src="../../images/dotpix.gif" height="10" width="1"></td></tr>
					<tr>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><a href="http://www.shfa.nsw.gov.au" target="_blank"><img src="../../images/Employment/shfa.jpg" alt=" SHFA " width="175" height="180" border="0"></a></td></tr>
							</table>							
						</td>
						<td><img src="../../images/dotpix.gif" height="1" width="10"></td>
						<td valign="top">
						<span class="txt_date">Jan 2004 - Dec 2005<!--- Dec 2005 ---></span><br>
						<span class="txt_title">Sydney Harbour Foreshore Authority - Sydney, Australia</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis 
						servitio magis utimur; alterum nobis cum dis, alterum cum beluis 
						commune est. 
						<p>
						<div align="right"><a href="portfolio.cfm?Employers=2##results" class="more">View Portfolio &gt;&gt;</a></div>
						</td>
					</tr>
					<tr><td colspan="3"><img src="../../images/dotpix.gif" height="10" width="1"></td></tr>
					<tr>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><a href="http://www.readingroom.com.au" target="_blank"><img src="../../images/Employment/readingroom.jpg" alt=" Reading Room Sydney " width="175" height="180" border="0"></a></td></tr>
							</table>							
						</td>
						<td><img src="../../images/dotpix.gif" height="1" width="10"></td>
						<td valign="top">
						<span class="txt_date">May 2001 - Dec 2004</span><br>
						<span class="txt_title">Reading Room - Sydney, Australia</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis 
						servitio magis utimur; alterum nobis cum dis, alterum cum beluis 
						commune est. 
						<p>
						<div align="right"><a href="portfolio.cfm?Employers=3##results" class="more">View Portfolio &gt;&gt;</a></div>
						</td>
					</tr>
					<tr><td colspan="3"><img src="../../images/dotpix.gif" height="10" width="1"></td></tr>
					<tr>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><a href="http://www.readingroom.com" target="_blank"><img src="../../images/Employment/readingroom.jpg" alt=" Reading Room Sydney " width="175" height="180" border="0"></a></td></tr>
							</table>							
						</td>
						<td><img src="../../images/dotpix.gif" height="1" width="10"></td>
						<td valign="top">
						<span class="txt_date">Apr 2000 - Apr 2001</span><br>
						<span class="txt_title">Reading Room - London, England</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis 
						servitio magis utimur; alterum nobis cum dis, alterum cum beluis 
						commune est. 
						<p>
						<div align="right"><a href="portfolio.cfm?Employers=4##results" class="more">View Portfolio &gt;&gt;</a></div>
						</td>
					</tr>
					<tr><td colspan="3"><img src="../../images/dotpix.gif" height="10" width="1"></td></tr>
					<tr>
						<td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><a href="http://www.compaq.com" target="_blank"><img src="../../images/Employment/compaq.jpg" alt=" Compaq " width="175" height="180" border="0"></a></td></tr>
							</table>							
						</td>
						<td><img src="../../images/dotpix.gif" height="1" width="10"></td>
						<td valign="top">
						<span class="txt_date">Aug 1997 - Aug 1998</span><br>
						<span class="txt_title">Compaq - Glasgow, Scotland</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis 
						servitio magis utimur; alterum nobis cum dis, alterum cum beluis 
						commune est. 
						<p>
						<div align="right"><a href="portfolio.cfm?Employers=5##results" class="more">View Portfolio &gt;&gt;</a></div>
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
