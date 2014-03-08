<cfcomponent>

	<cffunction name="Articles" access="public" returntype="array" output="true">
	
		<cfargument name="Datasource" type="string" required="true">
		<cfargument name="Home" type="string" required="true">
		<cfargument name="TDate" type="date" required="true" default="#Now()#">
		
		<cfquery name="GetArticles" datasource="#arguments.Datasource#">
			SELECT td.THIS_DAY_ID, td.SUMMARY, td.CITY_ID, td.DATE_DISPLAY, td.ARTICLE_ID, c.CITY, cs.COUNTRY
			FROM thisday td
			LEFT OUTER JOIN cities c ON c.CITY_ID = td.CITY_ID
			LEFT OUTER JOIN countries cs ON cs.COUNTRY_ID = c.COUNTRY_ID
			WHERE td.STATUS_ID = 1
			AND MONTH(DATE_DISPLAY) = #Month(arguments.TDate)#
			AND DAYOFMONTH(DATE_DISPLAY) = #Day(arguments.TDate)#
			ORDER BY DATE_DISPLAY DESC, THIS_DAY_ID DESC
		</cfquery>		
		
		<cfquery name="GetJourneys" datasource="#arguments.Datasource#">
			SELECT j.JOURNEY_ID, j.REF, j.OPERATOR, j.CLASS, j.DISTANCE, j.DATE_DEPART, j.DATE_ARRIVE, j.STATUS_ID,
				   c1.CITY AS JOURNEY_FROM,
				   c2.CITY AS JOURNEY_TO,
				   jt.JOURNEY_TYPE
			FROM journeys j
			LEFT OUTER JOIN cities c1 ON c1.CITY_ID = j.JOURNEY_FROM 
			LEFT OUTER JOIN cities c2 ON c2.CITY_ID = j.JOURNEY_TO 
			LEFT OUTER JOIN journey_types jt ON jt.JOURNEY_TYPE_ID = j.JOURNEY_TYPE_ID 
			WHERE j.STATUS_ID = 1
			AND MONTH(DATE_DEPART) = #Month(arguments.TDate)#
			AND DAYOFMONTH(DATE_DEPART) = #Day(arguments.TDate)#
			ORDER BY DATE_DEPART DESC
		</cfquery>		
		
		<cfset TotalRecordCount = GetArticles.Recordcount+GetJourneys.Recordcount>
		<cfset ThisDayArray = ArrayNew(2)>
		<cfset x = 1>
		
		<cfoutput query="GetArticles">
		
			<cfset TEXT = "#SUMMARY# in #CITY#, #COUNTRY#">
			<!--- Put results into Array --->
			<cfset ThisDayArray[x][1] = THIS_DAY_ID>
			<cfset ThisDayArray[x][2] = DATE_DISPLAY>
			<cfset ThisDayArray[x][3] = TEXT>
			<cfset ThisDayArray[x][4] = ARTICLE_ID>
			<!--- Get Article Categories for related article link --->
			<cfquery name="GetCategories" datasource="#arguments.Datasource#">
				SELECT acl.CATEGORY_ID, c.CATEGORY
				FROM article_category_lookup acl, categories c
				WHERE acl.ARTICLE_ID = #ARTICLE_ID#
				AND acl.CATEGORY_ID = c.CATEGORY_ID
			</cfquery>			
			<cfif GetCategories.Recordcount>
				<cfset ThisDayArray[x][5] = ValueList(GetCategories.CATEGORY_ID)>
			<cfelse>
				<cfset ThisDayArray[x][5] = "Any">
			</cfif>	
			<!--- Increment Count --->
			<cfset x = x + 1>
			
		</cfoutput>
		
		<cfoutput query="GetJourneys">
			<cfswitch expression="#JOURNEY_TYPE#">
				<cfcase value="Plane">
					<cfif len(trim(REF))><cfset FNum = "flight #REF#"><cfelse><cfset FNum = ""></cfif>
					<cfset JourneyType="flew on #OPERATOR# #FNum# ">
				</cfcase>
				<cfcase value="Helicopter"><cfset JourneyType="flew via helicopter"></cfcase>
				<cfcase value="Bus"><cfset JourneyType="caught the bus"></cfcase>
				<cfcase value="Train"><cfset JourneyType="caught the train"></cfcase>
				<cfcase value="Boat"><cfset JourneyType="sailed"></cfcase>
				<cfdefaultcase><cfset JourneyType="travelled"></cfdefaultcase>
			</cfswitch>
			<cfif #TimeFormat(DATE_DEPART,"hhhh:mmmm")# NEQ "">
				<cfset DepTime = " at " & TimeFormat(DATE_DEPART,"hh:mm:tt")>
			<cfelse>
				<cfset DepTime = "">	
			</cfif>
			
			<cfset TEXT = "I #JourneyType# <cfif len(trim(CLASS))>in #CLASS# </cfif>from #JOURNEY_FROM# to #JOURNEY_TO# #DepTime#">
		
			<!--- Put results into Array --->
			<cfset ThisDayArray[x][1] = JOURNEY_ID>
			<cfset ThisDayArray[x][2] = DATE_DEPART>
			<cfset ThisDayArray[x][3] = TEXT>
			<cfset ThisDayArray[x][4] = "">
			<cfset ThisDayArray[x][5] = "">
			<!--- Increment Count --->
			<cfset x = x + 1>
			
		</cfoutput>		
		
		<cfreturn ThisDayArray>
		
	</cffunction>
	
	
</cfcomponent>