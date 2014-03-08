<!-- tinyMCE -->
<cfoutput>
<script language="javascript" type="text/javascript" src="tinymce/jscripts/tiny_mce/tiny_mce.js"></script>
<script language="javascript" type="text/javascript">
	tinyMCE.init({
		theme : "advanced",
		mode : "textareas",
		elements : "#FieldName#",
		save_callback : "customSave",
		content_css : "example_advanced.css",
		extended_valid_elements : "a[href|target|name]",
		plugins : "table",
		theme_advanced_buttons3_add_before : "tablecontrols,separator",
		//invalid_elements : "a",
		theme_advanced_styles : "Header 1=header1;Header 2=header2;Header 3=header3;Table Row=tableRow1", // Theme specific setting CSS classes
		//execcommand_callback : "myCustomExecCommandHandler",
		theme_advanced_disable : "styleselect,formatselect,indent,outdent,strikethrough,justifyfull   ",
		theme_advanced_buttons1_add : "bullist,numlist, separator, sub,sup,charmap, separator, link,unlink, separator, copy,cut,paste, separator, cleanup,code,separator,undo,redo, separator, help ",
		theme_advanced_buttons2 : "",
		theme_advanced_buttons3 : "",
		//anchor,image,
		debug : false
	});
			
	// Custom event handler
	function myCustomExecCommandHandler(editor_id, elm, command, user_interface, value) {
		var linkElm, imageElm, inst;

		switch (command) {
			case "mceLink":
				inst = tinyMCE.getInstanceById(editor_id);
				linkElm = tinyMCE.getParentElement(inst.selection.getFocusElement(), "a");

				if (linkElm)
					alert("Link dialog has been overriden. Found link href: " + tinyMCE.getAttrib(linkElm, "href"));
				else
					alert("Link dialog has been overriden.");

				return true;

			case "mceImage":
				inst = tinyMCE.getInstanceById(editor_id);
				imageElm = tinyMCE.getParentElement(inst.selection.getFocusElement(), "img");

				if (imageElm)
					alert("Image dialog has been overriden. Found image src: " + tinyMCE.getAttrib(imageElm, "src"));
				else
					alert("Image dialog has been overriden.");

				return true;
		}

		return false; // Pass to next handler in chain
	}

	// Custom save callback, gets called when the contents is to be submitted
	function customSave(id, content) {
		//alert(id + "=" + content);
	}
</script>
<!-- /tinyMCE -->		

<textarea id="#FieldName#" name="#FieldName#" rows="10" style="width:560px">
#evaluate('GetData.' & FieldName)#
</textarea>
</cfoutput>
