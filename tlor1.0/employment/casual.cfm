<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "Casual Work">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet type="text/css" href="../stylesheets/riley.css">
	<script language="javascript" src="../javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderImage="header_vegasview1.jpg">

<cfinclude template="../includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">
		
			<!--- Navigation --->
			<cfinclude template="../includes/nav_employment.cfm">
		
		</td>
		<td><img src="../images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; <a href="#Application.Home#employment/" class="bread">EMPLOYMENT</a> &gt; #ThisPage#</td>
	</tr>
  	<tr>
    	<td><img src="../images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt">
		
		<cfif NOT isDefined("ArticleID")>			
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<cfinvoke component="#Application.CompsPath#/content_photo" method="Display" 
							FileName="usa_dennys.jpg"
							ImageText="Denny's Restaurant, Myrtel Beach">	
				<span class="txt_header">#ThisPage#</span>
				<br>		
				This page contains a brief list of most of the casual work I did before starting my IT career. 
				I have held a wide variety of positions ranging from a paper wound while at school to selling my body to science in the USA!
				<p>								
				</td>
			</tr>
			<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
			<tr>
				<td>			
				
							
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<!--- <td>						
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><img src="../images/Employment/youramigo.jpg" alt=" SHFA " width="50" height="100" border="0"></td></tr>
							</table>							
						</td> 
						<td><img src="../../images/dotpix.gif" height="1" width="10"></td>--->
						<td valign="top">
						<span class="txt_date">Sep 1999 - Jan 2000</span><br>
						<span class="txt_title">Fruit Picking - North Island, New Zealand</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						</td>
					</tr>
					<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
					<tr>
						<td valign="top">
						<span class="txt_date">Sep 1996 - May 1997</span><br>
						<span class="txt_title">Royals Disco - Manchester, England</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						</td>
					</tr>
					<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
					<tr>
						<td valign="top">
						<span class="txt_date">Summer 1996</span><br>
						<span class="txt_title">Ben Hur Removals - New York City, USA</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						</td>
					</tr>
					<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
					<tr>
						<td valign="top">
						<span class="txt_date">Oct 1994 - Jul 1996</span><br>
						<span class="txt_title">Medical Research Volunteer - Various Cities, USA</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						</td>
					</tr>
					<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
					<tr>
						<td valign="top">
						<span class="txt_date">Aug 1994 - Sep 1994</span><br>
						<span class="txt_title">Banana Bungalow Hostel - Hollywood, USA</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						</td>
					</tr>
					<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
					<tr>
						<td valign="top">
						<span class="txt_date">Aug 1994</span><br>
						<span class="txt_title">Telephone Sales - Las Vegas, USA</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						</td>
					</tr>
					<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
					<tr>
						<td valign="top">
						<span class="txt_date">Jul 1994 - Aug 1994</span><br>
						<span class="txt_title">Denny's Restaurant - Las Vegas, USA</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						</td>
					</tr>
					<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
					<tr>
						<td valign="top">
						<span class="txt_date">May 1994 - Jul 1994</span><br>
						<span class="txt_title">Denny's Restaurant - Myrtel Beach, USA</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						</td>
					</tr>
					<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
					<tr>
						<td valign="top">
						<span class="txt_date">Summer 1993</span><br>
						<span class="txt_title">Bar Tender - Crete, Greece</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						</td>
					</tr>
					<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
					<tr>
						<td valign="top">
						<span class="txt_date">Jun 1991 - Jun 1993</span><br>
						<span class="txt_title">Winter Gardens - Grimsby, England</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						</td>
					</tr>
					<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
					<tr>
						<td valign="top">
						<span class="txt_date">School Work Experience - 1998</span><br>
						<span class="txt_title">Sidewalk Cafe - Grimsby, England</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						</td>
					</tr>
					<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
					<tr>
						<td valign="top">
						<span class="txt_date">1996 - 1998</span><br>
						<span class="txt_title">Newspaper Round - Grimsby, England</span><br>
						Omnis homines, qui sese student praestare ceteris animalibus,
						summa ope niti decet, ne vitam silentio transeant veluti pecora, 
						quae natura prona atque ventri oboedientia finxit. 
						</td>
					</tr>
				</table>
				<p>
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
