
function replaceQuotes(originalString)
{
	var pos=0;
	var preString;
	var postString;
	var length = originalString.length;

	pos=originalString.indexOf("’");
	while (pos != -1)
	{
		preString = originalString.substring(0,pos);
		postString = originalString.substring(pos+1,length);
		originalString = preString+"'" + postString;
		pos = originalString.indexOf("’");
	}
	pos=originalString.indexOf("‘");

	while (pos != -1)
	{
		preString = originalString.substring(0,pos);
		postString = originalString.substring(pos+1,length);
		originalString = preString+"'" + postString;
		pos = originalString.indexOf("‘");
	}
		
	pos=originalString.indexOf("”");

	while (pos != -1)
	{
		preString = originalString.substring(0,pos);
		postString = originalString.substring(pos+1,length);
		originalString = preString+'"' + postString;
		pos = originalString.indexOf("”");
	}
	pos=originalString.indexOf("“");
	while (pos != -1)
	{
		preString = originalString.substring(0,pos);
		postString = originalString.substring(pos+1,length);
		originalString = preString+'"' + postString;
		pos = originalString.indexOf("“");
	}
	
	return originalString;
}  

function addRepeaterOption(thing,thing2,description)
{

		var oOption = document.createElement("OPTION");
		oOption.text=description;
		oOption.value=description;
		var oOption2 = document.createElement("OPTION");
		oOption2.text=description;
		oOption2.value=description;
		thing2.add(oOption2);
		thing.add(oOption);
		// thing is the hidden one. thing2 is the visible one
		thing.options(thing.options.length-1).selected=true;
		
}
 
function deleteRepeaterOption(thing2,thing,description)
{
	var id;
	for (i=0; i< thing.options.length; i++)
	{
        	if (thing.options(i).value == description)
        	{
        		id = i;
        	}
	}
	thing.remove(id);
	thing2.remove(id);
}

function setUpTextAreaScript ()
{	
	var len = editform.elements.length;
	var name;
	var miniscript = "<SCRIPT LANGUAGE=\"JAVASCRIPT1.1\">";
	miniscript = miniscript + "function copyTextAreas() { ";
	var a = 0;
	
	for (i = 0; i < len;i++)
	{
			name = editform.elements[i].getAttribute("ID");
			if (name.indexOf("text") >= 0)
			{
					name = name.replace("text","");
					miniscript=miniscript +"document.editform.text" + name + ".value=replaceQuotes(div" + name +".innerHTML);";
			}
	}
	miniscript = miniscript + " } </SCRIPT>";
	document.write(miniscript);

}

function changeOptions(child,parent)
{
	var subdropdown = eval("document.editform." + child);
	
	parent=eval("document.editform." +parent);
	var id = parent.value;
	if (eval("this." + child+id + "text"))
	{
		var textarray = eval(child+id + "text");
		var valuesarray = eval(child+id + "values");
		for (var i=subdropdown.options.length-1; i >=0;i--)
		{
	
			subdropdown.remove(i);
		}
	
		for (i=0; i < valuesarray.length;i++)
		{
			oOption = document.createElement("OPTION");
			oOption.value=valuesarray[i];
			oOption.text=textarray[i];
			subdropdown.add(oOption);
		}
		subdropdown.style.visibility = 'visible';
	}
	else
	{
		subdropdown.style.visibility = 'hidden';
	}
}

function setupOptions(child,parent)
{	
	var subdropdown = eval("document.editform." + child);
	
	var id =eval("document.editform." + parent+".value");
	if (eval("this." + child+id + "text"))
	{
		var textarray = eval(child+id + "text");
		var valuesarray = eval(child+id + "values");
		var defaultarray = eval(child+"selected");
	
		for (i=0; i < valuesarray.length;i++)
		{
			oOption = document.createElement("OPTION");
			oOption.value=valuesarray[i];
			oOption.text=textarray[i];
			for (j=0; j< defaultarray.length;j++)
			{
			   if (valuesarray[i]==defaultarray[j])
			   	oOption.selected=true;
			}
			subdropdown.add(oOption);
		}
	}
	else
	{	
		subdropdown.style.visibility = 'hidden';
	}
}
