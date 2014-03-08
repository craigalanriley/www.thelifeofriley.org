<cfcomponent>

	<cffunction name="Articles" access="public" returntype="any" output="true">
	
		<cfargument name="Datasource" type="string" required="true">
		<cfargument name="Home" type="string" required="true">
		<cfargument name="JourneyType" type="string" required="false" default="Any">
		<cfargument name="HowMany" type="numeric" required="false" default="200">
		<cfargument name="PerPage" type="numeric" required="false" default="5">
		<cfargument name="OrderBy" type="string" required="false" default="DATE_DISPLAY DESC, ">
		
		<!--- Articles --->
		<cfquery name="GetJourneys" datasource="#arguments.Datasource#" maxrows="#arguments.HowMany#">
			SELECT j.JOURNEY_ID,j.JOURNEY_TYPE_ID,j.SUMMARY,j.REF,j.CLASS,j.OPERATOR,j.DISTANCE,
				   j.DATE_DEPART, j.DATE_ARRIVE,
				   jt.JOURNEY_TYPE,
				   c1.CITY AS JOURNEY_FROM,
				   c2.CITY AS JOURNEY_TO		
			FROM journeys j
			LEFT OUTER JOIN cities c1 ON c1.CITY_ID = j.JOURNEY_FROM 
			LEFT OUTER JOIN cities c2 ON c2.CITY_ID = j.JOURNEY_TO 
			LEFT OUTER JOIN journey_types jt ON jt.JOURNEY_TYPE_ID = j.JOURNEY_TYPE_ID
			WHERE j.STATUS_ID = 1
			<cfif arguments.JourneyType NEQ 'Any'>
				AND j.JOURNEY_TYPE_ID = jt.JOURNEY_TYPE_ID
				AND	jt.JOURNEY_TYPE = '#arguments.JourneyType#'
			</cfif>
			ORDER BY #arguments.OrderBy#
		</cfquery>		
		
		<cfif GetJourneys.Recordcount>
		
			<cfoutput>
			<table width="550" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td class="txt" colspan="2">I have been on #GetJourneys.Recordcount# <cfif arguments.JourneyType NEQ 'Any'>#arguments.JourneyType#</cfif> journey(s):</td>
				</tr>
				<tr>
					<td><img src="#arguments.Home#images/dotpix.gif" height="10" width="40"></td>
					<td><img src="#arguments.Home#images/dotpix.gif" height="1" width="510"></td>
				</tr>
				<cfloop query="GetJourneys">
				<tr>
					<td><img src="#arguments.Home#images/icons/icon_#LCASE(JOURNEY_TYPE)#.gif" height="35" width="40"></td>
					<td valign="middle" class="txt">
					</span><span class="txt_date">#DateFormat(DATE_DEPART,"dd-mm-yyyy")# @ #TimeFormat(DATE_DEPART,"HH:MM")#</span> <span class="txt_title">&nbsp;#JOURNEY_FROM#</span> to <span class="txt_title">#JOURNEY_TO#</span> <cfif len(trim(OPERATOR)) OR len(trim(REF)) OR len(trim(CLASS))>[ <cfif len(trim(OPERATOR))>#OPERATOR#</cfif> <cfif len(trim(REF))> #REF#</cfif><cfif len(trim(CLASS))> : #CLASS#</cfif> ]</cfif>
					<!--- <cfif len(trim(SUMMARY))><br>#SUMMARY#<br></cfif> --->
					</td>
				</tr>	
				<tr><td colspan="2"><img src="#arguments.Home#images/dotpix.gif" height="10" width="1"></td></tr>
				</cfloop>	
			</table>
			</cfoutput>		
		<!--- <cfelse>
			<span class="txt_message">Sorry, no articles have been added yet, please try again later.</span> --->
		</cfif>
		
		<cfreturn>
		
	</cffunction>
	
	
	<cffunction name="ArticleData" access="public" returntype="any" output="true">
	
		<cfargument name="Home" type="string" required="true">
		<cfargument name="JourneyID" type="numeric" required="true">
		<cfargument name="JourneyType" type="string" required="false" default="Any">
		
		<cfreturn>
		
	</cffunction>
	
	<cffunction name="RelatedJourneys" access="public" returntype="string">
	
		<cfargument name="CountryID" type="string" required="false" default="Any">
		<cfargument name="DateDepart" type="string" required="false" default="Any">
		<cfargument name="DateReturn" type="string" required="false" default="Any">	
									
		<!--- Get Vacation Journeys --->
		<cfquery name="GetJourneys" datasource="#arguments.Datasource#">
			SELECT j.JOURNEY_ID,j.SUMMARY,j.REF,j.CLASS,j.OPERATOR,j.DISTANCE,j.DATE_DEPART,j.DATE_ARRIVE,
				   c1.CITY AS JOURNEY_FROM,
				   c2.CITY AS JOURNEY_TO				   
			FROM journeys j
			LEFT OUTER JOIN cities c1 ON c1.CITY_ID = j.JOURNEY_FROM 
			LEFT OUTER JOIN cities c2 ON c2.CITY_ID = j.JOURNEY_TO 
			WHERE j.STATUS_ID = 1
			<cfif arguments.DateDepart NEQ 'Any' AND arguments.DateReturn NEQ 'Any'>
				AND (j.DATE_DEPART >= #CreateODBCDate(arguments.DateDepart)# AND j.DATE_DEPART <= #CreateODBCDate(arguments.DateReturn)#
				OR (j.DATE_ARRIVE >= #CreateODBCDate(arguments.DateDepart)# AND j.DATE_ARRIVE <= #CreateODBCDate(arguments.DateReturn)#))
			</cfif>
			<cfif arguments.CountryID NEQ 'Any'>
				AND c1.COUNTRY_ID = #arguments.CountryID# OR c2.COUNTRY_ID = #arguments.CountryID#
			</cfif>
			ORDER BY j.DATE_DEPART
		</cfquery>		
		<cfif GetJourneys.Recordcount>
			<table width="550" border="0" cellspacing="0" cellpadding="0">
			<tr><td class="txt_header">Related Journeys:</td></tr>
			<cfoutput query="GetJourneys">
			<tr>
				<td></span><span class="txt_date">#DateFormat(DATE_DEPART,"dd-mm-yyyy")# @ #TimeFormat(DATE_DEPART,"HH:MM")#</span> <span class="txt_title">&nbsp;#JOURNEY_FROM#</span> to <span class="txt_title">#JOURNEY_TO#</span> <cfif len(trim(OPERATOR)) OR len(trim(REF)) OR len(trim(CLASS))>[ <cfif len(trim(OPERATOR))>#OPERATOR#</cfif> <cfif len(trim(REF))> #REF#</cfif><cfif len(trim(CLASS))> : #CLASS#</cfif> ]</cfif></td>
			</tr>
			</cfoutput>
			</table>
			<p>									
		</cfif>				

		<cfreturn>
		
	</cffunction>	
	
	
</cfcomponent>