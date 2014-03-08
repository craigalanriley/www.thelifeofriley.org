
<cfset PageTitle = Module>

<cfinclude template="includes/inc_header.cfm">

<cfif NOT isDefined("Session.UserID")>

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_login.cfm">

<cfelse>

	<cfparam name="ToggleOrder" default="0">	
	<cfparam name="OrderBy" default="m.date_modified">
	<cfparam name="OrderDirection" default=" DESC">
	
	<cfif ToggleOrder>
		<cfif OrderDirection EQ " DESC">
			<cfset OrderDirection = "">
		<cfelse>
			<cfset OrderDirection = " DESC">
		</cfif>		
	</cfif>
	<cfset OrderString = OrderBy & OrderDirection>

	<!--- <cfquery name="GetRecords" datasource="#Application.DataSource#">
		SELECT m.*, m2.label as parent, wf.work_flow, p.page_title
		FROM cms_menus m
		LEFT OUTER JOIN cms_menus m2 ON m.parent_id = m.menu_id
		LEFT OUTER JOIN cms_pages p ON p.page_id = m.page_id
		LEFT OUTER JOIN cms_work_flow wf ON wf.work_flow_id = m.work_flow_id
		ORDER BY #OrderBy#
	</cfquery>	 --->
	
	<!--- Call dyn cms_menus and don't pass parent ID to avoid recursion --->
	<cfinvoke component="#Application.CFC#dyn_menus" method="navArray" returnvariable="arrNav"
				ApprovedOnly="0"
				OrderString="#OrderString#">		
				
	<!--- If no other message has been set then set default showing records message --->
	<cfif ArrayLen(arrNav) LT HowMany>
		<cfset RC = ArrayLen(arrNav)>
	<cfelse>
		<cfset RC = HowMany>
	</cfif>
	<cfif ListLen(Message) LT 2>
		<cfset Message="Showing Records 1 to #RC# (out of #ArrayLen(arrNav)#)">
	</cfif>

	<cfset TabArray = ArrayNew(2)>
	<cfset TabArray[1][1] = "#PageTitle#">
	<cfset TabArray[1][2] = "menu_manager.cfm?Module=#Module#">
	<cfset TabArray[2][1] = "Menu Tree">
	<cfset TabArray[2][2] = "menu_manager_tree.cfm?Module=#Module#">
	<cfset TabArray[3][1] = "Edit">
	<cfset TabArray[3][2] = "menu_manager_edit.cfm?Module=#Module#">	
	<cfset TabArray[4][1] = "Add">
	<cfset TabArray[4][2] = "menu_manager_edit.cfm?Module=#Module#">
	
	<cfset DefaultTab = "1">	
	<cfset InactiveTabList = "3">

	<cfinclude template="includes/inc_action_menumanager.cfm">

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_tabs.cfm">
	
	<cfoutput>
	<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
	  <tr>
		<td><img src="images/dotpix.gif" width="20" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="20" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="15" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="350" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="15" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="120" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="15" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="115" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="15" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="15" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="25" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="25" height="1" border="0"></td>
	  </tr>
	  <tr bgcolor="##CC6600">
		<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><cfif OrderBy CONTAINS 'label'><img src="images/order_<cfif NOT len(trim(OrderDirection))>up<cfelse>down</cfif>.gif" width="15" height="20" border="0"><cfelse>&nbsp;</cfif></td>
		<td><a href="?HowMany=#HowMany#&Module=#Module#&OrderDirection=#OrderDirection#&OrderBy=m.label&ToggleOrder=1" class="txt_column">MENU LABEL</a></td>
		<td><cfif OrderBy CONTAINS 'page_title'><img src="images/order_<cfif NOT len(trim(OrderDirection))>up<cfelse>down</cfif>.gif" width="15" height="20" border="0"><cfelse>&nbsp;</cfif></td>
		<td><a href="?HowMany=#HowMany#&Module=#Module#&OrderDirection=#OrderDirection#&OrderBy=page_title&ToggleOrder=1" class="txt_column">LINKED PAGE</a></td>		
		<td><cfif OrderBy CONTAINS 'date_modified'><img src="images/order_<cfif NOT len(trim(OrderDirection))>up<cfelse>down</cfif>.gif" width="15" height="20" border="0"><cfelse>&nbsp;</cfif></td>
		<td><a href="?HowMany=#HowMany#&Module=#Module#&OrderDirection=#OrderDirection#&OrderBy=m.date_modified&ToggleOrder=1" class="txt_column">DATE MODIFIED</a></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <form method="post" action="?OrderBy=#OrderBy#&HowMany=#HowMany#&Module=#Module#&OrderDirection=#OrderDirection#"> 	  
	  <cfif ArrayLen(arrNav)>
		  <cfloop from="1" to="#RC#" index="x">
			  <tr bgcolor="##FFFFFF"><td colspan="12"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC">
				<td align="center"><input type="checkbox" id="TR_#arrNav[x][1]#" name="ID" value="#arrNav[x][1]#"<cfif NOT ListFind(WorkFlowList,arrNav[x][6]) OR (arrNav[x][3] EQ 1)> disabled</cfif> onClick="javascript:colorRow(this);"></td>
				<td align="center"><img src="images/wf_#arrNav[x][6]#.gif" alt=" #arrNav[x][6]# " width="13" height="13" border="0"></td>
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">#arrNav[x][2]#</td>
				<td>&nbsp;</td>
				<td class="txt"><cfif len(arrNav[x][5]) GT 15>#left(arrNav[x][5],"15")#...<cfelse>#arrNav[x][5]#</cfif></td>
				<td>&nbsp;</td>
				<td class="txt">#DateFormat(arrNav[x][8],"dd-mm-yyyy")# @ #TimeFormat(arrNav[x][8],"HH:mm")#</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<!--- If user is Admin Support allow to delete any nav, even primary / otherwise according to user type permissions --->
				<td align="center"><cfif (CanDelete AND (arrNav[x][3] GT 1)) OR (Session.UserID EQ 1)><a href="#TabArray[1][2]#&HowMany=#HowMany#&OrderBy=#OrderBy#&OrderDirection=#OrderDirection#&Action=delete&ID=#arrNav[x][1]#" onClick="if(! confirm('Are you sure you want to delete this record?')) return false"><img src="images/delete.gif" alt=" Delete " width="18" height="18" border="0"></a><cfelse><img src="images/delete_off.gif" alt=" Delete - No Access " width="18" height="18" border="0"></cfif></td>
				<td align="center"><cfif ListFind(WorkFlowList,arrNav[x][6])><a href="#TabArray[3][2]#&ID=#arrNav[x][1]#"><img src="images/edit.gif" alt=" Edit " width="18" height="18" border="0"></a><cfelse><img src="images/edit_off.gif" alt=" Edit - No Access " width="18" height="18" border="0"></cfif></td>
			  </tr>		  		  
		  </cfloop>			
		  <cfinclude template="includes/inc_batch_howmany.cfm"> 
	  <cfelse>
	  	  <!--- If no results --->
	   	  <tr bgcolor="##FFFFFF"><td colspan="12"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
		  <tr bgcolor="##CCCCCC"><td colspan="12"><img src="images/dotpix.gif" width="1" height="50" border="0"></td></tr>
		  <tr bgcolor="##CCCCCC"><td colspan="12" class="txt" align="center">No Records</td></tr>
		  <tr bgcolor="##CCCCCC"><td colspan="12"><img src="images/dotpix.gif" width="1" height="50" border="0"></td></tr>
	  </cfif> 	  
	  <tr bgcolor="##333333"><td colspan="12"><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>  
	</table>
	</cfoutput>
	
</cfif>


<cfinclude template="includes/inc_footer.cfm">
