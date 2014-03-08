<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfinclude template="includes/loggedin.cfm">

<cfparam name="Message" default="">
<cfparam name="ModuleID" default="">
<cfparam name="ErrorList" default="">
<cfparam name="SectionList" default="">
<cfparam name="FRONT_PAGE" default="0">
<cfparam name="GALLERY" default="0">

<cfset MustList="IMAGE_NAME,FILE_NAME,BIG_FILE_NAME,IMAGE_TYPE_ID,DATE_DISPLAY,STATUS_ID">
<cfset FieldList="IMAGE_NAME,FILE_NAME,BIG_FILE_NAME,SUMMARY,GALLERY,FRONT_PAGE,IMAGE_TYPE_ID,COUNTRY_ID,DATE_DISPLAY,STATUS_ID">
<cfset GetData = QueryNew("#FieldList#")>
<cfset Root = ExpandPath("../uploads/images/")>

<cfif isDefined("Action")>
	
	<cfif CompareNoCase(Action,"Delete")>

		<!--- Preserve state / Validate Module 
		<cfmodule template="../cfmodules/validate.cfm" 
					FieldList = "#FieldList#"
					MustList = "#MustList#"
					ErrorList = "#ErrorList#">--->
						
		<cfif NOT len(trim(ErrorList))>

			<cfswitch expression="#Action#">	
				<cfcase value="Create">
					<!--- Check if user has selected a file --->
					<cfif len(trim(FILE_NAME))>
						<!--- Upload file --->
						<cffile action="Upload" FileField="FILE_NAME" Destination="#Root#" MODE="744" nameconflict="MAKEUNIQUE">
						<!--- Check if file is of desired type --->		
						<cfif file.ServerFileExt IS NOT "jpg" AND file.ServerFileExt IS NOT "gif">
						
							<!--- If not desired type, delete it and set message --->
							<cfif FileExists("#Root##file.ServerFile#")>
								<cffile action="DELETE" File="#Root##file.ServerFile#">
							</cfif>	
							<cfset Message = "Sorry, the image you uploaded must be a jpeg or gif file.">
							
						<cfelse>
						
							<!--- <cfif FRONT_PAGE>
								<cfquery name="ResetImageFrontPage" datasource="#Application.Datasource#">
									UPDATE images
									SET FRONT_PAGE = 0
								</cfquery>					
							</cfif> --->							
							<!--- If file type is ok, add data to DB --->			
							<cfquery datasource="#Application.datasource#" >
								INSERT INTO images(#FieldList#,VIDEO,DATE_EDITED,DATE_CREATED)
								VALUES('#IMAGE_NAME#','#file.ServerFile#','#BIG_FILE_NAME#','#SUMMARY#','1','#FRONT_PAGE#','2',
								'#COUNTRY_ID#',#CreateODBCDate(DATE_DISPLAY)#,#STATUS_ID#,1,#CreateODBCDate(Now())#,#CreateODBCDate(Now())#)
							</cfquery>
							<cfquery datasource="#Application.Datasource#"  name="GetMaxID">
								SELECT MAX(IMAGE_ID) AS LatestID
								FROM images 
							</cfquery>
							<cfset ImageID = GetMaxID.LatestID>
												
							<cfloop list="#SectionList#" index="s">
								<cfquery name="InsertSections" datasource="#Application.Datasource#">
									INSERT INTO image_section_lookup(IMAGE_ID,SECTION_ID)
									VALUES(#ImageID#,#s#)
								</cfquery>					
							</cfloop>
														
							<cfset Message = "The image has been uploaded">
							
						</cfif>
					<cfelse>
						<cfset Message = "You must select an image">
					</cfif>		
				
				</cfcase>
				<cfcase value="Update">
				
					<!--- <cfif FRONT_PAGE>
						<cfquery name="ResetImageFrontPage" datasource="#Application.Datasource#">
							UPDATE images
							SET FRONT_PAGE = 0
						</cfquery>					
					</cfif> --->
					
					<cfquery name="Update" datasource="#Application.Datasource#">
						UPDATE images
						SET IMAGE_NAME = '#IMAGE_NAME#',
						    SUMMARY = '#SUMMARY#',
						    COUNTRY_ID = '#COUNTRY_ID#',
						    BIG_FILE_NAME = '#BIG_FILE_NAME#',
						    FRONT_PAGE = '#FRONT_PAGE#',
						    DATE_DISPLAY = #CreateODBCDate(DATE_DISPLAY)#,
						    STATUS_ID = '#STATUS_ID#'
						WHERE IMAGE_ID = #ImageID#
					</cfquery>	

					<cfquery name="DeleteOldSections" datasource="#Application.Datasource#">
						DELETE FROM image_section_lookup
						WHERE IMAGE_ID IN(#ImageID#)
					</cfquery>					
					<cfloop list="#SectionList#" index="s">
						<cfquery name="InsertSections" datasource="#Application.Datasource#">
							INSERT INTO image_section_lookup(IMAGE_ID,SECTION_ID)
							VALUES(#ImageID#,#s#)
						</cfquery>					
					</cfloop>
					<cfset Message = "The record has been updated">			
				
				</cfcase>			
			</cfswitch>
		<cfelse>
			<cfset Message = "You must complete all the highlighted fields">
		</cfif>		
		
	<cfelse>
		<cfif isDefined("ImageID")>
			<cfloop list="#ImageID#" index="i">
				<cfquery datasource="#Application.Datasource#"  name="GetFileName">
					SELECT FILE_NAME 
					FROM images WHERE IMAGE_ID = #i#
				</cfquery>
				<!--- Delete file from server --->
				<cfif FileExists("#Root##GetFileName.FILE_NAME#")>
					<cffile action="delete" File="#Root##GetFileName.FILE_NAME#">
				</cfif>
				<!--- delete DB records --->				
				<cfquery datasource="#Application.Datasource#" >
					DELETE FROM images 
					WHERE IMAGE_ID =#i#
				</cfquery>
			</cfloop>
			<cfset Message = "The records have been deleted">
			<cflocation url="video_uploads.cfm?ModuleID=#ModuleID#&Message=#Message#" addtoken="no">
		<cfelse>
			<cfset Message = "You must select a record">
		</cfif>		
	
	</cfif>

</cfif>

<html>
<cfoutput>
<head>
	<title>The Life of Riley</title>
	<meta name="keywords" content="Craig,Riley,the life of riley,Snooker,Pool,8 Ball,Grimsby,Sydney,Australia,Coldfusion,Web Developer," />
	<meta name="description" content="The Life of Riley is the personal website of Craig Riley, Web Developer and Pool Hustler"/>
	<meta http-equiv="content-type" content="text/html;charset=iso-8859-1"/>
	<link rel=stylesheet type="text/css" href="stylesheets/xroom.css">
	<script language="javascript" src="javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfinclude template="includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##8080C0"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="30" width="1"></td>
		<td bgcolor="##EAEAEA"><span class="txt_header">IMAGE UPLOADS</span> <cfif len(trim(Message))><span class="txt_message"> - #Message#</span></cfif></td>
	</tr>
  	<tr>
    	<td bgcolor="##8080C0" valign="top">
		
			<cfinclude template="includes/navigation.cfm">		
		
		</td>
    	<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="1" width="1"></td>
    	<td bgcolor="##EAEAEA" class="txt" valign="top">
		
			<cfif isDefined("ImageID")>
		
				<cfquery name="GetData" datasource="#Application.Datasource#">
					SELECT i.*
					FROM images i
					WHERE IMAGE_ID = #ImageID#
				</cfquery>
				
				<cfquery name="GetSections" datasource="#Application.Datasource#">
					SELECT SECTION_ID
					FROM image_section_lookup
					WHERE IMAGE_ID = #ImageID#
				</cfquery>
				<cfset SectionList = ValueList(GetSections.SECTION_ID)>
			
			</cfif>
			
			<table cellpadding="0" cellspacing="0" width="550" border="0">
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="25"></td>
				<td><img src="../images/dotpix.gif" height="1" width="25"></td>
				<td><img src="../images/dotpix.gif" height="1" width="75"></td>
				<td><img src="../images/dotpix.gif" height="1" width="375"></td>
				<td><img src="../images/dotpix.gif" height="1" width="25"></td>
				<td><img src="../images/dotpix.gif" height="1" width="25"></td>
			</tr>
			<tr bgcolor="##999999">
				<td><img src="../images/dotpix.gif" height="25" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td class="txt_columns">FIELD</td>
				<td class="txt_columns">DATA</td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>	
			<form action="video_uploads_edit.cfm" method="post" enctype="multipart/form-data">
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>NAME</td>
				<td><input name="IMAGE_NAME" value="#GetData.IMAGE_NAME#" type="text" size="25" class="Form"></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"IMAGE_NAME")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>SUMMARY</td>
				<td><textarea name="SUMMARY" cols="40" rows="5">#GetData.SUMMARY#</textarea></td>
				<td><img src="../images/dotpix.gif" height="95" width="1"></td>
				<td><cfif ListFind(MustList,"SUMMARY")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>COUNTRY</td>
				<td>
				<cfquery name="GetCountries" datasource="#Application.Datasource#">
					SELECT COUNTRY_ID, COUNTRY
					FROM countries
					WHERE status_id = 1
					ORDER BY COUNTRY
				</cfquery>				
				<select name="COUNTRY_ID">
					<option value="0">NO COUNTRY</option>
					<cfloop query="GetCountries">
					<option value="#COUNTRY_ID#" <cfif GetData.COUNTRY_ID EQ COUNTRY_ID>SELECTED</cfif>>#COUNTRY#</option>
					</cfloop>
				</select>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"COUNTRY_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">SECTION</td>
				<td>
					<cfquery name="GetSections" datasource="#Application.Datasource#">
						SELECT SECTION_ID, SECTION
						FROM sections
						ORDER BY SECTION_ID
					</cfquery>
					
					<cfset Toggle = 1>
					<table border="0" cellpadding="0" cellspacing="2">
					<cfloop query="GetSections">
						<cfif Toggle EQ 1>
							<tr>
						</cfif>						
					  	<td><input name="SectionList" type="checkbox" value="#SECTION_ID#" <cfif ListFind(SectionList,SECTION_ID)>checked</cfif>> #SECTION# </td>
					  	<cfif Toggle EQ 3>			
							</tr>
							<cfset Toggle = 1>			
						<cfelse>
							<cfset Toggle = Toggle + 1>
						</cfif>
					</cfloop>						
					</table>					
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"IMAGE_TYPE_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<!--- 
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td class="txt">IMAGE TYPE</td>
				<td>
					<cfquery name="GetImageTypes" datasource="#Application.Datasource#">
						SELECT IMAGE_TYPE_ID, IMAGE_TYPE
						FROM image_types
						ORDER BY IMAGE_TYPE_ID
					</cfquery>
					
					<cfif NOT len(trim(GetData.IMAGE_TYPE_ID))><cfset GetData.IMAGE_TYPE_ID = 1></cfif>
					<table border="0" cellpadding="0" cellspacing="2">
						<tr>
						<cfloop query="GetImageTypes">
					  		<td><input name="IMAGE_TYPE_ID" type="radio" value="#IMAGE_TYPE_ID#" <cfif IMAGE_TYPE_ID EQ GetData.IMAGE_TYPE_ID>checked</cfif>> #IMAGE_TYPE# </td>
					  	</cfloop>	
						</tr>
					</table>					
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"IMAGE_TYPE_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>	 			
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>GALLERY</td>
				<td><input name="GALLERY" type="checkbox" value="1" <cfif GetData.GALLERY EQ 1>checked</cfif>></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"GALLERY")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>--->
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>FRONT</td>
				<td><input name="FRONT_PAGE" type="checkbox" value="1" <cfif GetData.FRONT_PAGE EQ 1>checked</cfif>></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"FRONT_PAGE")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>
			<cfif isDefined("ImageID")>
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>IMAGE</td>
				<td><img src="#Application.Home#uploads/images/#GetData.FILE_NAME#" border="0" alt=" #GetData.FILE_NAME# "></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
			</tr>
			<cfelse>
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>THUMB</td>
				<td><input type="File" name="FILE_NAME" size="30" class=""></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"FILE_NAME")>*</cfif></td>
			</tr>			
			</cfif>
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>BIG FILE</td>
				<td><input name="BIG_FILE_NAME" value="#GetData.BIG_FILE_NAME#" type="text" size="25" class="Form"></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"BIG_FILE_NAME")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>	
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>DATE</td>
				<td><input name="DATE_DISPLAY" value="<cfif NOT len(trim(GetData.DATE_DISPLAY))>#DateFormat(Now(),"dd mmm yyyy")#<cfelse>#DateFormat(GetData.DATE_DISPLAY,"dd mmm yyyy")#</cfif>" type="text" size="25" class="Form"></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"DATE_DISPLAY")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>STATUS</td>
				<td>
				<cfquery name="GetStatuses" datasource="#Application.Datasource#">
					SELECT STATUS_ID, STATUS
					FROM statuses
				</cfquery>				
				<select name="STATUS_ID">
					<option value="0">PLEASE SELECT</option>
					<cfloop query="GetStatuses">
					<option value="#STATUS_ID#" <cfif GetData.STATUS_ID EQ STATUS_ID>SELECTED</cfif>>#STATUS#</option>
					</cfloop>
				</select>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"STATUS_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td></td>
				<td>
				
					<table cellpadding="0" cellspacing="3" border="0">					
					<tr>
					<cfif isDefined("ImageID")>
						<td>
						<input type="hidden" name="ImageID" value="#ImageID#">
						<input type="hidden" name="ModuleID" value="#ModuleID#">
						<input type="hidden" name="Action" value="Update">
						<input value="UPDATE" type="submit" class="SubmitButton">													
						</td>
						</form>
						<form action="?" method="post">
						<td>
						<input type="hidden" name="ImageID" value="#ImageID#">
						<input type="hidden" name="ModuleID" value="#ModuleID#">
						<input type="hidden" name="Action" value="Delete">
						<input value="DELETE" type="submit" class="SubmitButton">						
						</td>
						</form>
						<form action="?" method="post">
						<td>
						<input type="hidden" name="ModuleID" value="#ModuleID#">
						<input value="ADD" type="submit" class="SubmitButton">						
						</td>
						</form>
					<cfelse>
						<td>
						<input type="hidden" name="ModuleID" value="#ModuleID#">
						<input type="hidden" name="Action" value="Create">
						<input value="CREATE" type="submit" class="SubmitButton">
												
						</td>
						</form>
					</cfif>						
					</tr>										
					</table>
				
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>				
			</table>
				
		</td>
  	</tr>
	<tr>
		<td bgcolor="##8080C0"><img src="../images/dotpix.gif" height="1" width="175"></td>
		<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="20" width="25"></td>
		<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>

<cfinclude template="../footer.cfm">	 

</body>	
</cfoutput>
</html>
