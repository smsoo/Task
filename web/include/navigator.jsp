<%@ taglib prefix="s" uri="/struts-tags" %>
<table border="0" cellspacing="0" cellpadding="0" class="navilayout" width="996">
<tr>
<s:set name="accSession" value="#session.loginSess"></s:set>
<s:set name="adSession" value="#session.approvalSess"></s:set>
<s:set name="selectPage" value="page"></s:set>
<s:set name="currentPage" value="1"></s:set>
<s:set name="addPage" value="0"></s:set>
<s:set name="selectSection" value="section"></s:set>
<s:if test="#selectPage==null">
	 <script language="javascript">
		parent.location.href="loadMainPage.action";
	 </script>
</s:if>
<s:if test="#accSession!=null"> 
	<s:if test="#accSession.accType==1">
		<td <s:if test='#selectPage=="inbox"'>class="selectednavi" <s:set name="addPage" value="1"></s:set></s:if><s:elseif test="#addPage==0"><s:set name="currentPage" value="#currentPage+1"></s:set></s:elseif>>
		<a href ="inbox.action"  onclick="return navigationLoading();"><b>Inbox</b></a></td>
		
		<td <s:if test='#selectPage=="adminSetting"'>class="selectednavi" <s:set name="addPage" value="1"></s:set></s:if><s:elseif test="#addPage==0"><s:set name="currentPage" value="#currentPage+1"></s:set></s:elseif>>
		<a href ="setting.action"  onclick="return navigationLoading();"><b>Setting</b></a></td>
		
		
	</s:if>
	<s:elseif test="#accSession.accType==0">
		
				<td <s:if test='#selectPage=="post"'>class="selectednavi" <s:set name="addPage" value="1"></s:set></s:if><s:elseif test="#addPage==0"><s:set name="currentPage" value="#currentPage+1"></s:set></s:elseif>>
				<a href ="post.action"  onclick="return navigationLoading();"><b>Post</b></a></td>
				<td <s:if test='#selectPage=="browse"'>class="selectednavi" <s:set name="addPage" value="1"></s:set></s:if><s:elseif test="#addPage==0"><s:set name="currentPage" value="#currentPage+1"></s:set></s:elseif>>
				<a href ="browse.action"  onclick="return navigationLoading();"><b>Browse</b></a></td>
				<td <s:if test='#selectPage=="approverevision"'>class="selectednavi" <s:set name="addPage" value="1"></s:set></s:if><s:elseif test="#addPage==0"><s:set name="currentPage" value="#currentPage+1"></s:set></s:elseif>>
				<a href ="viewApprovalRevision.action"  onclick="return navigationLoading();"><b>Test</b></a></td>
		

		
	</s:elseif>
</s:if>
<s:else>
<td width="70%" <s:if test='#selectPage=="search"'>class="selectednavi" <s:set name="addPage" value="1"></s:set></s:if><s:elseif test="#addPage==0"><s:set name="currentPage" value="#currentPage+1"></s:set></s:elseif>>
<a href ="loadMainPage.action"  onclick="return navigationLoading();"><b>HOME</b></a></td>
<td>
<input type="hidden" id="test1" name="test1" value="1"/>
<input type="hidden" id="test2" name="test2" value="2"/>
<a href="javascript:void(0)" onclick="showLoginAjax('1','2','statusDetailDiv')" ><b>LOGIN</b></a></td>
</s:else>
<s:if test="#accSession!=null">
<td>

<a href="logoutAccount.action" onclick="return navigationLoading();" ><b>Logout</b></a></td>
</s:if>
</tr>
<tr height="5px"><td bgcolor="#00CEB5" colspan="<s:property value="#currentPage"/>"></td>
<td bgcolor="#FFFFFF" colspan="5"></td>
</tr>
</table>
<center>
<div id="naviLoadingDiv" class="loadingDiv">

</div>
</center>

<br/><br/><br/>
<iframe id="upload_target" name="upload_target" src="#" style="width:0;height:0;border:0px solid #fff;"></iframe>
<div id="statusDetailDiv" class="divClass">
	<a name="tabDivLocation"></a>
	<table border="0" id="divTable" bgcolor="#00A28A" cellspacing="0" cellpadding="5"  >
	<tr>
	<td width="100%">
	  <table border="0" width="100%" cellspacing="0" cellpadding="0">
	  <tr>
	  <td id="titleBar" width="100%" style="cursor:move"  onmousedown="dragStart(event,'statusDetailDiv')"><span class="popupTitle" id="frameTitle">Detail</span></td>
	  <td style="cursor:hand" valign="top"><a href="#" onClick="hideMeStatus('statusDetailDiv');return false"><span class="popupTitle">X</span></a>
		</td>
	  </tr>
	  <tr>
	  <td id="statusDetailTd" width="100%" bgcolor="#FFFFFF" style="padding:5px" colspan="2">
		
		
	  </td>
	  </tr>
	  </table>  
	</td>
	</tr>
	</table>
</div>

<script language="javascript">
	

	function validate(){
		return true;
	}
	
	function showLoginAjax(id,id2,divID){

		ajaxGetFunction2('test1',id,'test2',id2,'login.action','statusDetailTd');
		showStatusPanel(divID);	
		document.getElementById("transRow").style.height=document.body.scrollHeight+400;
		document.getElementById("transRow").style.width=document.body.scrollWidth+100;
		document.getElementById("bodyTrans").style.width=document.body.scrollWidth+100;
		mouseX=mouseX-500;
		mouseY=mouseY-100;
		document.getElementById("statusDetailDiv").style.left=mouseX+"px";
		document.getElementById("statusDetailDiv").style.top=mouseY+"px";
		document.getElementById("frameTitle").innerHTML="Login";
	}
</script>