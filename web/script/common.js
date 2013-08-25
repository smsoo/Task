var collectionRequiredField= new Array();
var crfIndex=0;
var httpXml = getXhttp();

function getXhttp ( )
{
    var ajax_request;
    if (  window.ActiveXObject  )  {
        var mSoftVersions = [
            'MSXML2.DOMDocument.5.0',
            'MSXML2.DOMDocument.4.0',
            'MSXML2.DOMDocument.3.0',
            'MSXML2.DOMDocument.2.0',
            'MSXML2.DOMDocument',
            'Microsoft.XmlDom',
            'Msxml2.XMLHTTP',
            'Microsoft.XMLHTTP'
        ];
        
        for (  i=0; i<mSoftVersions.length; i++  )  {
            try {
                ajax_request = new ActiveXObject (  mSoftVersions[i]  );
            }  catch (  e  )  {    }
        }
    }  else if (  !ajax_request && typeof XMLHttpRequest != 'undefined'  )  {
        try {
            ajax_request = new XMLHttpRequest;
        }  catch (  e  )  {    }
    }  else if (  !ajax_request && window.createRequest  )  {
        try {
            ajax_request = window.createRequest;
        }  catch (  e  )  {    }
    }  else  {
        ajax_request = false;
    }
    
    return ajax_request;
}
function generatorProcess(category,inputId,inputType,isRequired,value,selection, inputSize){
	var stringOutput="";
	if(value!="" && value!=null){
		if(value=="bySpanId"){
			value=document.getElementById("span_"+category+"_"+inputId).innerHTML;
			value=value.replace(/\"/g,"&quot;");
			value=value.replace(/\n/g,'');
			value=value.replace(/\<BR\>/g,'<br>');
			value=value.replace(/\<br\>/g,'\n');
		}
	}
	var textSize="100";
	var textAreaSize ="60";
	if(inputSize==1){
		textSize="135";
		textAreaSize="100";
	}
	if(inputType==0){
		stringOutput="<input type='text' value=\""+value+"\" id='"+category+"[0]' name='"+category+"[0]' size='"+textSize+"' class='textfield' > <input type='hidden' name='"+category+"[1]' id='"+category+"[1]' value='"+inputId+"'>";
	}else if(inputType==1){
		stringOutput="<textarea cols='"+textAreaSize+"' rows='3' style='font-size:11px' id='"+category+"[0]' name='"+category+"[0]'>"+value+"</textarea>  <input type='hidden' name='"+category+"[1]' id='"+category+"[1]' value='"+inputId+"'>";
	}else if(inputType==2){
		var choices = selection.split(";");
		for(var cs=0;cs<choices.size();cs++){
			choices[cs]=choices[cs].replace(/\"/g,"&quot;");
			if(value==choices[cs]){
				stringOutput=stringOutput+"<input type='radio' id='"+category+"[0]_"+cs+"' name='"+category+"[0]' value=\""+choices[cs]+"\" checked > "+choices[cs]+"<br>";
			}else{
				stringOutput=stringOutput+"<input type='radio' id='"+category+"[0]_"+cs+"' name='"+category+"[0]' value=\""+choices[cs]+"\" > "+choices[cs]+"<br>";
			}
		}
		stringOutput=stringOutput+"<input type=\"hidden\" name=\""+category+"[1]\" id='"+category+"[1]' value=\""+inputId+"\">";
	}else if(inputType==3){
		var choices = selection.split(";");
		stringOutput="<select id='"+category+"[0]' name='"+category+"[0]'>";
		stringOutput=stringOutput+"<option value=''>----Select----</option>";
		for(var cs=0;cs<choices.size();cs++){
			choices[cs]=choices[cs].replace(/\"/g,"&quot;");
			if(value==choices[cs]){
				stringOutput=stringOutput+"<option value=\""+choices[cs]+"\" selected > "+choices[cs]+"</option>";
			}else{
				stringOutput=stringOutput+"<option value=\""+choices[cs]+"\" > "+choices[cs]+"</option>";
			}
		}
		stringOutput=stringOutput+"</select>";
		stringOutput=stringOutput+"<input type='hidden' name='"+category+"[1]' id='"+category+"[1]' value='"+inputId+"'>";
	}else if(inputType==4){
		stringOutput="<textarea cols='"+textAreaSize+"' rows='2' style='font-size:11px' id='"+category+"[0]' name='"+category+"[0]'>"+value+"</textarea>  <input type='hidden' name='"+category+"[1]' id='"+category+"[1]' value='"+inputId+"'>";
	}
	if(isRequired==1){
		collectionRequiredField[crfIndex]=category+"[0]";
		crfIndex=crfIndex+1;
	}
	return stringOutput;
}
function fieldGenerator(category,inputId,inputType,isRequired,value,selection,inputSize){
	document.write(generatorProcess(category,inputId,inputType,isRequired,value,selection,inputSize));
}
function validateRequireForm(formName){
	for(var cc=0;cc<crfIndex;cc++){
		var inputFieldId=document.getElementById(collectionRequiredField[cc]);
		var inputFieldName;
		if(formName==null){
			inputFieldName=document.surveyForm[collectionRequiredField[cc]];
		}else{
		    inputFieldName=document[formName].elements[collectionRequiredField[cc]];
		}
		if(inputFieldId==null || inputFieldId.type=="radio"){
			var radioChecked = false;
			for(var rc=0; rc<inputFieldName.length; rc++){
				if(inputFieldName[rc].checked){
					radioChecked = true;
				}
			}
			if(radioChecked==false){
				if(formName==null){
					alert("Asterik field cannot leave blank ");
				}else{
					alert("Cannot save empty field ");
				}
				return false;
			}
		}else if(trim(inputFieldId.value)==""){
			if(formName==null){
				alert("Asterik field cannot leave blank ");
			}else{
				alert("Cannot save empty field ");
			}
			return false;
		}
		
	}
	if(formName==null){
		var isSubmit=confirm("Are you sure you want to save the form? You can still edit the form after saved.");
		if(!isSubmit){
			return false;
		}
	}
	return true;
}
function fieldUpdGenerator(category,inputId,inputType,isRequired,value,selection,formLocation,inputSize){
	document.write("<form name='form_"+category+"_"+inputId+"'>");
	fieldGenerator(category,inputId,inputType,isRequired,value,selection,inputSize);
	document.write("<br><input type='button' class='bt' value='Save'");
	selection=selection.replace(/"'"/g,"&#39;");
	document.write("onclick=\"ajaxAddField(&quot;"+category+"&quot;,"+inputId+","+inputType+","+isRequired+",&quot;&quot;,&quot;"+selection+"&quot;,&quot;"+formLocation+"&quot;)\"");
	
	document.write("/>");
	document.write("</form>");
}

function ajaxGetField(idName,idValue,formLoc){
	
	if(!httpXml){
		alert ("Your browser does not support AJAX!");
		return false;
	}

	httpXml.open("POST",formLoc);
	httpXml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	
	httpXml.send(idName+"="+idValue);
	return true;
}
function fieldReupdGenerator(category,inputId,inputType,isRequired,value,selection,formLocation,inputSize){
	var stringOutput=null;
	stringOutput="<form name='form_"+category+"_"+inputId+"'>";
	stringOutput=stringOutput+generatorProcess(category,inputId,inputType,isRequired,"bySpanId",selection,inputSize);
	stringOutput=stringOutput+"<br><input type='button' class='bt' value='Save'";
	selection=selection.replace(/"'"/g,"&#39;");
	stringOutput=stringOutput+"onclick=\"ajaxAddField(&quot;"+category+"&quot;,"+inputId+","+inputType+","+isRequired+",&quot;&quot;,&quot;"+selection+"&quot;,&quot;"+formLocation+"&quot;)\"";
	stringOutput=stringOutput+"/>";
	stringOutput=stringOutput+(" <input type='reset' class='bt' value='Reset'/>");
	stringOutput=stringOutput+"</form>";
	document.getElementById("div_"+category+"_"+inputId).innerHTML=stringOutput;
//	if(inputType==1){
//		var tempName = category.split("[");
//		if(tempName[0]=="personalArrFields"){
//			ajaxGetField("personalDetail.pdId",inputId,"getPersonalDetailField.action");
//			httpXml.onreadystatechange = function() {//Call a function when the state changes.
//				if(httpXml.readyState == 4 && httpXml.status == 200) {
//					document.getElementById(category+"[0]").innerHTML=httpXml.responseText.trim();
//				}
//			}
//		}
//	}
}
function trim(str){    
	if(!str || typeof str != 'string') return "";    
	return str.replace(/^[\s]+/,'').replace(/[\s]+$/,'').replace(/[\s]{2,}/,' ');
}



function ajaxAddField(category,inputId,inputType,isRequired,value,selection,formLoc){
	var inputFieldId=document.getElementById(category+"[0]");
	var inputFieldId2=document.getElementById(category+"[1]");

	crfIndex=0;
	collectionRequiredField= new Array();
	collectionRequiredField[crfIndex]=category+"[0]";
	crfIndex=crfIndex+1;
	var validateResult=validateRequireForm("form_"+category+"_"+inputId);
	if(validateResult==false){
		return false;
	}
	var formName="form_"+category+"_"+inputId;
	inputFieldName=document[formName].elements[category+"[0]"];
	if(inputFieldId==null || inputFieldId.type=="radio"){
		var radioChecked = false;
		for(var rc=0; rc<inputFieldName.length; rc++){
			if(inputFieldName[rc].checked){
				inputFieldId=inputFieldName[rc];
			}
		}
	}
	var cat=category.split("[");
	var xml = getXhttp();
	if(!xml){
		alert ("Your browser does not support AJAX!");
		return false;
	}

	xml.open("POST",formLoc);
	xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xml.onreadystatechange = function() {//Call a function when the state changes.
		if(xml.readyState == 4 && xml.status == 200) {
			 document.getElementById("div_"+category+"_"+inputId).innerHTML=xml.responseText;
		}else{
			 document.getElementById("div_"+category+"_"+inputId).innerHTML="<img src='image/loadingIndicatorSmall.gif'/>";
		}
	}
	//xml.send(cat[0]+"="+escape(inputFieldId.value)+"&"+cat[0]+"="+escape(inputFieldId2.value));
	xml.send("stringArr="+escape(inputFieldId.value)+"&stringArr="+escape(inputFieldId2.value));
}
function confirmUploadFile(validateField){
	var updField =document.getElementById(validateField); 
	if(updField.value==""){
		alert("You did not select any file to upload");
		return false;
	}
	var confirmString="Do you want to proceed upload the selected file?";
	var isConfirmSubmit=confirm(confirmString);
	if(isConfirmSubmit){
		return true;
	}
	return false;
}
function confirmDelUploadFile(delId,page){
	var confirmString="Are you sure you want to delete this file?";
	var isConfirmSubmit=confirm(confirmString);
	if(isConfirmSubmit){
		location.href="deleteUpdUploadFile.action?uploadFile.ufId="+delId+"&page="+page;
	}
	return false;
}
function confirmSubmitFinalForm(){
	var isSub=confirm("Please check your form before you submit.\n After submission, you are not able to edit/upload file anymore.\nDo you want to proceed submit your form?");
	if(isSub){
		return true;
	}
	return false;
}

function hideElemental(input){
	if(document.getElementById(input).style.display=="none"){
		document.getElementById(input).style.display="inline";
	}else{
		document.getElementById(input).style.display="none";
	}
}
function ignoreSpace(e){
	var key = window.event ? e.keyCode : e.which;
	var keychar = String.fromCharCode(key);
	reg = /[a-zA-Z_0-9\b]/;
	return reg.test(keychar);
}
function onKeyPressBlockNumbers(e)
{
	var key = window.event ? e.keyCode : e.which;
	var keychar = String.fromCharCode(key);
	reg = /\d/;
	return reg.test(keychar);
}
function onKeyPressAllowFloat(e)
{
	var key = window.event ? e.keyCode : e.which;
	var keychar = String.fromCharCode(key);
	reg = /\d/;
	reg2 = /\./;
	if(reg.test(keychar)){
		return reg.test(keychar);
	}else if(reg2.test(keychar)){
		return reg2.test(keychar);
	}
	return false;
}
function addRowToTable(formName)
{
  var tbl = document.getElementById(formName);
  var lastRow = tbl.rows.length;
  // if there's no header row in the table, then iteration = lastRow + 1
  var iteration = lastRow;
  var row = tbl.insertRow(lastRow);
  
  // left cell
  var cellLeft = row.insertCell(0);
  var textNode = document.createTextNode(iteration);
  cellLeft.appendChild(textNode);
  
  // right cell
  var cellRight = row.insertCell(1);
  var el = document.createElement('input');
  el.type = 'text';
  el.name = 'txtRow' + iteration;
  el.id = 'txtRow' + iteration;
  el.size = 40;
  
  el.onkeypress = keyPressTest;
  cellRight.appendChild(el);
  
  // select cell
  var cellRightSel = row.insertCell(2);
  var sel = document.createElement('select');
  sel.name = 'selRow' + iteration;
  sel.options[0] = new Option('text zero', 'value0');
  sel.options[1] = new Option('text one', 'value1');
  cellRightSel.appendChild(sel);
}
function keyPressTest(e, obj)
{
  var validateChkb = document.getElementById('chkValidateOnKeyPress');
  if (validateChkb.checked) {
    var displayObj = document.getElementById('spanOutput');
    var key;
    if(window.event) {
      key = window.event.keyCode; 
    }
    else if(e.which) {
      key = e.which;
    }
    var objId;
    if (obj != null) {
      objId = obj.id;
    } else {
      objId = this.id;
    }
    displayObj.innerHTML = objId + ' : ' + String.fromCharCode(key);
  }
}
function removeRowFromTable(formName)
{
  var tbl = document.getElementById(formName);
  var lastRow = tbl.rows.length;
  if (lastRow > 2) tbl.deleteRow(lastRow - 1);
}
function openInNewWindow(frm)
{
  // open a blank window
  var aWindow = window.open('', 'TableAddRowNewWindow',
   'scrollbars=yes,menubar=yes,resizable=yes,toolbar=no,width=400,height=400');
   
  // set the target to the blank window
  frm.target = 'TableAddRowNewWindow';
  
  // submit
  frm.submit();
}
function validateRow(frm)
{
  var chkb = document.getElementById('chkValidate');
  if (chkb.checked) {
    var tbl = document.getElementById('tblSample');
    var lastRow = tbl.rows.length - 1;
    var i;
    for (i=1; i<=lastRow; i++) {
      var aRow = document.getElementById('txtRow' + i);
      if (aRow.value.length <= 0) {
        alert('Row ' + i + ' is empty');
        return;
      }
    }
  }
  openInNewWindow(frm);
}

function navigationLoading(){
	document.getElementById("bodyTrans").style.visibility="visible";
	document.getElementById("transRow").style.height=document.body.scrollHeight+400+"px";
	document.getElementById("transRow").style.width=document.body.scrollWidth+100+"px";
	document.getElementById("bodyTrans").style.width=document.body.scrollWidth+100+"px";
	
	document.getElementById("naviLoadingDiv").style.display="block";	
	parent.document.getElementById("naviLoadingDiv").innerHTML="<center><img src='image/loading_bar.gif'/><br><b>Now Loading, Please Wait...</b></center>";
	return true;
}
function setFramePosition(e) {
	var posx = 0;
	var posy = 0;
	if(window.event){
		if (!e) var e = window.event;
	}else{
		if(!e) var e = e.which || e.keyCode;
	}
	if (e.pageX || e.pageY) 	{
		posx = e.pageX;
		posy = e.pageY;
	}
	else if (e.clientX || e.clientY) 	{
		posx = e.clientX + document.body.scrollLeft
			+ document.documentElement.scrollLeft;
		posy = e.clientY + document.body.scrollTop
			+ document.documentElement.scrollTop;
	}
	if(posx>400){
		posx=posx-400;
	}
	else if(posx>200){
		posx=posx-200;
	}
	if(posy>300){
		posy=posy-300;
	}
	else if(posy>150){
		posy=posy-150;
	}
	parent.document.getElementById("insertFormDiv").style.left=posx;
	parent.document.getElementById("insertFormDiv").style.top=posy;
}
function chgTblHeadCls(classId){
	if(document.getElementById('tblHead').className==classId){
		document.getElementById('tblHead').className="";
	}else{
		document.getElementById('tblHead').className=classId;
	}
}
function chgButtonCls(classId,button){
	if(button.className==classId){
		button.className="";
	}else{
		button.className=classId;
	}
}
function hideMe(divID){
	document.getElementById(divID).style.display="none";
	document.getElementById("bodyTrans").style.visibility="hidden";
}

function hideElement1(input){
	var elems = document.getElementsByTagName('tr');
	for(var i=0; i< elems.length; i++)
	{	
		
		if(elems[i].name==input){
			if(elems[i].style.display=="none"){
				elems[i].style.display="inline";
			}else{
				elems[i].style.display="none";
			}
		}
	}
}
function hideColumn(elemName, group){
	var x =document.getElementById("tableQuesBC").rows[0].cells;
	var ttext = ( $('show_col_'+elemName).src.indexOf('Show') != -1 ) ? 'Hide' : 'Show';
	var formGrp;
	var formCol;
	if(elemName.match(/B/)){
		formGrp="B";
		formCol=3;
	}else if(elemName.match(/C/)){
		formGrp="C";
		formCol=5;
	}
	if(ttext=="Show"){
		if(document.getElementById("header"+formGrp).style.display=="none"){
			$$('th.Col_'+formGrp).map(Element.extend).invoke('toggle');
			x[formCol].colSpan=parseInt(group);
		}else{
			x[formCol].colSpan=(x[formCol].colSpan+parseInt(group));
		}
	}else if(ttext=="Hide"){
		if(x[formCol].colSpan-parseInt(group)<=0){
			$$('th.Col_'+formGrp).map(Element.extend).invoke('toggle');
			
		}else{
			x[formCol].colSpan=(x[formCol].colSpan-parseInt(group));
		}
	}
	toggleColumn(elemName);
}
function toggleColumn(elemName){
	$$('td.Col_'+elemName).map(Element.extend).invoke('toggle');
	var text = ( $('show_col_'+elemName).src.indexOf('Show') != -1 ) ? 'Hide' : 'Show';
	$('show_col_'+elemName).src = $('show_col_'+elemName).src.replace(/Show|Hide/, text); 
}


function sortStr2(a,b){	
	var strA = a[currentCol].toLowerCase();
	var strB = b[currentCol].toLowerCase();
	var arrStrA =  strA.split(">");
	var arrStrB =  strB.split(">");
	if(arrStrA.length==1){
		strA=arrStrA[arrStrA.length-1];
	}else{
		strA=arrStrA[arrStrA.length-2];
	}
	if(arrStrB.length==1){
		strB=arrStrB[arrStrB.length-1];
	}else{
		strB=arrStrB[arrStrB.length-2];
	}
	if (strA < strB) {	return -1;	}
	else{
		if (strA > strB){	return 1;	}
		else{	return 0;	}
	}
}
function sortStr(a,b){	
	var strA = a[currentCol].toLowerCase();
	var strB = b[currentCol].toLowerCase();
	if (strA < strB) {	return -1;	}
	else{
		if (strA > strB){	return 1;	}
		else{	return 0;	}
	}
}
function sortNum(a,b){
	var numA=a[currentCol];
	var numB=b[currentCol];
	if(isNaN(numA)){	return 0;	}
	else{
		if(isNaN(numB)){	return 0;	}
		else{	return numA-numB;	}
	}
}





function SortingTable(BodyName, HeaderName, SortCol, SortType, strType, minusPoint,headRow){
	var Body   = document.getElementById(BodyName);
	var Header = document.getElementById(HeaderName);

	var TotalRows = Body.rows.length;
	var TotalCols = Body.rows[0].cells.length;
	if (TotalRows < 1){	exit;	} 
	currentCol = SortCol;
	var SortArray = new Array(TotalRows)
	for (i=0; i < TotalRows; i++) {
		SortArray[i] = new Array(TotalCols);
		for (j=0; j < TotalCols; j++) {
			SortArray[i][j] = Body.rows[i].cells[j].innerHTML;
		}
	}
	if (SortCol == previousCol) {
		SortArray.reverse(); 
		if(arrowup==1){
			Header.rows[headRow].cells[SortCol-minusPoint].innerHTML = previousheader + '<strong><font color=\"FF9900\">&darr;</font></strong>';
			arrowup = 0;
		}else {
			Header.rows[headRow].cells[SortCol-minusPoint].innerHTML = previousheader + '<strong><font color=\"FF9900\">&uarr;</font></strong>';
			arrowup = 1;
		}
	}
	else { 	
		currentheader = Header.rows[headRow].cells[SortCol-minusPoint].innerHTML;
		if (previousheader !== ''){	
	//		Header.rows[headRow].cells[previousCol-minusPoint].innerHTML = previousheader;	
			Header.rows[prevHeadRow].cells[previousCol-prevMinusPoint].innerHTML = previousheader;	
		}
		previousheader = currentheader;	
		Header.rows[headRow].cells[SortCol-minusPoint].innerHTML = currentheader + '<strong><font color=\"FF9900\">&uarr;</font></strong>';
		arrowup = 1;	
		switch (SortType) {
		case "str":
			if(strType==1){
				SortArray.sort(sortStr2);
			}else{
				SortArray.sort(sortStr);
			}
			break;
		case "num":
			SortArray.sort(sortNum);
			break;
		default:
			SortArray.sort();
		}
	}

	for (i=0; i < TotalRows; i++) {
		for (j=0; j < TotalCols; j++) {
			Body.rows[i].cells[j].innerHTML  = SortArray[i][j];
		}
	}
	previousCol = SortCol;
	prevHeadRow = headRow;
	prevMinusPoint = minusPoint;
}

function ajaxGetFunction2(idName,idValue,idName2,idValue2,formLoc,divId){

	var divh = document.getElementById(divId).offsetHeight;
	if(idValue2==null){
		idValue2=document.getElementById(idName2).value;
	}
	var xml = getXhttp();
	if(!xml){
		alert ("Your browser does not support AJAX!");
		return false;
	}
	
	xml.open("POST",formLoc);
	xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xml.onreadystatechange = function() {//Call a function when the state changes.
		if(xml.readyState == 4 && xml.status == 200) {
			
			if(trim(xml.responseText)=="session_end_refresh_page"){
				parent.location='index.jsp';
			}	
			document.getElementById(divId).innerHTML=xml.responseText;
		}else{
			
			document.getElementById(divId).innerHTML="<center><div style='height:"+divh+"px' ><img src='image/loadingIndicatorBig.gif'/></div></center>";
		}
	}

	if(idName==null){
		xml.send(idName2+"="+escape(idValue2));
	}else{
		xml.send(idName+"="+escape(idValue)+"&"+idName2+"="+escape(idValue2));
	}
	
	return true;
}

function ajaxGetFunction3(idName,idValue,idName2,idValue2,idName3,idValue3,formLoc,divId){

	var divh = document.getElementById(divId).offsetHeight;
	if(idValue2==null){
		idValue2=document.getElementById(idName2).value;
	}else{
		idValue2=document.getElementById(idValue2).value;
	}
	if(idName3!=null){
		idValue3=document.getElementById(idValue3).value;
	}
	
	var xml = getXhttp();
	if(!xml){
		alert ("Your browser does not support AJAX!");
		return false;
	}
	xml.open("POST",formLoc);
	xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xml.onreadystatechange = function() {//Call a function when the state changes.
		if(xml.readyState == 4 && xml.status == 200) {
			if(trim(xml.responseText)=="session_end_refresh_page"){
				parent.location='index.jsp';
			}	
			document.getElementById(divId).innerHTML=xml.responseText;
		}else{
			document.getElementById(divId).innerHTML="<center><div style='height:"+divh+"px' ><img src='image/loadingIndicatorBig.gif'/></div></center>";
		}
	}

	if(idName3==null){
		xml.send(idName+"="+escape(idValue)+"&"+idName2+"="+escape(idValue2));
	}else{
		xml.send(idName+"="+escape(idValue)+"&"+idName2+"="+escape(idValue2)+"&"+idName3+"="+escape(idValue3));
	}
	
	return true;
}
function ajaxGetFunction4(idName,idValue,idName2,idValue2,formLoc,divId){
	var divh = document.getElementById(divId).offsetHeight;
	var sendText="";
	for(tempi=0;tempi<idName2.length;tempi++){
		if(tempi==0){
			if(idName==null){
				sendText=idName2[tempi]+"="+escape(document.getElementById(idValue2[tempi]).value);
			}else{
				sendText=idName+"="+escape(idValue)+"&"+idName2[tempi]+"="+escape(document.getElementById(idValue2[tempi]).value);
			}
		}else{
			sendText += "&"+idName2[tempi]+"="+escape(document.getElementById(idValue2[tempi]).value);
		}
	}
	var xml = getXhttp();
	if(!xml){
		alert ("Your browser does not support AJAX!");
		return false;
	}
	xml.open("POST",formLoc);
	xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xml.onreadystatechange = function() {//Call a function when the state changes.
		if(xml.readyState == 4 && xml.status == 200) {
			if(trim(xml.responseText)=="session_end_refresh_page"){
				parent.location='index.jsp';
			}	
			document.getElementById(divId).innerHTML=xml.responseText;
			if((formLoc=="searchConfirmJobPage.action" && divId=="queryConfirmJobDiv")||(formLoc=="searchConfirmJobPageAdmin.action" && divId=="queryConfirmJobDiv")){
				document.getElementById("employeeId").disabled=false;
			}
		}else{
			document.getElementById(divId).innerHTML="<center><div style='height:"+divh+"px' ><img src='image/loadingIndicatorBig.gif'/></div></center>";
		}
	}
	xml.send(sendText);
	return true;
}

function ajaxGetFunction(idName,idValue,formLoc,divId,isTable){
	var xml = getXhttp();
	if(!xml){
		alert ("Your browser does not support AJAX!");
		return false;
	}
	xml.open("POST",formLoc);
	xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xml.onreadystatechange = function() {//Call a function when the state changes.
		if(xml.readyState == 4 && xml.status == 200) {
			if(trim(xml.responseText)=="session_end_refresh_page"){
				parent.location='index.jsp';
			}
			if(isTable==1){
				document.getElementById(divId).cells[0].innerHTML=xml.responseText;
			}else{
				document.getElementById(divId).innerHTML=xml.responseText;
			}
		}else{
			if(isTable==1){
				var t = document.getElementById(divId); 
				for(i=0;i<t.cells.length;i++){
					if(i==0){
						t.cells[i].colSpan=20;
						t.cells[i].innerHTML="<img src='image/loadingIndicatorSmall.gif'/>";
					}else{
						t.deleteCell(i);
					}
				}
			}else{
				document.getElementById(divId).innerHTML="<center><img src='image/loadingIndicatorSmall.gif'/></center>";
			}
		}
	}
	
	xml.send(idName+"="+escape(idValue));
	return true;
}
function showStatusPanel(divID){
	dojo.style(divID,"opacity",0);
	dojo.style(divID,"display","block");
	var fadeArgs={
			node:divID,
			onEnd:function(){
				dojo.fadeIn({node:"bodyTrans",onEnd:function(){dojo.style("bodyTrans","filter","alpha(opacity=50)");}}).play();
			}
	};
	dojo.style("bodyTrans","display","block");
	dojo.style("bodyTrans","opacity",0);
	dojo.style("bodyTrans","visibility","visible");
	document.getElementById(divID).style.display="block";	
	document.getElementById("bodyTrans").style.width=document.body.scrollWidth+100;
	dojo.fadeIn(fadeArgs).play();
}
function hideMeStatus(divID){
	
	var fadeArgs={
		node:divID,
		onEnd: function(){
			parent.document.getElementById(divID).style.display="none";
			backgroundAnime.play();
		}
	};
	dojo.fadeOut(fadeArgs).play();
	var backgroundAnime=dojo.fadeOut({node:"bodyTrans"});
	dojo.connect(backgroundAnime,"onEnd",function(){
		parent.document.getElementById("bodyTrans").style.visibility="hidden";
		parent.document.getElementById("bodyTrans").style.display="none";
	});
}

function hideElement2(input){
	var elems = document.getElementById(input);
	if(elems.style.display=="none"){
		elems.style.display="inline";
	}else{
		elems.style.display="none";
	}
}

function startUploadFile(id1,id2){   
	document.getElementById(id1).innerHTML ="<img src='image/loadingIndicatorSmall.gif'/>Uploading...";
	document.getElementById(id2).style.display ='none';  
	     
	return true;
}

function ajaxPasswordVerify(idName,idValue,idName2,idValue2,formLoc,divId){
	var divh = document.getElementById(divId).offsetHeight;
	if(idValue2==null){
		idValue2=document.getElementById(idName2).value;
	}
	var xml = getXhttp();
	if(!xml){
		alert ("Your browser does not support AJAX!");
		return false;
	}
	xml.open("POST",formLoc);
	xml.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
	xml.onreadystatechange = function() {//Call a function when the state changes.
		if(xml.readyState == 4 && xml.status == 200) {
			if(trim(xml.responseText)=="session_end_refresh_page"){
				parent.location='index.jsp';
			}	
			if(trim(xml.responseText)=="success"){
				document.getElementById("verifyUserPasswordTd").innerHTML="Verification successful. Please wait as system is in process.... <img src='image/loadingIndicatorSmall.gif'/>";
				
				document.forms[approveFormId].submit();
			}else if(trim(xml.responseText)=="fail"){
				document.getElementById(divId).innerHTML="<font color='red'>Sorry, Incorrect username or password. Verification Failed!</font>";
				document.getElementById("account.accUsername2").Value="";
				document.getElementById("account.accPassword2").Value="";
			}
			
		}else{
			
			document.getElementById(divId).innerHTML="<center><div style='height:"+divh+"px' ><img src='image/loadingIndicatorBig.gif'/></div></center>";
		}
	}
	if(idName==null){
		xml.send(idName2+"="+escape(idValue2));
	}else{
		xml.send(idName+"="+escape(idValue)+"&"+idName2+"="+escape(idValue2));
	}
	return true;
}