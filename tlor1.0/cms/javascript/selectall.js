
<!--//Checkbox Select All Script
function selectAll(selectall) {
	var formname = selectall.form;
	if(selectall.checked){
		for(y=0;y<formname.elements.length;y++){
			if(formname.elements[y].type.search('checkbox')==0&&formname.elements[y].name=='ID'){
				formname.elements[y].checked=true;
			}
		}
	}else{
		for(y=0;y<formname.elements.length;y++){
			if(formname.elements[y].type.search('checkbox')==0&&formname.elements[y].name=='ID'){
				formname.elements[y].checked=false;
			}
		}
	}			
}
function checkFrm() {
	var formname = eval(document.frmSearchResults2);
	var ok = 'no';
	for(y=0;y<formname.elements.length;y++){
		if(formname.elements[y].type.search('checkbox')==0&&formname.elements[y].name=='ID'&&formname.elements[y].checked){
			ok = 'yes';
		}
	}
	if (ok == 'no') {alert('You must select one or more records using the checkboxes.');}
	else{formname.submit();}
}
//-->
