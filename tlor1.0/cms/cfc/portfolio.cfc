<cfcomponent>

	<cffunction name="Articles" access="public" returntype="any" output="true">
	
		<cfargument name="Datasource" type="string" required="true">
		<cfargument name="Home" type="string" required="true">
		<cfargument name="Front" type="numeric" required="false" default="0">
		<cfargument name="Module" type="string" required="false" default="Any">
		<cfargument name="HowMany" type="numeric" required="false" default="200">
		<cfargument name="PerPage" type="numeric" required="false" default="5">
		<cfargument name="OrderBy" type="string" required="false" default="TITLE">	
		<cfargument name="FreeText" type="string" required="false" default="">	
		<cfargument name="Employers" type="numeric" required="false" default="0">	
		<cfargument name="WebTechs" type="numeric" required="false" default="0">	
			
        
        <cfoutput>
			SELECT a.ARTICLE_ID, a.TITLE, a.SUMMARY, a.WEB, a.DATE_DISPLAY, i.FILE_NAME, i.IMAGE_NAME, e.EMPLOYER
			FROM modules m, <cfif arguments.WebTechs>, article_webtech_lookup awtl, </cfif> articles a
			LEFT OUTER JOIN images i ON a.THUMB_ID = i.IMAGE_ID
			LEFT OUTER JOIN employers e ON a.EMPLOYER_ID = e.EMPLOYER_ID
			WHERE a.STATUS_ID = 1
			AND a.MODULE_ID = m.MODULE_ID
			AND m.MODULE = '#arguments.Module#'
			<cfif len(trim(arguments.FreeText))>
				AND a.TITLE LIKE '%#arguments.FreeText#%'
			</cfif>
			<cfif arguments.Employers>
				AND a.EMPLOYER_ID = #arguments.Employers#
			</cfif>
			<cfif arguments.WebTechs>
				AND a.ARTICLE_ID = awtl.ARTICLE_ID
				AND awtl.TECH_ID = #arguments.WebTechs#
			</cfif>
			ORDER BY #arguments.OrderBy#		
		</cfoutput>
		<!--- Articles --->
		<cfquery name="GetArticles" datasource="#arguments.Datasource#" maxrows="#arguments.HowMany#">
			SELECT a.ARTICLE_ID, a.TITLE, a.SUMMARY, a.WEB, a.DATE_DISPLAY, i.FILE_NAME, i.IMAGE_NAME, e.EMPLOYER
			FROM modules m, <cfif arguments.WebTechs>, article_webtech_lookup awtl, </cfif> articles a
			LEFT OUTER JOIN images i ON a.THUMB_ID = i.IMAGE_ID
			LEFT OUTER JOIN employers e ON a.EMPLOYER_ID = e.EMPLOYER_ID
			WHERE a.STATUS_ID = 1
			AND a.MODULE_ID = m.MODULE_ID
			AND m.MODULE = '#arguments.Module#'
			<cfif len(trim(arguments.FreeText))>
				AND a.TITLE LIKE '%#arguments.FreeText#%'
			</cfif>
			<cfif arguments.Employers>
				AND a.EMPLOYER_ID = #arguments.Employers#
			</cfif>
			<cfif arguments.WebTechs>
				AND a.ARTICLE_ID = awtl.ARTICLE_ID
				AND awtl.TECH_ID = #arguments.WebTechs#
			</cfif>
			ORDER BY #arguments.OrderBy#
		</cfquery>
        
		
		<!--- Results Table --->
		<table width="550" border="0" cellspacing="0" cellpadding="0">
		<tr><td><img src="#arguments.Home#images/dotpix.gif" height="25" width="1"></td></tr>
		<tr>
			<td class="txt_title" colspan="3">Showing #GetArticles.Recordcount# Websites:</td>
		</tr>
		<tr><td><img src="#arguments.Home#images/dotpix.gif" height="25" width="1"></td></tr>
		</table>
		
		<cfif GetArticles.Recordcount>
			
			<!--- Results Table --->
			<table width="550" border="0" cellspacing="0" cellpadding="0">			
			<cfoutput query="GetArticles">
				<!--- Get Article Categories --->
				<cfquery name="GetCategories" datasource="#arguments.Datasource#" maxrows="#arguments.HowMany#">
					SELECT acl.CATEGORY_ID, c.CATEGORY
					FROM article_category_lookup acl, categories c
					WHERE acl.ARTICLE_ID = #ARTICLE_ID#
					AND acl.CATEGORY_ID = c.CATEGORY_ID
				</cfquery>						
				<cfif GetCategories.Recordcount>
					<cfset CategoryList = ValueList(GetCategories.CATEGORY)>
				<cfelse>
					<cfset CategoryList = "Any">
				</cfif>
				
				<tr>		
				<cfif len(trim(FILE_NAME))>		
					<td valign="top" rowspan="2"><cfif len(trim(WEB))><a href="#WEB#" target="_blank"></cfif><img src="#arguments.Home#uploads/images/#FILE_NAME#" alt=" #IMAGE_NAME# " border="0"><cfif len(trim(WEB))></a></cfif></td>
				<cfelse>
					<td valign="top" rowspan="2"><img src="#arguments.Home#images/portfolio/unavailable.gif" alt=" Screenshot Unavailable "></td>
				</cfif>
					<td><img src="#arguments.Home#images/dotpix.gif" height="95" width="1"></td>
					<td valign="top">									
					
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><span class="txt_title">#TITLE#</span> - <span class="txt_date">#DateFormat(DATE_DISPLAY,"mmmm yyyy")#</span></td>
							</tr>
							<tr>
								<td class="txt"><cfif len(trim(EMPLOYER))>I worked on this website in #DateFormat(DATE_DISPLAY,"yyyy")# while I was a #EMPLOYER# developer. While working on this website I used the following technologies and/or sortware:</cfif></td>
							</tr>
							<!--- <tr>
								<td class="txt" align="right"><cfif len(trim(WEB))><a href="#WEB#" class="more" target="_blank">View Website</a></cfif></td>
							</tr> --->
						</table>
						
					</td>
				</tr>	
				<tr>
					<td><img src="#arguments.Home#images/dotpix.gif" height="30" width="1"></td>
					<td>		
					
						<cfquery name="GetWebTechs" datasource="#arguments.Datasource#" maxrows="#arguments.HowMany#">
							SELECT wt.TECH_ID, wt.TECH_NAME, wt.TECH_ICON
							FROM article_webtech_lookup awtl, web_techs wt
							WHERE awtl.ARTICLE_ID = #ARTICLE_ID#
							AND awtl.TECH_ID = wt.TECH_ID
							ORDER BY wt.ORDER_BY,wt.TECH_ID
						</cfquery>									
						<cfif GetWebTechs.Recordcount>
							<table border="0" cellspacing="0" cellpadding="0">
							<tr>
							<cfloop query="GetWebTechs">
								<cfif len(trim(TECH_ICON))>
									<td><img src="#arguments.Home#images/icons/#TECH_ICON#" alt=" #TECH_NAME# "></td>
								</cfif>
							</cfloop>
							</tr>								
							</table>								
						</cfif>	
					
					</td>
				</tr>
				<tr>
					<td width="175"><img src="#arguments.Home#images/dotpix.gif" height="20" width="175"></td>
					<td width="5"><img src="#arguments.Home#images/dotpix.gif" height="1" width="5"></td>
					<td width="370"><img src="#arguments.Home#images/dotpix.gif" height="1" width="370"></td>
				</tr>
			</cfoutput>	
			</table>
			
		</cfif>
		
		<cfreturn>
		
	</cffunction>
	
</cfcomponent>