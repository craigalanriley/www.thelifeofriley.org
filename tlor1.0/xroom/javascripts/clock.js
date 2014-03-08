<!--
	var dayarray=new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday")
	var montharray=new Array("January","February","March","April","May","June","July","August","September","October","November","December")
	
	function getthedate(){
	var mydate=new Date()
	var year=mydate.getFullYear()
	var day=mydate.getDay()
	var month=mydate.getMonth()
	var daym=mydate.getDate()
	if (daym<10)
	daym="0"+daym
	var hours=mydate.getHours()
	var minutes=mydate.getMinutes()
	var seconds=mydate.getSeconds()
	var apm="am" 
	if (hours>=12){
	apm="pm"
	hours=hours-12
	}
	if (hours==0)
	hours=12
	if (minutes<=9)
	minutes="0"+minutes
	if (seconds<=9)
	seconds="0"+seconds
	//var mydate=dayarray[day]+", "+montharray[month]+" "+daym+", "+year+" "+hours+":"+minutes+":"+seconds+" "+apm
	var mydate=daym + " " + montharray[month] + " " + year+" @ "+hours+":"+minutes+":"+seconds+" "+apm
	
	if (document.all)
	document.all.clock.innerHTML=mydate
	else
	document.write(mydate)
	}
	if (!document.all)
	getthedate()
	function startClock(){
	if (document.all)
	setInterval("getthedate()",1000)
	}
//-->
