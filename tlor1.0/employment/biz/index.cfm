<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<cfset ThisPage = "Business">

<html>
<cfoutput>
<head>
	<title>The Life of Riley - #ThisPage#</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<link rel=stylesheet type="text/css" href="../../stylesheets/riley.css">
	<script language="javascript" src="../../javascripts/rollover.js"></script>	
</head>

<body bgcolor="##FFFFFF" topmargin="25" onload="preload();">

<cfset HeaderImage="header_vegasview1.jpg">

<cfinclude template="../../includes/header.cfm">

<!--- Body --->	 
<table width="750" border="0" cellspacing="0" cellpadding="0" align="center" bgcolor="##FFFFFF">
	<tr>
		<td bgcolor="##CCCCCC" rowspan="2" valign="top">
		
			<!--- Navigation --->
			<cfinclude template="../../includes/nav_employment.cfm">
		
		</td>
		<td><img src="../../images/dotpix.gif" height="20" width="1"></td>
		<td class="bread"><a href="#Application.Home#" class="bread">HOME</a> &gt; <a href="#Application.Home#employment/" class="bread">EMPLOYMENT</a> &gt; #ThisPage#</td>
	</tr>
  	<tr>
    	<td><img src="../../images/dotpix.gif" height="1" width="1"></td>
    	<td class="txt">
			
			<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td>
				<cfinvoke component="#Application.CompsPath#/content_photo" method="Display" 
							FileName="biz1.jpg"
							ImageText="Filipino Night Market">
				<span class="txt_header">#ThisPage#</span>
				<br>		
Omnis homines, qui sese student praestare ceteris animalibus, summa ope niti decet, ne vitam silentio transeant veluti pecora, quae natura prona atque ventri oboedientia finxit. Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est.

Sed nostra omnis vis in animo et corpore sita est: animi imperio, corporis servitio magis utimur; alterum nobis cum dis, alterum cum beluis commune est. Quo mihi rectius videtur ingeni quam virium opibus gloriam quaerere et, quoniam vita ipsa, qua fruimur, brevis est, memoriam nostri quam maxume longam efficere. 
				<p>								
				</td>
			</tr>
			</table>			
				
		</td>
  	</tr>
	<tr>
		<td bgcolor="##CCCCCC"><img src="../../images/dotpix.gif" height="1" width="175"></td>
		<td><img src="../../images/dotpix.gif" height="20" width="25"></td>
		<td><img src="../../images/dotpix.gif" height="1" width="550"></td>
	</tr>
</table>

<cfinclude template="../../footer.cfm">	 

</body></cfoutput>	 


</html>
