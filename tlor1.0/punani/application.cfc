
<cfcomponent>

	<cfscript>
		// app vars
		this.name = "Tropism";
		this.sessionmanagement = "yes";
		this.sessiontimeout = createTimeSpan(0,0,60,0);
		this.applicationTimeout = createTimeSpan(0,0,30,0);
		this.clientmanagement= "yes";
		this.setClientCookies = "yes";
		this.setDomainCookies = "no";
		this.loginstorage="session";
		this.scriptProtect = "all";
		// Mappings
		if (cgi.HTTP_HOST EQ "localhost")
			{
			this.mappings["/tropism"] = "c:\Inetpub\wwwroot\tropism\master\cfcs";
			}
		else{
			this.mappings["/tropism"] = "c:\Webdev\www.tropismed.com\master\cfcs";
			}
    </cfscript>


    <cffunction name="onApplicationStart" output="false">  
    </cffunction>
    
    <cffunction name="onApplicationEnd" output="false">
    </cffunction>
      
    <cffunction name="onSessionStart" output="false">      
    </cffunction>
    
    <cffunction name="onSessionEnd" output="false">
    </cffunction>
    
    <cffunction name="OnRequestStart">   
    </cffunction>
        
    <cffunction name="onError" output="true">     
	</cffunction>        
 
</cfcomponent>