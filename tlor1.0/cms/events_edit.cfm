
<cfset PageTitle = Module>

<cfinclude template="includes/inc_header.cfm">


<cfif NOT isDefined("Session.UserID")>

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_login.cfm">

<cfelse>

	<cfset Message="Please complete all the * required fields,0">

	<cfparam name="ID" default="">
		
	<cfset FieldList="title,summary,copy,contact,email,web,web_desc,on_home_page,thumb_id,date_event,date_display,work_flow_id">
	<cfset ReqList="title,summary,date_event,date_display,work_flow_id">	
	
	<!--- Tab Stuff --->
	<cfset TabArray = ArrayNew(2)>
	<cfset TabArray[1][1] = "#PageTitle#">
	<cfset TabArray[1][2] = "events.cfm?Module=#Module#">
	<cfset TabArray[2][1] = "Edit">
	<cfset TabArray[2][2] = "events_edit.cfm?Module=#Module#&ID=#ID#">	
	<cfset TabArray[3][1] = "Add">
	<cfset TabArray[3][2] = "events_edit.cfm?Module=#Module#">
	
	<cfparam name="DefaultTab" default="3">
	<cfparam name="InactiveTabList" default="2">
	<!--- If ID set edit tab to be active --->
	<cfif len(trim(ID))>
		<cfset DefaultTab = "2">
		<cfset InactiveTabList = "">
	</cfif>
	
	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_tabs.cfm">
	<cfinclude template="includes/inc_validation.cfm">	
	
	<cfinclude template="includes/inc_action_articles.cfm">
	
	<!--- Dynamic mod_articles CFC, turn standard fields on and off via FieldList variable --->
	<cfinvoke component="#Application.CFC#articles" method="dynFields" returnvariable="Message" 
				CFC="#Application.CFC#"
				UserID="#Session.UserID#"
				Home="#Application.Home#"
				Module="#Module#"
				FieldList="#FieldList#"
				ReqList="#ReqList#"
				ID="#ID#"
				ShowRelated="1"
				ShowSections="1">  

</cfif>


<cfinclude template="includes/inc_footer.cfm">

