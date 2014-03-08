<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "Highest Breaks">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet type="text/css" href="../../stylesheets/riley.css">
	<script language="javascript" src="../../javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderImage="header_ozcricket.jpg">

<cfinclude template="../../includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">
		
			<!--- Navigation --->
			<cfinclude template="../../includes/nav_sport.cfm">
		
		</td>
		<td><img src="../../images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; <a href="#Application.Home#/sport/" class="bread">SPORT</a> &gt; <a href="#Application.Home#/sport/snooker/" class="bread">SNOOKER</a> &gt; #ThisPage#</td>
	</tr>
  	<tr>
    	<td><img src="../../images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt">
		
		<cfif NOT isDefined("ArticleID")>			
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<span class="txt_header">#ThisPage#</span>
				<br>		
				This page contains all the breaks over 50 I have made over the last couple of years in Sydney. 
				I have also added a couple of big breaks from the last time I played for a snooker team ten years ago.
				<p>
				Unfortunately it's impossible for me to recall the countless breaks I had when I was playing full time.
				<p>
				Each break is categorised depending on how it was achieved. 
				<p>
				<p>								
				</td>
			</tr>
			<tr><td><img src="../../images/dotpix.gif" height="20" width="1"></td></tr>
			<tr>
				<td>					
				
					<cfquery name="GetBreaks" datasource="#Application.Datasource#">
						SELECT b.BREAK_ID, b.TITLE
						FROM breaks b
						WHERE STATUS_ID = 1
						ORDER BY DATE_DISPLAY DESC,TITLE
					</cfquery>		
					<cfparam name="BreakList" default="">			
					<cfloop query="GetBreaks">
						<cfif ListLen(TITLE) GT 1>
							<cfloop list="#TITLE#" index="b">
								<cfset BreakList = ListAppend(BreakList,"#b#.#BREAK_ID#")>						
							</cfloop>				
						<cfelse>					
							<cfset BreakList = ListAppend(BreakList,"#TITLE#.#BREAK_ID#")>				
						</cfif>				
					</cfloop>
					<cfset BreakList = ListSort(BreakList, "numeric", "desc")>
					
					<cfset HeaderColor = "000099">
					<cfset Color1 = "999999">
					
					<table width="550" border="0" cellspacing="1" cellpadding="3">				
					<tr bgcolor="##660000">
						<td width="40" class="txt_white">BREAK</td>
						<td width="50" class="txt_white">TYPE</td>
						<td width="60" class="txt_white">AGAINST</td>
						<td width="75" class="txt_white">VENUE</td>
						<td width="275" class="txt_white">NOTES</td>
						<td width="50" class="txt_white">DATE</td>
					</tr>
					<cfloop list="#BreakList#" index="x">
						<cfquery name="GetData" datasource="#Application.Datasource#">
							SELECT b.BREAK_ID, b.TITLE, b.SUMMARY, b.LOCATION, b.WHO, b.DATE_DISPLAY, bt.BREAK_TYPE
							FROM breaks b, break_types bt
							WHERE b.BREAK_TYPE_ID = bt.BREAK_TYPE_ID
							AND BREAK_ID = #ListGetAt(x,"2",".")#
						</cfquery>					
						<tr bgcolor="##CCCCCC">
							<td class="txt_table" bgcolor="##2E2352" valign="top">#ListGetAt(x,"1",".")#</td>
							<td class="txt_small" valign="top">#GetData.BREAK_TYPE#</td>
							<td class="txt_small" valign="top">#GetData.WHO#</td>
							<td class="txt_small" valign="top">#GetData.LOCATION#</td>
							<td class="txt_small" valign="top" >#GetData.SUMMARY#</td>
							<td class="txt_small" valign="top">#DateFormat(GetData.DATE_DISPLAY,"dd-mm-yyyy")#</td>
						</tr>
					</cfloop>
					</table>

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
				</td>
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
