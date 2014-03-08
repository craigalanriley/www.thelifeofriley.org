<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfinclude template="includes/loggedin.cfm">

<cfparam name="Message" default="">
<cfparam name="SUMMARY" default="">
<cfparam name="ModuleID" default="">
<cfparam name="ErrorList" default="">
<cfparam name="ImageList" default="">
<cfparam name="CategoryList" default="">
<cfparam name="TechList" default="">
<cfparam name="FRONT_PAGE" default="0">
<cfparam name="STATUS_ID" default="0">
<cfparam name="COUNTRY_ID" default="0">
<cfparam name="EMPLOYER_ID" default="0">

<cfset MustList="TITLE,SUMMARY,WEB,DATE_DISPLAY,STATUS_ID">
<cfset FieldList="TITLE,SUMMARY,CONTENT,WEB,COUNTRY_ID,EMPLOYER_ID,FRONT_PAGE,THUMB_ID,SECTION_ID,DATE_DISPLAY,STATUS_ID">
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
						INSERT INTO articles(MODULE_ID,#FieldList#,DATE_EDITED,DATE_CREATED)							
						VALUES(#ModuleID#,'#TITLE#','#SUMMARY#','#CONTENT#','#WEB#',#COUNTRY_ID#,#EMPLOYER_ID#,'#FRONT_PAGE#','#THUMB_ID#',3,#CreateODBCDateTime(DATE_DISPLAY)#,#STATUS_ID#,#CreateODBCDateTime(Now())#,#CreateODBCDateTime(Now())#)
					</cfquery>
					<cfquery name="GetLatestID" datasource="#Application.Datasource#">
						SELECT MAX(ARTICLE_ID) AS ArticleID							
						FROM articles
					</cfquery>
					<cfset ArticleID = GetLatestID.ArticleID>	
									
					<cfloop list="#CategoryList#" index="c">
						<cfquery name="InsertCategories" datasource="#Application.Datasource#">
							INSERT INTO article_category_lookup(ARTICLE_ID,CATEGORY_ID)
							VALUES(#ArticleID#,#c#)
						</cfquery>					
					</cfloop>			
									
					<cfloop list="#ImageList#" index="i">
						<cfquery name="InsertImages" datasource="#Application.Datasource#">
							INSERT INTO article_image_lookup(ARTICLE_ID,IMAGE_ID)
							VALUES(#ArticleID#,#i#)
						</cfquery>					
					</cfloop>																			
									
					<cfloop list="#TechList#" index="w">
						<cfquery name="InsertWebTechs" datasource="#Application.Datasource#">
							INSERT INTO article_webtech_lookup(ARTICLE_ID,TECH_ID)
							VALUES(#ArticleID#,#w#)
						</cfquery>					
					</cfloop>							
																	
					<cfset Message = "The record has been created">
				
				</cfcase>
				<cfcase value="Update">
					
					<cftransaction>
					<!--- Update Article Data --->
					<cfquery name="Update" datasource="#Application.Datasource#">
						UPDATE articles
						SET TITLE = '#TITLE#',
						    SUMMARY = '#SUMMARY#',
						    CONTENT = '#CONTENT#',
						    WEB = '#WEB#',
						    COUNTRY_ID = '#COUNTRY_ID#',
						    EMPLOYER_ID = '#EMPLOYER_ID#',
						    FRONT_PAGE = #FRONT_PAGE#,
						    THUMB_ID = '#THUMB_ID#',
						    DATE_DISPLAY = #CreateODBCDateTime(DATE_DISPLAY)#,
						    DATE_EDITED = #CreateODBCDateTime(now())#,
							STATUS_ID = #STATUS_ID#
						WHERE ARTICLE_ID = #ArticleID#
					</cfquery>
					<!--- Update Categories --->
					<cfquery name="DeleteOldCategories" datasource="#Application.Datasource#">
						DELETE FROM article_category_lookup
						WHERE ARTICLE_ID IN(#ArticleID#)
					</cfquery>					
					<cfloop list="#CategoryList#" index="c">
						<cfquery name="InsertCategories" datasource="#Application.Datasource#">
							INSERT INTO article_category_lookup(ARTICLE_ID,CATEGORY_ID)
							VALUES(#ArticleID#,#c#)
						</cfquery>					
					</cfloop>		
							
					<!--- Update Images --->
					<cfquery name="DeleteOldImages" datasource="#Application.Datasource#">
						DELETE FROM article_image_lookup
						WHERE ARTICLE_ID IN(#ArticleID#)
					</cfquery>					
					<cfloop list="#ImageList#" index="i">
						<cfquery name="InsertImages" datasource="#Application.Datasource#">
							INSERT INTO article_image_lookup(ARTICLE_ID,IMAGE_ID)
							VALUES(#ArticleID#,#i#)
						</cfquery>					
					</cfloop>																		
									
					<!--- Update WebTechs --->
					<cfquery name="DeleteOldWebTechs" datasource="#Application.Datasource#">
						DELETE FROM article_webtech_lookup
						WHERE ARTICLE_ID IN(#ArticleID#)
					</cfquery>	
					<cfloop list="#TechList#" index="w">
						<cfquery name="InsertWebTechs" datasource="#Application.Datasource#">
							INSERT INTO article_webtech_lookup(ARTICLE_ID,TECH_ID)
							VALUES(#ArticleID#,#w#)
						</cfquery>					
					</cfloop>	
					
					<cfset Message = "The record has been updated">			
				
					</cftransaction>
					
				</cfcase>			
			</cfswitch>
		<cfelse>
			<cfset Message = "You must complete all the highlighted fields">
		</cfif>		
		
	<cfelse>
	
		<!--- Delete Articles --->
		<cfquery name="DeleteArticle" datasource="#Application.Datasource#">
			DELETE FROM articles
			WHERE ARTICLE_ID IN(#ArticleID#)
		</cfquery>		

		<!--- Delete Categories --->
		<cfquery name="DeleteOldCategories" datasource="#Application.Datasource#">
			DELETE FROM article_category_lookup
			WHERE ARTICLE_ID IN(#ArticleID#)
		</cfquery>			
																
		<!--- Delete Images --->
		<cfquery name="DeleteOldImages" datasource="#Application.Datasource#">
			DELETE FROM article_image_lookup
			WHERE ARTICLE_ID IN(#ArticleID#)
		</cfquery>				
									
		<!--- Delete WebTechs --->
		<cfquery name="DeleteOldWebTechs" datasource="#Application.Datasource#">
			DELETE FROM article_webtech_lookup
			WHERE ARTICLE_ID IN(#ArticleID#)
		</cfquery>	
					
		<!--- Delete Categories --->
		<cfquery name="DeleteOldCategories" datasource="#Application.Datasource#">
			DELETE FROM article_category_lookup
			WHERE ARTICLE_ID IN(#ArticleID#)
		</cfquery>		
	
		<cfset Message = "The records have been deleted">
	
	</cfif>

</cfif>

<html>
<cfoutput>
<head>
	<title>The Life of Riley - Xroom</title>
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
		<td bgcolor="##EAEAEA"><span class="txt_header">Web Portfolio</span> <cfif len(trim(Message))><span class="txt_message"> - #Message#</span></cfif></td>
	</tr>
  	<tr>
    	<td bgcolor="##8080C0" valign="top">
		
			<cfinclude template="includes/navigation.cfm">		
		
		</td>
    	<td bgcolor="##EAEAEA"><img src="../images/dotpix.gif" height="1" width="1"></td>
    	<td bgcolor="##EAEAEA" class="txt" valign="top">
		
			<cfif isDefined("ArticleID")>
		
				<cfquery name="GetData" datasource="#Application.Datasource#">
					SELECT a.ARTICLE_ID, a.TITLE, a.SUMMARY, a.WEB, a.CONTENT, a.LOCATION, a.COUNTRY_ID, a.EMPLOYER_ID, a.DATE_DISPLAY, a.FRONT_PAGE, a.VENUE, a.THUMB_ID, a.SECTION_ID, a.STATUS_ID
					FROM articles a
					WHERE ARTICLE_ID = #ArticleID#
				</cfquery>
				
				<cfquery name="GetImages" datasource="#Application.Datasource#">
					SELECT IMAGE_ID
					FROM article_image_lookup
					WHERE ARTICLE_ID = #ArticleID#
				</cfquery>
				<cfset ImageList = ValueList(GetImages.IMAGE_ID)>
				
				<cfquery name="GetCategories" datasource="#Application.Datasource#">
					SELECT CATEGORY_ID
					FROM article_category_lookup
					WHERE ARTICLE_ID = #ArticleID#
				</cfquery>
				<cfset CategoryList = ValueList(GetCategories.CATEGORY_ID)>				
				
				<cfquery name="GetWebTechs" datasource="#Application.Datasource#">
					SELECT TECH_ID
					FROM article_webtech_lookup
					WHERE ARTICLE_ID = #ArticleID#
				</cfquery>	
				<cfset TechList = ValueList(GetWebTechs.TECH_ID)>
			
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
			<form action="portfolio_edit.cfm" method="post">
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>TITLE</td>
				<td><input name="TITLE" value="#GetData.TITLE#" type="text" size="50" class="Form"></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"TITLE")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<!--- <tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>SUMMARY</td>
				<td><textarea name="SUMMARY" cols="40" rows="5">#GetData.SUMMARY#</textarea></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"SUMMARY")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>	 --->
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>CONTENT</td>
				<td>												
				<!--- Call AE4 cfc --->
		  		<cfset FieldName = "CONTENT">
				<cfinvoke component="#Application.CompsPath#/AE4" method="GUI" returnvariable="FieldName" 
							FieldName="#FieldName#"
							FieldData="#Evaluate('GetData.' & FieldName)#"
							ImageURL="#Application.Home#uploads/images,#ModuleID#"
							ImagePath="#ExpandPath('../uploads/images/')#"
							BaseURL="#Application.Home#"
							StyleSheet="#Application.Home#admin/css/cms.css"
							Height="500">							
				<!--- <textarea name="CONTENT" cols="40" rows="10">#GetData.CONTENT#</textarea> --->
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"CONTENT")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>
			<!--- <tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>LOCATION</td>
				<td><input name="LOCATION" value="#GetData.LOCATION#" type="text" size="40" class="Form"></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"LOCATION")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>	 --->	
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>WEB</td>
				<td><input name="WEB" value="#GetData.WEB#" type="text" size="40" class="Form"></td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"WEB")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>	<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>EMPLOYER</td>
				<td>
				<cfquery name="GetEmployers" datasource="#Application.Datasource#">
					SELECT EMPLOYER_ID, EMPLOYER
					FROM employers
					ORDER BY EMPLOYER_ID
				</cfquery>				
				<select name="EMPLOYER_ID">
					<option value="0">PLEASE SELECT</option>
					<cfloop query="GetEmployers">
					<option value="#EMPLOYER_ID#" <cfif GetData.EMPLOYER_ID EQ EMPLOYER_ID>SELECTED</cfif>>#EMPLOYER#</option>
					</cfloop>
				</select>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"EMPLOYER_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>
			<!--- <tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>COUNTRY</td>
				<td>
				<cfquery name="GetCountries" datasource="#Application.Datasource#">
					SELECT COUNTRY_ID, COUNTRY
					FROM countries
					ORDER BY COUNTRY
				</cfquery>				
				<select name="COUNTRY_ID">
					<option value="0">PLEASE SELECT</option>
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
				<td>SECTION</td>
				<td>
				<cfquery name="GetSections" datasource="#Application.Datasource#">
					SELECT SECTION_ID, SECTION
					FROM sections
				</cfquery>				
				<select name="SECTION_ID">
					<option value="0">PLEASE SELECT</option>
					<cfloop query="GetSections">
					<option value="#SECTION_ID#" <cfif GetData.SECTION_ID EQ SECTION_ID>SELECTED</cfif>>#SECTION#</option>
					</cfloop>
				</select>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"SECTION_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		 
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>CATEGORY</td>
				<td>
				<cfquery name="GetCategories" datasource="#Application.Datasource#">
					SELECT CATEGORY_ID, CATEGORY
					FROM categories
					WHERE TOP_10 = 0
					ORDER BY CATEGORY
				</cfquery>				
				<select name="CategoryList" size="5" multiple>
					<cfloop query="GetCategories">
					<option value="#CATEGORY_ID#" <cfif ListFind(CategoryList,CATEGORY_ID)>SELECTED</cfif>>#CATEGORY#</option>
					</cfloop>
				</select>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"CATEGORY_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		--->
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>THUMB</td>
				<td>
				<cfquery name="GetThumbs" datasource="#Application.Datasource#">
					SELECT IMAGE_ID, IMAGE_NAME, FILE_NAME
					FROM images
					WHERE IMAGE_TYPE_ID = 5
					AND STATUS_ID = 1
					ORDER BY IMAGE_NAME
				</cfquery>				
				<select name="THUMB_ID">
					<option value="0">NO IMAGE</option>
					<cfloop query="GetThumbs">
					<option value="#IMAGE_ID#" <cfif GetData.THUMB_ID EQ IMAGE_ID>SELECTED</cfif>>#IMAGE_NAME# - [#FILE_NAME#]</option>
					</cfloop>
				</select>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"IMAGE_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>			
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>IMAGES</td>
				<td>
				<cfquery name="GetImages" datasource="#Application.Datasource#">
					SELECT IMAGE_ID, IMAGE_NAME, FILE_NAME
					FROM images
					WHERE IMAGE_TYPE_ID = 2
					AND STATUS_ID = 1
					ORDER BY IMAGE_NAME
				</cfquery>				
				<select name="ImageList" size="5" multiple>
					<cfloop query="GetImages">
					<option value="#IMAGE_ID#"  <cfif ListFind(ImageList,IMAGE_ID)>SELECTED</cfif>>#IMAGE_NAME# - [#FILE_NAME#]</option>
					</cfloop>
				</select>
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"IMAGE_ID")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
			<tr>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td><img src="../images/dotpix.gif" height="1" width="1"></td>
				<td>TECHS</td>
				<td>
					<cfquery name="GetWebTechs" datasource="#Application.Datasource#">
						SELECT TECH_ID, TECH_NAME
						FROM web_techs
						ORDER BY ORDER_BY
					</cfquery>		
					<table border="0" cellpadding="0" cellspacing="5">
					<cfset t = 0>
					<cfloop query="GetWebTechs">
						<cfif NOT t><tr></cfif>
							<td><input name="TechList" type="checkbox" value="#TECH_ID#" <cfif ListFind(TechList,TECH_ID)>checked</cfif>> #TECH_NAME#</td>
						<cfif t EQ 1></tr><cfset t = 0><cfelse><cfset t = t + 1></cfif>
					</cfloop>	
					</table>
				
				</td>
				<td><img src="../images/dotpix.gif" height="30" width="1"></td>
				<td><cfif ListFind(MustList,"WEB_TECHS")>*</cfif></td>
			</tr>
			<tr>
				<td colspan="6" bgcolor="##FFFFFF"><img src="../images/dotpix.gif" height="2" width="1"></td>
			</tr>		
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
				
					<table cellpadding="2" cellspacing="0" border="0">
					<tr>
						<cfif isDefined("ArticleID")>
							<td>
							<input type="hidden" name="ArticleID" value="#ArticleID#">
							<input type="hidden" name="ModuleID" value="#ModuleID#">
							<input type="hidden" name="Action" value="Update">
							<input value="UPDATE" type="submit" class="SubmitButton">							
							</td>
							</form>
							<form action="portfolio_edit.cfm" method="post">	
							<td>					
							<input type="hidden" name="ArticleID" value="#ArticleID#">
							<input type="hidden" name="ModuleID" value="#ModuleID#">
							<input type="hidden" name="Action" value="Delete">
							<input value="DELETE" type="submit" class="SubmitButton">	
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
						<form action="portfolio_edit.cfm" method="post">	
						<td>
						<input value="ADD" type="submit" class="SubmitButton">										
						</td>
						</form>	
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
