
<cfcomponent>

	<cffunction name="Articles" access="public" returntype="any" output="true">
	
		<cfargument name="Datasource" type="string" required="true">
		<cfargument name="Home" type="string" required="true">
		<cfargument name="Front" type="numeric" required="false" default="0">
		<cfargument name="Module" type="string" required="false" default="Any">
		<cfargument name="Section" type="string" required="false" default="Any">
		<cfargument name="Category" type="string" required="false" default="Any">
		<cfargument name="HowMany" type="numeric" required="false" default="200">
		<cfargument name="PerPage" type="numeric" required="false" default="5">
		<cfargument name="ThisPage" type="string" required="false" default="">
		<cfargument name="OrderBy" type="string" required="false" default="DATE_DISPLAY DESC, ">
		
		<!--- Articles --->
		<cfquery name="GetArticles" datasource="#arguments.Datasource#" maxrows="#arguments.HowMany#">
			SELECT a.ARTICLE_ID, a.SECTION_ID, a.TITLE, a.SUMMARY, a.CONTENT, a.ENTRANTS, a.RESULT, a.PRIZE, a.HIGH_RUN, a.DATE_DISPLAY, 
				   i.FILE_NAME, i.IMAGE_NAME,
				   sec.SECTION, sec.SECTION_PATH
			FROM <cfif arguments.Section NEQ 'Any'>sections s,</cfif>
			     <cfif arguments.Category NEQ 'Any'> article_category_lookup acl, categories c, </cfif>			
			     <cfif arguments.Module NEQ 'Any'>modules m, </cfif> 
                 articles a
			LEFT OUTER JOIN images i ON a.THUMB_ID = i.IMAGE_ID
			LEFT OUTER JOIN sections sec ON a.SECTION_ID = sec.SECTION_ID
			WHERE a.STATUS_ID = 1
			<cfif arguments.Front>AND a.FRONT_PAGE = #arguments.Front#</cfif>
			<cfif arguments.Category NEQ 'Any'>
				AND a.ARTICLE_ID = acl.ARTICLE_ID
				AND acl.CATEGORY_ID = c.CATEGORY_ID
				AND c.CATEGORY = '#arguments.Category#'
			</cfif>
			<cfif arguments.Section NEQ 'Any'>
				AND a.SECTION_ID = s.SECTION_ID
				AND s.SECTION = '#arguments.Section#'
			</cfif>
			<cfif arguments.Module NEQ 'Any'>
				AND a.MODULE_ID = m.MODULE_ID
				AND m.MODULE = '#arguments.Module#'
			</cfif>
			ORDER BY #arguments.OrderBy#
		</cfquery>
		
		<cfif GetArticles.Recordcount>
		
			<table width="550" border="0" cellspacing="0" cellpadding="0">
			<tr><td colspan="3" class="txt_header">Latest Articles:</td></tr>
			<tr><td colspan="3"><img src="#arguments.Home#images/dotpix.gif" height="20" width="1"></td></tr>
			<cfoutput query="GetArticles">
				<!--- Get Article Categories --->
				<cfquery name="GetCategories" datasource="#arguments.Datasource#">
					SELECT acl.CATEGORY_ID, c.CATEGORY
					FROM article_category_lookup acl, categories c
					WHERE acl.ARTICLE_ID = #ARTICLE_ID#
					AND acl.CATEGORY_ID = c.CATEGORY_ID
				</cfquery>						
				<cfif GetCategories.Recordcount>
					<cfset CategoryList = ValueList(GetCategories.CATEGORY_ID)>
				<cfelse>
					<cfset CategoryList = "Any">
				</cfif>				
				<tr>				
					<td valign="top" rowspan="2"><cfif len(trim(FILE_NAME))><img src="#arguments.Home#uploads/images/#FILE_NAME#" alt=" #IMAGE_NAME# "><cfelse><img src="#arguments.Home#images/thumbs/blank_thumb.gif" alt=" No Image "></cfif></td>
					<td><img src="#arguments.Home#images/dotpix.gif" height="115" width="5"></td>
					<td valign="top">	
					
						<table width="100%" border="0" cellspacing="2" cellpadding="0">
							<cfif NOT CompareNoCase(ThisPage,"HOME")>
								<tr><td><a href="#GetArticles.SECTION_PATH#" class="section">#GetArticles.SECTION#</a></td></tr>
							</cfif>
							<tr>
								<td><cfif len(trim(CONTENT))><a href="?ArticleID=#ARTICLE_ID#&Category=#CategoryList#" class="txt_title">#TITLE#</a><cfelse><span class="txt_title">#TITLE#</span></cfif> - <span class="txt_date">#DateFormat(DATE_DISPLAY,"dd mmmm yyyy")#</span></td>
							</tr>
							<cfif ENTRANTS>
							<tr>
								<td>
								
								<table width="100%" border="0" cellspacing="0" cellpadding="3">
								<tr>
									<td width="15%" bgcolor="##333333" class="txt_white">ENTRIES</td>
									<td width="10%" bgcolor="##cccccc" class="txt_small">#ENTRANTS#</td>
									<td width="15%" bgcolor="##2E2352" class="txt_white">HIGH RUN</td>
									<td width="10%" bgcolor="##cccccc" class="txt_small"><cfif len(trim(HIGH_RUN))>#HIGH_RUN# Racks</cfif></td>
									<td width="15%" bgcolor="##333333" class="txt_white">RESULT</td>
									<td width="10%" bgcolor="##cccccc" class="txt_small">#RESULT#</td>
									<td width="15%" bgcolor="##660000" class="txt_white">PRIZE</td>
									<td width="10%" bgcolor="##cccccc" class="txt_small"><cfif isNumeric(PRIZE)>$</cfif>#PRIZE#</td>
								</tr>								
								</table>								
								
								</td>
							</tr>
							</cfif>
							<tr>
								<td class="txt">#SUMMARY#</td>
							</tr>
						</table>
						
					</td>
				</tr>	
				<tr>
					<td><img src="#arguments.Home#images/dotpix.gif" height="1" width="5"></td>
					<td align="right"><cfif len(trim(CONTENT))><a href="?ArticleID=#ARTICLE_ID#&Category=#CategoryList#" class="more">MORE &gt;&gt;</a></cfif></td>
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
			SELECT a.ARTICLE_ID, a.TITLE, a.SUMMARY, a.CONTENT, a.WEB, a.WEB_DESC, a.DATE_DISPLAY, 
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
						<!--- <img src="#arguments.Home#uploads/images/#GetImages.FILE_NAME#" alt=" #GetImages.IMAGE_NAME# " width="175" height="200" hspace="5" vspace="5" align="right" border="0"> --->
						<cfset FrontPage = "0">
						<table align="right" vspace="5" hspace="5" border="0" cellspacing="1" bgcolor="##000000" cellpadding="0">
						<tr><td bgcolor="##FFFFFF">
						<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab##version=6,0,0,0" width="175" height="200" id="dynamicimages">
						<param name="allowScriptAccess" value="sameDomain"/>
						<param name="movie" value="#arguments.Home#dynamicimages.swf"/>
						<param name="quality" value="high"/>
						<param name="bgcolor" value="##d6d3ce"/>
						<PARAM NAME="FlashVars" VALUE="ArticleID=#ArticleID#&FrontPage=#FrontPage#">
						<embed src="#arguments.Home#dynamicimages.swf" FlashVars="ArticleID=#ArticleID#&FrontPage=#FrontPage#" quality="high" bgcolor="##d6d3ce" width="175" height="200" name="dynamicimages" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer"/>
						</object>								
						</td></tr>
						</table>							
					
					</cfif>
					<span class="txt_header">#GetData.TITLE#</span> - <span class="txt_date">#DateFormat(GetData.DATE_DISPLAY,"dd mmmm yyyy")#</span>
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
	
	<cffunction name="RelatedNews" access="public" returntype="any" output="true">

		<cfargument name="ArticleID" type="string" required="false" default="Any">
		<cfargument name="CountryID" type="string" required="false" default="Any">
		<cfargument name="Category" type="string" required="false" default="Any">
		<cfargument name="DateDepart" type="string" required="false" default="Any">
		<cfargument name="DateReturn" type="string" required="false" default="Any">		
		
		<!--- GetRelated Category Articles --->
		<cfquery name="GetRelatedArticles" datasource="#arguments.Datasource#">
			SELECT a.ARTICLE_ID, a.TITLE, a.SUMMARY, a.DATE_DISPLAY
			FROM articles a<cfif arguments.Category NEQ 'Any'>, article_category_lookup acl</cfif>		
			WHERE a.STATUS_ID = 1
			<cfif arguments.Category NEQ 'Any'>
				AND a.ARTICLE_ID = acl.ARTICLE_ID
				AND acl.CATEGORY_ID IN ('#arguments.Category#')			
			</cfif>
			<cfif arguments.DateDepart NEQ 'Any'>
				AND a.DATE_DISPLAY >= #CreateODBCDate(arguments.DateDepart)#
			</cfif>
			<cfif arguments.DateReturn NEQ 'Any'>
				AND a.DATE_DISPLAY <= #CreateODBCDate(arguments.DateReturn)#
			</cfif>
			<cfif arguments.CountryID NEQ 'Any'>
				AND a.COUNTRY_ID = #arguments.CountryID#
			</cfif>
			<cfif arguments.ArticleID NEQ 'Any'>
				AND a.ARTICLE_ID != #arguments.ArticleID#
			</cfif>
			ORDER BY DATE_DISPLAY DESC
		</cfquery>
					
		<cfif GetRelatedArticles.Recordcount>
			<table width="550" border="0" cellspacing="0" cellpadding="0">
			<tr><td class="txt_header">Related Articles:</td></tr>
			<cfoutput query="GetRelatedArticles">
				<!--- Get Article Categories --->
				<cfquery name="GetCategories" datasource="#arguments.Datasource#">
					SELECT acl.CATEGORY_ID, c.CATEGORY
					FROM article_category_lookup acl, categories c
					WHERE acl.ARTICLE_ID = #ARTICLE_ID#
					AND acl.CATEGORY_ID = c.CATEGORY_ID
				</cfquery>						
				<cfif GetCategories.Recordcount>
					<cfset CategoryList = ValueList(GetCategories.CATEGORY_ID)>
				<cfelse>
					<cfset CategoryList = "Any">
				</cfif>			
				<tr>
					<td><span class="txt_date">#DateFormat(DATE_DISPLAY,"dd-mm-yyyy")#</span> - <a href="#arguments.Home#?ArticleID=#ARTICLE_ID#&Category=#CategoryList#" class="txt_title">#TITLE#</a>
					</td>
				</tr>
			</cfoutput>
			</table>									
		</cfif>				
		
		<cfreturn>
	
	</cffunction>	
	
</cfcomponent>