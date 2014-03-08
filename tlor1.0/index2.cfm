<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>The Life of Riley</title>
	<style type="text/css">
    <!--
    body {
        font: 100% Verdana, Arial, Helvetica, sans-serif;
        font-size:12px;
        background: #fff;
        margin: 0; /* it's good practice to zero the margin and padding of the body element to account for differing browser defaults */
        padding: 0;
        text-align: center; /* this centers the container in IE 5* browsers. The text is then set to the left aligned default in the #container selector */
        color: #000000;
    }
    .oneColFixCtrHdr #container {
        width: 750px;  /* using 20px less than a full 800px width allows for browser chrome and avoids a horizontal scroll bar */
        background: #FFFFFF;
        margin: 0 auto; /* the auto margins (in conjunction with a width) center the page */
        text-align: left; /* this overrides the text-align: center on the body element. */
    }
    .oneColFixCtrHdr #header {
        background: #DDDDDD; 
    }
    .oneColFixCtrHdr #header h1 {
        margin: 0; /* zeroing the margin of the last element in the #header div will avoid margin collapse - an unexplainable space between divs. If the div has a border around it, this is not necessary as that also avoids the margin collapse */
    }
    .oneColFixCtrHdr #mainContent {
        padding: 0 0px; /* remember that padding is the space inside the div box and margin is the space outside the div box */
        background: #FFFFFF;
    }
    .oneColFixCtrHdr #footer {
        padding: 10px 0px; /* this padding matches the left alignment of the elements in the divs that appear above it. */
        margin-bottom:10px;
        background:#CCCCCC;
    }
    .oneColFixCtrHdr #footer p {
        margin: 0; /* zeroing the margins of the first element in the footer will avoid the possibility of margin collapse - a space between divs */
        padding: 10px 0; /* padding on this element will create space, just as the the margin would have, without the margin collapse issue */
    }
    .box_headlines{
        background-color:#0000CC;
        width:370px;
        height:170px;
        margin-bottom:10px;
        }
    
    -->
    </style>

	<link rel=stylesheet type="text/css" href="stylesheets/riley.css">
	<script language="javascript" src="javascripts/rollover.js"></script>	
</head>

<body class="oneColFixCtrHdr">

<div id="container">
  <div id="header" style="border-bottom:solid 25px #222">
  	<img src="flash/header/images/brazil_rio3.jpg" alt="Header" />
  </div>
  
  <div id="mainContent">
    <h1> Main Content </h1>
    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent aliquam,  justo convallis luctus rutrum, erat nulla fermentum diam, at nonummy quam  ante ac quam. Maecenas urna purus, fermentum id, molestie in, commodo  porttitor, felis. Nam blandit quam ut lacus. Quisque ornare risus quis  ligula. Phasellus tristique purus a augue condimentum adipiscing. Aenean  sagittis. Etiam leo pede, rhoncus venenatis, tristique in, vulputate at,  odio. Donec et ipsum et sapien vehicula nonummy. Suspendisse potenti. Fusce  varius urna id quam. Sed neque mi, varius eget, tincidunt nec, suscipit id,  libero. In eget purus. Vestibulum ut nisl. Donec eu mi sed turpis feugiat  feugiat. Integer turpis arcu, pellentesque eget, cursus et, fermentum ut,  sapien. Fusce metus mi, eleifend sollicitudin, molestie id, varius et, nibh.  Donec nec libero.</p>
   
	<cfquery name="GetWeb" datasource="#Application.Datasource#" maxrows="3">
        SELECT a.ARTICLE_ID, a.SECTION_ID, a.TITLE, a.SUMMARY, a.CONTENT, a.ENTRANTS, a.RESULT, a.PRIZE, a.HIGH_RUN, a.DATE_DISPLAY, 
               i.FILE_NAME, i.IMAGE_NAME,
               sec.SECTION, sec.SECTION_PATH
        FROM sections s, modules m, articles a			
        LEFT OUTER JOIN images i ON a.THUMB_ID = i.IMAGE_ID
        LEFT OUTER JOIN sections sec ON a.SECTION_ID = sec.SECTION_ID
        WHERE a.STATUS_ID = 1
            AND a.FRONT_PAGE = 1
            AND a.SECTION_ID = s.SECTION_ID
            AND s.SECTION = 'EMPLOYMENT'
            AND a.MODULE_ID = m.MODULE_ID
            AND m.MODULE = 'News & Events'
        ORDER BY DATE_DISPLAY DESC
    </cfquery>		
	<div class="box_headlines" style="float:right; background-color:#8080DA">
    	<img src="images/home/header_web.gif" />
        <cfoutput><img src="uploads/images/#GetWeb.FILE_NAME[1]#" alt="#GetWeb.IMAGE_NAME[1]#" style="padding:5px; float:left" /></cfoutput>
        <div style="margin-left:110px; padding:5px; color:#FFFFFF">
        	<div style="height:100px;">
			<cfoutput>
            <a href="##" style="text-decoration:none; font-weight:bold">#GetWeb.TITLE[1]#</a><br />
			#GetWeb.SUMMARY[1]#
            </div>
            <cfloop query="GetWeb" startrow="2">
            	<a href="##" style="text-decoration:none;"><cfif len(TITLE) GT 35>#left(TITLE,35)#...<cfelse>#TITLE#</cfif></a><br />
            </cfloop>
			</cfoutput>
        </div>
    </div>		
    
    <cfquery name="GetRiley" datasource="#Application.Datasource#" maxrows="3">
        SELECT a.ARTICLE_ID, a.SECTION_ID, a.TITLE, a.SUMMARY, a.CONTENT, a.ENTRANTS, a.RESULT, a.PRIZE, a.HIGH_RUN, a.DATE_DISPLAY, 
               i.FILE_NAME, i.IMAGE_NAME,
               sec.SECTION, sec.SECTION_PATH
        FROM sections s, modules m, articles a			
        LEFT OUTER JOIN images i ON a.THUMB_ID = i.IMAGE_ID
        LEFT OUTER JOIN sections sec ON a.SECTION_ID = sec.SECTION_ID
        WHERE a.STATUS_ID = 1
            AND a.FRONT_PAGE = 1
            AND a.SECTION_ID = s.SECTION_ID
            AND s.SECTION IN ('RILEY','EDUCATION')
            AND a.MODULE_ID = m.MODULE_ID
            AND m.MODULE = 'News & Events'
        ORDER BY DATE_DISPLAY DESC
    </cfquery>	
    <div class="box_headlines" style="background-color:#EE8C8C">
    	<img src="images/home/header_riley.gif" />
        <cfoutput><img src="uploads/images/#GetRiley.FILE_NAME[1]#" alt="#GetRiley.IMAGE_NAME[1]#" style="padding:5px; float:left" /></cfoutput>
        <div style="margin-left:110px; padding:5px; color:#FFFFFF">
        	<div style="height:100px;">
			<cfoutput>
            <a href="##" style="text-decoration:none; font-weight:bold">#GetRiley.TITLE[1]#</a><br />
			#GetRiley.SUMMARY[1]#
            </div>
            <cfloop query="GetRiley" startrow="2">
            	<a href="##" style="text-decoration:none;"><cfif len(TITLE) GT 35>#left(TITLE,35)#...<cfelse>#TITLE#</cfif></a><br />
            </cfloop>
			</cfoutput>
        </div>
    
    
    </div>
    
    
	<cfquery name="GetTravel" datasource="#Application.Datasource#" maxrows="3">
        SELECT a.ARTICLE_ID, a.SECTION_ID, a.TITLE, a.SUMMARY, a.CONTENT, a.ENTRANTS, a.RESULT, a.PRIZE, a.HIGH_RUN, a.DATE_DISPLAY, 
               i.FILE_NAME, i.IMAGE_NAME,
               sec.SECTION, sec.SECTION_PATH
        FROM sections s, modules m, articles a			
        LEFT OUTER JOIN images i ON a.THUMB_ID = i.IMAGE_ID
        LEFT OUTER JOIN sections sec ON a.SECTION_ID = sec.SECTION_ID
        WHERE a.STATUS_ID = 1
            AND a.SECTION_ID = s.SECTION_ID
            AND s.SECTION = 'TRAVEL'
            AND a.MODULE_ID = m.MODULE_ID
            AND m.MODULE = 'News & Events'
        ORDER BY DATE_DISPLAY DESC
    </cfquery>	    
	<div class="box_headlines" style="float:right; background-color:#C280C2">
    	<img src="images/home/header_travel.gif" />
        <cfoutput><img src="uploads/images/#GetTravel.FILE_NAME[1]#" alt="#GetTravel.IMAGE_NAME[1]#" style="padding:5px; float:left" /></cfoutput>
        <div style="margin-left:110px; padding:5px; color:#FFFFFF">
        	<div style="height:100px;">
			<cfoutput>
            <a href="##" style="text-decoration:none; font-weight:bold">#GetTravel.TITLE[1]#</a><br />
			#left(GetTravel.SUMMARY[1],200)#
            </div>
            <cfloop query="GetTravel" startrow="2">
            	<a href="##" style="text-decoration:none;"><cfif len(TITLE) GT 35>#left(TITLE,35)#...<cfelse>#TITLE#</cfif></a><br />
            </cfloop>
			</cfoutput>   
        </div>
    </div>
    
	<cfquery name="GetPool" datasource="#Application.Datasource#" maxrows="3">
        SELECT a.ARTICLE_ID, a.SECTION_ID, a.TITLE, a.SUMMARY, a.CONTENT, a.ENTRANTS, a.RESULT, a.PRIZE, a.HIGH_RUN, a.DATE_DISPLAY, 
               i.FILE_NAME, i.IMAGE_NAME,
               sec.SECTION, sec.SECTION_PATH
        FROM sections s, modules m, articles a			
        LEFT OUTER JOIN images i ON a.THUMB_ID = i.IMAGE_ID
        LEFT OUTER JOIN sections sec ON a.SECTION_ID = sec.SECTION_ID
        WHERE a.STATUS_ID = 1
            AND a.FRONT_PAGE = 1
            AND a.SECTION_ID = s.SECTION_ID
            AND s.SECTION = 'SPORT & LEISURE'
            AND a.MODULE_ID = m.MODULE_ID
            AND m.MODULE = 'News & Events'
        ORDER BY DATE_DISPLAY DESC
    </cfquery>	    
	<div class="box_headlines" style="background-color:#80C780">
    	<img src="images/home/header_pool.gif" />
        <cfoutput><img src="uploads/images/#GetPool.FILE_NAME[1]#" alt="#GetPool.IMAGE_NAME[1]#" style="padding:5px; float:left" /></cfoutput>
        <div style="margin-left:110px; padding:5px; color:#FFFFFF">
        	<div style="height:100px;">
			<cfoutput>
            <a href="##" style="text-decoration:none; font-weight:bold">#GetPool.TITLE[1]#</a><br />
			#left(GetPool.SUMMARY[1],100)#
            </div>
            <cfloop query="GetPool" startrow="2">
            	<a href="##" style="text-decoration:none;"><cfif len(TITLE) GT 35>#left(TITLE,35)#...<cfelse>#TITLE#</cfif></a><br />
            </cfloop>
			</cfoutput>   
        </div>    
    </div>
    
  </div>
  
  <div id="footer"></div>

</div>
</body>
</html>
