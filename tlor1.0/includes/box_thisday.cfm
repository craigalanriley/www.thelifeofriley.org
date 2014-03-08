
<cfinvoke component="#Application.CompsPath#/thisday" method="Articles" returnvariable="ThisDayArray"
			Datasource="#Application.Datasource#"
			Home="#Application.Home#"
			TDate="#now()#">	
	

	
<cfoutput>
<table width="175" border="0" cellspacing="0" cellpadding="0">
	<tr bgcolor="###Application.PriHome#">
		<td colspan="3"><img src="#Application.Home#images/titles/title_thisday.gif" height="20" width="175"></td>
	</tr>
	<tr bgcolor="##FFFFFF">
		<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
		<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
		<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
	</tr>
	<tr bgcolor="###Application.SecHome#">
		<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="5" width="1"></td>
	</tr>
	<cfif ArrayLen(ThisDayArray)>
	
		<cfset RN = RandRange(1,(ArrayLen(ThisDayArray)))>	
		
		<tr bgcolor="###Application.SecHome#">
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
			<td class="txt_white" align="left">...in #DateFormat(ThisDayArray[RN][2],"yyyy")#, #ThisDayArray[RN][3]#</td>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
		</tr>
		<cfif ThisDayArray[RN][4] GT 0>
			<tr bgcolor="###Application.SecHome#">
				<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
				<td align="right"><a href="?ArticleID=#ThisDayArray[RN][4]#&Category=#ThisDayArray[RN][5]#" class="txt"><img src="#Application.Home#images/titles/box_more.gif" height="19" width="65" border="0"></a></td>
				<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
			</tr>
		</cfif>
		
	<cfelse> 
		<tr bgcolor="###Application.SecHome#">
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
			<td class="txt_white" align="left">...in any year, it seems I either haven't done anything memorable, or haven't got around to writing about it yet!</td>
			<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
		</tr>
	</cfif>
	<tr bgcolor="###Application.SecHome#">
		<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="5" width="1"></td>
	</tr>
	<tr bgcolor="##FFFFFF">
		<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
	</tr>
	<tr bgcolor="###Application.PriHome#">
		<td><img src="#Application.Home#images/dotpix.gif" height="15" width="5"></td>
		<td><img src="#Application.Home#images/dotpix.gif" height="1" width="165"></td>
		<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
	</tr>
</table>
</cfoutput>
<p>		

