<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!--- 
	Application: CF_Activedit
	Name: right.cfm
	Function: Right frame of image window, Lists uploaded images
	Author: Pete Freitag, Matt Finn
	Company: CFDEV.COM
	Current Version: 4
	Date: 4/2001

	SECURITY NOTES:
		It is fairly simple for someone to list any directory on your server with this code.
		You should "hard code" the path variable in this page if this page is avaliable to 
		the public.  Otherwise password protect this page.
		
		Check Security notes on upload.cfm as well
 --->
<style type="text/css">
	A {color : blue;}	
	A:Hover {color : #1d039e; text-decoration : underline;}
	
	.generic{font-family: arial, helvetica, sans serif; font-size:10px; color:#CC6600; text-decoration:none;}
	a.generic:LINK{font-family: arial, helvetica, sans serif; font-size:10px; color:#CC6600; text-decoration:none;}	
	a.generic:HOVER{font-family: arial, helvetica, sans serif; font-size:10px; color:#CC6600; text-decoration:underline;}	
	a.generic:VISITED{font-family: arial, helvetica, sans serif; font-size:10px;}	
	
	.txt{font-family: arial, helvetica, sans serif; font-size:12px; color:#000000;}
	.title{font-family: arial, helvetica, sans serif; font-size:10px; font-weight:bold; color:#333333}
</style> 

<cflock scope="SERVER" type="READONLY" timeout="30">
	<cfset ae_encryptkey=server.ae_encryptkey>
</cflock>

<cfset img_data = decrypt("#url.imagedata#",ae_encryptkey)>
<cftry>
	<cfset this.root = ListGetAt(img_data,3)>
	<cfcatch type="Any">
		<strong>Error:<br></strong>
		You have not set up the path to the images directory, and the url to images.
		<br><br>
		Example: 
		<font face="Courier" size="2">&lt;cf_activedit imageurl="http://me.com/img/" imagepath="c:\inetpub\wwwroot\images&gt;</font>
		<cfabort>
	</cfcatch>
</cftry>

<cfoutput>

<!--- If url.imageurl is a list it contains the module and needs to be split. The module is used to restrict image list size in query  --->
<cfif ListLen(url.imageurl) GT 1>
	<cfset Module = ListGetAt(url.imageurl,2)>
	<cfset url.imageurl = ListGetAt(url.imageurl,1)>
</cfif>

<script language="javascript">
function onLoad() {
	this.window.focus();
	if (typeof(upload_onLoad) == "function") {
		upload_onLoad();
	}
}
function select_image(img_name) {

	if (typeof(parent.left.document.ipreview) == 'undefined') 
		{
		parent.left.document.location = "left.cfm?imageurl=#URLEncodedFormat(url.imageurl)#&imagedata=#URLEncodedFormat(url.imagedata)#&instance=#url.instance#&img=#URLEncodedFormat(url.imageurl)#" + img_name;		
		//alert("#url.imageurl#/"+ img_name);
		}
	else{
	    parent.left.document.ipreview.location = "#url.imageurl#/" + img_name;
		//alert("#url.imageurl#/"+ img_name);
		}
	parent.image_loc = "#url.imageurl#/" + img_name;
	}
</script>
</cfoutput>

<cfparam name="url.dirname" default="">
<cfset this.path = this.root & url.dirname>

<!--- create the image directory if it doesnt exist
<cfif NOT DirectoryExists(Trim(this.path))>
	<cfdirectory action="create" directory="#trim(this.path)#">
</cfif>
--->

<cfdirectory action="LIST" directory="#Trim(this.path)#" name="dir">
<html>
<body bgcolor="white" onload="onLoad()" topmargin="0" leftmargin="0">
<font face="Tahoma" size="2"> 
<div align="center" style="font:bold 10pt Verdana,Arial;background-color:#f5f5f5;padding:4px;margin-bottom:5px;border-bottom:1px solid silver;">
<b>Avaliable Images</b>
</div>

<!--- Get Images From DB - If can pass module from parent, restrict images to corresponding module --->
<cfquery name="GetModuleImages" datasource="riley">
	SELECT i.*
	FROM images i
	WHERE STATUS_ID = 1
	AND IMAGE_TYPE_ID = 2
	ORDER BY IMAGE_NAME
</cfquery>	

<table border="0" cellspacing="5" cellpadding="0">
<cfif GetModuleImages.Recordcount>
	<cfoutput query="GetModuleImages">
	<tr>
		<td valign="top"><img src="images/imgicon.gif" border="0" align="absmiddle" width="18" height="16"></td>
		<td><A href="javascript:select_image('#file_name#')" class="generic">#image_name#</a></td>
	</tr>	
	</cfoutput>	
<cfelse>
	<tr><td class="txt">[ no images available ]</td></tr>
</cfif>		
</table>


<!--- Hard Code path here --->

<!--- output directories 
<div style="font-family:verdana;font-size:8pt;padding-left:1px;">
<cfif Len(url.dirname)>
	<cfset dirup=REReplace(url.dirname, "(.*)/.*","\1", "ALL")>
	<cfoutput><a href="right.cfm?dirname=#URLEncodedFormat(dirup)#&imageurl=#URLEncodedFormat(url.imageurl)#&imagedata=#URLEncodedFormat(url.imagedata)#&instance=#url.instance#"><img src="images/upfolder.gif" alt="Up One Directory" border="0" align="absmiddle" width="18" height="15"></a>[ <a href="right.cfm?dirname=#URLEncodedFormat(dirup)#&imageurl=#URLEncodedFormat(url.imageurl)#&imagedata=#URLEncodedFormat(url.imagedata)#&instance=#url.instance#">Up One Level</a> ]<br></cfoutput>
</cfif>
<cfoutput query="dir">
	<cfif dir.Type is "dir" AND dir.name IS NOT "." AND dir.name IS NOT "..">
		<a href="right.cfm?dirname=#URLEncodedFormat(url.dirname)#%2F#URLEncodedFormat(dir.name)#&imageurl=#URLEncodedFormat(url.imageurl)#&imagedata=#URLEncodedFormat(url.imagedata)#&instance=#url.instance#"><img src="images/folder.gif" alt="Directory" border="0" align="absmiddle" width="18" height="15">#dir.name#</a><br>
	</cfif>
</cfoutput> 
<!--- output files --->
<cfoutput query="dir">
<cfif dir.name contains '.gif' OR dir.name contains '.jpg' OR dir.name contains '.jpeg'>
<A href="javascript:select_image('#url.dirname#/#dir.name#')"><img src="images/imgicon.gif" border="0" alt="Image" align="absmiddle" width="18" height="16">#dir.name#</a><br>
</cfif>
</cfoutput>
<cfif dir.recordcount lte 2>
	<BR>
	[ no images ]
</cfif>--->
<br>

</div>
			
			
	

</body>
</html>

