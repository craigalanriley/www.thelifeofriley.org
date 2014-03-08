<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "Biography">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet type="text/css" href="../stylesheets/riley.css">
	<script language="javascript" src="../javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderList="malaysia1">

<cfinclude template="../includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">		
		
			<!--- Navigation --->
			<cfinclude template="../includes/nav_riley.cfm">
		
		</td>
		<td><img src="../images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; <a href="#Application.Home#riley/" class="bread">RILEY</a> &gt; #ThisPage#</td>
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
				<br><br>										
				<table border="0" cellpadding="3" cellspacing="1" width="550">
				<tr>
					<td bgcolor="##660000" colspan="2" class="txt_white">PERSONAL DETAILS</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Full Name</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Craig Alan Riley</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Born</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Grimsby Maternity Hospital on 9th January 1974</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Height</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">5 11" / 178cm</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Eye Color</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Dark Brown</td>
				</tr>
				<tr>
					<td bgcolor="##660000" colspan="2" class="txt_white">PERSONAL FAVOURITES</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Color</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Black and Silver</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Brand</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Sony / Armani / CK / Tag / Apple</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Drink</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">JD and Coke / Stella / Kamikaze</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Food</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Italian / Indian / Mexican / Thai</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Person</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Richard Branson / Winston Churchill</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Sportsman</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Alex Higgins / Efren Reyes / Mike Tyson / Roy Keane / Ryan Giggs</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Song</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">The End - Doors / Bohemian Rhapsody - Queen</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Music</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Rolling Stones / Queen / The Doors / Dance + Techno</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Movie</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Exorcist / Matrix / Heat / Lord of the Rings / Unforgiven / Tombstone</td>
				</tr>
				<tr>
					<td bgcolor="##660000" colspan="2" class="txt_white">TRAVEL FAVOURITES</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Bar</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Hard Rock Cafe, Kuala Lumpa / Piano Bar, Las Vegas / Spy Bar, Bali </td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Hotel</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Tongsai Bay Hotel, Koh Samui / Jumeirah Beach Hotel, Dubai / Grand Hyatt, Oman </td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Place</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Christ The Redeemer, Rio / Angkor Wat, Cambodia / Great Barrier Reef, Australia</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Beach</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Paradise Island - Maldives / Bondi Beach - Sydney / Chaweng Beach - Koh Samui</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">City</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">NYC / Las Vegas / Dubai / Rome</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Country</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">America / Thailand / UK</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Airport</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Hong Kong / Singapore / Heathrow</td>
				</tr>
				<tr>
					<td bgcolor="##2E2352" class="txt_white" width="25%">Airline</td>
					<td bgcolor="##cccccc" class="txt_small" width="75%">Emirates</td>
				</tr>
				</table>					
				
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
