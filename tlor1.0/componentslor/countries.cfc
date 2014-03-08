<cfcomponent>
	<cffunction name="Articles" access="public" returntype="any" output="true">
	
		<cfargument name="Datasource" type="string" required="true">
		<cfargument name="Home" type="string" required="true">
		<cfargument name="Front" type="numeric" required="false" default="0">
		<cfargument name="Continent" type="string" required="false" default="Any">
		<cfargument name="HowMany" type="numeric" required="false" default="200">
		<cfargument name="PerPage" type="numeric" required="false" default="5">
		<cfargument name="OrderBy" type="string" required="false" default="DATE_DISPLAY DESC">
		
		<!--- News --->
		<cfquery name="GetCountries" datasource="#arguments.Datasource#">
			SELECT c.COUNTRY_ID, c.VISITS, c.COUNTRY, c.SUMMARY, c.CONTENT, c.DATE_CREATED, ct.CONTINENT, i.FILE_NAME, i.IMAGE_NAME
			FROM countries c
			LEFT OUTER JOIN images i ON i.IMAGE_ID = c.THUMB_ID
			LEFT OUTER JOIN continents ct ON ct.CONTINENT_ID = c.CONTINENT_ID
			WHERE c.STATUS_ID = 1
			ORDER BY COUNTRY
		</cfquery>
		
		<span class="txt">I have visited the following <cfoutput>#GetCountries.Recordcount#</cfoutput> countries:</span>
		<p>
		<table width="550" border="0" cellspacing="0" cellpadding="0">
			<cfoutput query="GetCountries">
			<cfquery name="GetHowMany" datasource="#arguments.Datasource#">			
				select c1.COUNTRY_ID, j.DATE_ARRIVE
				from cities c1, cities c2, journeys j
				where j.JOURNEY_TO = c1.CITY_ID
				AND j.JOURNEY_FROM = c2.CITY_ID
				AND c1.COUNTRY_ID != c2.COUNTRY_ID
				AND c1.COUNTRY_ID = #COUNTRY_ID#
				ORDER BY j.DATE_ARRIVE
			</cfquery>
			<tr>
				<td valign="top"><img src="#arguments.Home#uploads/images/#FILE_NAME#" width="75" height="50" border="1" alt=" #IMAGE_NAME# "></td>
				<td><img src="#arguments.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
				<td valign="top">
				
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td><a href="?CountryID=#COUNTRY_ID#&Continent=#Continent#" class="txt_title">#COUNTRY#</a></td>
						</tr>
						<tr>
							<td class="txt">
							<cfif GetHowMany.RecordCount GT 0>
								I have visited this country <strong>#GetHowMany.RecordCount#</strong> time<cfif GetHowMany.RecordCount GT 1>s</cfif>
							<cfelse>
								I have only visited this country in transit
							</cfif>
							<cfif len(trim(GetHowMany.DATE_ARRIVE[1])) AND COUNTRY_ID NEQ 235>
								- my first visit was on <span class="txt_date">#DateFormat(GetHowMany.DATE_ARRIVE[1],"dd mmmm yyyy")#</span>.							
							<cfelseif COUNTRY_ID EQ 235>
								- I was born in England in 1974.
							<cfelse>	
								.
							</cfif>
							</td>
						</tr>
						<tr><td><img src="#arguments.Home#images/dotpix.gif" height="5" width="1" border="0"></td></tr>
						<tr>
							<td class="txt" align="right"><a href="?CountryID=#COUNTRY_ID#&Continent=#Continent#" class="more">MORE &gt;&gt;</a></td>
						</tr>
					</table>
					<!--- <cfif len(trim(CONTENT))></cfif>	 --->
																	
				</td>
			</tr>	
			<tr>
				<td><img src="#arguments.Home#images/dotpix.gif" height="10" width="80" border="0"></td>
				<td><img src="#arguments.Home#images/dotpix.gif" height="1" width="5" border="0"></td>
				<td><img src="#arguments.Home#images/dotpix.gif" height="1" width="465" border="0"></td>
			</tr>
			</cfoutput>	
		</table>

		<cfreturn>
		
	</cffunction>
	
	<cffunction name="ArticleData" access="public" returntype="any" output="true">
	
		<cfargument name="Datasource" type="string" required="true">
		<cfargument name="Home" type="string" required="true">
		<cfargument name="Front" type="numeric" required="false" default="0">
		<cfargument name="CountryID" type="numeric" required="true" default="0">
		<cfargument name="Continent" type="string" required="false" default="Any">
		<cfargument name="HowMany" type="numeric" required="false" default="200">
		<cfargument name="PerPage" type="numeric" required="false" default="5">
		<cfargument name="OrderBy" type="string" required="false" default="DATE_DISPLAY DESC">
		
		<!--- News --->
		<cfquery name="GetData" datasource="#arguments.Datasource#">
			SELECT c.COUNTRY_ID, c.VISITS, c.COUNTRY, c.SUMMARY, c.CONTENT, c.DATE_CREATED, ct.CONTINENT, i.FILE_NAME, i.IMAGE_NAME
			FROM countries c
			LEFT OUTER JOIN images i ON i.IMAGE_ID = c.THUMB_ID
			LEFT OUTER JOIN continents ct ON ct.CONTINENT_ID = c.CONTINENT_ID
			WHERE c.STATUS_ID = 1
			AND c.COUNTRY_ID = #CountryID#
			ORDER BY COUNTRY
		</cfquery>
		<cfquery name="GetHowMany" datasource="#arguments.Datasource#">			
			select c1.COUNTRY_ID, j.DATE_ARRIVE
			from cities c1, cities c2, journeys j
			where j.JOURNEY_TO = c1.CITY_ID
			AND j.JOURNEY_FROM = c2.CITY_ID
			AND c1.COUNTRY_ID != c2.COUNTRY_ID
			AND c1.COUNTRY_ID = #CountryID#
			ORDER BY j.DATE_ARRIVE
		</cfquery>
		
		<table width="550" border="0" cellspacing="0" cellpadding="0">
			<cfoutput>
			<tr>
				<td valign="top"><img src="#arguments.Home#uploads/images/#GetData.FILE_NAME#" width="75" height="50" border="1" alt=" #GetData.IMAGE_NAME# "></td>
				<td><img src="#arguments.Home#images/dotpix.gif" height="1" width="1" border="0"></td>
				<td valign="top">
				<span class="txt_title">#GetData.COUNTRY#</span>
				<br>
				<!--- On <span class="txt_date">#DateFormat(GetData.DATE_CREATED,"dd mmmm yyyy")#</span> I visited to #GetData.COUNTRY# for the first time. 
				<cfif GetData.VISITS GT 1>I have been to #GetData.COUNTRY# a total of #GetData.VISITS# times.<cfelse>I have not managed to return since then.</cfif><br>
				<cfif len(trim(GetData.CONTENT))>
					<p>GetData.CONTENT</p>
				</cfif>		 --->	
				<cfif GetHowMany.RecordCount GT 0>
					I have visited this country <strong>#GetHowMany.RecordCount#</strong> time<cfif GetHowMany.RecordCount GT 1>s</cfif>
				<cfelse>
					I have only visited this country in transit
				</cfif>
				<cfif len(trim(GetHowMany.DATE_ARRIVE[1])) AND CountryID NEQ 235>
					my first visit was on <span class="txt_date">#DateFormat(GetHowMany.DATE_ARRIVE[1],"dd mmmm yyyy")#</span>.											
				<cfelseif CountryID EQ 235>
					- I was born in England in 1974.			
				<cfelse>
					.
				</cfif>					
				</td>
			</tr>	
			<tr>
				<td><img src="#arguments.Home#images/dotpix.gif" height="10" width="80" border="0"></td>
				<td><img src="#arguments.Home#images/dotpix.gif" height="1" width="5" border="0"></td>
				<td><img src="#arguments.Home#images/dotpix.gif" height="1" width="465" border="0"></td>
			</tr>
			</cfoutput>	
		</table>

		<cfreturn>
		
	</cffunction>	
	
</cfcomponent>