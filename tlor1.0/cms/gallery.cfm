
<cfset PageTitle = Module>

<cfinclude template="includes/inc_header.cfm">

<cfif NOT isDefined("Session.UserID")>

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_login.cfm">

<cfelse>

	<cfparam name="ToggleOrder" default="0">	
	<cfparam name="OrderBy" default="date_modified">
	<cfparam name="OrderDirection" default=" DESC">
	
	<cfif ToggleOrder>
		<cfif OrderDirection EQ " DESC">
			<cfset OrderDirection = "">
		<cfelse>
			<cfset OrderDirection = " DESC">
		</cfif>		
	</cfif>
	<cfset OrderString = OrderBy & OrderDirection>

	<cfquery name="GetRecords" datasource="#Application.DataSource#">
		SELECT g.*, wf.work_flow
		FROM mod_gallery g
		LEFT OUTER JOIN cms_work_flow wf ON wf.work_flow_id = g.work_flow_id
		ORDER BY #OrderString#
	</cfquery>	
	<!--- If no other message has been set then set default showing records message --->
	<cfif ListLen(Message) LT 2>
		<cfif GetRecords.RecordCount LT HowMany>
			<cfset RC = GetRecords.RecordCount>
		<cfelse>
			<cfset RC = HowMany>
		</cfif>
		<cfset Message="Showing Records 1 to #RC# (out of #GetRecords.RecordCount#),1">
	</cfif>

	<cfset TabArray = ArrayNew(2)>
	<cfset TabArray[1][1] = "#PageTitle#">
	<cfset TabArray[1][2] = "gallery.cfm?Module=#Module#">
	<cfset TabArray[2][1] = "Edit">
	<cfset TabArray[2][2] = "gallery_edit.cfm?Module=#Module#">	
	<cfset TabArray[3][1] = "Add">
	<cfset TabArray[3][2] = "gallery_edit.cfm?Module=#Module#">
	
	<cfset DefaultTab = "1">	
	<cfset InactiveTabList = "2">

	<cfinclude template="includes/inc_action_gallery.cfm">

	<cfinclude template="includes/inc_message.cfm">
	<cfinclude template="includes/inc_tabs.cfm">
	
	<script language="javascript">
		function EditVariable(id){
			if (id != 'image' && id != 'text'){
				document.getElementById('display_' + id).style.display = 'none';
			}
			document.getElementById('edit_' + id).style.display = '';
		}
		
		function preImage(loc, holder) {
		
			holderdiv_y = document.getElementById('img_' + holder).offsetTop;
			document.getElementById('previewArea').style.top = holderdiv_y + 'px';
			document.getElementById('previewCover').style.top = (holderdiv_y + 1) + 'px';
			document.getElementById('previewArea').style.left = '300px';
			document.getElementById('previewCover').style.left = '301px';
			document.getElementById('previewArea').style.backgroundColor = '#FFFFFF';
			document.getElementById('previewCover').style.display = '';
			document.getElementById('previewArea').style.border = '1px solid green';
			document.getElementById('previewArea').style.fontFamily = 'Verdana';
			document.getElementById('previewArea').innerHTML = '<img id="prev_img" src="' + loc + '" alt="preview image of ' + loc + '" style="display:none" />';
			document.getElementById('previewCover').innerHTML = '<br /><br /><br /><br /><br />Loading...';
			
			document.getElementById('prev_img').onload = function(){
				
				document.getElementById('previewArea').innerHTML = '<img id="prev_img" src="' + loc + '" alt="preview image of ' + loc + '" />';
				sdkWidth = document.getElementById('prev_img').width;
				sdkHeight = document.getElementById('prev_img').height;
								
				
				if ((sdkWidth > 140) || (sdkHeight > 140)){
					if (sdkWidth > sdkHeight){
						document.getElementById('prev_img').setAttribute('width', '140');
					} else {
						document.getElementById('prev_img').setAttribute('height', '140');
					}
				}
				
				document.getElementById('prev_img').style.marginTop = (75 - (document.getElementById('prev_img').height/2)) + 'px';
				document.getElementById('previewCover').style.display = 'none';
				
			}

		}
		function removePreview() {
			document.getElementById('previewArea').innerHTML = '';
			document.getElementById('previewArea').style.backgroundColor = '';
			document.getElementById('previewArea').style.border = '0px';
			document.getElementById('previewCover').style.display = 'none';
		}
		
		function deleteVar(id, vName, themeId){
			if(confirm('Are you sure you want to delete variable ' + vName + '?')){
				document.location.href = 'theme_management_edit.cfm?deleteVar=' + id + '&ThemeID=' + themeId;
			}
		}
		
	</script>

	<div id="previewArea" style="position: absolute; top: 0px; left: 0px; overflow:hidden; height: 152px; width: 152px; text-align: center;"></div>
	<div id="previewCover" style="z-index:2; position: absolute; top: 0px; left: 0px; overflow:hidden; height: 150px; width: 150px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:x-small; background-color:##FFFFFF; text-align:center; color:##999999; display: none;"></div>		
	
	
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
		<td><cfif OrderBy CONTAINS 'title'><img src="images/order_<cfif NOT len(trim(OrderDirection))>up<cfelse>down</cfif>.gif" width="15" height="20" border="0"><cfelse>&nbsp;</cfif></td>
		<td><a href="?HowMany=#HowMany#&Module=#Module#&OrderDirection=#OrderDirection#&OrderBy=title&ToggleOrder=1" class="txt_column">TITLE</a></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>		
		<td><cfif OrderBy CONTAINS 'date_modified'><img src="images/order_<cfif NOT len(trim(OrderDirection))>up<cfelse>down</cfif>.gif" width="15" height="20" border="0"><cfelse>&nbsp;</cfif></td>
		<td><a href="?HowMany=#HowMany#&Module=#Module#&OrderDirection=#OrderDirection#&OrderBy=date_modified&ToggleOrder=1" class="txt_column">DATE MODIFIED</a></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
		<td><img src="images/dotpix.gif" width="1" height="1" border="0"></td>
	  </tr>
	  <cfif GetRecords.RecordCount>
		  <form method="post" action="?OrderBy=#OrderBy#&HowMany=#HowMany#&Module=#Module#&OrderDirection=#OrderDirection#"> 	  
		  <cfloop query="GetRecords" endrow="#HowMany#">
			  <tr bgcolor="##FFFFFF"><td colspan="12"><img src="images/dotpix.gif" width="1" height="1" border="0"></td></tr>
			  <tr bgcolor="##CCCCCC">
				<td align="center"><input type="checkbox" id="TR_#Evaluate(FieldID)#" name="ID" value="#Evaluate(FieldID)#"<cfif NOT ListFind(WorkFlowList,work_flow_id)> disabled</cfif> onClick="javascript:colorRow(this);"></td>
				<td align="center"><img src="images/wf_#work_flow_id#.gif" alt=" #work_flow# " width="13" height="13" border="0"></td>
				<td><img src="images/dotpix.gif" width="1" height="25" border="0"></td>
				<td class="txt"><cfif len(title) GT 60>#left(title,"60")#...<cfelse>#title#</cfif></td>
				<td>&nbsp;</td>
				<td class="txt"></td>
				<td>&nbsp;</td>
				<td class="txt">#DateFormat(date_modified,"dd-mm-yyyy")# @ #TimeFormat(date_modified,"HH:mm")#</td>
				<td>&nbsp;</td>
				<td align="center" id="img_#FieldID#"><!--- <a href="" onMouseOver="javascript:preImage('', #FieldID#);" onMouseOut="javascript:removePreview();" target="_blank"><img src="images/edit.gif" alt=" Edit " width="18" height="18" border="0"></a> ---></td>
				<td align="center"><cfif CanDelete><a href="#TabArray[1][2]#&HowMany=#HowMany#&OrderBy=#OrderBy#&OrderDirection=#OrderDirection#&Action=delete&ID=#Evaluate(FieldID)#" onClick="if(! confirm('Are you sure you want to delete this record?')) return false"><img src="images/delete.gif" alt=" Delete " width="18" height="18" border="0"></a><cfelse><img src="images/delete_off.gif" alt=" Delete - No Access " width="18" height="18" border="0"></cfif></td>
				<td align="center"><cfif ListFind(WorkFlowList,work_flow_id)><a href="#TabArray[2][2]#&ID=#Evaluate(FieldID)#"><img src="images/edit.gif" alt=" Edit " width="18" height="18" border="0"></a><cfelse><img src="images/edit_off.gif" alt=" Edit - No Access " width="18" height="18" border="0"></cfif></td>
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
