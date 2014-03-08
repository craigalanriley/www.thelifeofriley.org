<cfparam name="Action" default="0">
<cfparam name="Name" default="">
<cfparam name="Email" default="contact@thelifeofriley.org">
<cfparam name="Comments" default="">
<cfparam name="SiteSection" default="">
<cfparam name="Message" default="Please complete all the * required fields:">

<cfif Action>

	<!--- Send Email --->
	<cfmail to="#Application.Email#" from="#Email#" subject="TLOR Contact" type="html">
	This email has been sent from the ATP <a href="http://www.atp.com.au/contact.cfm">contact</a> page.
	<p><strong>NAME</strong>: #Name#</p>
	<p><strong>EMAIL</strong>: #Email#</p>
	<strong>COMMENTS</strong>:
	<p>#Comments#</p>	
	</cfmail>
	<!--- Set Message --->
	<cfset Message = "Thankyou, your message has been sent">

</cfif>


<cfoutput>
<table width="100%" cellspacing="2" cellpadding="5" border="0">
<form name="frm" action="contact.cfm" method="post">
<input type="hidden" name="Action" value="1">
<input type="hidden" name="sectionName" value="">
<tr>
	<td></td>
	<td width="8" valign="top">&nbsp;</td>
	<td class="txt_message">#Message#</td>				
</tr>
<tr>
	<td>Name:</td>
	<td width="8" valign="top">*</td>
	<td><input type="text" name="Name" size="35"></td>				
</tr>
<tr>
	<td>Email:</td>
	<td width="8" valign="top">*</td>
	<td><input type="text" name="Email" size="35"></td>
</tr>
<tr>
	<td valign="top">Comments:</td>
	<td width="8" valign="top">*</td>
	<td><textarea cols="50" rows="5" name="Comments"></textarea></td>

</tr>		
<tr>
	<td valign="top">&nbsp;</td>
	<td width="8" valign="top">&nbsp;</td>
	<td><input type="submit" value=" Send " onclick="return submitform(this.form);"></td>
</tr>			
</form>					
</table>
</cfoutput>

<img src="images/dotpix.gif" width="1" height="20"><br>

<cfset ReqList="Name,Email,Comments">
<cfinclude template="validation.cfm">
