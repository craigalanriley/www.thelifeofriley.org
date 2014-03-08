
<!--- 
##### NOTE ##### 
To Make this script to work all drop down fields should be named "SomethingList" and all email fields should be named "SomethingEmail" or just "Email" 
--->

<!--- Variables --->
<cfparam name="Attributes.Message" default= "You must complete all the highlighted fields" type="string">
<cfparam name="Attributes.MustList" default= "#Attributes.FieldList#">
<cfparam name="Attributes.ErrorList" default= "">
<cfset ErrorList = Attributes.ErrorList>
<cfset FieldList = Attributes.FieldList>
<cfset GetData = QueryNew("#FieldList#")>

<!--- Validate Form Fields --->
<cfloop index="Field" list="#Attributes.MustList#">
	
	<cfif Field CONTAINS "Email">
		
		<cfset EvalField = evaluate(Field)>					
		<cfif NOT Len(trim(EvalField)) OR EvalField DOES NOT CONTAIN '@' OR EvalField DOES NOT CONTAIN '.'>
			<cfset ErrorList = ListAppend(ErrorList,Field,",")>
		</cfif>		
					
	<cfelseif Field CONTAINS "ID">
	
		<cfset EvalField = evaluate(Field)>			
		<cfif NOT EvalField GT 0>			
			<cfset ErrorList = ListAppend(ErrorList,Field,",")>
		</cfif>					
	
	<cfelse>
	
		<cfset EvalField = evaluate(Field)>			
		<cfif NOT len(trim(EvalField))>			
			<cfset ErrorList = ListAppend(ErrorList,Field,",")>
		</cfif>							
	
	</cfif>			

</cfloop>

<!--- If error exists Preserve State --->
<cfif len(trim(ErrorList))>
	
	<cfset t=QueryAddRow(GetData,1)>
	<cfloop LIST="#FieldList#" index="index">
		<cfif NOT index CONTAINS "DATE">
			<cfset index=trim(index)>
			<cfset value=Evaluate("#index#")>
			<cfset t=QuerySetCell(GetData,index,value)>
		</cfif>
	</cfloop>
	
	<cfset CALLER.Message = Attributes.Message>
	<cfset CALLER.ErrorList = ErrorList>
	<cfset CALLER.GetData = GetData>

</cfif>

<!--- 
#### Use this code inside each form field to highlight particular field ####
<cfif ListFind(ErrorList,"FieldName")>class="ErrorText"<cfelse>class="FormText"</cfif>
--->
