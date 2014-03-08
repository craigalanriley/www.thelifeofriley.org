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
		<cfargument name="Width" type="string" required="no" default="560">
		<cfargument name="Height" type="string" required="no" default="500">
		<cfargument name="Image" type="string" required="no" default="true">
		<cfargument name="Upload" type="string" required="no" default="no">
		<cfargument name="TabView" type="string" required="no" default="yes">
		<cfargument name="AllowEditSource" type="string" required="no" default="yes">
		<cfargument name="BreakOnEnter" type="string" required="no" default="false">
		<cfargument name="ButtonColor" type="string" required="no" default="D4D0C8">
		<cfargument name="Border" type="string" required="no" default="0">
		<cfargument name="Applet" type="string" required="no" default="auto">
		<cfargument name="Toolbar" type="string" required="no" default="cut,copy,paste,|,bold,italic,underline,|,subscript,superscript,|,strike,removeformat,replace,|,bullets,justifyleft,justifycenter,justifyright,|,specialchars,hyperlink,image,table,||,quickstyles,redo,undo,|,help">
		
		<!--- Spacing Table --->
		<cfset RowPadding = 5>
		<img src="images/dotpix.gif" width="1" height="#RowPadding#" border="0"><br>
		<table cellpadding="0" cellspacing="1" border="0" bgcolor="##000000">
		<tr bgcolor="##FFFFFF">
			<td>
			<cf_activedit4_atp 
				fieldname="#arguments.FieldName#" 
				inc="ActivEdit4/inc/" 
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
				ToolBar="#arguments.ToolBar#"> 
				#FieldData#
			</cf_activedit4_atp>									
			</td>	
		</tr>		
		</table>	
		<img src="images/dotpix.gif" width="1" height="#RowPadding#" border="0"><br>
					
		<cfreturn FieldData>
		
	</cffunction>
</cfcomponent>