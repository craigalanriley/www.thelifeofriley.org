<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>RSS Twitter Test</title>
</head>

<body>

<cfhttp url="http://twitter.com/statuses/user_timeline/17833966.rss" method="GET" resolveurl="No"></cfhttp>

<cfset myTwitter = XMLParse(cfhttp.FileContent)>

<!--- <cfdump var="#myTwitter#"> --->


<cfoutput>
	<span style="font-family:Arial, Helvetica, sans-serif; font-size:11px">
    
    <!--- #myTwitter.rss.channel.title.xmlText#<br /> --->
    <br />
    <strong>#left(myTwitter.rss.channel.description.xmlText,20)#:</strong> <a href="#myTwitter.rss.channel.link.xmlText#">#myTwitter.rss.channel.link.xmlText#</a><br />
    <!--- #myTwitter.rss.channel.language.xmlText#<br /> --->
    
    <cfloop from="1" to="#ArrayLen(myTwitter.rss.channel.item)#" index="x">
    
        <p>
        <span style="color:##999999">#DateFormat(myTwitter.rss.channel.item[x].pubDate.xmlText,"dd mmmm yyyy")# @#TimeFormat(myTwitter.rss.channel.item[x].pubDate.xmlText,"HH:mm:ss")#</span><br />
        #myTwitter.rss.channel.item[x].title.xmlText#<br />        
        <!--- <a href="#myTwitter.rss.channel.item[x].link.xmlText#" target="_blank">#myTwitter.rss.channel.item[x].link.xmlText#</a><br /> --->
        <!--- #myTwitter.rss.channel.item[x].description.xmlText#<br /> --->        
        <!--- #myTwitter.rss.channel.item[x].guid.xmlText#<br /> --->
        </p>
        
    </cfloop>
    </span>

</cfoutput>

</body>
</html>



