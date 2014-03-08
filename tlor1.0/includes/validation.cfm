<!---  
This script will validate all forms providing a few simple guidlines are met:
1)A ReqList of required fields must exist
2)Each Field in this list must have a table row with a corresponding id eg. <tr id="field_name"> 
3)The checkbox.js script must be included on the page (usually put in the header file)
4)Form fields must be named consistantly as follows:
	- All drop down lists contain "_id" eg. "work_flow_id"
	- Email fields contain "email" eg "work_email"
--->
<cfparam name="ReqList" default="">

<cfoutput>
<script language="javascript">
	<!--	
	function submitform(myForm){
		//alert("We're In!");
		if (checkFrm(myForm)){
			//ae_onSubmit();
			return true;
		}else{
			return false;
		}	
	}
	function checkFrm(theform) {
		var message = 'You must complete the required * fields: \n\n';
		var showmsg = 0;
		<cfloop list="#ReqList#" index="x">
		
			// Validate Select Lists
			<cfif x CONTAINS "_id">
				// Drop Down Lists
				if (theform.#x#.value == '0') {				
					//message+='  -  #x#\n';
					showmsg = 1;
					}			
			<cfelse> // Validate Text Fields
				// Text Fields
				if (theform.#x#.value == '') {
					//message+='  -  #x#\n';
					showmsg = 1;			
					}			
			</cfif>
			
		</cfloop>

								
		if (showmsg == 1) {
			alert(message);
			return false
		}
		else {
			return true
		}			
	}
	
	//-->	
</script>	
</cfoutput>
