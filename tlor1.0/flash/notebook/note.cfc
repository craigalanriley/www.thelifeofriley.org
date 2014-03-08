<!--- Note.cfm - Copyright (c) 2002 Macromedia, Inc. --->

<!---
	Description:
		This page renders information about each product.

	Functions:

	Revision 1.0  2002/09/11  Mike Chambers
	Initial version
--->

<cfcomponent>
			
	<cfset DATASOURCENAME = "Notes" />

	<!---
		Adds a note.
	--->
	<cffunction name="addNote" access="remote" returntype="struct">
		<cfargument name="note" type="string" required="true">
		<cfargument name="title" type="string" required="true">
		
		<cfset var rQuery = "" />
			
		<cfquery datasource="#DATASOURCENAME#" name="rQuery">
			<!---#PreserveSingleQuotes(sqlString)#--->
				INSERT INTO Notes
					 (title, noteData)
				VALUES
					 ('#arguments.title#','#arguments.note#')			
		</cfquery>
		<cfquery datasource="#DATASOURCENAME#" name='rQuery'>
			Select @@identity AS newId
		</cfquery>
		
		<cfreturn getNote(rQuery.newId)>
	</cffunction>

	<!---
		edits an existing note.
	--->
	<cffunction name="updateNote" access="remote" returntype="struct">
		<cfargument name="id" type="numeric" required="true">
		<cfargument name="note" type="string" required="true">
		<cfargument name="title" type="string" required="true">

		<cfset var rQuery = "" />

		<cfquery datasource="#DATASOURCENAME#" name="rQuery">
			UPDATE Notes set noteData = '#arguments.note#', 
							title = '#arguments.title#'
							WHERE id = #arguments.id#
		</cfquery>

		<cfreturn getNote(arguments.id)>
	</cffunction>


	<!---
		Removes a note.
	--->
	<cffunction name="removeNote" access="remote" returntype="numeric">
		<cfargument name="id" type="numeric" required="true">
		
		<cfquery datasource="#DATASOURCENAME#">
			DELETE FROM Notes where id = #arguments.id#
		</cfquery>		
		
		<cfreturn arguments.id>
	</cffunction>		

	<!---
		Returns a Query containing all avaliable notes.
	--->
	<cffunction name="getAllNotes" access="remote" returntype="Query">
		<cfset var rQuery = "" />

		<cfquery datasource="#DATASOURCENAME#" name="rQuery">
			SELECT * from Notes
		</cfquery>

		<cfreturn rQuery>
	</cffunction>

	<!---
		Returns a single note.
	--->
	<cffunction name="getNote" access="remote" returntype="struct">
		<cfargument name="id" type="numeric" required="true">
		<cfset var rQuery = "" />
		<cfset var noteStruct = StructNew() />
		
		<cfquery datasource="#DATASOURCENAME#" name="rQuery">
			SELECT * FROM Notes where id = #arguments.id#
		</cfquery>		
		
		<cfloop query="rQuery">
			<cfset noteStruct.id = id />
			<cfset noteStruct.title = title />
			<cfset noteStruct.noteData = noteData />
		</cfloop>
		
		
		<cfreturn noteStruct>
	</cffunction>
	
</cfcomponent>