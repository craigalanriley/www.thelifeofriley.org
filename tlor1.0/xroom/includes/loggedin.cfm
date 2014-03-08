<cfif NOT isDefined("Session.UserTypeID")>			
	<cflocation url="index.cfm" addtoken="No">
</cfif>
