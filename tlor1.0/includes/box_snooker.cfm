<cfquery name="GetBreaks" datasource="#Application.Datasource#" maxrows="5">
	SELECT b.BREAK_ID, b.TITLE
	FROM breaks b
	WHERE STATUS_ID = 1
	ORDER BY DATE_DISPLAY DESC,TITLE
</cfquery>		
<cfparam name="BreakList" default="">			
<cfloop query="GetBreaks">
	<cfif ListLen(TITLE) GT 1>
		<cfloop list="#TITLE#" index="b">
			<cfset BreakList = ListAppend(BreakList,"#b#.#BREAK_ID#")>						
		</cfloop>				
	<cfelse>					
		<cfset BreakList = ListAppend(BreakList,"#TITLE#.#BREAK_ID#")>				
	</cfif>				
</cfloop>
<cfset BreakList = ListSort(BreakList, "numeric", "desc")>
<!--- <Cfdump var="#BreakList#"> --->
<cfoutput>
<table width="175" border="0" cellspacing="0" cellpadding="0">
<tr bgcolor="###Application.PriHome#">
	<td colspan="3"><img src="#Application.Home#images/titles/title_snooker_breaks.gif" height="20" width="175"></td>
</tr>
<tr bgcolor="##FFFFFF">
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="165"></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="5"></td>
</tr>
<tr bgcolor="###Application.SecHome#">
	<td><img src="#Application.Home#images/dotpix.gif" height="100" width="1"></td>
	<td>
		
		<table width="100%" border="0" cellspacing="3" cellpadding="0">
		<cfloop list="#BreakList#" index="x">
			<cfquery name="GetData" datasource="#Application.Datasource#">
				SELECT b.BREAK_ID, b.TITLE, b.WHO, b.DATE_DISPLAY
				FROM breaks b
				WHERE BREAK_ID = #ListGetAt(x,"2",".")#
			</cfquery>					
			<tr>
				<td class="txt_white">#ListGetAt(x,"1",".")#</td>
				<td class="txt_white">#GetData.WHO#</td>
				<td class="txt_white" align="right">#DateFormat(GetData.DATE_DISPLAY,"dd-mm-yy")#</td>
			</tr>
		</cfloop>
		</table>					
					
	</td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr bgcolor="##FFFFFF">
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr bgcolor="###Application.PriHome#">
	<td><img src="#Application.Home#images/dotpix.gif" height="15" width="1"></td>
	<td align="right"><a href="#Application.Home#sport/snooker/breaks.cfm" class="txt_box_more">View All Breaks &gt;&gt;</a></td>
	<td><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
<tr bgcolor="###Application.PriHome#">
	<td colspan="3"><img src="#Application.Home#images/dotpix.gif" height="1" width="1"></td>
</tr>
</table>
<p>
</cfoutput>
