<CFAPPLICATION NAME="ATP" CLIENTMANAGEMENT="No" SESSIONMANAGEMENT="Yes" SESSIONTIMEOUT="#CreateTimeSpan(0,0,30,0)#">

<cfif NOT CompareNoCase(CGI.server_name,"localhost") OR NOT CompareNoCase(CGI.server_name,"dreamlaptop")>
	<cfset Application.Home = "http://localhost:8500/wwwthelifeofrileyorg2/">
	<cfset Application.CFC = "/componentslor2/cms/">
	<cfset Application.DataUserName = "">
	<cfset Application.DataPassWord = "">
<cfelse>
	<cfset Application.Home = "http://www.thelifeofriley.org/">
	<cfset Application.CFC = "/componentslor2/cms/">
	<cfset Application.DataUserName = "">
	<cfset Application.DataPassWord = "">	
</cfif>

<cfset Application.DataSource = "riley">

<cfset Application.SiteName = "The Life of Riley">

<cfset Application.Email = "info@thelifeofriley.org">
<cfset Application.EmailFrom = "cms@thelifeofriley.org">
<cfset Application.EmailSupport = "help@thelifeofriley.org">

<cfset PriColor = "CC6600">
<cfset SecColor = "E6B380">


