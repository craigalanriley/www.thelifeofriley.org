<cfparam name="Action" default="">

<cfset FieldID = "image_id">

<cfset FileExtList="gif,jpg,png">
<cfset Root = ExpandPath("../uploads/images/")>

<cfif len(trim(Action))>
							
	<cftry>
								
		<cfswitch expression="#Action#">	
			<cfcase value="Batch">
			
				<cftransaction>
				
					<cfif isDefined("ID")>
						<cfquery name="BatchUpdate" datasource="#Application.DataSource#">
							UPDATE cms_images
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
				
					<!--- Upload file --->
					<cffile action="Upload" FileField="file_name" Destination="#Root#" MODE="744" nameconflict="MAKEUNIQUE">
					<!--- Check if file is of desired type --->		
					<cfif NOT ListFind(FileExtList,file.ServerFileExt)>
					
						<!--- If not desired type, delete it and set message --->
						<cfif FileExists("#Root##file.ServerFile#")>
							<cffile action="DELETE" File="#Root##file.ServerFile#">
						</cfif>	
						<cfset Message = "Sorry - the file you uploaded must be one of the following: #FileExtList#,0">
						
					<cfelse>
											
						<!--- If file type is ok, add data to DB --->														
						<cfquery name="AddRecord" datasource="#Application.DataSource#">
							INSERT INTO cms_images(date_created,date_modified,created_by_id,modified_by_id,image_name,file_name,work_flow_id)						
							VALUES(#CreateODBCDateTime(now())#,#CreateODBCDateTime(now())#,#Session.UserID#,#Session.UserID#,'#image_name#','#file.ServerFile#',#work_flow_id#)				
						</cfquery>				
						<cfquery name="GetLatestID" datasource="#Application.DataSource#">
							SELECT MAX(#FieldID#) AS MaxID							
							FROM cms_images
						</cfquery>			
						<cfset ID = GetLatestID.MaxID>	
						<cfif isDefined("module_id")>
							<cfloop list="#module_id#" index="x">
								<cfquery name="AddLookups" datasource="#Application.DataSource#">
									INSERT INTO cms_img_mod_lookup(image_id,module_id)						
									VALUES(#ID#,#x#)				
								</cfquery>		   
							</cfloop>						
						</cfif>
						<cfset Message = "The record has been created,1">
						
					</cfif>		
				
				</cftransaction>
			
			</cfcase>
			<cfcase value="Edit">
		
				<cftransaction>
			
					<cfquery name="UpdateRecord" datasource="#Application.DataSource#">
						UPDATE cms_images
						SET date_modified = #CreateODBCDateTime(now())#,
							modified_by_id = #Session.UserID#,
							<cfloop from="1" to="#ListLen(FieldList)#" index="x">
								#ListGetAt(FieldList,x)# = '#Replace(Evaluate(ListGetAt(FieldList,x)),"'","''","ALL")#'<cfif NOT x EQ ListLen(FieldList)>,</cfif>
							</cfloop>
						WHERE #FieldID# = #ID#
					</cfquery>		
					<!--- Clear Lookup Table --->
					<cfquery name="DeleteLookups" datasource="#Application.DataSource#">
						DELETE from cms_img_mod_lookup
						WHERE #FieldID# IN (#ID#)
					</cfquery>					
					<cfif isDefined("module_id")>
						<cfloop list="#module_id#" index="x">
							<cfquery name="AddLookups" datasource="#Application.DataSource#">
								INSERT INTO cms_img_mod_lookup(image_id,module_id)						
								VALUES(#ID#,#x#)				
							</cfquery>		   
						</cfloop>						
					</cfif>			
					
					<cfset Message = "The record has been updated,1">			
				
				</cftransaction>
			
			</cfcase>	
			<cfcase value="Delete">
		
				<cftransaction>
				
					<!--- Delete image from DB but leave on server in case used in active edit --->
					<cfquery name="DeleteRecord" datasource="#Application.DataSource#">
						DELETE from cms_images
						WHERE #FieldID# IN (#ID#)
					</cfquery>						
					<!--- Clear Lookup Table --->
					<cfquery name="DeleteLookups" datasource="#Application.DataSource#">
						DELETE from cms_img_mod_lookup
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
