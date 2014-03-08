<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfinclude template="includes/loggedin.cfm">

<cfparam name="Message" default="">
<cfparam name="ModuleID" default="">
<cfparam name="ErrorList" default="">
<cfparam name="VISITS" default="0">
<cfparam name="STATUS_ID" default="0">

<cfset MustList="COUNTRY,CONTINENT_ID,DATE_CREATED,STATUS_ID">
<cfset FieldList="COUNTRY,CONTINENT_ID,SUMMARY,CONTENT,VISITS,THUMB_ID,STATUS_ID">

<cfset GetData = QueryNew("#FieldList#")>

<cfif isDefined("Action")>
	
	<cfif CompareNoCase(Action,"Delete")>

		<!--- Preserve state / Validate Module 
		<cfmodule template="cfmodules/validate.cfm" 
					FieldList = "#FieldList#"
					MustList = "#MustList#">--->
						
		<cfif NOT len(trim(ErrorList))>

			<cfswitch expression="#Action#">	
				<cfcase value="Create">

					<cfquery name="Create" datasource="#Application.Datasource#">
						INSERT INTO countries(#FieldList#,DATE_EDITED,DATE_CREATED)							
						VALUES('#COUNTRY#','#CONTINENT_ID#','#SUMMARY#','#CONTENT#',#VISITS#,'#THUMB_ID#',#STATUS_ID#,#CreateODBCDate(Now())#,#CreateODBCDate(Now())#)
					</cfquery>
					<cfquery name="GetLatestID" datasource="#Application.Datasource#">
						SELECT MAX(COUNTRY_ID) AS CountryID							
						FROM countries
					</cfquery>
					<cfset CountryID = GetLatestID.CountryID>							
					<cfset Message = "The record has been created">
				
				</cfcase>
				<cfcase value="Update">
					<cfquery name="Update" datasource="#Application.Datasource#">
						UPDATE countries
						SET COUNTRY = '#COUNTRY#',
						    CONTINENT_ID = '#CONTINENT_ID#',
						    SUMMARY = '#SUMMARY#',
						    CONTENT = '#CONTENT#',
						    VISITS = '#VISITS#',
						    THUMB_ID = #THUMB_ID#,
						    DATE_EDITED = #CreateODBCDate(Now())#,
							STATUS_ID = #STATUS_ID#
						WHERE COUNTRY_ID = #CountryID#
					</cfquery>
					<cfset Message = "The record has been updated">			
				
				</cfcase>			
			</cfswitch>
		<cfelse>
			<cfset Message = "You must complete all the highlighted fields">
		</cfif>		
		
	<cfelse>
	
		<cfset Message = "The records have been deleted">
	
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
		<td bgcolor="##EAEAEA"><span class="txt_header">Country</span> <cfif len(trim(Message))><span class="txt_message"> - #Message#</span></cfif></td>
	</tr>
  	<tr>
    	<td bgcolor="##8080C0" valign="top">
		
			<cfinclude template="includes/navigation.cfm">		
		
		</td>
    	<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="1" width="1"></td>
    	<td bgcolor="##EAEAEA" class="txt" valign="top">
		
			<cfif isDefined("CountryID")>
		
				<cfquery name="GetData" datasource="#Application.Datasource#">
					SELECT c.COUNTRY_ID, c.COUNTRY, c.SUMMARY, c.CONTENT, c.CONTINENT_ID, c.THUMB_ID, c.VISITS, c.DATE_CREATED, c.STATUS_ID
					FROM countries c
					WHERE COUNTRY_ID = #CountryID#
				</cfquery>
			
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
			<form action="country_edit.cfm" method="post">
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>COUNTRY</td>
				<td><input name="COUNTRY" value="#GetData.COUNTRY#" type="text" size="50" class="Form"></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"COUNTRY")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>SUMMARY</td>
				<td><textarea name="SUMMARY" cols="40" rows="5">#GetData.SUMMARY#</textarea></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"SUMMARY")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>CONTENT</td>
				<td>
				<!--- Call AE4 cfc --->
		  		<cfset FieldName = "CONTENT">
				<!--- 
				<cfinvoke component="#Application.CompsPath#/AE4" method="GUI" returnvariable="FieldName" 
							FieldName="#FieldName#"
							FieldData="#Evaluate('GetData.' & FieldName)#"
							ImageURL="#Application.Home#uploads/images,#ModuleID#"
							ImagePath="#ExpandPath('../uploads/images/')#"
							BaseURL="#Application.Home#"
							StyleSheet="#Application.Home#admin/css/cms.css"
							Height="500">		
				--->	
				<textarea name="CONTENT" cols="40" rows="10">#GetData.CONTENT#</textarea> 
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"CONTENT")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>CONTINENT</td>
				<td>
				<cfquery name="GetContinents" datasource="#Application.Datasource#">
					SELECT CONTINENT_ID, CONTINENT
					FROM continents
					ORDER BY CONTINENT
				</cfquery>				
				<select name="CONTINENT_ID">
					<option value="0">NO CONTINENT</option>
					<cfloop query="GetContinents">
					<option value="#CONTINENT_ID#" <cfif GetData.CONTINENT_ID EQ CONTINENT_ID>SELECTED</cfif>>#CONTINENT#</option>
					</cfloop>
				</select>
				
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"CONTINENT_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>				
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>THUMB</td>
				<td>
				<cfquery name="GetImages" datasource="#Application.Datasource#">
					SELECT IMAGE_ID, IMAGE_NAME, FILE_NAME
					FROM images
					WHERE IMAGE_TYPE_ID = 4
					AND STATUS_ID = 1
					ORDER BY IMAGE_NAME
				</cfquery>				
				<select name="THUMB_ID">
					<option value="0">NO IMAGE</option>
					<cfloop query="GetImages">
					<option value="#IMAGE_ID#" <cfif GetData.THUMB_ID EQ IMAGE_ID>SELECTED</cfif>>#IMAGE_NAME# - [#FILE_NAME#]</option>
					</cfloop>
				</select>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"THUMB_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>VISITS</td>
				<td>				
				<select name="VISITS">
					<cfloop from="1" to="15" index="x">
					<option value="#x#" <cfif GetData.VISITS EQ x>SELECTED</cfif>>#x#</option>
					</cfloop>
				</select>				
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"VISITS")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>DATE</td>
				<td><input name="DATE_CREATED" value="<cfif NOT isDefined("GetData.DATE_CREATED")>#DateFormat(Now(),"dd mmm yyyy")#<cfelse>#DateFormat(GetData.DATE_CREATED,"dd mmm yyyy")#</cfif>" type="text" size="25" class="Form"></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"DATE_CREATED")>*</cfif></td>
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
				<cfif isDefined("CountryID")>
					<input type="hidden" name="CountryID" value="#CountryID#">
					<input type="hidden" name="ModuleID" value="#ModuleID#">
					<input type="hidden" name="Action" value="Update">
					<input value="UPDATE" type="submit" class="SubmitButton">
				<cfelse>
					<input type="hidden" name="ModuleID" value="#ModuleID#">
					<input type="hidden" name="Action" value="Create">
					<input value="CREATE" type="submit" class="SubmitButton">
				</cfif>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>
			</form>	
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
