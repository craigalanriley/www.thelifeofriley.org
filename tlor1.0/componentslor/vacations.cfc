<cfcomponent>

	<cffunction name="Articles" access="public" returntype="any" output="true">
	
		<cfargument name="Datasource" type="string" required="true">
		<cfargument name="Home" type="string" required="true">
		<cfargument name="Front" type="numeric" required="false" default="0">
		<cfargument name="Module" type="string" required="false" default="Vacations">
		<cfargument name="HowMany" type="numeric" required="false" default="200">
		<cfargument name="PerPage" type="numeric" required="false" default="5">
		<cfargument name="OrderBy" type="string" required="false" default="DATE_DISPLAY DESC">
		
		<!--- Articles --->
		<cfquery name="GetArticles" datasource="#arguments..Datasource#" maxrows="#HowMany#">
			SELECT a.ARTICLE_ID, a.TITLE, a.SUMMARY, a.CONTENT, a.DATE_DISPLAY, a.DATE_END,
				   i.FILE_NAME, i.IMAGE_NAME
			FROM articles a
			<cfif arguments.Module NEQ 'Any'>, modules m</cfif>
			LEFT OUTER JOIN images i ON a.THUMB_ID = i.IMAGE_ID
			WHERE a.STATUS_ID = 1
			<cfif arguments.Front>AND a.FRONT_PAGE = #arguments.Front#</cfif>
			<cfif arguments.Module NEQ 'Any'>
				AND a.MODULE_ID = m.MODULE_ID
				AND m.MODULE = '#arguments.Module#'
			</cfif>
			ORDER BY #arguments.OrderBy#
		</cfquery>
		
		<cfif GetArticles.Recordcount>
		
			<table width="550" border="0" cellspacing="0" cellpadding="0">
				<cfoutput query="GetArticles">
				<tr>
				<cfif len(trim(FILE_NAME))>
					<td valign="top"><img src="#arguments.Home#uploads/images/#FILE_NAME#" alt=" #IMAGE_NAME# "></td>
					<td><img src="#arguments.Home#images/dotpix.gif" height="1" width="5"></td>
					<td valign="top">
				<cfelse>
					<td valign="top" colspan="3">
				</cfif>					
					
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td><a href="?ArticleID=#ARTICLE_ID#&DateDepart=#DATE_DISPLAY#&DateReturn=#DATE_END#" class="txt_title">#TITLE#</a> - <span class="txt_date">#DateFormat(DATE_DISPLAY,"dd mmmm yyyy")# to #DateFormat(DATE_END,"dd mmmm yyyy")#</span></td>
							</tr>
							<tr>
								<td class="txt">#SUMMARY#</td>
							</tr>
							<tr>
								<td class="txt" align="right"><cfif len(trim(CONTENT))><a href="?ArticleID=#ARTICLE_ID#&DateDepart=#DATE_DISPLAY#&DateReturn=#DATE_END#" class="more">MORE &gt;&gt;</a></cfif></td>
							</tr>
						</table>
						
					</td>
				</tr>	
				<tr>
					<td width="100"><img src="#arguments.Home#images/dotpix.gif" height="20" width="100"></td>
					<td width="5"><img src="#arguments.Home#images/dotpix.gif" height="1" width="5"></td>
					<td width="445"><img src="#arguments.Home#images/dotpix.gif" height="1" width="445"></td>
				</tr>
				</cfoutput>	
			</table>
			
		<!--- <cfelse>
			<span class="txt_message">Sorry, no articles have been added yet, please try again later.</span> --->
		</cfif>
		
		<cfreturn>
		
	</cffunction>
	
	
	<cffunction name="ArticleData" access="public" returntype="any" output="true">
	
		<cfargument name="Home" type="string" required="true">
		<cfargument name="ArticleID" type="numeric" required="true">
		<cfargument name="Category" type="string" required="false" default="Any">
		
		<!--- Data --->
		<cfquery name="GetData" datasource="#arguments.Datasource#">
			SELECT a.ARTICLE_ID, a.TITLE, a.SUMMARY, a.CONTENT, a.WEB, a.WEB_DESC, a.DATE_DISPLAY, a.DATE_END,
				   i.FILE_NAME, i.IMAGE_NAME
			FROM articles a
			LEFT OUTER JOIN images i ON a.THUMB_ID = i.IMAGE_ID
			WHERE a.ARTICLE_ID = '#arguments.ArticleID#'
		</cfquery>
		<!--- Get Article Image *Note: will be in own cfc later passing images to flash--->
		<cfquery name="GetImages" datasource="#arguments.Datasource#" maxrows="1">
			SELECT i.IMAGE_NAME, i.FILE_NAME
			FROM images i, article_image_lookup ail
			WHERE ail.IMAGE_ID = i.IMAGE_ID 
			AND ail.ARTICLE_ID = #ArticleID#
			ORDER BY ail.IMAGE_ID DESC
		</cfquery>
				
		<cfif GetData.Recordcount>
			<table width="550" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<!--- <cfif len(trim(GetData.FILE_NAME))>
						<td valign="top"><img src="#arguments.Home#uploads/images/#GetData.FILE_NAME#" alt=" #GetData.IMAGE_NAME# "></td>
						<td><img src="#arguments.Home#images/dotpix.gif" height="1" width="5"></td>
					</cfif> --->
					<td valign="top">
					<cfif GetImages.Recordcount>
						<img src="#arguments.Home#uploads/images/#GetImages.FILE_NAME#" alt=" #GetImages.IMAGE_NAME# " width="175" height="200" hspace="5" vspace="5" align="right" border="0">
					</cfif>
					<span class="txt_header">#GetData.TITLE#</span> - <span class="txt_date">#DateFormat(GetData.DATE_DISPLAY,"dd mmmm yyyy")# to #DateFormat(GetData.DATE_END,"dd mmmm yyyy")#</span>
					<br>
					#GetData.SUMMARY#
					<p>
					#GetData.CONTENT#
					<p>
					<cfif len(trim(GetData.WEB_DESC)) AND len(trim(GetData.WEB))>
						<a href="#GetData.WEB#" class="more" target="_blank">#GetData.WEB_DESC#</a>
						<p>
					</cfif>						
					</td>
				</tr>
			</table>		
																	
		<cfelse>
			<span class="txt_message">Sorry, article could not be found.</span>
		</cfif>
		
		<cfreturn>
		
	</cffunction>
	
	
</cfcomponent>