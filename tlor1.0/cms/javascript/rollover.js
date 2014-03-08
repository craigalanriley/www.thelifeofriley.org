<!--
var	arrOff, arrOn, arrNames;		//arrays for images and image names
var bOkay;

bOkay= document.images;				//images OK?
arrOff = new Array();
arrOn = new Array();
arrNames = new Array();

function preload(){					//Called in the Onload event of the body tag

var iSlashIndex, iLastIndex;		//integers and indices
var strName, strImagePath;			//image name and path
var iCount, i, j;					

if (bOkay)
{
	iCount = document.images.length;
	j = 0;
	
	for (i=0; i<iCount; i++)
	{
		strName = document.images[i].name;
		
		if (strName != "")			//Add any exceptions here. NB need names of multiple rollovers (cannot handle these) 
		{							// 			eg (strName != "" && strName != image1 && ...)
									//Also - .gif rollovers only! (could easily be altered)
			arrOff[j] = new Image();
			arrOn[j] = new Image();
			arrNames[j] = new String();

			arrNames[j] = strName;							//the image name is stored (name=filename)
			strImagePath = document.images[i].src;			
			arrOff[j].src = strImagePath;					//the off image is the image itself
			strImagePath = strImagePath.substring(0, strImagePath.length-4);
			arrOn[j].src = strImagePath + "_on.gif";		//the on image
			j++;
		}
	}	
}
}

function on(strName) 
{
var i;
if (bOkay)
{
	for (i=0; i<arrNames.length; i++)
	{
		if (strName == arrNames[i])
		{
			document.images[strName].src = arrOn[i].src;
		}
	}
}
}

function off(strName)
{
var i;
if (bOkay)
{
	for (i=0; i<arrNames.length; i++)
	{
		if (strName == arrNames[i])
		{
			document.images[strName].src = arrOff[i].src;
		}
	}
}
}
//-->
