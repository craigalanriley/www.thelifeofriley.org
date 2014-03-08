
<cfcomponent>		

	<cffunction name="navTrail" access="public" returntype="string" output="false">
		
		<!--- Required Arguments --->
		<cfargument name="MenuID" type="numeric" required="true">
		<!--- Optional Arguments --->
		<cfargument name="navList" type="string" required="false">
		
		<cfparam name="navList" default="">
		
		<cfset navList = ListPrepend(navList,arguments.MenuID)>
		
		<!--- Check if any Children exist --->				
		<cfquery name="GetParent" datasource="#Application.DataSource#">
			SELECT m.parent_id
			FROM cms_menus m
			WHERE menu_id = #arguments.MenuID#
		</cfquery>			
		<cfif GetParent.Recordcount>
			<cfif GetParent.parent_id>
				<!--- Recursion --->
				<cfinvoke component="#Application.CFC#dyn_menus" method="navTrail" returnvariable="navList"
							MenuID="#GetParent.parent_id#"
							navList="#navList#">				
			</cfif>
		</cfif>
		
		<cfreturn navList>

	</cffunction>
	<!--- 
	- This function basicall uses recursion to build a sequential ordered array of the menu items
	- By default it will only select ApprovedOnly menu items but it can also show a complete list by setting 
	- By default returned array is ordered by menu_order, however this can be changed (eg column orderby links) 
	--->
	<cffunction name="navArray" access="public" returntype="array" output="true">
	
		<!--- Optional Arguments --->
		<cfargument name="ParentID" type="any" required="false" default="">
		<cfargument name="navList" type="string" required="false" default="">
		<cfargument name="ApprovedOnly" type="numeric" required="false" default="1">
		<cfargument name="Maxlevels" type="numeric" required="false" default="3">
		<cfargument name="OrderString" type="string" required="false" default="m.menu_order">
		
		<!--- Init --->
		<cfif NOT isDefined("arrNav")>
			<!--- Create Array --->
			<cfset arrNav = ArrayNew(2)>
		</cfif>
		
		<!--- Check if any Children exist --->				
		<cfquery name="GetChildren" datasource="#Application.DataSource#">
			SELECT m.*, p.page_title, wf.work_flow
			FROM cms_menus m
			LEFT OUTER JOIN cms_pages p ON p.page_id = m.page_id
			LEFT OUTER JOIN cms_work_flow wf ON wf.work_flow_id = m.work_flow_id
			<cfif len(trim(arguments.ParentID))>
				WHERE parent_id = #arguments.ParentID#
			</cfif>
			<cfif arguments.ApprovedOnly>
				AND m.work_flow_id = 1
			</cfif>
			ORDER BY #arguments.OrderString# 
		</cfquery>					
		<cfif GetChildren.RecordCount>
			<cfoutput query="GetChildren">
			
				<!--- populate nav array --->
				<cfset arrCount = ArrayLen(arrNav) + 1>				
				<cfset arrNav[arrCount][1] = menu_id>
				<cfset arrNav[arrCount][2] = label>
				<cfset arrNav[arrCount][3] = menu_level>
				<cfset arrNav[arrCount][4] = page_id>
				<cfset arrNav[arrCount][5] = page_title>
				<cfset arrNav[arrCount][6] = work_flow_id>
				<cfset arrNav[arrCount][7] = work_flow>
				<cfset arrNav[arrCount][8] = date_modified>
				
				<cfif len(trim(arguments.ParentID))>
				
					<cfif ListLen(arguments.navList)>
						<cfif ListFind(arguments.navList,menu_id) AND (menu_level LT arguments.MaxLevels)>
						
							<!--- Recursion: only check page id children --->
							<cfinvoke method="navArray" returnvariable="arrNav"
										ParentID="#menu_id#"
										ApprovedOnly="#arguments.ApprovedOnly#"
										MaxLevels="#arguments.MaxLevels#"
										navList="#arguments.navList#">		
									
						</cfif>
					<cfelse>			
						
						<cfif menu_level LT arguments.MaxLevels>
						
							<!--- Recursion: check every item to see if it has children --->
							<cfinvoke method="navArray" returnvariable="arrNav"
										ParentID="#menu_id#"
										ApprovedOnly="#arguments.ApprovedOnly#"
										MaxLevels="#arguments.MaxLevels#"
										navList="#arguments.navList#">		
														
						</cfif>
					</cfif>
				
				</cfif>
									
			</cfoutput>
		</cfif>

		<cfreturn arrNav>
		
	</cffunction>
	
	<!--- This function accepts a menu level and returns formating variables based on level value --->
	<cffunction name="navFormat" access="public" returntype="struct" output="true">
		<!--- Set Arguments --->
		<cfargument name="MenuLevel" type="numeric" required="true">

		<cfswitch expression="#MenuLevel#">
			<cfcase value="1">
				<cfset Menu.Class = "txt_level1">	
				<cfset Menu.Indent = "">	
				<cfset Menu.Icon = "(i) ">				
			</cfcase>
			<cfcase value="2">
				<cfset Menu.Class = "txt_level2">	
				<cfset Menu.Indent = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">		
				<cfset Menu.Icon = "(ii) ">			
			</cfcase>
			<cfcase value="3">
				<cfset Menu.Class = "txt_level3">
				<cfset Menu.Indent = "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;">			
				<cfset Menu.Icon = "(iii) ">			
			</cfcase>
			<cfdefaultcase>
				<cfset Menu.Class = "txt">	
				<cfset Menu.Indent = "">			
				<cfset Menu.Icon = "">		
			</cfdefaultcase>				
		</cfswitch>		

		<cfreturn Menu>
		
	</cffunction>
</cfcomponent>