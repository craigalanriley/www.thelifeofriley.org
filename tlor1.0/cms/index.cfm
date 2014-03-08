<cfparam name="LogOut" default="0">

<cfif LogOut>
	<cfloop collection="#session#" item="i">
		<cfset StructDelete(session,i)>
	</cfloop>
</cfif>


<cfinclude template="includes/inc_header.cfm">
<cfinclude template="includes/inc_message.cfm">


<cfif NOT isDefined("Session.UserID")>
	
	<cfinclude template="includes/inc_login.cfm">

<cfelse>

	<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

</cfif>


<cfinclude template="includes/inc_footer.cfm">

