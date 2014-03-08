<cfcomponent>
	<cffunction name="GUI" access="public" returntype="string" output="true">
	
		<!--- Required Arguments --->
		<cfargument name="FieldName" type="string" required="true">
		<cfargument name="FieldData" type="string" required="true">
		<cfargument name="ImageURL" type="string" required="true">
		<cfargument name="ImagePath" type="string" required="true">
		<cfargument name="BaseURL" type="string" required="true">
		<cfargument name="StyleSheet" type="string" required="true">
		<!--- Optional Arguments --->
		<cfargument name="Width" type="string" required="no" default="565">
		<cfargument name="Height" type="string" required="no" default="300">
		<cfargument name="Image" type="string" required="no" default="true">
		<cfargument name="Upload" type="string" required="no" default="no">
		<cfargument name="TabView" type="string" required="no" default="yes">
		<cfargument name="AllowEditSource" type="string" required="no" default="yes">
		<cfargument name="BreakOnEnter" type="string" required="no" default="true">
		<cfargument name="ButtonColor" type="string" required="no" default="999999">
		<cfargument name="Border" type="string" required="no" default="0">
		<cfargument name="Applet" type="string" required="no" default="auto">
		
		<!--- Spacing Table --->
		<cfset TableHeight = 5>
		<table cellpadding="0" cellspacing="0" border="0">
		<tr><td><img src="images/dotpix.gif" width="1" height="#TableHeight#" border="0"></td></tr>
		<tr>
			<td>
			<cf_activedit3_atp 
				fieldname="#arguments.FieldName#" 
				inc="ActivEdit3/inc/" 
				Width="#arguments.Width#" 
				Height="#arguments.Height#" 
				Image="#arguments.Image#"
				imageurl="#arguments.ImageURL#"
				imagepath="#arguments.ImagePath#"  
				Upload="#arguments.ImagePath#"
				TabView="#arguments.TabView#" 
				AllowEditSource="#arguments.AllowEditSource#" 
				BreakOnEnter="#arguments.BreakOnEnter#"
				BaseURL="#arguments.BaseURL#"
				ButtonColor="#arguments.ButtonColor#" 
				Border = "#arguments.Border#"
				Applet="#arguments.Applet#"
				DefaultFont="10pt Verdana"
				StyleSheet="#arguments.StyleSheet#"
				QuickStyles="txt"
				QuickStyleNames="Plain Text"
				ToolBar="cut,copy,paste,|,bold,italic,underline,|,outdent,indent,bullets,|,justifyleft,justifycenter,justifyright,|,image,hyperlink,table,specialchars,|,redo,undo,|,quickstyles,help"
			> 
			#FieldData#
			</cf_activedit3_atp>									
			</td>	
		</tr>		
		<tr><td><img src="images/dotpix.gif" width="1" height="#TableHeight#" border="0"></td></tr>	
		</table>	
					
		<cfreturn FieldData>
		
	</cffunction>
</cfcomponent>