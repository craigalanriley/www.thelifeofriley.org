
<cfparam name="Message" default="">
<cfparam name="Session.UserID" default="0">

<!--- Set Error Message --->
<cfif len(trim(Message))>
	<cfset Message = "">
</cfif>
<cfset Message = "ERROR - the request could not be processed please try again later,0">

<!--- Get User Info --->
<cfquery name="GetUser" datasource="#Application.DataSource#">
	SELECT au.*							
	FROM cms_users au
	WHERE au.admin_user_id = #Session.UserID#
</cfquery>



<p>
<cfoutput>
<font color="##000066" face="Arial, Helvetica, sans-serif"><strong>CMS ERROR:</strong></font>
<p>
This email is to inform you that there has been an error in the <strong>ATP CMS</strong>. 
<p>
The error occured on <font color="##FF0000"><strong>#DateFormat(now(),"dd-mmm-yyyy")#</strong> @ <strong>#LSTimeFormat(now(),"HH:mm:ss")#</strong></font><cfif GetUser.Recordcount> when <strong>#GetUser.first_name# #GetUser.family_name#</strong> was editing the following page:</cfif>
<p>
<a href="#CGI.HTTP_REFERER#">#CGI.HTTP_REFERER#</a>
<p>
_________________________________________________________________________________________________
<p>
<font color="##000066" face="Arial, Helvetica, sans-serif"><strong>FURTHER DETAILS:</strong></font>
<p>
<cfif isDefined("Action")><strong>Page Action:</strong> #Action#<br></cfif>
<p>
<strong>Template Path:</strong> #CGI.CF_TEMPLATE_PATH#
<p>
<strong>Error Message:</strong> <font color="##FF0000">#cfcatch.message#</font>
<p>		
<strong>Details:</strong> #cfcatch.detail#
<p>
<cfif isDefined("cfcatch.tagcontext")>
	<strong>TagContext...</strong><p>
	<cfloop index="i" from="1" to="#ArrayLen(CFCATCH.TAGCONTEXT)#">
		<cfset sCurrent="#CFCATCH.TAGCONTEXT[i]#">
		TEMPLATE: #sCurrent["TEMPLATE"]#<br>
		LINE: #sCurrent["LINE"]#, Column: #sCurrent["COLUMN"]#<p>
	</cfloop>
</cfif>
<p>
<cfif isDefined("cfcatch.type")><strong>Type:</strong> #cfcatch.type#<br></cfif>
<cfif isDefined("cfcatch.NativeErrorCode")><strong>NativeErrorCode:</strong> #cfcatch.NativeErrorCode#<br></cfif>
<cfif isDefined("cfcatch.SQLSTATE")><strong>SQLState:</strong> #cfcatch.SQLState#<br></cfif>
<cfif isDefined("cfcatch.ErrNumber")><strong>ErrNumber:</strong> #cfcatch.ErrNumber#<br></cfif>
<cfif isDefined("cfcatch.MissingFileName")><strong>MissingFileName:</strong> #cfcatch.MissingFileName#<br></cfif>
<cfif isDefined("cfcatch.LockName")><strong>LockName:</strong> #cfcatch.LockName#<br></cfif>
<cfif isDefined("cfcatch.LockOperation")><strong>LockOperation:</strong> #cfcatch.LockOperation#<br></cfif>
<cfif isDefined("cfcatch.ErrorCode")><strong>ErrorCode:</strong> #cfcatch.ErrorCode#<br></cfif>
<cfif isDefined("cfcatch.ExtendedInfo")><strong>ExtendedInfo:</strong> #cfcatch.ExtendedInfo#<br></cfif>
<cfif isDefined("CGI.HTTP_REFERER")><strong>HttpReferrer:</strong> #CGI.HTTP_REFERER#<br></cfif>
<p>
_________________________________________________________________________________________________
<p>
</cfoutput>
<!--- Send Debug Email 
<cfmail to="#Application.EmailSupport#" subject="ATP CMS - Error" from="cmsadmin@atp-cms" type="html">
</cfmail>--->
