<cfparam name="Action" default="">
<cfparam name="on_home_page" default="0">
<cfparam name="section_id" default="0">
<cfparam name="thumb_id" default="0">

<cfset FieldID = "article_id">

<cfif len(trim(Action))>
	
	<cftry>
								
		<cfswitch expression="#Action#">	
			<cfcase value="Batch">
			
				<cftransaction>
				
					<cfif isDefined("ID")>
						<cfquery name="BatchUpdate" datasource="#Application.DataSource#">
							UPDATE mod_articles
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
				
					<cfquery name="GetModuleID" datasource="#Application.DataSource#">
						SELECT m.module_id						
						FROM cms_modules m
						WHERE module='#Module#'
					</cfquery>					
					<!--- If file type is ok, add data to DB --->														
					<cfquery name="AddRecord" datasource="#Application.DataSource#">
						INSERT INTO mod_articles(date_created,date_modified,created_by_id,modified_by_id,module_id,#FieldList#)						
						VALUES(#CreateODBCDateTime(now())#,#CreateODBCDateTime(now())#,#Session.UserID#,#Session.UserID#,#GetModuleID.module_id#,<cfloop from="1" to="#ListLen(FieldList)#" index="x">'#Replace(Evaluate(ListGetAt(FieldList,x)),"'","''","ALL")#'<cfif NOT x EQ ListLen(FieldList)>,</cfif></cfloop>)				
					</cfquery>		
					<cfquery name="GetLatestID" datasource="#Application.DataSource#">
						SELECT MAX(#FieldID#) AS MaxID							
						FROM mod_articles
					</cfquery>			
					<cfset ID = GetLatestID.MaxID>	
					<!--- Insert Document Lookup --->
					<cfif isDefined("document_id")>
						<cfloop list="#document_id#" index="x">
							<cfquery name="AddLookups" datasource="#Application.DataSource#">
								INSERT INTO mod_article_doc_lookup(article_id,document_id)						
								VALUES(#ID#,#x#)				
							</cfquery>		   
						</cfloop>						
					</cfif>		
					<!--- Insert Section Lookup --->			
					<cfif isDefined("section_id")>
						<cfloop list="#section_id#" index="x">
							<cfquery name="AddLookups" datasource="#Application.DataSource#">
								INSERT INTO mod_article_section_lookup(article_id,section_id)						
								VALUES(#ID#,#x#)				
							</cfquery>		   
						</cfloop>						
					</cfif>		
					<cfset Message = "The record has been created,1">				
				
				</cftransaction> 
			
			</cfcase>
			<cfcase value="Edit">
		
				<cftransaction> 
				
					<cfquery name="GetModuleID" datasource="#Application.DataSource#">
						SELECT m.module_id						
						FROM cms_modules m
						WHERE module='#Module#'
					</cfquery>			
					<cfquery name="UpdateRecord" datasource="#Application.DataSource#">
						UPDATE mod_articles
						SET date_modified = #CreateODBCDateTime(now())#,
							modified_by_id = #Session.UserID#,
							module_id = #GetModuleID.module_id#,
							<cfloop from="1" to="#ListLen(FieldList)#" index="x">
								#ListGetAt(FieldList,x)# = '#Replace(Evaluate(ListGetAt(FieldList,x)),"'","''","ALL")#'<cfif NOT x EQ ListLen(FieldList)>,</cfif>
							</cfloop>
						WHERE #FieldID# = #ID#
					</cfquery>		
					<!--- Insert Document Lookup --->
					<cfquery name="DeleteLookups" datasource="#Application.DataSource#">
						DELETE from mod_article_doc_lookup
						WHERE #FieldID# IN (#ID#)
					</cfquery>					
					<cfif isDefined("document_id")>
						<cfloop list="#document_id#" index="x">
							<cfquery name="AddLookups" datasource="#Application.DataSource#">
								INSERT INTO mod_article_doc_lookup(article_id,document_id)						
								VALUES(#ID#,#x#)				
							</cfquery>		   
						</cfloop>						
					</cfif>			
					<!--- Insert Section Lookup --->
					<cfquery name="DeleteLookups" datasource="#Application.DataSource#">
						DELETE from mod_article_section_lookup
						WHERE #FieldID# IN (#ID#)
					</cfquery>					
					<cfif isDefined("section_id")>
						<cfloop list="#section_id#" index="x">
							<cfquery name="AddLookups" datasource="#Application.DataSource#">
								INSERT INTO mod_article_section_lookup(article_id,section_id)						
								VALUES(#ID#,#x#)				
							</cfquery>		   
						</cfloop>						
					</cfif>		
					
					<cfset Message = "The record has been updated,1">			
				
				</cftransaction> 
			
			</cfcase>	
			<cfcase value="Delete">
		
				<cftransaction> 
				
					<!--- Delete Article --->
					<cfquery name="DeleteRecord" datasource="#Application.DataSource#">
						DELETE from mod_articles
						WHERE #FieldID# IN (#ID#)
					</cfquery>		
					<!--- Delete Document Lookups --->
					<cfquery name="DeleteLookups" datasource="#Application.DataSource#">
						DELETE from mod_article_doc_lookup
						WHERE #FieldID# IN (#ID#)
					</cfquery>		
					<!--- Delete Section Lookups --->
					<cfquery name="DeleteLookups" datasource="#Application.DataSource#">
						DELETE from mod_article_section_lookup
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
