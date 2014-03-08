<cfcomponent>
		<cffunction name="allImages" access="public" returntype="query" output="true">

		<!--- Optional Arguments --->
		<cfargument name="HowMany" type="numeric" required="false" default="1">
		<cfargument name="OrderBy" type="string" required="false" default="date_display">
		<cfargument name="WorkFlow" type="string" required="false" default="1">
		<cfargument name="FreeText" type="string" required="false" default="">
		<cfargument name="SectionID" type="numeric" required="false" default="0">	
		<cfargument name="RoomStyleID" type="numeric" required="false" default="0">
		<cfargument name="RoomTypeID" type="numeric" required="false" default="0">
		<cfargument name="RoomCapacityID" type="numeric" required="false" default="0">
		<cfargument name="ID" type="numeric" required="false" default="0">
		
		<!--- Latest News --->
		<cfquery name="GetImages" datasource="#Application.DataSource#" maxrows="#arguments.HowMany#">
			SELECT g.*, rs.room_style, rt.room_type, rc.room_capacity,
				   i1.file_name AS ThumbFile, i1.image_name AS ThumbImage, 
				   i2.file_name AS LargeFile, i2.image_name AS LargeImage
			FROM mod_gallery g
			LEFT OUTER JOIN cms_images i1 ON g.thumb_id = i1.image_id		
			LEFT OUTER JOIN cms_images i2 ON g.large_id = i2.image_id
			<cfif arguments.SectionID>
				LEFT OUTER JOIN mod_gallery_section_lookup gsl ON g.gallery_id = gsl.gallery_id		
				LEFT OUTER JOIN cms_sections s ON gsl.section_id = s.section_id		
			</cfif>
			LEFT OUTER JOIN room_styles rs ON g.room_style_id = rs.room_style_id
			LEFT OUTER JOIN room_types rt ON g.room_type_id = rt.room_type_id
			LEFT OUTER JOIN room_capacities rc ON g.room_capacity_id = rc.room_capacity_id
			WHERE g.work_flow_id = #arguments.WorkFlow#
			<!--- Conference Search Clauses --->
			<cfif arguments.RoomStyleID>
				AND rs.room_style_id = #arguments.RoomStyleID#
			</cfif>
			<cfif arguments.RoomTypeID>
				AND rt.room_type_id = #arguments.RoomTypeID#
			</cfif>
			<cfif arguments.RoomCapacityID>
				AND rc.room_capacity_id = #arguments.RoomCapacityID#
			</cfif>
			<!--- Default Search Clauses --->			
			<cfif arguments.SectionID>
				AND s.section_id = #arguments.SectionID#
			</cfif>
			<cfif len(trim(arguments.FreeText))>
				AND g.title LIKE '%#arguments.FreeText#%'
			</cfif>
			<cfif arguments.ID>
				AND g.gallery_id = #arguments.ID#
			</cfif>
			ORDER BY #arguments.OrderBy#	
		</cfquery>					
		
		<cfreturn GetImages>
		
	</cffunction>
</cfcomponent>