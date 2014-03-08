<cfcomponent displayname="JMap" output="true" hint="Handle the application." >
 
 
	<!--- Set up the application. --->
    <cfscript>
		
		// ormReload();
		// ormFlush();
		// OnApplicationStart();
    	
		THIS.Name 				= "jmap";
		THIS.ApplicationTimeout = CreateTimeSpan( 0, 0, 1, 0 );
		THIS.SessionManagement 	= true;
		THIS.SessionTimeout 	= CreateTimeSpan( 0, 0, 1, 0 );
    		THIS.SetClientCookies 	= false;
		THIS.dataSource  		= "jmap";
		THIS.ormEnabled 		= "true";
		THIS.ormSettings		= {datasource="jmap",logsql="false", dbcreate="dropcreate"};
    </cfscript>
	
 
	<!--- Define the page request properties. --->
	<cfsetting requesttimeout="20" showdebugoutput="true" enablecfoutputonly="false" />  
  
  
  	<!--- Request Functions --->
	<cffunction name="OnRequestStart" access="public" returntype="any" output="true" hint="Fires at first part of page processing.">
		<cfargument	name="TargetPage" type="string"	required="true" />
 
			<!---<p>OnRequestStart...</p>--->
            
		<cfreturn true />
	</cffunction> 
 
 	<!---
	<cffunction	name="OnRequest" access="public" returntype="any" output="true" hint="Fires after pre page processing is complete.">
		<cfargument	name="TargetPage" type="string"	required="true" />
 
 			<p>OnRequest...</p>
 
		<cfreturn />
	</cffunction> 
	--->
 
	<cffunction	name="OnRequestEnd"	access="public"	returntype="any" output="true"	hint="Fires after the page processing is complete.">
 
  			<!---<p>OnRequestEnd...</p>--->

		<cfreturn />
	</cffunction> 
    
 
 	<!--- Session Functions --->
	<cffunction name="OnSessionStart" access="public" returntype="any" output="true" hint="Fires when the session is first created.">
 
   			<!---<p>OnSessionStart...</p>--->

		<cfreturn />
	</cffunction>
        
	<cffunction	name="OnSessionEnd"	access="public"	returntype="any" output="true" hint="Fires when the session is terminated.">
		<cfargument	name="SessionScope"	type="struct" required="true" /> 
		<cfargument	name="ApplicationScope"	type="struct" required="false" default="#StructNew()#" />
 
  			<!---<p>OnSessionEnd...</p>--->
 
		<cfreturn />
	</cffunction>
    
 
 	<!--- Application Functions --->
	<cffunction name="OnApplicationStart" access="public" returntype="any" output="true" hint="Fires when the application is first created.">
 
   			<!---<p>OnApplicationStart...</p>--->

		<cfreturn true />
	</cffunction>     
    
	<cffunction name="OnApplicationEnd"	access="public"	returntype="void" output="true" hint="Fires when the application is terminated.">
		<cfargument name="ApplicationScope"	type="struct" required="false" default="#StructNew()#" />
 
   			<!---<p>OnApplicationEnd...</p>--->
 
		<cfreturn />
	</cffunction> 
    
 	<!--- Error Functions ---> 
	<cffunction	name="OnError" access="public" returntype="void" output="true" hint="Fires when an exception occures that is not caught by a try/catch.">
		<cfargument	name="Exception" type="any"	required="true" /> 
		<cfargument	name="EventName" type="string" required="false" default="" />
 
  			<p>OnError...</p>  <cfdump var="#Exception#">

		<cfreturn />
	</cffunction>
 
</cfcomponent>

