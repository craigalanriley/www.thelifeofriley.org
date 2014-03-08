
<!--- Default Message and MessageType params are in header include --->

<cfif ListLen(Message) GT 1>
	<cfif ListGetAt(Message,2) EQ 0>
		<cfset MessageType = "error">
	<cfelse>
		<cfset MessageType = "success">
	</cfif>
</cfif>

<!--- Dynamic Message Bar ---> 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">  
<cfoutput>
  <tr><td><img src="#Application.Home#cms/images/dotpix.gif" width="1" height="10" border="0"></td></tr>
  <tr>
  	<td class="txt_message" align="center"> 
	
		<table border="0" cellspacing="0" cellpadding="0" align="center">
		<cfif len(trim(Message))>
			<tr>
				<td><img src="#Application.Home#cms/images/#MessageType#.gif" alt=" #MessageType# " width="15" height="16" border="0"></td>
				<td><img src="#Application.Home#cms/images/dotpix.gif" width="5" height="20" border="0"></td>
				<td class="txt_message">#ListGetAt(Message,1)#</td>
			</tr>
		<cfelse>
			<tr>
				<td colspan="3"><img src="#Application.Home#cms/images/dotpix.gif" width="1" height="20" border="0"></td>
			</tr>
		</cfif>		
		</table>

	</td>
  </tr>  
  <tr><td><img src="#Application.Home#cms/images/dotpix.gif" width="1" height="5" border="0"></td></tr>
</cfoutput>
</table>
