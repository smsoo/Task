<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to Task Butcher</title>
<link href="include/main.css" rel="stylesheet" type="text/css">
<link href="include/styles.css" rel="stylesheet" type="text/css">
<link href="include/custom.css" rel="stylesheet" type="text/css">
<!-- link rel="stylesheet" type="text/css" href="script/dijit/themes/tundra_mod/tundra.css"/ -->
 <script type="text/javascript" src="script/dojo/dojo.js"   djConfig="parseOnLoad: true"></script>
<SCRIPT language=javascript src="script/common.js"></SCRIPT>

<script language="javascript">
var isIE = document.all;
var mouseX = 0;
var mouseY = 0;
var approveFormId="";
function getMouseXY(e)
{ 
  if (!e) e = window.event;
  if (e)
  { 
  	mouseX = isIE ? (e.clientX + document.body.scrollLeft) : e.pageX;
  	mouseY = isIE ? (e.clientY + document.body.scrollTop+ document.documentElement.scrollTop) : e.pageY;
  }
}


function getUrlVars(){    
	var vars = [], hash;    
	var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');     
	for(var i = 0; i < hashes.length; i++)    {        
		hash = hashes[i].split('=');        
		vars.push(hash[0]);        
		vars[hash[0]] = hash[1];    
	}     
	return vars;
}
var urlParam=getUrlVars();
if(urlParam["innerLoc"]){
	if(urlParam["employee.empId"]){
		parent.location.href=window.location.href.split("?")[0]+"?employee.empId="+urlParam["employee.empId"]+"#"+urlParam["innerLoc"];
	}else{
		parent.location.href=window.location.href.split("?")[0]+"?#"+urlParam["innerLoc"];
	}
}

//*****************************************************************************
// Do not remove this notice.
//
// Copyright 2001 by Mike Hall.
// See http://www.brainjar.com for terms of use.
//*****************************************************************************

// Determine browser and version.

function Browser() {

  var ua, s, i;

  this.isIE    = false;
  this.isNS    = false;
  this.version = null;

  ua = navigator.userAgent;

  s = "MSIE";
  if ((i = ua.indexOf(s)) >= 0) {
    this.isIE = true;
    this.version = parseFloat(ua.substr(i + s.length));
    return;
  }

  s = "Netscape6/";
  if ((i = ua.indexOf(s)) >= 0) {
    this.isNS = true;
    this.version = parseFloat(ua.substr(i + s.length));
    return;
  }

  // Treat any other "Gecko" browser as NS 6.1.

  s = "Gecko";
  if ((i = ua.indexOf(s)) >= 0) {
    this.isNS = true;
    this.version = 6.1;
    return;
  }
}

var browser = new Browser();

// Global object to hold drag information.

var dragObj = new Object();
dragObj.zIndex = 0;

function dragStart(event, id) {

  var el;
  var x, y;
  // If an element id was given, find it. Otherwise use the element being
  // clicked on.

  if (id){
    dragObj.elNode = document.getElementById(id);
	 if (dragObj.elNode.nodeType == 3)
      dragObj.elNode = document.getElementById(id);
  }else {
    if (browser.isIE)
      dragObj.elNode = window.event.srcElement;
    if (browser.isNS)
      dragObj.elNode = event.target;
    // If this is a text node, use its parent element.
    if (dragObj.elNode.nodeType == 3)
      dragObj.elNode = dragObj.elNode.parentNode;
  }


  // Get cursor position with respect to the page.

  if (browser.isIE) {
    x = window.event.clientX + document.documentElement.scrollLeft
      + document.body.scrollLeft;
    y = window.event.clientY + document.documentElement.scrollTop
      + document.body.scrollTop;
  }
  if (browser.isNS) {
    x = event.clientX + window.scrollX;
    y = event.clientY + window.scrollY;
  }

  // Save starting positions of cursor and element.

  dragObj.cursorStartX = x;
  dragObj.cursorStartY = y;
  dragObj.elStartLeft  = parseInt(dragObj.elNode.style.left, 10);
  dragObj.elStartTop   = parseInt(dragObj.elNode.style.top,  10);

  if (isNaN(dragObj.elStartLeft)) dragObj.elStartLeft = 0;
  if (isNaN(dragObj.elStartTop))  dragObj.elStartTop  = 0;

  // Update element's z-index.

  //dragObj.elNode.style.zIndex = ++dragObj.zIndex;
  // Capture mousemove and mouseup events on the page.

  if (browser.isIE) {
    document.attachEvent("onmousemove", dragGo);
    document.attachEvent("onmouseup",   dragStop);
    window.event.cancelBubble = true;
    window.event.returnValue = false;
  }
  if (browser.isNS) {
    document.addEventListener("mousemove", dragGo,   true);
    document.addEventListener("mouseup",   dragStop, true);
    event.preventDefault();
  }
}

function dragGo(event) {
 // alert('go');
  var x, y;

  // Get cursor position with respect to the page.

  if (browser.isIE) {
    x = window.event.clientX + document.documentElement.scrollLeft
      + document.body.scrollLeft;
    y = window.event.clientY + document.documentElement.scrollTop
      + document.body.scrollTop;
  }
  if (browser.isNS) {
    x = event.clientX + window.scrollX;
    y = event.clientY + window.scrollY;
  }

  // Move drag element by the same amount the cursor has moved.

  dragObj.elNode.style.left = (dragObj.elStartLeft + x - dragObj.cursorStartX) + "px";
  dragObj.elNode.style.top  = (dragObj.elStartTop  + y - dragObj.cursorStartY) + "px";

  if (browser.isIE) {
    window.event.cancelBubble = true;
    window.event.returnValue = false;
  }
  if (browser.isNS)
    event.preventDefault();
}

function dragStop(event) {
  // Stop capturing mousemove and mouseup events.
  if (browser.isIE) {
    document.detachEvent("onmousemove", dragGo);
    document.detachEvent("onmouseup",   dragStop);
  }
  if (browser.isNS) {
    document.removeEventListener("mousemove", dragGo,   true);
    document.removeEventListener("mouseup",   dragStop, true);
  }
}

</script>
</head>
<body  text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:set name="accSession" value="#session.loginSess"></s:set>
<s:set name="selectPage" value="page"></s:set>

<table border="0" cellspacing="0" cellpadding="0" width="100%">
<tr><td colspan="2">
<s:include value="include/header.jsp"/>
</td></tr>
<tr bgcolor="#016D5E"><td colspan="2" > &nbsp;<font color="#FFFFFF"><b>Welcome <s:set name="accSession" value="#session.loginSess"></s:set><s:if test="#accSession!=null"><s:property value="#accSession.user.userName"/></s:if> </b></font> &nbsp;</td></tr>
<tr bgcolor="#FFFFFF" ><td width="1000px">
<s:include value="include/navigator.jsp"/>
</td><td bgcolor="#FFFFFF">&nbsp;</td></tr>

<tr><td width="1000px">
<s:if test="#selectPage==null">
	<s:if test="accSession.accType==1">
		<s:include value="content/inbox.jsp"/>
	</s:if>
	
</s:if>
<s:elseif test='#selectPage=="user"'>
	<s:include value="content/user.jsp"/>
</s:elseif>

<s:elseif test='#selectPage=="search"'>
	<s:include value="content/search.jsp"/>
</s:elseif>

</td></tr>
</table>

<div id="bodyTrans" class="transparent_class">
<table height=100% >
<tr  id="transRow" height="500px"><td>&nbsp;</td></tr>
</table>
</div> 



<script language="javascript">
document.onmousemove = getMouseXY;
<%if(request.getParameter("loginError")!=null){%>
mouseX=600;
mouseY=200;
showLoginPanel();
<%}%>
 //function show_win_login()
 //{

	// var wshshell=new ActiveXObject("wscript.shell");
	// var username=wshshell.ExpandEnvironmentStrings("%username%"); 
	// alert(username);  
 //}

</script>

</body>
</html>