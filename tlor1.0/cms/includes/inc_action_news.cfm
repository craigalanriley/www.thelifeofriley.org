<cfparam name="Action" default="">
<cfparam name="FRONT_PAGE" default="">
<cfparam name="date_display" default="">

<cfset FieldID = "article_id">

<cfif len(trim(Action))>

	<cftry>
								
		<cfswitch expression="#Action#">	
			<cfcase value="Batch">
			
				<cftransaction>
				
					<cfif isDefined("ID")>
						<cfquery name="BatchUpdate" datasource="#Application.DataSource#">
							UPDATE articles
							SET work_flow_id = #work_flow_id#
							WHERE #FieldID# IN (#ID#)
						</cfquery>			
						<cfset Message = "The records have been updated,1">
					<cfelse>
						<cfset Message = "You must select at least 1 record,0">
					</cfif>
				
				</cftransaction>
				
			</cfcase>	
			<cfcase value="Create">			
			
				<cftransaction>			
					
					<!--- If file type is ok, add data to DB --->														
					<cfquery name="AddRecord" datasource="#Application.DataSource#">
						INSERT INTO articles(date_created,date_edited,created_by_id,modified_by_id,MODULE_ID,date_display,#FieldList#)						
						VALUES(#CreateODBCDateTime(now())#,#CreateODBCDateTime(now())#,#Session.UserID#,#Session.UserID#,4,#CreateODBCDate(date_display)#,<cfloop from="1" to="#ListLen(FieldList)#" index="x">'#Replace(Evaluate(ListGetAt(FieldList,x)),"'","''","ALL")#'<cfif NOT x EQ ListLen(FieldList)>,</cfif></cfloop>)				
					</cfquery>		
					<cfquery name="GetLatestID" datasource="#Application.DataSource#">
						SELECT MAX(#FieldID#) AS MaxID							
						FROM articles
					</cfquery>			
					<cfset ID = GetLatestID.MaxID>	
					<cfset Message = "The record has been created,1">				
				
				</cftransaction>
			
			</cfcase>
			<cfcase value="Edit">
		
				<cftransaction>
				
					<cfquery name="UpdateRecord" datasource="#Application.DataSource#">
						UPDATE articles
						SET date_edited = #CreateODBCDateTime(now())#,
							modified_by_id = #Session.UserID#,
							date_display = #CreateODBCDate(date_display)#,
							<cfloop from="1" to="#ListLen(FieldList)#" index="x">
								#ListGetAt(FieldList,x)# = '#Replace(Evaluate(ListGetAt(FieldList,x)),"'","''","ALL")#'<cfif NOT x EQ ListLen(FieldList)>,</cfif>
							</cfloop>
						WHERE #FieldID# = #ID#
					</cfquery>			
					
					<cfset Message = "The record has been updated,1">			
				
				</cftransaction>
			
			</cfcase>	
			<cfcase value="Delete">
		
				<cftransaction>
				
					<cfquery name="DeleteRecord" datasource="#Application.DataSource#">
						DELETE from articles
						WHERE #FieldID# IN (#ID#)
					</cfquery>		
				
					<cfset Message = "The record has been deleted,1">		
				
				</cftransaction>
			
			</cfcase>		
		</cfswitch>
		
		<cflocation url="#TabArray[1][2]#&Message=#Message#" addtoken="yes">
		
		<cfcatch>
			<!--- If Error --->
			<cfinclude template="inc_action_error.cfm">
		</cfcatch>	

	</cftry>	

</cfif>
