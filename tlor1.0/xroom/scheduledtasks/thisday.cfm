<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>OnThisDay - Mail Shot</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body>


<cfinvoke component="#Application.CompsPath#/thisday" method="Articles" returnvariable="ThisDayArray"
			Datasource="#Application.Datasource#"
			Home="#Application.Home#"
			TDate="#Now()#">	
			
<cfdump var="#ThisDayArray#">		
ARRAY LEN: <cfoutput>#ArrayLen(ThisDayArray)#</cfoutput><br>
			
<cfif ArrayLen(ThisDayArray)>

	<cfquery name="GetUsers" datasource="#Application.Datasource#">
		SELECT u.USER_ID, u.FIRST_NAME, u.FIRST_NAME, u.EMAIL
		FROM users u
		WHERE u.STATUS_ID = 1
		AND u.SENT = 0
	</cfquery>					
	
	<cfif GetUsers.Recordcount>
	
		<cfloop query="GetUsers">
					
<cfmail from="craig@thelifeofriley.org" to="globetrotter69@hotmail.com" bcc="c.riley@swiftdsl.com.au" subject="On This Day" type="html">

<html>
<head>
	<title>The Life of Riley - On This Day</title>
	<meta name="keywords" content="Craig,Riley,the life of riley,Snooker,Pool,8 Ball,Grimsby,Sydney,Australia,Coldfusion,Web Developer," />
	<meta name="description" content="The Life of Riley is the personal website of Craig Riley, Web Developer and Pool Hustler"/>
	<meta http-equiv="content-type" content="text/html;charset=iso-8859-1"/>
	<link rel=stylesheet type="text/css" href="#Application.Home#stylesheets/riley.css">
	<script language="javascript">
		<!--
		var	arrOff, arrOn, arrNames;		//arrays for images and image names
		var bOkay;
		
		bOkay= document.images;				//images OK?
		arrOff = new Array();
		arrOn = new Array();
		arrNames = new Array();
		
		function preload(){					//Called in the Onload event of the body tag
		
		var iSlashIndex, iLastIndex;		//integers and indices
		var strName, strImagePath;			//image name and path
		var iCount, i, j;					
		
		if (bOkay)
		{
			iCount = document.images.length;
			j = 0;
			
			for (i=0; i<iCount; i++)
			{
				strName = document.images[i].name;
				
				if (strName != "")			//Add any exceptions here. NB need names of multiple rollovers (cannot handle these) 
				{							// 			eg (strName != "" && strName != image1 && ...)
											//Also - .gif rollovers only! (could easily be altered)
					arrOff[j] = new Image();
					arrOn[j] = new Image();
					arrNames[j] = new String();
		
					arrNames[j] = strName;							//the image name is stored (name=filename)
					strImagePath = document.images[i].src;			
					arrOff[j].src = strImagePath;					//the off image is the image itself
					strImagePath = strImagePath.substring(0, strImagePath.length-4);
					arrOn[j].src = strImagePath + "_on.gif";		//the on image
					j++;
				}
			}	
		}
		}
		
		function on(strName) 
		{
		var i;
		if (bOkay)
		{
			for (i=0; i<arrNames.length; i++)
			{
				if (strName == arrNames[i])
				{
					document.images[strName].src = arrOn[i].src;
				}
			}
		}
		}
		
		function off(strName)
		{
		var i;
		if (bOkay)
		{
			for (i=0; i<arrNames.length; i++)
			{
				if (strName == arrNames[i])
				{
					document.images[strName].src = arrOff[i].src;
				}
			}
		}
		}
		//-->	
	</script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<!--- Header Image --->
<cfparam name="HeaderImage" default="header_bondime.jpg">

<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr bgcolor="##000000">
		<td><img src="#Application.Home#images/header/#HeaderImage#" alt=" The Life of Riley " width="750" height="250"></td>
  	</tr>
	<tr><td><img src="#Application.Home#images/dotpix.gif" width="1" height="1"></td></tr>
</table>

<!--- Primary Nav --->
<table border="0" cellspacing="0" cellpadding="0" width="750" align="center">
  	<tr bgcolor="##000000">		
		<td><a href="#Application.Home#riley/index.cfm" onmouseover="on('nav_riley')" onmouseout="off('nav_riley')"><img src="#Application.Home#images/nav/nav_riley.gif" alt=" Riley " width="77" height="30" border="0" name="nav_riley"></a></td>
		<td><a href="#Application.Home#education/index.cfm" onmouseover="on('nav_education')" onmouseout="off('nav_education')"><img src="#Application.Home#images/nav/nav_education.gif" alt=" Education " width="104" height="30" border="0" name="nav_education"></a></td>
		<td><a href="#Application.Home#employment/index.cfm" onmouseover="on('nav_employment')" onmouseout="off('nav_employment')"><img src="#Application.Home#images/nav/nav_employment.gif" alt=" Spoloyment " width="120" height="30" border="0" name="nav_employment"></a></td>
		<td><a href="#Application.Home#sport/index.cfm" onmouseover="on('nav_sport')" onmouseout="off('nav_sport')"><img src="#Application.Home#images/nav/nav_sport.gif" alt=" Sport " width="145" height="30" border="0" name="nav_sport"></a></td>
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

<cfquery name="GetFrontImages" datasource="#Application.Datasource#" maxrows="1">
	SELECT i.IMAGE_ID, i.IMAGE_NAME, i.FILE_NAME, i.DATE_CREATED, i.SUMMARY, i.COUNTRY_ID
	FROM images i
	WHERE IMAGE_TYPE_ID = 2
	<!--- AND FRONT_PAGE = 1  --->
	AND STATUS_ID = 1
	ORDER BY DATE_CREATED DESC
</cfquery>

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">
		
		
			<cfinclude template="../../includes/box_snooker.cfm">
			<!--- <cfinclude template="includes/box_thisday.cfm">
			
			<MM:BeginLock translatorClass="MM_SSI" type="ssi" orig="%3Ccfinclude template=%22includes/box_gallery.cfm%22%3E" fileRef="includes/box_gallery.cfm"><MM:EndLock> 
			
			<MM:BeginLock translatorClass="MM_SSI" type="ssi" orig="%3Ccfinclude template=%22includes/box_snooker.cfm%22%3E" fileRef="includes/box_snooker.cfm"><MM:EndLock>--->
		
		</td>
		<td><img src="#Application.Home#images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"></td>
	</tr>
  	<tr>
    	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt" valign="top">
		
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<cfif GetFrontImages.recordcount>
								
					<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=6,0,0,0" width="175" height="200" id="dynamicimages" align="right" hspace="5" vspace="5">
					<param name="allowScriptAccess" value="sameDomain" />
					<param name="movie" value="#Application.Home#dynamicimages.swf" />
					<param name="quality" value="high" />
					<param name="bgcolor" value="##d6d3ce" />
					<embed src="#Application.Home#dynamicimages.swf" quality="high" bgcolor="##d6d3ce" width="175" height="200" name="dynamicimages" align="right" hspace="5" vspace="5" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
					</object>								
										
					<!--- <img src="uploads/images/#GetFrontImages.FILE_NAME#" width="175" height="200" hspace="5" vspace="5" align="right" border="0" alt=" #GetFrontImages.SUMMARY# ">		 --->
				</cfif>
				<span class="txt_header">#DateFormat(now(),"dd mmmm yyyy")#</span>
				<br>
				Hi #FIRST_NAME#, 
				<p>
				This is my On This Day email, this email details memorable events that have happened in ym 
				life on this day, #year(now())# in previous years.
				<p> 
				This email will also contain latest news, images and much more...
				<p>
				I hope you enjoy it!
				<p>					
				</td>
			</tr>
			<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
			<tr>
				<td>					
					
					<cfif ArrayLen(ThisDayArray)>
					
						<table border="0" cellpadding="0" cellspacing="0">
						<tr><td class="txt_header">On This Day<p></td></tr>
						<cfloop from="1" to="#ArrayLen(ThisDayArray)#" index="x">
							<tr>
								<td class="txt">...in <span class="txt_date">#DateFormat(ThisDayArray[x][2],"yyyy")#</span>, #ThisDayArray[x][3]#<p></td>
							</tr>					
						</cfloop>
						</table>
						
					</cfif>
					<p>
					<span class="txt_header">Latest News</span>
					<p>
					<cfinvoke component="#Application.CompsPath#/news" method="Articles" 
						Datasource="#Application.Datasource#"
						Home="#Application.Home#"
						Front="1" 
						Module="Any"
						Section="Any" 
						Category="Any" 
						HowMany="2" 
						PerPage="5"
						OrderBy="DATE_DISPLAY DESC"
						ThisPage="#Application.Home#">	 
						
				</td>
			</tr>
			</table>				
				
		</td>
  	</tr>
	<tr>
		<td bgcolor="##CCCCCC"><img src="#Application.Home#images/dotpix.gif" height="1" width="175"></td>
		<td><img src="#Application.Home#images/dotpix.gif" height="20" width="25"></td>
		<td><img src="#Application.Home#images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr><td><img src="#Application.Home#images/dotpix.gif" width="1" height="2" border="0"></td></tr>
	<tr bgcolor="##660000">
		<td>
		
		<table border="0" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<td><img src="#Application.Home#images/dotpix.gif" width="5" height="20" border="0"></td>
				<td><a href="#Application.Home#riley/index.cfm" class="footer">RILEY</a></td>
				<td class="footer">&nbsp; | &nbsp;</td>
				<td><a href="#Application.Home#education/index.cfm" class="footer">EDUCATION</a></td>
				<td class="footer">&nbsp; | &nbsp;</td>
				<td><a href="#Application.Home#employment/index.cfm" class="footer">EMPLOYMENT</a></td>
				<td class="footer">&nbsp; | &nbsp;</td>
				<td><a href="#Application.Home#sport/index.cfm" class="footer">SPORT</a></td>
				<td class="footer">&nbsp; | &nbsp;</td>
				<td><a href="#Application.Home#travel/index.cfm" class="footer">TRAVEL</a></td>
				<td class="footer">&nbsp; | &nbsp;</td>
				<td><a href="#Application.Home#gallery/index.cfm" class="footer">GALLERY</a></td>
				<td><img "#Application.Home#images/dotpix.gif" width="200" height="1" border="0"></td>
				<td><a href="#Application.Home#contact.cfm" class="footer">CONTACT</a></td>
				<td class="footer">&nbsp; | &nbsp;</td>
				<td><a href="#Application.Home#sitemap.cfm" class="footer">SITE MAP</a></td>
				<td class="footer">&nbsp; | &nbsp;</td>
				<td><a href="#Application.Home#index.cfm" class="footer">HOME</a></td>
				<td><img src="#Application.Home#images/dotpix.gif" width="5" height="20" border="0"></td>
			</tr>
		</table>		
		
		</td>
	</tr>
  	<tr>
    	<td><img src="#Application.Home#images/footer.gif" alt=" The Life of Riley " width="750" height="75" border="0"></td>
  	</tr>
</table>	

</body> 
</html>

</cfmail>
		
		
		
		
		
		
		</cfloop>
		SENT <cfoutput>#GetUsers.Recordcount#</cfoutput> emails.
	<cfelse>
		No users?	
	</cfif>
</cfif>



</body>
</html>
