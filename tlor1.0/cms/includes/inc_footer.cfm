<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">
  <cfoutput>
  <tr>
  	<td colspan="3"><img src="#Application.Home#cms/images/dotpix.gif" width="1" height="20" border="0"></td>
  </tr>
  <tr bgcolor="##333333">
  	<td colspan="3"><img src="#Application.Home#cms/images/dotpix.gif" width="750" height="3" border="0"></td>
  </tr>
  <tr>
  	<td colspan="3"><img src="#Application.Home#cms/images/dotpix.gif" width="1" height="3" border="0"></td>
  </tr>
  <tr>
  	<td width="40%" class="footer">Design and Technology by <a href="http://www.log1k.com" class="footer" target="_blank"><b>Log<font color="##cc0000">1k</font></a></b></td>
  	<cfif isDefined("Session.UserID")>
		<td width="20%" align="center"><a href="##TOP" class="footer">^ Back To Top ^</a></td>
		<td width="40%" class="footer" align="right">
		<a href="#Application.Home#cms/index.cfm" class="footer">Home</a> | 
		<a href="#Application.Home#cms/workflow.cfm" class="footer">Work Flow</a> | 
		<a href="##" class="footer">Statistics</a> | 
		<a href="#Application.Home#cms/index.cfm?LogOut=1" class="footer">Logout</a>
		</td>
	</cfif>
  </tr>  
  </cfoutput>
</table>
<!--  
Design and Technology by Xroom
Built by Craig Riley April 2006
-->
</body>
</html>
