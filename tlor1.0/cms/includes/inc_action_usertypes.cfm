<cfparam name="Action" default="">

<cfset FieldID = "admin_user_type_id">

<cfif len(trim(Action))>

	
								
		<cfswitch expression="#Action#">	
			<cfcase value="Batch">
			
				<cftransaction>
				
					<cfif isDefined("ID")>
						<cfquery name="BatchUpdate" datasource="#Application.DataSource#">
							UPDATE cms_user_types
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
				
					<cfquery name="AddRecord" datasource="#Application.DataSource#">
						INSERT INTO cms_user_types(date_created,date_modified,created_by_id,modified_by_id,#FieldList#)						
						VALUES(#CreateODBCDateTime(now())#,#CreateODBCDateTime(now())#,#Session.UserID#,#Session.UserID#,<cfloop from="1" to="#ListLen(FieldList)#" index="x">'#Replace(Evaluate(ListGetAt(FieldList,x)),"'","''","ALL")#'<cfif NOT x EQ ListLen(FieldList)>,</cfif></cfloop>)				
					</cfquery>				
					<cfquery name="GetLatestID" datasource="#Application.DataSource#">
						SELECT MAX(#FieldID#) AS MaxID							
						FROM cms_user_types
					</cfquery>			
					<cfset ID = GetLatestID.MaxID>					
					<cfloop from="1" to="#ListLen(work_flow_type_id)#" index="x">
						<cfif ListGetAt(work_flow_type_id,x) GT 0>
							<cfquery name="AddRecord" datasource="#Application.DataSource#">
								INSERT INTO cms_user_type_lookup(admin_user_type_id,module_id,work_flow_type_id)						
								VALUES(#ID#,#ListGetAt(ModuleList,x)#,#ListGetAt(work_flow_type_id,x)#)				
							</cfquery>				
						</cfif> 		   
					</cfloop>				
					<cfset Message = "The record has been created,1">
				
				</cftransaction>
			
			</cfcase>
			<cfcase value="Edit">
		
				<cftransaction>
				
					<cfquery name="AddRecord" datasource="#Application.DataSource#">
						UPDATE cms_user_types
						SET date_modified = #CreateODBCDateTime(now())#,
							modified_by_id = #Session.UserID#,
							<cfloop from="1" to="#ListLen(FieldList)#" index="x">
								#ListGetAt(FieldList,x)# = '#Replace(Evaluate(ListGetAt(FieldList,x)),"'","''","ALL")#'<cfif NOT x EQ ListLen(FieldList)>,</cfif>
							</cfloop>
						WHERE #FieldID# = #ID#
					</cfquery>					
					<!--- Clear Lookup Table --->
					<cfquery name="DeleteLookups" datasource="#Application.DataSource#">
						DELETE from cms_user_type_lookup
						WHERE #FieldID# IN (#ID#)
					</cfquery>						
					<cfloop from="1" to="#ListLen(work_flow_type_id)#" index="x">
						<cfif ListGetAt(work_flow_type_id,x) GT 0>
							<cfquery name="AddRecord" datasource="#Application.DataSource#">
								INSERT INTO cms_user_type_lookup(admin_user_type_id,module_id,work_flow_type_id)						
								VALUES(#ID#,#ListGetAt(ModuleList,x)#,#ListGetAt(work_flow_type_id,x)#)				
							</cfquery>				
						</cfif> 		   
					</cfloop>			
					
					<cfset Message = "The record has been updated,1">			
				
				</cftransaction>
			
			</cfcase>	
			<cfcase value="Delete">
		
				<cftransaction>
		
					<!--- Delete user type --->
					<cfquery name="DeleteRecord" datasource="#Application.DataSource#">
						DELETE from cms_user_types
						WHERE #FieldID# IN (#ID#)
					</cfquery>				
					<!--- Delete Lookup Entries --->
					<cfquery name="DeleteLookups" datasource="#Application.DataSource#">
						DELETE from cms_user_type_lookup
						WHERE #FieldID# IN (#ID#)
					</cfquery>		
				
					<cfset Message = "The record has been deleted,1">		
				
				</cftransaction>
			
			</cfcase>		
		</cfswitch>
		
		<cflocation url="#TabArray[1][2]#&Message=#Message#" addtoken="yes">
		<cftry>
		<cfcatch>
			<!--- If Error --->
			<cfinclude template="inc_action_error.cfm">
		</cfcatch>	

	</cftry>	

</cfif>
