<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "Employment">

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

			<cfinclude template="../includes/google_rectangle.cfm">		
		
		</td>
		<td><img src="../images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; EMPLOYMENT</td>
	</tr>
  	<tr>
    	<td><img src="../images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt">
			
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<cfinvoke component="#Application.CompsPath#/content_photo" method="Display" 
							FileName="poolball.jpg"
							ImageText="Balls!">
				<span class="txt_header">#ThisPage#</span>
				<br>		
				My first job was delivering the local newspaper on a Thursday evening when I was about 13 years old. I was 
				too lazy to do the morning shift but I still wanted to work. I worked in many different jobs while I was young, 
				including summer factory work, restaurants and even onion picking which I stuck for a whole day before quitting!
				By the age of 18 I had had about 20 different jobs, this only increased when a friend and I decided to broaden our
				horizons and travel to America to spend a year working in 1994/95. I worked as a waited in Myrtle Beach and Las Vegas, a laborer
				and kitchen hand in Hollywood, and I helped decorate a youth hostel in New York City!
				<p>
				After I graduated in 1999 I chose to become a web developer, but during my degree I spent a year working for Compaq computers
				as a Production Engineer in Scotland. This was great corporate experience and I'm sure it helped me get my first post graduate 
				job in April 2000.
				I spent the next year working i London for Reading Room, one of the leading web design agencies in the UK at the time. But after just one year 
				I was chosen to go to Sydney, Australia to setup Reading Room's first international office.
				<p>
				I worked for Reading Room in Sydney for another 3 years, building websites for clients such as The Australian Technology Park, Petroleum
				Development Oman, and the award winning government website Hornsbyshire Council. During this time I was made technical director but I also had responsibility for 
				website production and research and development. 
				<p>
				In October 2003 I departed company with Reading Room and went to work for the e-services department of a government agency, 
				Sydney Harbor Foreshore Authority (SHFA). During this time I worked on sites such as Darling Harbor, The Rocks, and I also redeveloped the 
				fantastic Australian Technology Park website.
				<p>								
				</td>
			</tr>
			<tr><td><img src="../images/dotpix.gif" height="20" width="1"></td></tr>
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

</body></cfoutput>	 


</html>
