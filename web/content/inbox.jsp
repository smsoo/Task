<%@ taglib prefix="s" uri="/struts-tags" %>
<SCRIPT language=javascript src="script/popcalendar.js"></SCRIPT>
<table width="995" border="0" cellspacing="0" cellpadding="0" class="mt">
<tr>
	<td class="hdl-sm-line" width="369" colspan="2"><img src="image/trans.gif" width="1" height="1" border="0" alt=""></td>
		</tr>
			<tr>
				<td class="hdl-sm" width="342">
					Total Job Code Status
				</td>
				<td width="72" background="image/header_bg.gif">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td class="hdl-sm-line" width="369" colspan="2"><img src="image/trans.gif" width="1" height="1" border="0" alt=""></td>
			</tr>
</table>
<br><br>
<table border="0" width="870" cellspacing=1 cellpadding=5 class="generalTable" style="margin-left:auto; margin-right:auto;">
	<thead id="tblHead">
	<tr class="head"><th>Job Code Status [<a href="javascript:void(0)" onclick="hideElement2('tblBody')">Hide/Unhide</a>]</th><th>Total</th></tr>
	</thead>
	<tbody id="tblBody" >
	<tr>
		<td><a href="javascript:void(0)" onclick="ajaxGetFunction2('newPosition.npStatus','0','displayFunc','queryJobStatus','queryJobStatus.action','queryJobStatusDiv');"/>New Submission/Resubmission</a></td><td><s:property value="integerArr[0]"/></td>
	</tr>
	<tr>
		<td><a href="javascript:void(0)" onclick="ajaxGetFunction2('newPosition.npStatus','1','displayFunc','queryJobStatus','queryJobStatus.action','queryJobStatusDiv');"/>Request for more information : pending</a></td><td><s:property value="integerArr[1]"/></td>
	</tr>
	<tr>
		<td><a href="javascript:void(0)" onclick="ajaxGetFunction2('newPosition.npStatus','2','displayFunc','queryJobStatus','queryJobStatus.action','queryJobStatusDiv');"/>Request for more information : submitted</a></td><td><s:property value="integerArr[2]"/></td>
	</tr>
	<tr>
		<td><a href="javascript:void(0)" onclick="ajaxGetFunction2('newPosition.npStatus','3','displayFunc','queryJobStatus','queryJobStatus.action','queryJobStatusDiv');"/>Approval : Requestor</a></td><td><s:property value="integerArr[3]"/></td>
	</tr>
	<tr>
		<td><a href="javascript:void(0)" onclick="ajaxGetFunction2('newPosition.npStatus','4','displayFunc','queryJobStatus','queryJobStatus.action','queryJobStatusDiv');"/>Approval : 1st Level</a></td><td><s:property value="integerArr[4]"/></td>
	</tr>
	<tr>
		<td><a href="javascript:void(0)" onclick="ajaxGetFunction2('newPosition.npStatus','5','displayFunc','queryJobStatus','queryJobStatus.action','queryJobStatusDiv');"/>Approval : 2nd Level</a></td><td><s:property value="integerArr[5]"/></td>
	</tr>
	<tr>
		<td><a href="javascript:void(0)" onclick="ajaxGetFunction2('newPosition.npStatus','6','displayFunc','queryJobStatus','queryJobStatus.action','queryJobStatusDiv');"/>Job Description Publication : Pending</a></td><td><s:property value="integerArr[6]"/></td>
	</tr>
	<tr>
		<td><a href="javascript:void(0)" onclick="ajaxGetFunction2('newPosition.npStatus','8','displayFunc','queryJobStatus','queryJobStatus.action','queryJobStatusDiv');"/>Job Description Publication : Completed</a></td><td><s:property value="integerArr[8]"/></td>
	</tr>
	<tr>
		<td><a href="javascript:void(0)" onclick="ajaxGetFunction2('newPosition.npStatus','7','displayFunc','queryJobStatus','queryJobStatus.action','queryJobStatusDiv');"/>Rejected Application</a></td><td><s:property value="integerArr[7]"/></td>
	</tr>
	</tbody>
</table>
<br>

<div id="queryJobStatusDiv">
<s:actionmessage/>
</div>
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
function stopUpload(id){
	ajaxGetFunction2('newPosition.npId',id,'displayFunc','newPositionDetail','newPositionDetail.action','queryJobStatusDiv');
}
function validateAllFields(){
	var msg="The following field(s) are empty:\n";
	var isEmpty=false;
	if(trim(document.getElementById("proKnowledgeRequireDiv").innerHTML)==""){
		msg+="Professional Knowledge is empty \n";
		isEmpty=true;
	}
	if(trim(document.getElementById("proCustomKnowledgeRequireDiv").innerHTML)==""){
		msg+="Custom Type Professional Knowledge is empty \n";
		isEmpty=true;
	}
	if(document.getElementById("jobFamilySaveButton")!=null && trim(document.getElementById("jobFamilySaveButton").value)=="Save"){
		msg+="Job Family is empty \n";
		isEmpty=true;
	}
	if(trim(document.getElementById("authorityMapDiv").innerHTML)==""){
		msg+="Limit and Authorization is empty \n";
		isEmpty=true;
	}
	if(trim(document.getElementById("dimensionMapDiv").innerHTML)==""){
		msg+="Job Dimension is empty \n";
		isEmpty=true;
	}
	if(document.getElementById("effectiveDateSaveButton")!=null&&trim(document.getElementById("effectiveDateSaveButton").value)==""){
		msg+="You did not select effective date. \n";
		isEmpty=true;
	}
	if(isEmpty){
		msg+="Are you sure you want to proceed? ";
		var isConfirm=confirm(msg);
		if(isConfirm){
			return true;
		}else{
			return false;
		}
	}else{
		return true;
	}
}
function checkRouteToUserConfirm(){
	if(validateAllFields()){
		if(confirm('Are you sure you want to route to user for confirmation?')){
			return true;
		}else{
			return false;
		}
	}else{
		return false;
	}
}
function validatePostLiveDb(){
	if(validateAllFields()){
		if(confirm('Are you sure you want to confirm and post this job into live system?')){
			return true;
		}else{
			return false;
		}
	}else{
		return false;
	}
}

</script>