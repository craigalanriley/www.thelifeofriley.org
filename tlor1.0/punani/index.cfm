
<cfparam name="FORM.page" default="http://www.bbc.com">

<cfform method="post" action="">

	URL: <cfinput type="text" size="100" name="page" required="yes" validateat="onsubmit" message="Hey Schmuck, type something!"> 			   
    <input type="submit" name="Go" value="I love Punani!">

</cfform>

<hr>

<cfhttp url="#FORM.page#" method="get" resolveurl="yes" throwonerror="yes">


<cfset session.page = CFHTTP.FileContent>

<iframe width="1024" height="700" src="page.cfm" style="border:1px solid #000">test</iframe>
