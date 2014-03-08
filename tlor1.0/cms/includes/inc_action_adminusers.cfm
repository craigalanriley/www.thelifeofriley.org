<cfparam name="Action" default="">

<cfset FieldID = "admin_user_id">

<cfif len(trim(Action))>

	<cftry>
								
		<cfswitch expression="#Action#">	
			<cfcase value="Batch">
				<cfif isDefined("ID")>
					<cfquery name="BatchUpdate" datasource="#Application.DataSource#">
						UPDATE cms_users
						SET work_flow_id = #work_flow_id#
						WHERE #FieldID# IN (#ID#)
					</cfquery>			
					<cfset Message = "The records have been updated,1">
				<cfelse>
					<cfset Message = "You must select at least 1 record,0">
				</cfif>
			</cfcase>	
			<cfcase value="Create">
			
				<cfquery name="AddRecord" datasource="#Application.DataSource#">
					INSERT INTO cms_users(date_created,date_modified,created_by_id,modified_by_id,#FieldList#)						
					VALUES(#CreateODBCDateTime(now())#,#CreateODBCDateTime(now())#,#Session.UserID#,#Session.UserID#,<cfloop from="1" to="#ListLen(FieldList)#" index="x">'#Replace(Evaluate(ListGetAt(FieldList,x)),"'","''","ALL")#'<cfif NOT x EQ ListLen(FieldList)>,</cfif></cfloop>)				
				</cfquery>				
				<cfquery name="GetLatestID" datasource="#Application.DataSource#">
					SELECT MAX(#FieldID#) AS MaxID							
					FROM cms_users
				</cfquery>
				<cfset ID = GetLatestID.MaxID>	
				
				<!--- Send Login Info Email 
				<cfif work_flow_id EQ 1>
					<!--- Call Admin User Email CFC --->
					<cfinvoke component="#Application.CFC#admin_user" method="sendEmail" returnvariable="Message" 
								Home="#Application.Home#"
								EmailFrom="#Application.EmailFrom#"
								MessageType="New User"
								AdminUserID="#ID#">				
				</cfif>			--->				
				
				<cfset Message = "The record has been created,1">
			
			</cfcase>
			<cfcase value="Edit">
		
				<cfquery name="UpdateRecord" datasource="#Application.DataSource#">
					UPDATE cms_users
					SET date_modified = #CreateODBCDateTime(now())#,
						modified_by_id = #Session.UserID#,
						<cfloop from="1" to="#ListLen(FieldList)#" index="x">
							#ListGetAt(FieldList,x)# = '#Replace(Evaluate(ListGetAt(FieldList,x)),"'","''","ALL")#'<cfif NOT x EQ ListLen(FieldList)>,</cfif>
						</cfloop>
					WHERE #FieldID# = #ID#
				</cfquery>					
				<!--- Send Login Info Email 
				<cfif work_flow_id EQ 1>
					<!--- Call Admin User Email CFC --->
					<cfinvoke component="#Application.CFC#admin_user" method="sendEmail" returnvariable="Message" 
								Home="#Application.Home#"
								EmailFrom="#Application.EmailFrom#"
								MessageType="Info Updated"
								AdminUserID="#ID#">				
				</cfif>					--->	
				<cfset Message = "The record has been updated,1">			
			
			</cfcase>	
			<cfcase value="Delete">
		
				<cfquery name="DeleteRecord" datasource="#Application.DataSource#">
					DELETE from cms_users
					WHERE #FieldID# IN (#ID#)
				</cfquery>		
			
				<cfset Message = "The record has been deleted,1">		
			
			</cfcase>		
		</cfswitch>
		
		<cflocation url="admin_users.cfm?Module=#Module#&Message=#Message#" addtoken="yes">
		
		<cfcatch>
			<!--- If Error --->
			<cfinclude template="inc_action_error.cfm">
		</cfcatch>	

	</cftry>	

</cfif>
