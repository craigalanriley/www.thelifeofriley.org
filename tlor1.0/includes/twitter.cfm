<cfhttp url="http://twitter.com/statuses/user_timeline/17833966.rss" method="GET" resolveurl="No"></cfhttp>

<cfset myTwitter = XMLParse(cfhttp.FileContent)>

<!--- <cfdump var="#myTwitter#"> --->

<img src="../images/twitter.jpg"><br />
<br />

<cfoutput>
<span style="font-family:Arial, Helvetica, sans-serif; font-size:11px">
    
    <cfset currFeeds = ArrayLen(myTwitter.rss.channel.item)>
    <cfif currFeeds GT 5>
    	<cfset maxFeeds = 5>
    <cfelse>    
    	<cfset maxFeeds = currFeeds>
    </cfif>
    
    <cfloop from="1" to="#maxFeeds#" index="x">
    
        <p>
        <span style="color:##999999">#DateFormat(myTwitter.rss.channel.item[x].pubDate.xmlText,"dd mmmm yyyy")# @#TimeFormat(myTwitter.rss.channel.item[x].pubDate.xmlText,"HH:mm:ss")#</span><br />
        #myTwitter.rss.channel.item[x].title.xmlText#<br />        
        <!--- <a href="#myTwitter.rss.channel.item[x].link.xmlText#" target="_blank">#myTwitter.rss.channel.item[x].link.xmlText#</a><br /> --->
        <!--- #myTwitter.rss.channel.item[x].description.xmlText#<br /> --->        
        <!--- #myTwitter.rss.channel.item[x].guid.xmlText#<br /> --->
        </p>
        
    </cfloop>
    <br />
    <!--- #myTwitter.rss.channel.title.xmlText#<br /> --->
    <!--- #myTwitter.rss.channel.language.xmlText#<br /> --->
    <strong>View all my #left(myTwitter.rss.channel.description.xmlText,15)# @ </strong> <a href="#myTwitter.rss.channel.link.xmlText#" target="_blank">#myTwitter.rss.channel.link.xmlText#</a><br />
    
</span>
</cfoutput>
<br />



