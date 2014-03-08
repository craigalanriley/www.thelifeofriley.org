<CFAPPLICATION NAME="riley" CLIENTMANAGEMENT="No" SESSIONMANAGEMENT="Yes" SESSIONTIMEOUT="#CreateTimeSpan(0,2,0,0)#">

<cfparam name="Live" default="0">

<cfif NOT CompareNoCase(CGI.server_name,"localhost") OR NOT CompareNoCase(CGI.server_name,"127.0.0.1")>
	<cfset Application.Home = "http://127.0.0.1:8500/www.thelifeofriley.org/">
	<cfset Application.Email = "craig@thelifeofriley.org">
<cfelse>
	<cfset Application.Home = "http://www.thelifeofriley.org/">
	<cfset Application.Email = "craig@thelifeofriley.org">
</cfif>

<cfset Application.Datasource = "riley">
<cfset Application.CompsPath = "/componentslor">

<cfset Application.ThisPage = GetFileFromPath(GetCurrentTemplatePath())>

<cfset Application.PriHome = "000000">
<cfset Application.SecHome = "666666">

<cfset Application.PriRil = "DC1818">
<cfset Application.SecRil = "EA7474">

<cfset Application.PriEdu = "F26100">
<cfset Application.SecEdu = "F7A066">

<cfset Application.PriEmp = "0000B5">
<cfset Application.SecEmp = "8080DA">

<cfset Application.PriSpo = "008E00">
<cfset Application.SecSpo = "80C780">

<cfset Application.PriTra = "840084">
<cfset Application.SecTra = "B566B5">

<cfset Application.PriGal = "FFCC00">
<cfset Application.SecGal = "E3DE79">


<cfset Application.FootPri = "100439">
<cfset Application.FootSec = "2E2352">
<cfset Application.FootRed = "660000">

<!----- This example shows the use of GetFunctionList.
<cfset fList = GetFunctionList()>
<cfoutput>#StructCount(fList)# functions<br><br></cfoutput>
<cfloop COLLECTION = "#fList#" ITEM = "key">
  <cfoutput>#key#<br>
  </cfoutput>
</cfloop> ---->
