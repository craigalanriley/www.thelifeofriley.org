
<!--//Checkbox Select All Script
//declare global variables
var rowsSelected = 0;
var off_color = 'CCCCCC';
var on_color = 'E6B380';

//change the background color of a row when selected and
//also count how many rows are selected
function onRow(srcElement)
	{
	var whichRow = srcElement
	//alert("whichRow" + whichRow);
	whichRow.style.backgroundColor = on_color;
	//alert("yep");
	}

function offRow(srcElement)
	{
	var whichRow = srcElement
	whichRow.style.backgroundColor = off_color;
	}

function colorRow(srcElement)
{
  //alert("sds" + eval(srcElement));
  var cb = event.srcElement;
  var curElement = cb;
  while (curElement && !(curElement.tagName == "TR"))
  {
    curElement = curElement.parentElement;
  }
  if (!(curElement == cb) && (cb.name != "cbxSelectAll"))
  {
    if (cb.checked)
    {
      curElement.style.backgroundColor = on_color;
      rowsSelected = rowsSelected + 1;
    }
    else
    {
      curElement.style.backgroundColor = off_color;
      rowsSelected = rowsSelected - 1;
    }
  }
}

//color all rows when the main checkbox is clicked
function checkAll(form)
{
  var thisNumRowsSelected = 0;
  var isChecked = document.all.cbxSelectAll.checked;
  for (var i=0; i < form.elements.length; i++)
  {
    if (form.elements[i].id.indexOf('TR_') > -1)
    {
      var curElement = form.elements[i];
      if (isChecked)
      {
       	curElement.checked = true;
        thisNumRowsSelected = thisNumRowsSelected + 1;
        while (!(curElement.tagName == "TR"))
        {
          curElement = curElement.parentElement;
        }
        if (form.elements[i].name != "cbxSelectAll")
        {
          curElement.style.backgroundColor = on_color;
        }
      }
      else
      {
        curElement.checked = false;
        while (!(curElement.tagName == "TR"))
        {
          curElement = curElement.parentElement;
        }
        if (form.elements[i].name != "cbxSelectAll")
        {
          curElement.style.backgroundColor = off_color;
        }
      }
    }
  }
  rowsSelected = thisNumRowsSelected
}
//-->
