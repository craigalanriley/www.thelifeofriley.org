<cfcomponent>		

	<cffunction name="buildTrail" access="public" returntype="string" output="true">
		
		<!--- Required Arguments --->
		<cfargument name="Home" type="string" required="true">
		<!--- Optional Arguments --->
		<cfargument name="PageTitle" type="string" required="false" default="This Page">
		<cfargument name="navList" type="string" required="false" default="0">
		<cfargument name="showBreadCrumbs" type="numeric" required="false" default="0">
		<cfargument name="showEmail" type="numeric" required="false" default="0">
		<cfargument name="showPrint" type="numeric" required="false" default="0">
		
		<cfparam name="MenuID" default="0">
		
		<cfquery name="GetMenuNames" datasource="#Application.DataSource#">
			SELECT m.menu_id, m.label
			FROM cms_menus m
			WHERE m.menu_id IN (#arguments.navList#)
			ORDER BY m.menu_level
		</cfquery>	
		
		<table width="590" border="0" cellspacing="0" cellpadding="0">
		<cfoutput>
		<tr>
			<td align="left">
			<!--- Breadcrumb Links --->
			<cfif arguments.showBreadCrumbs>
				<a href="#Application.Home#" class="breadCrumbs">Home</a>
				<cfif GetMenuNames.Recordcount>
					<cfloop query="GetMenuNames">
						<span class="txtBreadCrumbs">&nbsp;&gt;&nbsp;</span>
						<a href="dyncontent.cfm?MenuID=#menu_id#" class="breadCrumbs<cfif menu_id EQ ListLast(navList)>_on</cfif>">#label#</a>
					</cfloop>
				<cfelse>
					<span class="txtBreadCrumbs">&nbsp;&gt;&nbsp;</span>
					<a href="#GetFileFromPath(GetBaseTemplatePath())#?MenuID=#MenuID#" class="breadCrumbs_on">#PageTitle#</a>
				</cfif>
			</cfif>
			</td>
			<!--- Email Buttons --->
			<td align="left"><cfif arguments.showEmail><a href="email_friend.cfm"><img src="images/common/icon_email.gif" alt="Email a Friend " width="26" height="16" border="0"></a></cfif></td>
			<!--- Print Buttons --->
			<td align="right"><cfif arguments.showPrint><a href="?MenuID=#MenuID#&Print=1<cfif isDefined("ID")>&ID=#ID#</cfif>"><img src="images/common/icon_print.gif" alt=" Print " width="26" height="16" border="0"></a></cfif></td>
		</tr>
		<tr>
			<td><img src="images/dotpix.gif" width="530" height="10" border="0"></td>
			<td><img src="images/dotpix.gif" width="30" height="1"></td>
			<td><img src="images/dotpix.gif" width="30" height="1"></td>
		</tr>
		</cfoutput>
		</table>
		
		<cfreturn>

	</cffunction>
</cfcomponent>