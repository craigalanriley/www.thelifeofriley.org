
DSN: <cfoutput>#Application.Datasource#</cfoutput>

<cfquery name="GetTest" datasource="#Application.Datasource#">
	select * from articles
</cfquery>

<cfdump var="#GetTest#">
