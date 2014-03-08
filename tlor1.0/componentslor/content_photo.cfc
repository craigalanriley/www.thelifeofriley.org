<cfcomponent>

	<cffunction name="Display" access="public" returntype="any" output="true">
	
		<cfargument name="FileName" type="string" required="true" default="">
		<cfargument name="ImageText" type="string" required="true">
		

		<table align="right" border="0" cellpadding="0" cellspacing="5">
		<tr>
			<td><img src="#Application.Home#images/copy/#arguments.FileName#" alt=" #arguments.ImageText# " width="175" border="1" align="right"></td>
		</tr>
		<tr>
			<td align="right" class="txt_small"><em>#arguments.ImageText#</em></td>
		</tr>
		</table>		
		
		
		<cfreturn>
		
	</cffunction>
	
</cfcomponent>