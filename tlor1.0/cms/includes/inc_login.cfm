
<cfparam name="Email" default="">
<cfparam name="Password" default="">

<cfoutput>
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center">  
  <tr>
	<td><img src="#Application.Home#cms/images/dotpix.gif" width="1" height="50" border="0"></td>
  </tr>
  <tr>
	<td>
	
		<table border="0" cellspacing="1" cellpadding="3" align="center" bgcolor="##333333">
		<form action="" method="post">
		  <input type="hidden" name="Login" value="1">
		  <tr bgcolor="##CCCCCC">
			<td class="txt_form">Email</td>
			<td><input type="text" class="frm_txt_medium" name="Email" value="#Email#"></td>
		  </tr>
		  <tr bgcolor="##CCCCCC">
			<td class="txt_form">Password</td>
			<td><input type="password" class="frm_txt_medium" name="Password" value="#Password#"></td>
		  </tr>
		  <tr bgcolor="##CCCCCC">
			<td>&nbsp;</td>
			<td><input type="submit" class="form_button" value="LOGIN"></td>
		  </tr>
		</form>  
		</table>	
	
	</td>
  </tr>
  <tr>
	<td><img src="#Application.Home#cms/images/dotpix.gif" width="1" height="75" border="0"></td>
  </tr>  
</table>
</cfoutput>
