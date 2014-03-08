<cfcomponent>
	
	<cffunction name="showHowMany" access="public" returntype="string" output="false" hint="Displays How Many Text">
		
		<!--- Required Arguments --->
		<cfargument name="StartRow" type="string" required="true">	
		<cfargument name="RecordCount" type="string" required="true">	
		<cfargument name="PerPage" type="string" required="true">		
		
		<!--- Set Local variables so don't have to type arguments everywhere --->
		<cfset StartRow = arguments.StartRow>
		<cfset RecordCount = arguments.RecordCount>
		<cfset PerPage = arguments.PerPage>		
		
		<cfif RecordCount>
		
			<!--- Calculate EndRow Value --->		
			<cfset EndRow = Min(StartRow + PerPage - 1, RecordCount)>			
			<!--- Set String --->
			<cfset HowManyText = "Showing records #StartRow# to #EndRow# (out of #RecordCount#)">
			
		<cfelse>
		
			<cfset HowManyText = "No Records Found">
		
		</cfif>
		
		<cfreturn HowManyText>
		
	</cffunction>
	
	
	<cffunction name="showNav" access="public" output="true" hint="Displays Article Navigation">
		
		<!--- Required Arguments --->
		<cfargument name="StartRow" type="string" required="true">	
		<cfargument name="RecordCount" type="string" required="true">	
		<cfargument name="PerPage" type="string" required="true">			
		<!--- Optional Arguments --->
		<cfargument name="UrlVariables" type="string" required="false" default="">
		<cfargument name="ClassPages" type="string" required="false" default="">
		<cfargument name="ClassPageOn" type="string" required="false" default="">
		<cfargument name="ClassBackNext" type="string" required="false" default="">
		
		<!--- Set Local variables so don't have to type arguments everywhere --->
		<cfset StartRow = arguments.StartRow>
		<cfset RecordCount = arguments.RecordCount>
		<cfset PerPage = arguments.PerPage>		
		
		<!--- Set WhichPage We're On --->
		<cfset WhichPage = Ceiling(StartRow / PerPage)>
		<!--- Set HowMany --->
		<cfset HowMany = Ceiling(RecordCount / PerPage)>
		<!--- Set StartRow --->
		<cfif StartRow GT RecordCount>
			<cfset StartRow = (RecordCount - PerPage +1)>
		</cfif>
		
		<cfset EndRow = Min(StartRow + PerPage - 1, RecordCount)>
		<cfset NextRow = EndRow + 1>
		<cfset PrevRow = Max(StartRow - PerPage, 1)>
		
		
		<table cellspacing="5" cellpadding="0" border="0" align="center">
		<cfoutput>
		<tr>			
			<!--- Back Button --->
			<cfif StartRow GT 1>
				<cfset Previous = PrevRow>
				<td><a class="#arguments.ClassBackNext#" href="?StartRow=#Previous#&#UrlVariables#">Back</a></td>
			</cfif>										
			<!--- Page Numbers --->
			<cfloop from="1" to="#HowMany#" index="Count" step="1">		     
				<cfset StartRowValue = (PerPage * Count) - (PerPage - 1)>		
				<cfif RecordCount GT PerPage>
					<cfif Count EQ WhichPage>
						<!--- Page On --->
						<td><a class="#arguments.ClassPageOn#" href="?StartRow=#StartRowValue#&#UrlVariables#">#Count#</a></td>			 			
					<cfelse>
						<!--- Page Off --->
						<td><a class="#arguments.ClassPages#" href="?StartRow=#StartRowValue#&#UrlVariables#">#Count#</a></td>
					</cfif>
				</cfif>			
			</cfloop> 						
			<!--- Next Button --->	
			<cfif EndRow LT RecordCount>
				<cfset Next = NextRow>
				<td><a class="#arguments.ClassBackNext#" href="?StartRow=#Next#&#UrlVariables#">Next</a></td>
			</cfif>	
		</tr>
		</cfoutput>
		</table>				
				
		<cfreturn>
		
	</cffunction>
</cfcomponent>