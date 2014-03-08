<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<cfparam name="FORM.myCountries" default="">
<cfset visitedList = "dk,ee">
<cfset bShowMap = 1>

<cfif NOT isDefined("COOKIE.Jmap")>
	<cfcookie name="Jmap" value="0" expires="never">1
</cfif>

<cfif ListLen(FORM.myCountries)>
	<cfcookie name="Jmap" value="#FORM.myCountries#" expires="never">
</cfif>

<cfscript>

	// All Countries
	arrCountries = EntityLoad("countries");

	// Debug
	writeDump(var=arrCountries, expand=false);

</cfscript>

<!---
<cfloop array="#arrCountries#" index="country">
    <cfoutput>#country.GETsCountry()#</cfoutput><br>
    <cfoutput>#country.GETsCountryCode()#</cfoutput><br>
</cfloop>
--->

<cfoutput>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 

	<script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.4.1-vsdoc.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>

    <script src="jquery.vector-map/world-en.js" type="text/javascript"></script>
    <link href="jquery.vector-map/jquery.vector-map.css" rel="stylesheet" type="text/css" />
    <script src="jquery.vector-map/jquery.vector-map.js" type="text/javascript"></script>
        
	<style type="text/css">
        .maps{
            height: 700px;
            width:1025px;
            cursor: url(openhand.cur), default;
            }

        .maps.grabbing{
            cursor: url(closedhand.cur), default;
            }

        .jvectormap-zoomin, 
        .jvectormap-zoomout{
            position: absolute;
            -moz-border-radius: 3px;
            border-radius:3px;
            background: ##292929;
            padding: 3px;
            margin-bottom: 30px;
            color: white;
            width: 18px;
            height: 18px;
            cursor: pointer;
            line-height: 18px;
            text-align: center;
            font-weight: bold;
            font-size: 23px;
            }

        .jvectormap-zoomin{
            left: 10px;
            top: 10px;
            }

        .jvectormap-zoomout{
            left: 10px;
            top: 40px;
            }
    </style>
    <title>jQuery Demo</title>
</head>
<body>
<cfif bShowMap>
	<div style="float:left">
        <form id="form1" runat="server">
        
            <!--- Map --->         
            <div id="map" class="maps"></div>
            
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script> 
            <script src="jquery.vector-map/jquery.vector-map.js"></script> 
            <script src="jquery.vector-map/world-en.js"></script>
            <script>
                $(function()
                    {
                    $('##map').vectorMap
                        ({ 
                        map: 'world_en', 
                        color: '##666',
                        hoverColor: false,
                        hoverOpacity: 0.5,
                        colors:
                            {
                            /*	
                            <cfloop array="#arrCountries#" index="country">
                                #country.GETsCountryCode()#:'##cc0000', 		// Visited Country	
                            </cfloop>
                            */
                            
                            <cfloop list="#COOKIE.Jmap#" index="myC">
                                #myC#:'##cc0000', 		// Visited Country
                            </cfloop>
                            
                            /* 
                            // Europe 
                            gb:'##cc0000', 		// United Kingdom	
                            dk:'##cc0000', 		// Denmark
                            gl:'##cc0000', 		// Greenland(Denmark)
                            ee:'##cc0000', 		// Estonia
                            pt:'##cc0000', 		// Portugal
                            es:'##cc0000', 		// Spain						
                            is:'##cc0000', 		// Iceland						
                            no:'##cc0000', 		// Norway
                            tr:'##cc0000', 		// Turkey					
                            ie:'##cc0000', 		// Ireland
                            fi:'##cc0000', 		// Finland						
                            lv:'##cc0000', 		// Latvia
                            lt:'##cc0000', 		// Lithuania						
                            by:'##cc0000', 		// Belarus
                            pl:'##cc0000', 		// Poland						
                            it:'##cc0000', 		// Italy
                            fr:'##cc0000', 		// France
                            nl:'##cc0000', 		// Netherlands
                            be:'##cc0000', 		// Belgium
                            de:'##cc0000', 		// Germany
                            ch:'##cc0000', 		// Switzerland
                            cz:'##cc0000', 		// Czech Republic				
                            at:'##cc0000', 		// Austria
                            hu:'##cc0000', 		// Hungary
                            si:'##cc0000', 		// Slovenia
                            sk:'##cc0000', 		// Slovakia		
                            hr:'##cc0000', 		// Croatia
                            ba:'##cc0000', 		// Bosnia and Herzegovina
                            ua:'##cc0000', 		// Ukraine
                            al:'##cc0000', 		// Albania
                            mk:'##cc0000', 		// Macedonia
                            gr:'##cc0000', 		// Greece
                            hr:'##cc0000', 		// Croatia
                            
                            // Middle East						
                            om:'##cc0000', 		// Oman
                            ae:'##cc0000', 		// United Arab Emirates
                            qa:'##cc0000', 		// Qatar
                            
                            
                            // Central Asia
                            in:'##cc0000', 		// India 
                            ru:'##cc0000', 		// Russia
                            mv:'##cc0000',		// Maldives
                            lk:'##cc0000',		// Sri Lanka
                            np:'##cc0000',		// Nepal
                            bt:'##cc0000',		// Bhutan	
                            bd:'##cc0000',		// Bangladesh
                            
                            // Oceana
                            au:'##cc0000', 		// Australia
                            nz:'##cc0000', 		// New Zealand
                                                    
                            // Asia
                            id:'##cc0000', 		// Indonesia
                            my:'##cc0000', 		// Malaysia
                            bn:'##cc0000', 		// Brunei
                            ph:'##cc0000', 		// Philippines
                            cn:'##cc0000', 		// China
                            tw:'##cc0000', 		// Taiwan
                            jp:'##cc0000', 		// Japan
                            kp:'##cc0000', 		// North Korea
                            kr:'##cc0000', 		// South Korea	
                            mm:'##cc0000', 		// Myanmar
                            th:'##cc0000', 		// Thailand	
                            kh:'##cc0000', 		// Cambodia
                            la:'##cc0000', 		// Laos	
                            vn:'##cc0000', 		// Vietnam
                            
                            
                            // North America
                            us:'##cc0000', 		// USA
                            ca:'##cc0000', 		// Canada
                            
                            
                            // Central America
                            mx:'##cc0000', 		// Mexico
                            gt:'##cc0000', 		// Guatemala
                            bz:'##cc0000', 		// Belize				
                            
                            
                            // Caribbean						
                            lc:'##cc0000', 		// St Lucia
                            bb:'##cc0000', 		// Barbados
                            gd:'##cc0000', 		// Grenada
                            cu:'##cc0000', 		// Cuba
                            bs:'##cc0000', 		// Bahamas
                            jm:'##cc0000', 		// Jamaica		
                            do:'##cc0000', 		// Dominican Republic				
                            
                            
                            // South America	
                            co:'##cc0000', 		// Colombia		
                            ar:'##cc0000', 		// Argentina	
                            br:'##cc0000', 		// Brazil
                            
                            
                            // Africa
                            eg:'##cc0000', 		// Egypt
                            ma:'##cc0000',		// Morrocco
                            */
                            
                            },
                        backgroundColor: 'false',
                        onRegionOver: showmyinfo,       
                        });
                    });
    
    
                function showmyinfo(event,label)
                    {
                    switch (label)
                        {
                        case 'dk':
                        $('##information').html('<p><strong>Danmark</strong><br /> 5.500.000 indbyggere </p>');
                        break;
    
                        case 'tr':
                        $('##information').html('<p><strong>Tyrkiet</strong><br /> 80.000 kristne</p>');
                        break;
    
                        case 'kp':
                        $('##information').html('<p><strong>Nordkorea </strong><br />25 millioner indbyggere </br>400.000 kristne </p>');
                        break;
            
                        case 'ir':
                        $('##information').html('<p><strong>Iran</strong><br />75 millioner indbyggere </br>128.000 katolikker og 200.000 evangeliske kristne </p>');
                        break;
            
                        case 'iq':
                        $('##information').html('<p><strong>Irak</strong><br />31 millioner indbyggere </br>Frre end  million kristne </p>');
                        break;
                        
                        case 'pk':
                        $('##information').html('<p><strong>Pakistan</strong><br />150 millioner indbyggere </br>2,8 millioner kristne </p>');
                        break;
            
                        case 'uz':
                        $('##information').html('<p><strong>Usbekistan</strong><br />27,5 millioner indbyggere </br>1,4 millioner russisk-ortodokse og 15.000 evangeliske kristne </p>');
                        break;
    
                        case 'tm':
                        $('##information').html('<p><strong>Turkmenistan</strong><br />5,1 millioner indbyggere </br> million russisk-ortodokse + 5000 evangeliske kristne </p>');
                        break;
            
                        case 'eg':
                        $('##information').html('<p><strong>gypten</strong><br />80 millioner indbyggere </br>Anslet 8 millioner kristne </p>');
                        break;
            
                        case 'az':
                        $('##information').html('<p><strong>Aserbajdsjan</strong><br />9 millioner indbyggere </br>125.000 kristne </p>');
                        break;
            
                        case 'in':
                        $('##information').html('<p><strong>Indien </strong><br />1,2 milliarder indbyggere</br>28.000.000 kristne </p>');
                        break;
            
                        case 'tj':
                        $('##information').html('<p><strong>Tadsjikistan</strong><br />8 millioner indbyggere</br>160.000 kristne </p>');
                        break;
    
                        case 'kg':
                        $('##information').html('<p><strong>Kirgisistan</strong><br />5,5 millioner indbyggere</br>1 million russisk ortodokse og 5.000 evangeliske kristne </p>');
                        break;
            
                        case 'sy':
                        $('##information').html('<p><strong>Syrien</strong><br />22 millioner indbyggere</br>2,3 millioner kristne </p>');
                        break;
            
                        case 'jo':
                        $('##information').html('<p><strong>Jordan</strong><br />6,4 millioner indbyggere</br>384.000 kristne </p>');
                        break;
            
                        case 'kz':
                        $('##information').html('<p><strong>Kasakhstan</strong><br />16,6 millioner indbyggere</br>4,4 millioner kristne </p>');
                        break;
            
                        case 'lk':
                        $('##information').html('<p><strong>Sri Lanka</strong><br />20 millioner indbyggere</br>1,6 kristne </p>');
                        break;
    
                        // case '':
                        // $('##information').html('<p><strong></strong><br />millioner indbyggere</br> kristne </p>');
                        // break;
                        }
                    }
                </script>
            	<!--- Info 
				<div id="information" href=""></div>--->
        </form>
    </div>
    <div style="float: right">
        <form action="" method="post">
            <br /><br /><br />
            <select name="myCountries" multiple="multiple" size="30">
                <cfset x = 1>
                <cfloop array="#arrCountries#" index="country">
                    <option value="#country.GETsCountryCode()#" <cfif ListFind(COOKIE.Jmap,country.GETsCountryCode())>selected</cfif>>#country.GETsCountry()#</option>
                    <cfset x = x + 1>
                </cfloop>        
            </select>
            <br /><br />
            <input type="submit" value="Save" name="Save" style="padding: 5px 60px 5px 60px" />
        </form>
	</div>
</cfif>  
</body>
</html>
</cfoutput>