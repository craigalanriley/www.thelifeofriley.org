<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "8 Ball Pool">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet type="text/css" href="../../stylesheets/riley.css">
	<script language="javascript" src="../../javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderList="vegaspool1">

<cfinclude template="../../includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">
		
			<!--- Navigation --->
			<cfinclude template="../../includes/nav_sport.cfm">

			<cfinclude template="../../includes/google_rectangle.cfm">		
		
		</td>
		<td><img src="../../images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; <a href="#Application.Home#/sport/" class="bread">SPORT</a>  &gt; #ThisPage#</td>
	</tr>
  	<tr>
    	<td><img src="../../images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt">
		
		<cfif NOT isDefined("ArticleID")>			
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<cfinvoke component="#Application.CompsPath#/content_photo" method="Display" 
							FileName="8ball1.jpg"
							ImageText="8 Ball">
				<span class="txt_header">#ThisPage#</span>
				<br>		
				I first started to play 8 ball when I was 9 years old. My parents took me to a local juniors league and I played in a 
				team called "Hot Shots" with my sister and my cousin! My cousin had a 6ft snooker table which we used to practice on but
				it wasn't long before I had discovered I had a talent for the game. My parents had bought me a 4ft table a few years earlier 
				and I remember organising my first competition for money aged 7 or 8, it was on my own table so I won of course. 
				<p>
				After trying my hand at snooker in my teens I eventually started playing 8 ball again when I was asked to play for a local 
				pub team when I was just 15 years old. My father wasn't too thrilled about me playing in pubs at such a young age but he gave me 
				permission and my team went on to win the league. This success attracted various challenges and stake horses which resulted in large 
				money games in front of even larger crowds most weekends. Over the next few years I got the better of all the best players in town. 
				At 19 I gave up full time pool to go to University, despite this I still managed to win some national competitions and beat full time 
				Pro's for money in my spare time. 
				<p>								
				After many years at University, travelling and working in the IT industry I rediscovered my passion for pool in 2003. I signed up for a local team 
				in Sydney, Australia and we won the league. Our prize for this success was not the usual plastic cup but a trip to Las Vegas no less, 
				to play in BCA National Championships. Amazingly after so long away from the game I managed to place 13th out of almost 2000 entries 
				which earnt me a not too shabby $1500 for my troubles!
				<p> 	
				Below is a series of date listed articles about my most memorable 8 ball experiences.
				</td>
			</tr>
			<tr><td><img src="../../images/dotpix.gif" height="20" width="1"></td></tr>
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
		<td bgcolor="##CCCCCC"><img src="../../images/dotpix.gif" height="1" width="175"></td>
		<td><img src="../../images/dotpix.gif" height="20" width="25"></td>
		<td><img src="../../images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>

<cfinclude template="../../footer.cfm">	 

</body>
</cfoutput>	 
</html>
