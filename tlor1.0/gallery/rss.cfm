<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>RSS Test</title>
</head>

<body>
<cfoutput>

<cfparam name="Action" default="0">

<p>
<form action="?Action=1" method="post">
<img src="feed.gif" alt=" RSS Feed ">
<input type="text" name="rss" width="100">
<input type="submit" value=" Get Headlines ">
</form>
</p>

<p>
<form action="?Action=1" method="post">
<img src="feed.gif" alt=" RSS Feed ">
<select name="rss">
	<option value="http://www.internationalpooltour.com/rss.asp">IPT Pool</option>
	<option value="http://www.azbilliards.com/rss/feed.xml">AZ Billiards</option>
	<option value="http://www.insidepoolmag.com/index2.php?option=com_rss&feed=RSS2.0&no_html=1">Inside Pool</option>
	<option value="http://newsrss.bbc.co.uk/rss/sportonline_uk_edition/other_sports/snooker/rss.xml">BBC Snooker</option>
	<option value="http://www.youtube.com/rss/user/globetrotter69/videos.rss">YouTUBE</option>
</select>
<input type="submit" value=" Get Headlines ">
</form>
</p>

<br>

<cfif Action>

	<cftry>

	<cfhttp url="#FORM.rss#" resolveurl="no"/>
	<!--- <CFHTTP URL="http://newsrss.bbc.co.uk/rss/sportonline_uk_edition/other_sports/snooker/rss.xml" resolveurl="yes"/> --->
	
	<cfset VARIABLES.LocalRSS = "#XMLParse(CFHTTP.FileContent)#">
	<cfparam name="VARIABLES.RandomList" default="">
	
	<table cellpadding="0" cellspacing="0" width="500">
		<tr>
			<td>
			<b>#VARIABLES.LocalRSS.rss.channel.title.xmltext#</b><br>
			#VARIABLES.LocalRSS.rss.channel.description.xmltext#<br>
			</td>
		</tr>	
		<tr><td>&nbsp;</td></tr>
		<cfloop from="1" TO="#Arraylen(VARIABLES.LocalRSS.rss.channel.item)#" index="r">
			<cfset VARIABLES.LoopControl = 0>
			<cfloop condition="VARIABLES.LoopControl EQ 0">
				<cfset RandomPick = RandRange(1, Arraylen(VARIABLES.LocalRSS.rss.channel.item))>
				<cfif NOT ListFind(VARIABLES.RandomList, RandomPick)>
					 <cfset VARIABLES.RandomList = ListAppend(VARIABLES.RandomList, RandomPick)>
					 <cfset VARIABLES.LoopControl = 1>
				</cfif>
			</cfloop>
			<TR>
			   <TD CLASS="body" valign="top">
			   <img src="#VARIABLES.LocalRSS.rss.channel.item[RandomPick]['media:thumbnail'].xmlAttributes['url']#" alt="" align="right">
			   <i>#VARIABLES.LocalRSS.rss.channel.item[RandomPick].pubDate.xmltext#</i><br>
			   <A HREF="#VARIABLES.LocalRSS.rss.channel.item[RandomPick].link.xmltext#" TARGET="_BLANK">#VARIABLES.LocalRSS.rss.channel.item[RandomPick].title.xmltext#</A><br>
			   by <a href="">#VARIABLES.LocalRSS.rss.channel.item[RandomPick]['media:credit'].xmltext#</a>
			   </TD>
			</TR>
			<TR>
			   <TD>&nbsp;</TD>
			</TR>
		</cfloop>
	</table>
	
	<font color="##FF0000">#VARIABLES.LocalRSS.rss.channel.item[1]['media:thumbnail'].xmlAttributes['url']#</font><br>
	<br>
	<cfdump var="#VARIABLES.LocalRSS#">
	

	<cfcatch>
		<div style="color:##FF0000; font-weight:bold">#cfcatch.message#</div>
		#cfcatch.detail#<br>
	</cfcatch>

	</cftry>

</cfif>

</cfoutput>
</body>
</html>
