<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "HOME">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta name="keywords" content="Craig Riley,the life of riley,Snooker,Pool,9 ball,8 Ball,Grimsby,Sydney,Australia,Coldfusion,Web Developer,globetrotter"/>
	<meta name="description" content="The Life of Riley is the personal website of Craig Riley, Web Developer and Pool Hustler"/>
	<meta http-equiv="content-type" content="text/html;charset=iso-8859-1"/>
	<link rel=stylesheet type="text/css" href="stylesheets/riley.css">
	<script language="javascript" src="javascripts/rollover.js"></script>
	<script type="text/javascript">
    
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-21418229-1']);
      _gaq.push(['_trackPageview']);
    
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
    
    </script>
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderList = "">
<!--- beijing_manu1,hkme,cambodia1,beijing_square3,beijing_wall1,giants,greece1,greece2,malaysia1,phillipines_batad1,phuketme,rio2,srilanka1 --->

<cfinclude template="includes/header.cfm">


<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top" align="center">
		
			<cfinclude template="includes/box_thisday.cfm">
	
			<!--- <cfinclude template="includes/box_clipofday.cfm">  --->
			
			<!--- <cfinclude template="includes/box_snooker.cfm"> --->
							
			<cfinclude template="includes/box_gallerysearch.cfm">			

			<cfinclude template="includes/google_rectangle.cfm">			
		
		</td>
		<td><img src="images/dotpix.gif" height="20" width="1"></td>
		<td class="bread">#ThisPage#</td>
	</tr>
  	<tr>
    	<td><img src="images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt" valign="top">
		
		<cfif NOT isDefined("ArticleID")>			
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<!--- <cfif GetFrontImages.recordcount>
				
					<cfset ArticleID = "0">
					<cfset FrontPage = "1">
					<table align="right" vspace="5" hspace="5" border="0" cellspacing="1" bgcolor="##000000" cellpadding="0">
					<tr><td bgcolor="##FFFFFF">
					<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=6,0,0,0" width="175" height="200" id="dynamicimages">
					<param name="allowScriptAccess" value="sameDomain"/>
					<param name="movie" value="dynamicimages.swf"/>
					<param name="quality" value="high"/>
					<param name="bgcolor" value="##d6d3ce"/>
					<PARAM NAME="FlashVars" VALUE="ArticleID=#ArticleID#&FrontPage=#FrontPage#">
					<embed src="dynamicimages.swf" FlashVars="ArticleID=#ArticleID#&FrontPage=#FrontPage#" quality="high" bgcolor="##d6d3ce" width="175" height="200" name="dynamicimages" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
					</object>								
					</td></tr>
					</table>					
					
				</cfif> --->
				<span class="txt_header">WELCOME</span>
				<br>
				Hi, my name is Craig Riley and I am a professional web developer and pool player. 
				I built this website mainly so I could record all the eventful things that happen in my life. 
				Therefore, although I use some sections of the site like my <a href="employment/web/portfolio.cfm" class="txt">web portfolio</a>
				and <a href="##" target="_blank" class="txt">resume</a> for professional purposes it is	primarily a fun site.</p>
				<p>
				You will also find a comprehensive listing of my billiards achievements in the <a href="travel/index.cfm" class="txt">sport</a> section, in depth details of my global adventures in the 
				<a href="travel/index.cfm" class="txt">travel</a> section, and many images and videos in the <a href="gallery/index.cfm" class="txt">gallery</a>. 
				And last (and probably least!) if you want to know what makes me tick, check out the <a href="travel/index.cfm" class="txt">riley</a> area of the site.		
				Also throughout the site you will find many articles about <em>The Life of Riley</em>, my life - I hope you like it!</p>
				</td>
			</tr>
			<tr><td><img src="../images/dotpix.gif" height="10" width="1"></td></tr>  
			<!---		          
			<tr>
            	<td><cfinclude template="includes/twitter.cfm"></td>
            </tr>
			--->
			<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
			<tr>
				<td>					
					<cfinvoke component="#Application.CompsPath#/news" method="Articles" 
								Datasource="#Application.Datasource#"
								Home="#Application.Home#"
								Front="1" 
								Module="Any"
								Section="Any" 
								Category="Any" 
								HowMany="2" 
								PerPage="5"
								ThisPage="#ThisPage#"
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
							ArticleID="#ArticleID#" >
							
				<!--- Get Related News Articles - By Date or Category --->
				<cfparam name="DateDepart" default="Any">
				<cfparam name="DateReturn" default="Any">				
	
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
		<td bgcolor="##CCCCCC"><img src="images/dotpix.gif" height="1" width="175"></td>
		<td><img src="images/dotpix.gif" height="20" width="25"></td>
		<td><img src="images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>

<cfinclude template="footer.cfm">	 

</body>
</cfoutput>	 
</html>
