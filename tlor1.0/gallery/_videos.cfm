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
			
				<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="500" height="400" id="videoplayer" align="middle">
				<param name="allowScriptAccess" value="sameDomain" />
				<param name="movie" value="../video/videoplayer.swf" />
				<param name="quality" value="high" />
				<param name="bgcolor" value="#ffffff" />
				<embed src="../video/videoplayer.swf" quality="high" bgcolor="#ffffff" width="500" height="400" name="videoplayer" align="middle" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />
				</object>
				
			<p align="center">96 Ball run @ Rack n Roll Billiards, Manila, 2005.</p>
			
			<!--- <!--- Gallery Navigation Variables --->
			<cfparam name="PerPage" default="6">		
			<cfparam name="StartRow" default="1">
			<cfparam name="EndRow" default="">
			<cfparam name="PrevRow" default="">
			<cfparam name="NextRow" default="">
			<cfparam name="Count" default="">
			<cfparam name="Category" default="">
			
			<cfparam name="SectionID" default="0">
			<cfparam name="CountryID" default="0">
			<cfparam name="FreeText" default="">			
			
			<cfquery name="GetImages" datasource="#Application.Datasource#">
				SELECT i.IMAGE_ID, i.IMAGE_NAME, i.FILE_NAME, i.DATE_CREATED,
					   i.SUMMARY, i.COUNTRY_ID, i.FRONT_PAGE
				FROM images i<cfif SectionID GT 0>, image_section_lookup isl</cfif>
				WHERE IMAGE_TYPE_ID = 2
				AND STATUS_ID = 1
				<cfif SectionID GT 0>
					AND i.IMAGE_ID = isl.IMAGE_ID
					AND isl.SECTION_ID = #SectionID#
				</cfif>
				<cfif len(trim(FreeText))>
					AND i.SUMMARY LIKE '%#FreeText#%'
				</cfif>
				<cfif CountryID GT 0>
					AND i.COUNTRY_ID = #CountryID#
				</cfif>
				ORDER BY DATE_CREATED DESC
			</cfquery>
			
			<cfif GetImages.Recordcount>
			
				<cfset PageNo = Ceiling(StartRow / PerPage)>
				<cfset Pages = Ceiling(GetImages.RecordCount / PerPage)>
				
				<cfif StartRow GT GetImages.RecordCount>
					<cfset StartRow = (GetImages.RecordCount - PerPage +1)>
				</cfif>
				<cfset EndRow=  Min(StartRow + PerPage - 1, GetImages.RecordCount)>
				<cfset NextRow= EndRow + 1>
				<cfset PrevRow= Max(StartRow - PerPage, 1)>
				<cfif StartRow gt 1>
					<cfset Previous = PrevRow>
				</cfif>
				<cfif EndRow LT GetImages.RecordCount>
					<cfset Next = NextRow>
				</cfif>			
					
				<cfset Toggle = 0>
				<table border="0" cellpadding="0" cellspacing="5">
				<tr><td colspan="3" class="txt"><cfoutput>Showing images #StartRow# to #EndRow# [out of #GetImages.Recordcount#]</cfoutput></td></tr>
				<cfoutput query="GetImages" StartRow="#StartRow#" MaxRows="#PerPage#">
					<cfif Toggle EQ 0>
						<tr>
					</cfif>
						<td valign="top">
							
							<table bgcolor="##000000" border="0" cellpadding="0" cellspacing="1">
								<tr><td><img src="#Application.Home#uploads/images/#FILE_NAME#" width="175" border="0" alt=" #SUMMARY# "></td></tr>
								<tr bgcolor="##FFFFFF"><td class="txt">&nbsp;#IMAGE_NAME#</td></tr>
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
				
				<table cellspacing="0" cellpadding="0" border="0" align="center">
				<cfoutput>
				<tr>			
				<cfif isDefined("Previous")>
					<td><a class="PageNav" href="?FreeText=#FreeText#&CountryID=#CountryID#&SectionID=#SectionID#&StartRow=#Previous#" onmouseover="on('back')" onmouseout="off('back')"><img src="../images/pagenav/back.gif" name="back" width="97" height="30" border="0" alt=" Back "></a></td>
				</cfif>										
				<!--- page links --->
				<cfloop from="1" to="#Pages#" index="Count" step="1">		     
					<cfset StartRowvalue = (PerPage * Count) - (PerPage - 1)>		
					<cfif  GetImages.RecordCount GT PerPage>
						<!--- This line checks to see what page is being displayed and puts a link around all the other links --->
						<cfif Count EQ PageNo>
							<td><a href="?FreeText=#FreeText#&CountryID=#CountryID#&SectionID=#SectionID#&StartRow=#StartRowvalue#" class="PageNav"><img src="../images/pagenav/p#Count#_pon.gif" width="21" height="30" border="0" alt=" Page #Count# " name="p#Count#"></td>						
						<cfelse>
							<td><a class="PageNav" href="?FreeText=#FreeText#&CountryID=#CountryID#&SectionID=#SectionID#&StartRow=#StartRowvalue#" onmouseover="on('p#Count#')" onmouseout="off('p#Count#')"><img src="../images/pagenav/p#Count#.gif" width="21" height="30" border="0" alt=" Page #Count# " name="p#Count#"></a></td>
						</cfif>
					</cfif>			
				</cfloop> 							
				<cfif isDefined("Next")>
					<td><a class="PageNav" href="?FreeText=#FreeText#&CountryID=#CountryID#&SectionID=#SectionID#&StartRow=#Next#" onmouseover="on('next')" onmouseout="off('next')"><img src="../images/pagenav/next.gif" name="next" width="97" height="30" border="0" alt=" Next "></a></td>
				</cfif>	
				</tr>
				</cfoutput>
				</table>
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
			</cfif> --->
				
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
