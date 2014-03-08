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
			<!--- Gallery Navigation Variables --->
			<cfparam name="PerPage" default="15">		
			<cfparam name="StartRow" default="1">
			<cfparam name="EndRow" default="">
			<cfparam name="PrevRow" default="">
			<cfparam name="NextRow" default="">
			<cfparam name="Count" default="">
			<cfparam name="Category" default="">
			
			<cfparam name="FreeText" default="">			
			<cfparam name="SectionID" default="0">
			<cfparam name="CountryID" default="0">
				
			<!--- Call Nav CFC - How Many Text --->	
			<cfinvoke component="#Application.CompsPath#/videos" method="GetThumbs" returnvariable="GetThumbs" 
						FreeText="#FreeText#">	

			
			<cfif GetThumbs.Recordcount>
			
				<!--- Call Nav CFC - How Many Text --->	
				<cfparam name="PerPage" default="15">		
				<cfparam name="StartRow" default="1">	
				<cfinvoke component="#Application.CompsPath#/results_nav" method="showHowMany" returnvariable="HowManyText" 
							StartRow="#StartRow#" 
							RecordCount="#GetThumbs.RecordCount#" 
							PerPage="#PerPage#">				
			
					
				<cfset Toggle = 0>
				<table border="0" cellpadding="0" cellspacing="5">
				<tr><td colspan="3" class="txt"><cfoutput>#HowManyText#</cfoutput></td></tr>
				<cfoutput query="GetThumbs" StartRow="#StartRow#" MaxRows="#PerPage#">
					<cfif Toggle EQ 0>
						<tr>
					</cfif>
						<td valign="top">
							<cfset PopupPath = "popup_videos.cfm">
								<cfset PopupWidth = "750">
								<cfset PopupHeight = "550">
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr bgcolor="##FFFFFF">
									<td>
										<!--- Text & Icon --->
										<table border="0" cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td width="100%" class="txt">&nbsp;#title#</td>
											
												<td><a href="##" onClick="javascript:window.open('#PopupPath#?','mywindow','width=#PopupWidth#,height=#PopupHeight#')"><img src="../images/icons/click_enlarge.gif" border="0" alt=" Click to Enlarge "></a></td>
											
										</tr>										
										</table>
										
									</td>
								</tr>
								<tr bgcolor="##FFFFFF">
									<td><object border="0" width="175" height="150" hspace="0" vspace="0" style="padding:0px 0px 0px 0px"><param name="movie" value="http://www.youtube.com/v/#file_name#" style="padding:0px 0px 0px 0px"></param><param name="wmode" value="transparent" style="padding:0px 0px 0px 0px"></param><embed src="http://www.youtube.com/v/#file_name#" type="application/x-shockwave-flash" wmode="transparent" width="175" height="150" style="padding:0px 0px 0px 0px"></embed></object></td>
								</tr>
							</table>
							
						</td>
					<cfif Toggle EQ 2>			
						</tr>
						<cfset Toggle = 0>			
					<cfelse>
						<cfset Toggle = Toggle + 1>
					</cfif>				
				</cfoutput>
				
				<cfif Toggle EQ 1>
						<td><img src="../images/dotpix.gif" height="1" width="175"></td>
						<td><img src="../images/dotpix.gif" height="1" width="175"></td>
					</tr>
				<cfelseif Toggle EQ 2>
						<td><img src="../images/dotpix.gif" height="1" width="175"></td>
					</tr>
				</cfif>
				</table>
				
				<br>
				
				<!--- Call Nav CFC - Display Page Nav --->	
				<cfinvoke component="#Application.CompsPath#/results_nav" method="showNav" 
							UrlVariables="FreeText=#FreeText#&CountryID=#CountryID#&SectionID=#SectionID#" 
							StartRow="#StartRow#" 
							RecordCount="#GetThumbs.RecordCount#" 
							PerPage="#PerPage#" 
							ClassPages="ArticleNavPages" 
							ClassPageOn="ArticleNavPageOn" 
							ClassBackNext="ArticleBackNext">					
				
			<cfelse>						
				<table border="0" cellpadding="0" cellspacing="5">
					<tr>
						<td class="txt_message" colspan="3">No Results, please try another search.</td>
					</tr>
					<tr>
						<td><img src="../images/dotpix.gif" height="200" width="175"></td>
						<td><img src="../images/dotpix.gif" height="1" width="175"></td>
						<td><img src="../images/dotpix.gif" height="1" width="175"></td>
					</tr>
				</table>				
			</cfif>
				
		</td>
  	</tr>
	<cfoutput>
	<tr>
		<td bgcolor="##CCCCCC"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td><img src="../images/dotpix.gif" height="20" width="25"></td>
		<td><img src="../images/dotpix.gif" height="1" width="550"></td>
	</tr>
	</cfoutput>
</table>

<cfinclude template="../footer.cfm">	 

</body>
</html>
