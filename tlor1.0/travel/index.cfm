<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "Travel">

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
							FileName="rio.jpg"
							ImageText="It was this big!">
				<span class="txt_header">#ThisPage#</span>
				<br>		
				My interest in travel probably started at an early age when my uncle worked on a cruise ship.
				Every time he came home he would bring exotic presents back for the family from all around the world.
				He once gave me a banner from Disney Land in America and my mother had the latest music player from Japan.
				<p>
				While still young I went on various camping trips to Scotland and the Lake District. I would also often disappear 
				for the day catching the train with friends to the country and running around and exploring remote woodlands.
				However it wasn't until I was fifteen until I flew for the first time and went abroad. My family and I went to 
				Benidorm, Spain. I was lucky enough to meet my cousin there and spent much of the time partying in the bars and clubs.
				This only fueled my passion for adventure and it wasn't long before I left England again. 
				<p>
				After a short holiday to Corfu, Greece with an old school friend when I was seventeen, I decided I wanted to spend a longer 
				time away to really discover a place. When I was nineteen I organized a trip to Greece with 4 friends and we spent a couple 
				of months in Crete having the time of our lives. This was where I met seasoned travelers for the first time and there stories
				added to my desire for more adventure. It wasn't long before I was flying long haul to exotic islands, remote jungles, and 
				world famous cities. During the next decade I would fly over a 100 more times visiting 40 countries in almost every continent around the globe.
				I feel very fortunate to have seen so much, but with over 200 countries on the planet there is so so much more to see.
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
							Section="Travel" 
							Category="Any" 
							HowMany="5" 
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
