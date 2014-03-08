<cfparam name="Action" default="">

<cfset FieldID = "menu_id">

<cfif len(trim(Action))>
							
								
		<cfswitch expression="#Action#">  	   
			<cfcase value="Batch">
			
				<cftransaction>
			
					<cfif isDefined("ID")>
						<cfquery name="BatchUpdate" datasource="#Application.DataSource#">
							UPDATE cms_menus
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
				
					<!--- Get Menu Level --->			
					<cfquery name="GetParentLevel" datasource="#Application.DataSource#">
						SELECT menu_level						
						FROM cms_menus
						WHERE menu_id = #parent_id#
					</cfquery>
					<cfif GetParentLevel.RecordCount>
						<cfset MenuLevel = GetParentLevel.menu_level + 1>
					<cfelse><!--- If no result parent must be top level (eg no id of zero) --->
						<cfset MenuLevel = 1>
					</cfif>
					
					<!--- Get Menu Order --->				
					<cfquery name="GetMaxOrder" datasource="#Application.DataSource#">
						SELECT MAX(menu_order) as MenuOrder					
						FROM cms_menus
						WHERE parent_id = #parent_id#
					</cfquery>			
					<cfif len(trim(GetMaxOrder.MenuOrder))>
						<cfset MenuOrder = GetMaxOrder.MenuOrder + 1>
					<cfelse><!--- If no result menu item must be first one under selected parent --->
						<cfset MenuOrder = 1>
					</cfif>
					
					<!--- <cfdump var="#parent_id#"> --->
					<cfquery name="AddRecord" datasource="#Application.DataSource#">
						INSERT INTO 			
                        cms_menus(date_created,
                                date_modified,
                                created_by_id,
                                modified_by_id,
                                menu_level,
                                menu_order,
                                label,
                                template_id,
                                parent_id,
                                page_id,
                                meta_data,
                                container_id,
                                on_home_page,
                                date_display,
                                work_flow_id)						
						VALUES(#CreateODBCDateTime(now())#,
                                #CreateODBCDateTime(now())#,
                                #Session.UserID#,
                                #Session.UserID#,                        
                                #MenuLevel#,
                                #MenuOrder#,
                                '#label#',
                                #template_id#,
                                #parent_id#,
                                #page_id#,
                                '#meta_data#',
                                #container_id#,
                                #on_home_page#,
                                #CreateODBCDateTime(date_display)#,
                                #work_flow_id#)				
					</cfquery>				
					<cfquery name="GetLatestID" datasource="#Application.DataSource#">
						SELECT MAX(#FieldID#) AS MaxID							
						FROM cms_menus
					</cfquery>
					<cfset ID = GetLatestID.MaxID>	
					<!--- Add Docs to lookup table --->
					<cfif isDefined("document_id")>
						<cfloop list="#document_id#" index="x">
							<cfquery name="AddLookups" datasource="#Application.DataSource#">
								INSERT INTO cms_menu_doc_lookup(menu_id,document_id)						
								VALUES(#ID#,#x#)				
							</cfquery>		   
						</cfloop>						
					</cfif> 
					<cfset Message = "The record has been created,1">
			
				</cftransaction>
			
			</cfcase>
			<cfcase value="Edit">
		
				<cftransaction>
				
					<!--- Get Menu Level --->			
					<cfquery name="GetParentLevel" datasource="#Application.DataSource#">
						SELECT menu_level						
						FROM cms_menus
						WHERE menu_id = #parent_id#
					</cfquery>
					<cfif GetParentLevel.RecordCount>
						<cfset MenuLevel = GetParentLevel.menu_level + 1>
					<cfelse><!--- If no result parent must be top level (eg no id of zero) --->
						<cfset MenuLevel = 1>
					</cfif>
					
					<!--- Get Menu Order 				
					<cfquery name="GetMaxOrder" datasource="#Application.DataSource#">
						SELECT MAX(menu_order) as MenuOrder					
						FROM cms_menus
						WHERE parent_id = #parent_id#
					</cfquery>			
					<cfif len(trim(GetMaxOrder.MenuOrder))>
						<cfset MenuOrder = GetMaxOrder.MenuOrder + 1>
					<cfelse><!--- If no result menu item must be first one under selected parent --->
						<cfset MenuOrder = 1>
					</cfif>	--->	
					
					<cfquery name="UpdateRecord" datasource="#Application.DataSource#">
						UPDATE cms_menus
						SET date_modified = #CreateODBCDateTime(now())#,
							modified_by_id = #Session.UserID#,
							menu_level = #MenuLevel#,
                            label = '#label#',
                            template_id = #template_id#,
                            parent_id = #parent_id#,
                            page_id = #page_id#,
                            meta_data = '#meta_data#',
                            container_id = #container_id#,
                            on_home_page = #on_home_page#,
                            date_display = #CreateODBCDateTime(date_display)#,
                            work_flow_id = #work_flow_id#
						WHERE #FieldID# = #ID#
					</cfquery>		
					<!--- Add Docs --->
					<cfquery name="DeleteLookups" datasource="#Application.DataSource#">
						DELETE from cms_menu_doc_lookup
						WHERE #FieldID# IN (#ID#)
					</cfquery>					
					<cfif isDefined("document_id")>
						<cfloop list="#document_id#" index="x">
							<cfquery name="AddLookups" datasource="#Application.DataSource#">
								INSERT INTO cms_menu_doc_lookup(menu_id,document_id)						
								VALUES(#ID#,#x#)				
							</cfquery>		   
						</cfloop>						
					</cfif>				
					
					<cfset Message = "The record has been updated,1">			
			
				</cftransaction>
			
			</cfcase>	
			<cfcase value="Delete">
		
				<cftransaction>
				
					<!--- Get parent ID before deleting record so we can reorder menu items --->	
					<cfquery name="GetParentID" datasource="#Application.DataSource#">
						SELECT parent_id				
						FROM cms_menus
						WHERE menu_id = #ID#
					</cfquery>	
					<cfset ParentID = GetParentID.parent_id>			
					<!--- Delete Menu Record --->
					<cfquery name="DeleteRecord" datasource="#Application.DataSource#">
						DELETE from cms_menus
						WHERE #FieldID# IN (#ID#)
					</cfquery>			
					<!--- Delete Document Lookups --->
					<cfquery name="DeleteLookups" datasource="#Application.DataSource#">
						DELETE from cms_menu_doc_lookup
						WHERE #FieldID# IN (#ID#)
					</cfquery>		
				
					<!--- Re-Order remaining menu items sequentially --->
					<cfinvoke component="#Application.CFC#menu_order" method="reorder" 
								ParentID="#ParentID#">			
				
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
