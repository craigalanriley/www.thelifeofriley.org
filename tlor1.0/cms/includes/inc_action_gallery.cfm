<cfparam name="Action" default="">

<cfset FieldID = "gallery_id">

<cfif len(trim(Action))>
									
		<cfswitch expression="#Action#">	
			<cfcase value="Batch">
			
				<cftransaction>
				
					<cfif isDefined("ID")>
						<cfquery name="BatchUpdate" datasource="#Application.DataSource#">
							UPDATE mod_gallery
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
			
				<!--- Image CFC Stuff --->
				<cfset root = ExpandPath("../uploads/images/")>
			
				<cfset imagecfc = createObject("component","#Application.CFC#/image")>
				
				<!--- Upload Original File --->
				<cffile action="Upload" FileField="file_large" Destination="#root#" MODE="744" nameconflict="makeunique">				
				<!--- Crop and Optimise Large Image--->
				<cfset imglargeName = "large_" & file.ServerFile>
				<cfset imgLarge = imageCFC.scaleX("", "#root##file.ServerFile#", "#root##imglargeName#", 800, 80)> 
				<!--- Add Water Mark Logo --->
				<cfset imgWaterMark = imageCFC.watermark(
					"", "", 
					"#root##imglargeName#",
					"#ExpandPath('../images/logo/')#/watermark.png",
					1, 
					20, 20, 
					"#root##imglargeName#" 
					)>	 
				<!--- Crop and Optimise Thumb Image --->
				<cfset imgSmallName = "small_" & file.ServerFile>
				<cfset imgSmall = imageCFC.scaleX("", "#root##file.ServerFile#", "#root##imgSmallName#", 175)> 
				<!--- Delete Large Original File --->
				<cffile action="delete" file="#root##file.ServerFile#">		
			
			
				<cftransaction>
				
					<cfquery name="AddRecord" datasource="#Application.DataSource#">
						INSERT INTO mod_gallery(date_created,date_modified,created_by_id,modified_by_id,title,summary,file_small,file_large,country_id,front_page,date_display,work_flow_id)						
						VALUES(#CreateODBCDateTime(now())#,#CreateODBCDateTime(now())#,#Session.UserID#,#Session.UserID#,'#title#','#summary#','#imgSmallName#','#imglargeName#',#country_id#,#front_page#,#CreateODBCDateTime(date_display)#,#work_flow_id#)				
					</cfquery>				
					<cfquery name="GetLatestID" datasource="#Application.DataSource#">
						SELECT MAX(#FieldID#) AS MaxID							
						FROM mod_gallery
					</cfquery>
					<cfset ID = GetLatestID.MaxID>		
					<!--- Insert Section Lookup	--->
					<cfif isDefined("section_id")>
						<cfloop list="#section_id#" index="x">
							<cfquery name="AddLookups" datasource="#Application.DataSource#">
								INSERT INTO mod_gallery_section_lookup(gallery_id,section_id)						
								VALUES(#ID#,#x#)				
							</cfquery>		   
						</cfloop>						
					</cfif>	 
					<cfset Message = "The record has been created,1">
				
				</cftransaction>
			
			</cfcase>
			<cfcase value="Edit">
		
				<cftransaction>
				
					<cfquery name="UpdateRecord" datasource="#Application.DataSource#">
						UPDATE mod_gallery
						SET title = '#title#',
							summary = '#summary#',
							country_id = '#country_id#',
							front_page = '#front_page#',
							date_modified = #CreateODBCDateTime(now())#,
							date_display = #CreateODBCDateTime(date_display)#,
							modified_by_id = #Session.UserID#,
							work_flow_id = '#work_flow_id#'
						WHERE #FieldID# = #ID#
					</cfquery>							
					<!--- Insert Section Lookup --->
					<cfquery name="DeleteLookups" datasource="#Application.DataSource#">
						DELETE from mod_gallery_section_lookup
						WHERE #FieldID# IN (#ID#)
					</cfquery>					
					<cfif isDefined("section_id")>
						<cfloop list="#section_id#" index="x">
							<cfquery name="AddLookups" datasource="#Application.DataSource#">
								INSERT INTO mod_gallery_section_lookup(gallery_id,section_id)						
								VALUES(#ID#,#x#)				
							</cfquery>		   
						</cfloop>						
					</cfif>	
					
					<cfset Message = "The record has been updated,1">			
				
				</cftransaction>
			
			</cfcase>	
			<cfcase value="Delete">
		
				<cftransaction>
				
					<cfquery name="DeleteRecord" datasource="#Application.DataSource#">
						DELETE from mod_gallery
						WHERE #FieldID# IN (#ID#)
					</cfquery>									
					<!--- Insert Section Lookup --->
					<cfquery name="DeleteLookups" datasource="#Application.DataSource#">
						DELETE from mod_gallery_section_lookup
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
