
<cfset PageTitle = Module>

<cfinclude template="includes/inc_header.cfm">

<cfif NOT isDefined("Session.UserID")>

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_login.cfm">

<cfelse>

	<cfparam name="Action" default="">
	<cfset FieldID = "menu_id">
	
	<cfif len(trim(Action))>
		<!--- Call the cfc to move the menu item up or down --->
		<cfinvoke component="#Application.CFC#menu_order" method="move" returnvariable="Message" 
					Action="#Action#"
					ID="#ID#">	
	</cfif>

	<!--- If no other message has been set then set default showing records message --->
	<cfif ListLen(Message) LT 2>
		<cfset Message = "Showing all menu records,1">
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
	
	<cfset DefaultTab = "2">	
	<cfset InactiveTabList = "3">

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
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td class="txt_column">MENU LABEL</td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td class="txt_column">LINKED PAGE</td>		
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td class="txt_column">DATE MODIFIED</td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>	
	  <cfinvoke component="#Application.CFC#dyn_menus" method="navArray" returnvariable="arrNav"
					ParentID="0"
					ApprovedOnly="0">	
					
	  <cfif ArrayLen(arrNav)>
		  <cfloop from="1" to="#ArrayLen(arrNav)#" index="x">
		  
			<!--- <cfquery name="GetOrder" datasource="#Application.DataSource#">
				SELECT m.menu_order
				FROM cms_menus m
				WHERE menu_id = #arrNav[x][1]#
			</cfquery>		
			<font color="FF0000">[#GetOrder.menu_order#]</font> 		  
		    --->
		  
		  	  <cfinvoke component="#Application.CFC#dyn_menus" method="navFormat" returnvariable="Menu" MenuLevel="#arrNav[x][3]#">
			  <tr bgcolor="##FFFFFF"><td colspan="12"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC">
				<td align="center"><input type="checkbox" id="TR_#arrNav[x][1]#" name="ID" value="#arrNav[x][1]#" disabled></td>
				<td align="center"><img src="images/wf_#arrNav[x][6]#.gif" alt=" #arrNav[x][7]# " width="13" height="13" border="0"></td>
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="#Menu.Class#">#Menu.Indent##Menu.Icon#<cfif ListFind(WorkFlowList,arrNav[x][6])><a href="#TabArray[3][2]#&ID=#arrNav[x][1]#" class="#Menu.Class#">#arrNav[x][2]#</a><cfelse>#arrNav[x][2]#</cfif></td>
				<td>&nbsp;</td>
				<td class="txt"><cfif len(arrNav[x][5]) GT 15>#left(arrNav[x][5],"15")#...<cfelse>#arrNav[x][5]#</cfif></td>
				<td>&nbsp;</td>
				<td class="txt">#DateFormat(arrNav[x][8],"dd-mm-yyyy")# @ #TimeFormat(arrNav[x][8],"HH:mm")#</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<!--- If user is Admin Support allow to move any nav, even primary / otherwise according to user type permissions --->				
				<td align="center"><cfif (ListFind(WorkFlowList,arrNav[x][6]) AND arrNav[x][3] NEQ 1) OR (Session.UserID EQ 1)><a href="?Module=#Module#&ID=#arrNav[x][1]#&Action=Down"><img src="images/move_down.gif" width="18" height="18" border="0" alt=" Move Down "></a><cfelse><img src="images/move_down_off.gif" width="18" height="18" border="0" alt=" No Permission "></cfif></td>
				<td align="center"><cfif (ListFind(WorkFlowList,arrNav[x][6]) AND arrNav[x][3] NEQ 1) OR (Session.UserID EQ 1)><a href="?Module=#Module#&ID=#arrNav[x][1]#&Action=Up"><img src="images/move_up.gif" width="18" height="18" border="0" alt=" Move Up "></a><cfelse><img src="images/move_down_off.gif" width="18" height="18" border="0" alt=" No Permission "></cfif></td>
			  </tr>				  
		  </cfloop>			
	  <cfelse>
	  	  <!--- If no results --->
	   	  <tr bgcolor="##FFFFFF"><td colspan="12"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
		  <tr bgcolor="##CCCCCC"><td colspan="12"><img src="images/dotpix.gif" width="1" height="50" border="0"></td></tr>
		  <tr bgcolor="##CCCCCC"><td colspan="12" class="txt" align="center">No Records</td></tr>
		  <tr bgcolor="##CCCCCC"><td colspan="12"><img src="images/dotpix.gif" width="1" height="50" border="0"></td></tr>
	  </cfif> 	
					
					
					
					
					

<!--- 	  <cfquery name="GetTopLevel" datasource="#Application.DataSource#">
		SELECT m.*, m2.label as parent, wf.work_flow, page_title
		FROM cms_menus m
		LEFT OUTER JOIN cms_menus m2 ON m.parent_id = m.menu_id
		LEFT OUTER JOIN cms_pages p ON p.page_id = m.page_id
		LEFT OUTER JOIN cms_work_flow wf ON wf.work_flow_id = m.work_flow_id
		WHERE m.parent_id = 0
		ORDER BY m.menu_order
	  </cfquery>	
	  <cfif GetTopLevel.RecordCount>
		  <form method="post" action="?Module=#Module#"> 	  
		  <cfloop query="GetTopLevel">
			  <tr bgcolor="##FFFFFF"><td colspan="12"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC">
				<td align="center"><input type="checkbox" id="TR_#Evaluate(FieldID)#" name="ID" value="#Evaluate(FieldID)#" disabled></td>
				<td align="center"><img src="images/wf_#work_flow_id#.gif" alt=" #work_flow# " width="13" height="13" border="0"></td>
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt">#label#</td>
				<td>&nbsp;</td>
				<td class="txt"><cfif len(page_title) GT 15>#left(page_title,"15")#...<cfelse>#page_title#</cfif></td>
				<td>&nbsp;</td>
				<td class="txt">#DateFormat(date_modified,"dd-mm-yyyy")# @ #TimeFormat(date_modified,"HH:mm")#</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td><cfif ListFind(WorkFlowList,work_flow_id)><a href="?Module=#Module#&ID=#Evaluate(FieldID)#&Action=Down"><img src="images/move_down.gif" width="18" height="18" border="0" alt=" Move Down "></a><cfelse><img src="images/move_down_off.gif" width="18" height="18" border="0" alt=" No Permission "></cfif></td>
				<td><cfif ListFind(WorkFlowList,work_flow_id)><a href="?Module=#Module#&ID=#Evaluate(FieldID)#&Action=Up"><img src="images/move_up.gif" width="18" height="18" border="0" alt=" Move Up "></a><cfelse><img src="images/move_down_off.gif" width="18" height="18" border="0" alt=" No Permission "></cfif></td>
			  </tr>			
			  <cfquery name="GetSecondLevel" datasource="#Application.DataSource#">
				SELECT m.*, wf.work_flow, page_title
				FROM cms_menus m
				LEFT OUTER JOIN cms_pages p ON p.page_id = m.page_id
				LEFT OUTER JOIN cms_work_flow wf ON wf.work_flow_id = m.work_flow_id
				WHERE m.parent_id = #menu_id#
				ORDER BY m.menu_order
			  </cfquery>				
			  <cfif GetSecondLevel.RecordCount>
			  	  <cfloop query="GetSecondLevel">
					  <tr bgcolor="##FFFFFF"><td colspan="12"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
					  <tr bgcolor="##CCCCCC">
						<td align="center"><input type="checkbox" id="TR_#Evaluate(FieldID)#" name="ID" value="#Evaluate(FieldID)#" disabled></td>
						<td align="center"><img src="images/wf_#work_flow_id#.gif" alt=" #work_flow# " width="13" height="13" border="0"></td>
						<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
						<td class="txt"><img src="images/dotpix.gif" width="10" height="1" border="0">- [#menu_order#] #label#</td>
						<td>&nbsp;</td>
						<td class="txt"><cfif len(page_title) GT 15>#left(page_title,"15")#...<cfelse>#page_title#</cfif></td>
						<td>&nbsp;</td>
						<td class="txt">#DateFormat(date_modified,"dd-mm-yyyy")# @ #TimeFormat(date_modified,"HH:mm")#</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td><cfif ListFind(WorkFlowList,work_flow_id)><a href="?Module=#Module#&ID=#Evaluate(FieldID)#&Action=Down"><img src="images/move_down.gif" width="18" height="18" border="0" alt=" Move Down "></a><cfelse><img src="images/move_down_off.gif" width="18" height="18" border="0" alt=" No Permission "></cfif></td>
						<td><cfif ListFind(WorkFlowList,work_flow_id)><a href="?Module=#Module#&ID=#Evaluate(FieldID)#&Action=Up"><img src="images/move_up.gif" width="18" height="18" border="0" alt=" Move Up "></a><cfelse><img src="images/move_down_off.gif" width="18" height="18" border="0" alt=" No Permission "></cfif></td>
					  </tr>			
					  <cfquery name="GetThirdLevel" datasource="#Application.DataSource#">
						SELECT m.*, wf.work_flow, page_title
						FROM cms_menus m
						LEFT OUTER JOIN cms_pages p ON p.page_id = m.page_id
						LEFT OUTER JOIN cms_work_flow wf ON wf.work_flow_id = m.work_flow_id
						WHERE m.parent_id = #menu_id#
						ORDER BY m.menu_order
					  </cfquery>				
					  <cfif GetThirdLevel.RecordCount>
						  <cfloop query="GetThirdLevel">
							  <tr bgcolor="##FFFFFF"><td colspan="12"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
							  <tr bgcolor="##CCCCCC">
								<td align="center"><input type="checkbox" id="TR_#Evaluate(FieldID)#" name="ID" value="#Evaluate(FieldID)#" disabled></td>
								<td align="center"><img src="images/wf_#work_flow_id#.gif" alt=" #work_flow# " width="13" height="13" border="0"></td>
								<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
								<td class="txt"><img src="images/dotpix.gif" width="20" height="1" border="0">- [#menu_order#] #label#</td>
								<td>&nbsp;</td>
								<td class="txt"><cfif len(page_title) GT 15>#left(page_title,"15")#...<cfelse>#page_title#</cfif></td>
								<td>&nbsp;</td>
								<td class="txt">#DateFormat(date_modified,"dd-mm-yyyy")# @ #TimeFormat(date_modified,"HH:mm")#</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td><cfif ListFind(WorkFlowList,work_flow_id)><a href="?Module=#Module#&ID=#Evaluate(FieldID)#&Action=Down"><img src="images/move_down.gif" width="18" height="18" border="0" alt=" Move Down "></a><cfelse><img src="images/move_down_off.gif" width="18" height="18" border="0" alt=" No Permission "></cfif></td>
								<td><cfif ListFind(WorkFlowList,work_flow_id)><a href="?Module=#Module#&ID=#Evaluate(FieldID)#&Action=Up"><img src="images/move_up.gif" width="18" height="18" border="0" alt=" Move Up "></a><cfelse><img src="images/move_down_off.gif" width="18" height="18" border="0" alt=" No Permission "></cfif></td>
							  </tr>			
						  </cfloop>
					  </cfif>		
				  </cfloop>
			  </cfif>
		  </cfloop>
	  <cfelse>
	  	  <!--- If no results --->
	   	  <tr bgcolor="##FFFFFF"><td colspan="12"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
		  <tr bgcolor="##CCCCCC"><td colspan="12"><img src="images/dotpix.gif" width="1" height="50" border="0"></td></tr>
		  <tr bgcolor="##CCCCCC"><td colspan="12" class="txt" align="center">No Records</td></tr>
		  <tr bgcolor="##CCCCCC"><td colspan="12"><img src="images/dotpix.gif" width="1" height="50" border="0"></td></tr>
	  </cfif>  --->	  
	  <tr bgcolor="##333333"><td colspan="12"><img src="images/dotpix.gif" width="1" height="2" border="0"></td></tr>  
	</table>
	</cfoutput>
	
</cfif>


<cfinclude template="includes/inc_footer.cfm">
