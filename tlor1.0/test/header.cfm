<!--- Default list if custom list not present--->
<!--- <cfparam name="HeaderList" default="korea_north1,vegasview4,japan_kyoto1,usa_washington1,hk2,hk6,korea1,cambodia3,cambodia4,cambodia5,cambodia6,australia_ayers2,australia_ayers3,beijing_wall2,brunei1,brunei2,brunei4,fraserforest,maldives,manhattan,ozsydneyharbour,phillipines_batad2,phillipines_batad5,phillipines_batad6,phuket1,phuketbond,riosugarloaf,shanghai2,srilanka2,srilanka_elephants1,taiwan1,timesquare1,vegasview1,vegasview3" --->
<cfparam name="HeaderList" default="">



<cfoutput>
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr bgcolor="##000000">
		<td>
        <img src="#Application.home#images/header/bhutan.jpg" alt="www.thelifeofriley.org - Bhutan Bound!" width="750" height="250" />
		<!--- <cfif NOT len(trim(HeaderList))>
	
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=7,0,0,0" width="750" height="250" id="header" align="middle">
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="movie" value="#Application.Home#flash/header/flashheader1.swf" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="##ffffff" />
			<embed src="#Application.Home#flash/header/flashheader1.swf" quality="high" bgcolor="##ffffff" width="750" height="250" name="header" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>			
			
		<cfelse>
		
			<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=7,0,0,0" width="750" height="250" id="flashheader2" align="middle">
			<param name="allowScriptAccess" value="sameDomain" />
			<param name="movie" value="#Application.Home#flash/header/flashheader2.swf" />
			<param name="quality" value="high" />
			<param name="bgcolor" value="##ffffff" />
			<embed src="#Application.Home#flash/header/flashheader2.swf" quality="high" bgcolor="##ffffff" width="750" height="250" name="flashheader2" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
			</object>		
		
			<!--- Get Random Position From List 
			<cfset RandomNumber = RandRange(1,ListLen(HeaderList))>
			
			<!--- Get Random Header Name From RandomNumber --->
			<cfset RandomHeader =  ListGetAt(HeaderList,RandomNumber)>		
			<a href="#Application.Home#"><img src="#Application.Home#images/header/header_#RandomHeader#.jpg" alt=" The Life of Riley " width="750" height="250" border="0"></a>				
			--->
		</cfif>	 --->		
		</td>
  	</tr>
	<tr><td><img src="#Application.Home#images/dotpix.gif" width="1" height="1"></td></tr>
</table>

<!--- Primary Nav --->
<table border="0" cellspacing="0" cellpadding="0" width="750" align="center">
  	<tr bgcolor="##000000">		
		<td><a href="#Application.Home#riley/index.cfm" onmouseover="on('nav_riley')" onmouseout="off('nav_riley')"><img src="#Application.Home#images/nav/nav_riley.gif" alt=" Riley " width="77" height="30" border="0" name="nav_riley"></a></td>
		<td><a href="#Application.Home#education/index.cfm" onmouseover="on('nav_education')" onmouseout="off('nav_education')"><img src="#Application.Home#images/nav/nav_education.gif" alt=" Education " width="104" height="30" border="0" name="nav_education"></a></td>
		<td><a href="#Application.Home#employment/index.cfm" onmouseover="on('nav_employment')" onmouseout="off('nav_employment')"><img src="#Application.Home#images/nav/nav_employment.gif" alt=" Employment " width="120" height="30" border="0" name="nav_employment"></a></td>
		<td><a href="#Application.Home#sport/index.cfm" onmouseover="on('nav_sport')" onmouseout="off('nav_sport')"><img src="#Application.Home#images/nav/nav_sport.gif" alt=" Sport &amp; Leisure " width="145" height="30" border="0" name="nav_sport"></a></td>
		<td><a href="#Application.Home#travel/index.cfm" onmouseover="on('nav_travel')" onmouseout="off('nav_travel')"><img src="#Application.Home#images/nav/nav_travel.gif" alt=" Travel " width="80" height="30" border="0" name="nav_travel"></a></td>
		<td><a href="#Application.Home#gallery/index.cfm" onmouseover="on('nav_gallery')" onmouseout="off('nav_gallery')"><img src="#Application.Home#images/nav/nav_gallery.gif" alt=" Gallery " width="90" height="30" border="0" name="nav_gallery"></a></td>
		<td><img src="#Application.Home#images/nav/nav_blank.gif" width="70" height="30" border="0"></td>
		<td><a href="#Application.Home#contact.cfm" onmouseover="on('nav_contact')" onmouseout="off('nav_contact')"><img src="#Application.Home#images/nav/nav_contact.gif" alt=" Contact " width="20" height="30" border="0" name="nav_contact"></a></td>
		<td><a href="#Application.Home#sitemap.cfm" onmouseover="on('nav_sitemap')" onmouseout="off('nav_sitemap')"><img src="#Application.Home#images/nav/nav_sitemap.gif" alt=" Site Map " width="20" height="30" border="0" name="nav_sitemap"></a></td>
		<td><a href="#Application.Home#" onmouseover="on('nav_home')" onmouseout="off('nav_home')"><img src="#Application.Home#images/nav/nav_home.gif" alt=" Home " width="25" height="30" border="0" name="nav_home"></a></td>
  	</tr>
	<tr><td colspan="10"><img src="#Application.Home#images/dotpix.gif" width="1" height="1"></td></tr>
	<tr bgcolor="##666666"><td colspan="10"><img src="#Application.Home#images/dotpix.gif" width="1" height="2"></td></tr>
	<tr><td colspan="10"><img src="#Application.Home#images/dotpix.gif" width="1" height="2"></td></tr>
</table>	
</cfoutput>
