<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "VIDEOS">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet type="text/css" href="../stylesheets/riley.css">
	<script language="javascript" src="../javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderImage="header_hk5.jpg">

<cfinclude template="../includes/header.cfm"> 

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">
		
			<!--- Navigation --->
			<cfinclude template="../includes/nav_gallery.cfm">
			<p>		
			<!--- Search --->
			<cfinclude template="../includes/box_gallerysearch.cfm">
			<p>		
		
		</td>
		<td><img src="../images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; <a href="#Application.Home#gallery/" class="bread">GALLERY</a> &gt; #ThisPage#</td>
	</tr>
	</cfoutput>	  
  	<tr>
    	<td><img src="../images/dotpix.gif" height="150" width="1"></td>
    	<td class="txt" valign="top">
			
			<span class="txt_header"><cfoutput>#ThisPage#</cfoutput></span>
			<br>		
			<!--- You Tube RSS Gallery --->
			<cftry>
			
			<cfparam name="VARIABLES.RandomList" default="">
			<cfhttp url="http://www.youtube.com/rss/user/globetrotter69/videos.rss" resolveurl="no"/>
			<cfset VARIABLES.LocalRSS = "#XMLParse(CFHTTP.FileContent)#">
	
			<cfset Toggle = 0>
			<table cellpadding="0" cellspacing="6" width="500">
			<cfoutput>
				<cfloop from="1" TO="#Arraylen(VARIABLES.LocalRSS.rss.channel.item)#" index="r">
				
					
					<cfset vidLink = VARIABLES.LocalRSS.rss.channel.item[r].link.xmltext>			
					<cfset vidTitle = VARIABLES.LocalRSS.rss.channel.item[r].title.xmltext>					
					<cfset vidDate = VARIABLES.LocalRSS.rss.channel.item[r].pubDate.xmltext>
					<cfset vidCredit = VARIABLES.LocalRSS.rss.channel.item[r]['media:credit'].xmltext>
					<cfset vidThumb = VARIABLES.LocalRSS.rss.channel.item[r]['media:thumbnail'].xmlAttributes['url']>
					<cfset AltTxt = vidTitle & " - "& vidDate>
					<cfif len(VARIABLES.LocalRSS.rss.channel.item[r].title.xmltext) GTE 25>
						<cfset vidTitle = left(VARIABLES.LocalRSS.rss.channel.item[r].title.xmltext,25) & "...">
					</cfif>					
					<!--- 
					<cfset VARIABLES.LoopControl = 0>
					<cfloop condition="VARIABLES.LoopControl EQ 0">
						<cfset r = RandRange(1, Arraylen(VARIABLES.LocalRSS.rss.channel.item))>
						<cfif NOT ListFind(VARIABLES.RandomList, r)>
							 <cfset VARIABLES.RandomList = ListAppend(VARIABLES.RandomList, r)>
							 <cfset VARIABLES.LoopControl = 1>
						</cfif>
					</cfloop> 
					--->
				<cfif Toggle EQ 0>
					<tr>
				</cfif>
				
					<td class="body" valign="top">
					
						<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
						<tr bgcolor="##FFFFFF">
							<td>						
								<!--- Text & Icon --->
								<table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr>
									<td width="100%" class="txt">&nbsp;#vidTitle#</td>
									<td><a href="#vidLink#" target="_blank"><img src="../images/icons/click_enlarge.gif" border="0" alt=" Click to Play "></a></td>
								</tr>							
								</table>
							
							</td>
						</tr>
						<tr>
							<td><a href="#vidLink#" target="_blank"><img src="#vidThumb#" alt="#AltTxt#" width="175" border="0"></a></td>
						</tr>
						</table>
					
					</TD>		
				
				<cfif Toggle EQ 2>			
					</tr>
					<cfset Toggle = 0>			
				<cfelse>
					<cfset Toggle = Toggle + 1>
				</cfif>		
					
				</cfloop>
			</cfoutput>
			</table>	
			
			<cfcatch>
				<div style="color:##FF0000; font-weight:bold">ERROR! Could not connect to server please try later</div>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			</cfcatch>
		
		</cftry>				
		</td>
  	</tr>
	<tr>
		<td bgcolor="#CCCCCC"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td><img src="../images/dotpix.gif" height="20" width="25"></td>
		<td><img src="../images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>

<cfinclude template="../footer.cfm">	 

</body>
</html>
