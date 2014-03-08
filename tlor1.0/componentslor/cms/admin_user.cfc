

<cfcomponent>		

	<cffunction name="sendEmail" access="public" returntype="string" output="false">
		
		<!--- Required Arguments --->
		<cfargument name="Home" type="string" required="true">
		<cfargument name="AdminUserID" type="numeric" required="true">
		<cfargument name="MessageType" type="string" required="true">
		<!--- Optional Arguments --->
		<cfargument name="EmailType" type="string" required="false" default="html">
		<cfargument name="EmailBcc" type="string" required="false" default="info@xroom.co.uk">
		<cfargument name="EmailFrom" type="string" required="false" default="atpcms@atp.com.au">

		<cfquery name="GetData" datasource="#Application.DataSource#">
			SELECT au.*, aut.admin_user_type		
			FROM cms_users au			
			LEFT OUTER JOIN cms_user_types aut ON au.admin_user_type_id = aut.admin_user_type_id
			WHERE au.admin_user_id = #arguments.AdminUserID#
		</cfquery>				

		<cfif GetData.RecordCount>

<!--- Email --->
<cfmail to="#GetData.email#" bcc="#arguments.EmailBcc#" from="#arguments.EmailFrom#" subject="ATP CMS - #arguments.MessageType#" type="#arguments.EmailType#">

Dear #GetData.first_name# #GetData.family_name#, this email contains your ATP CMS login information.
<p>
You can login at <a href="#Application.Home#cms/">#Application.Home#cms/</a>, your login details are:
<p>
<table border="0" cellspacing="2" cellpadding="5" bgcolor="##CC6600">
  <tr bgcolor="##CCCCCC">
    <td><strong>First Name</strong></td>
    <td>#GetData.first_name#</td>
  </tr>
  <tr bgcolor="##CCCCCC">
    <td><strong>Surname</strong></td>
    <td>#GetData.family_name#</td>
  </tr>
  <tr bgcolor="##CCCCCC">
    <td><strong>User Type</strong></td>
    <td>#GetData.admin_user_type#</td>
  </tr>
  <tr bgcolor="##E6B380">
    <td><strong>Email</strong></td>
    <td>#GetData.email#</td>
  </tr>
  <tr bgcolor="##E6B380">
    <td><strong>Password</strong></td>
    <td>#GetData.password#</td>
  </tr>
</table>
<p>
Regards
<p>
ATP Administrator
<p>
</cfmail> 
			
		</cfif>

		
	</cffunction>
</cfcomponent>