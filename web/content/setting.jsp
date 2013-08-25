<%@ taglib prefix="s" uri="/struts-tags" %>
<table width="995" border="0" cellspacing="0" cellpadding="0" class="mt">
<tr>
	<td class="hdl-sm-line" width="369" colspan="2"><img src="image/trans.gif" width="1" height="1" border="0" alt=""></td>
		</tr>
			<tr>
				<td class="hdl-sm" width="342">
					Setting
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
<s:if test='section=="jobFamily"'>
	<div id="div_job_family">
		<table border="0" width="800" cellspacing=1 cellpadding=5 class="generalTable" style="margin-left:auto; margin-right:auto;">
		<tr class="head"><th colspan="5">Job Family</th></tr>
	  	<s:iterator value="jobFamilies" status="stat">
	  		<tr id="div_jf_<s:property value="jfId"/>">
	  			<td><s:property value="jfCode"/></td><td><s:property value="jfText"/></td>
	  			<td><input type="button" value="Edit" onclick="ajaxGetFunction('jobFamily.jfId','<s:property value="jfId"/>','editJobFamily.action','div_jf_<s:property value="jfId"/>','1');"/></td>
	  			<td><input type="button" value="Delete" onclick="if(confirm('Are you sure you want to delete this Job Family?')){ajaxGetFunction('jobFamily.jfId','<s:property value="jfId"/>','deleteJobFamily.action','div_job_family',0);}"/></td>
	  		</tr>
	  	</s:iterator>
		</table>
		<div id="td_div_job_family">
		<center>
		<input type="button" value="Add New Job Family" onclick="showJobFamilyInputBox()"/>
	  	</center>
	  	</div>
  	</div>
</s:if>
<s:elseif test='section=="approvalDetail"'>
	<div id="div_approval_detail">
		<table border="0" width="800" cellspacing=1 cellpadding=5 class="generalTable" style="margin-left:auto; margin-right:auto;">
		<tr class="head"><th>Employee Id</th><th>Name</th><th>Approval Level</th><th>Email</th><th>Approval Is Admin?</th><th>Edit</th><th>Delete</th></tr>
	  	<s:iterator value="approvalDetails" status="stat">
	  		<tr id="div_ad_<s:property value="adId"/>">
	  			<td><s:property value="adApproveId"/></td>
	  			<td><s:property value="adApproveName"/></td>
	  			<td><s:property value="adApproveLevel"/></td>
	  			<td><s:property value="adEmail"/></td>
	  			<td><s:property value="adIsAdmin"/></td>
	  			<td><input type="button" value="Edit" onclick="ajaxGetFunction('approvalDetail.adId','<s:property value="adId"/>','editApprovalDetail.action','div_ad_<s:property value="adId"/>', '1');"/></td>
	  			<td><input type="button" value="Delete" onclick="if(confirm('Are you sure you want to delete this Approval?')){ajaxGetFunction('approvalDetail.adId','<s:property value="adId"/>','deleteApprovalDetail.action','div_approval_detail',0);}"/></td>
	  		</tr>
	  	</s:iterator>
		</table>
		<div id="td_div_approval_detail">
		<center>
		<input type="button" value="Add New Approval" onclick="showApprovalInputBox()"/>
	  	</center>
	  	</div>
  	</div>
</s:elseif>
<s:elseif test='section=="proKnowledge"'>
	<div id="div_pro_knowledge">
		<table border="0" width="800" cellspacing=1 cellpadding=5 class="generalTable" style="margin-left:auto; margin-right:auto;">
		<tr class="head"><th colspan="5">Professional Knowledge</th></tr>
	  	<s:iterator value="proKnowledges" status="stat">
	  		<tr id="div_pk_<s:property value="pkId"/>">
	  			<td><s:property value="pkText"/></td>
	  			<td><input type="button" value="Edit" onclick="ajaxGetFunction('proKnowledge.pkId','<s:property value="pkId"/>','editProKnowledge.action','div_pk_<s:property value="pkId"/>', '1');"/></td>
	  			<td><input type="button" value="Delete" onclick="if(confirm('Are you sure you want to delete this Professional Knowledge?')){ajaxGetFunction('proKnowledge.pkId','<s:property value="pkId"/>','deleteProKnowledge.action','div_pro_knowledge',0);}"/></td>
	  		</tr>
	  	</s:iterator>
		</table>
		<div id="td_div_pro_knowledge">
		<center>
		<input type="button" value="Add New Professional Knowledge" onclick="showProKnowledgeInputBox()"/>
	  	</center>
	  	</div>
  	</div>
</s:elseif>
<s:elseif test='section=="main"'>
	<div id="div_main_setting">
		<table border="0" width="800" cellspacing=1 cellpadding=5 class="generalTable" style="margin-left:auto; margin-right:auto;">
		<tr class="head"><th>Document Number</th><th>Document Version</th><th>Total Number of Approval</th><th>Recruitment Email</th><th>Doc Date</th><th>Edit</th></tr>
	  	<s:iterator value="mainSettings" status="stat">
	  		<tr id="div_ms_<s:property value="msId"/>">
	  			<td><s:property value="msDocNo"/></td>
	  			<td><s:property value="msDocVersion"/></td><td><s:property value="msNoApproval"/></td>
	  			<td><s:property value="msRecruitEmail"/></td>
	  			<td><s:date name="msDocDate" format="yyyy/MM/dd"/></td>
	  			<td><input type="button" value="Edit" onclick="ajaxGetFunction('mainSetting.msId','<s:property value="msId"/>','editMainSetting.action','div_ms_<s:property value="msId"/>', '1');"/></td>
	  		</tr>
	  	</s:iterator>
		</table>
		<div id="td_div_main_setting">
		<s:if test="mainSettings==null || mainSettings.size==0">
		<center>
		<input type="button" value="Add New Main Setting" onclick="showMainSettingInputBox()"/>
	  	</center>
	  	</s:if>
	  	</div>
  	</div>
  	
  	<br><br><br>
  	<center>
  	<input type="button" id="viewChangesButton" value="View Update Changes to Live Database" onclick="viewDbChanges()"/>
  	</center>
  	<div id="liveDbDiv">
  	</div>
</s:elseif>
<s:elseif test='section=="jobDimension"'>
	<div id="div_job_dimension">
		<table border="0" width="800" cellspacing=1 cellpadding=5 class="generalTable" style="margin-left:auto; margin-right:auto;">
		<tr class="head"><th>Dimension Code</th><th>Code Desc</th><th>Career Stream</th><th>Edit</th><th>Delete</th></tr>
	  	<s:iterator value="jobDimensions" status="stat">
	  		<tr id="div_jdm_<s:property value="jdmCode"/>">
	  			<td><s:property value="jdmCode"/></td>
	  			<td><s:property value="jdmCodeDesc"/></td>
	  			<td><s:property value="jdmCareerStream"/></td>
	  			<td><input type="button" value="Edit" onclick="ajaxGetFunction('jobDimension.jdmCode','<s:property value="jdmCode"/>','editJobDimension.action','div_jdm_<s:property value="jdmCode"/>', '1');"/></td>
	  			<td><input type="button" value="Delete" onclick="if(confirm('Are you sure you want to delete this dimension?')){ajaxGetFunction('jobDimension.jdmCode','<s:property value="jdmCode"/>','deleteJobDimension.action','div_job_dimension',0);}"/></td>
	  		</tr>
	  	</s:iterator>
		</table>
		<div id="td_div_job_dimension">
		<center>
		<input type="button" value="Add New Job Dimension" onclick="showJobDimensionInputBox()"/>
	  	</center>
	  	</div>
	  	<div id="hiddenJobDimension" style='margin-left:auto; margin-right:auto;display:none;'>
			<table border='0' style='margin-left:auto; margin-right:auto;'>
			<tr><td>Job Dimension Code</td><td><input type='text' id='jobDimension.jdmCode'/></td></tr>
			<tr><td>Dimension Code Description</td><td> <input type='text' id='jobDimension.jdmCodeDesc'/></td></tr>
			<tr>
				<td>Career Stream</td>
				<td>
				<s:if test="stringList!=null">
					<input type="radio" name="radioCs" id="radioCs1" value="jobDimension.jdmCareerStreamSelect">Select
					<input type="radio" name="radioCs" id="radioCs2" value="jobDimension.jdmCareerStreamText">Type New
					<br>
					Existing
					<select id="jobDimension.jdmCareerStreamSelect">
						<s:iterator value="stringList" id="sl" status="stat">
						<option value="<s:property value="sl"/>"><s:property value="sl"/></option>
						</s:iterator>
					</select>
					<br>
					Type New<input type='text' size="50" id="jobDimension.jdmCareerStreamText"/>
				</s:if>
				<s:else>
					<input type='text' size="50" id="jobDimension.jdmCareerStreamText"/>
				</s:else>
				</td>
			</tr>
			</table>
			<br><center><input type='button' value='Save' onclick="addNewJdm()"/>
			</center>
	  	</div>
  	</div>
  	
  	
  	<br><br><br>
<center>Sort By 
  	<select id="jddSortList" onchange="sortDimensionDetail();">
  		<option value=""/>None</option>
  		<option value="jddText">Job Dimension</option>
  		<option value="jobDimension.jdmCode">Dimension Code</option>
  	</select>
</center>
  	<div id="div_dimension_detail">
		<table border="0" width="800" cellspacing=1 cellpadding=5 class="generalTable" style="margin-left:auto; margin-right:auto;">
		<tr class="head"><th>Dimension Code</th><th>Job Dimension</th><th>Job Dimension Description</th><th>Edit</th><th>Delete</th></tr>
	  	<s:iterator value="jobDimensionDetails" status="stat">
	  		<tr id="div_jdd_<s:property value="jddId"/>">
	  			<td><s:property value="jobDimension.jdmCode"/></td>
	  			<td><s:property value="jddText"/></td>
	  			<td><s:property value="jddTextDesc.replaceAll('\n','<br>')" escape="false"/></td>
	  			<td><input type="button" value="Edit" onclick="ajaxGetFunction('jobDimensionDetail.jddId','<s:property value="jddId"/>','editJobDimensionDetail.action','div_jdd_<s:property value="jddId"/>', '1');"/></td>
	  			<td><input type="button" value="Delete" onclick="if(confirm('Are you sure you want to delete this dimension detail?')){ajaxGetFunction('jobDimensionDetail.jddId','<s:property value="jddId"/>','deleteJobDimensionDetail.action','div_dimension_detail',0);}"/></td>
	  		</tr>
	  	</s:iterator>
		</table>
		<div id="td_div_dimension_detail">
		<center>
		<input type="button" value="Add New Dimension Detail" onclick="showDimensionDetailInputBox()"/>
	  	</center>
	  	</div>
	  	<div id="hiddenDimensionDetail" style='margin-left:auto; margin-right:auto;display:none;'>
			<table border='0' style='margin-left:auto; margin-right:auto;'>
			<tr><td>Job Dimension Code</td>
				<td id="selectJobDimensionDetailJdmCode">
					<select id="jobDimensionDetail.jobDimension.jdmCode">
						<s:iterator value="stringList2" id="sl" status="stat">
						<option value="<s:property value="sl"/>"><s:property value="sl"/></option>
						</s:iterator>
					</select>
				</td>
			</tr>
			<tr><td>Job Dimension</td><td> <input type='text' size="50" id='jobDimensionDetail.jddText'/></td></tr>
			<tr>
				<td>Job Dimension Desc</td>
				<td>
				<textarea id="jobDimensionDetail.jddTextDesc" cols="70" rows="5"></textarea>
				</td>
			</tr>
			</table>
			<br><center><input type='button' value='Save' onclick="addNewJdd()"/>
			</center>
	  	</div>
  	</div>
  	<br><br>
  	<center>
  		<form action="exportExcel.action" method="post" target="_blank">
  			<input type="hidden" value="jobDimension" name="section"/>
  			<input type="submit" value="Export to Excel" />
  		</form>
  	</center>
</s:elseif>
<s:elseif test='section=="authority"'>
	<div id="div_authority">
		<table border="0" width="800" cellspacing=1 cellpadding=5 class="generalTable" style="margin-left:auto; margin-right:auto;">
		<tr class="head"><th colspan="5">Limit and Authorization</th></tr>
	  	<s:iterator value="authorities" status="stat">
	  		<tr id="div_au_<s:property value="auId"/>">
	  			<td><s:property value="auText"/></td>
	  			<td><input type="button" value="Edit" onclick="ajaxGetFunction('authority.auId','<s:property value="auId"/>','editAuthority.action','div_au_<s:property value="auId"/>', '1');"/></td>
	  			<td><input type="button" value="Delete" onclick="if(confirm('Are you sure you want to delete this item?')){ajaxGetFunction('authority.auId','<s:property value="auId"/>','deleteAuthority.action','div_authority',0);}"/></td>
	  		</tr>
	  	</s:iterator>
		</table>
		<div id="td_div_authority">
		<center>
		<input type="button" value="Add New Limit and Authorization" onclick="showAuthorityInputBox()"/>
	  	</center>
	  	</div>
  	</div>
</s:elseif>
<s:elseif test='section=="adminAccount"'>
	<center>
	<h2>Create New Admin Account</h2>
	<form method="post" action="addNewAdminAccount.action" onsubmit="return validateAdminInput()" >
	<table>
	<tr>
	<td>Username </td>
	<td><input type="text" name="jdAdminAccount.jdAccUsername" id="uname"/></td>
	</tr>
	<tr>
	<td>Password</td>
	<td><input type="password" name="jdAdminAccount.jdAccPassword" id="password"/></td>
	</tr>
	<tr>
	<td>Confirm Password</td>
	<td><input type="password" id="password2"/></td>
	<tr>
	<td>Admin Name</td>
	<td><input type="text" name="jdAdminAccount.jdAccName" id="name"/></td>
	<tr>
	<td>Admin Email</td>
	<td><input type="text" name="jdAdminAccount.jdAccEmail" id="email"/></td>
	<tr>
	<tr>
	<td>Employee Id</td>
	<td><input type="text" name="jdAdminAccount.jdEmpId" id="empId"/></td>
	<tr>
	<td colspan="2"><input type="submit" value="Submit & Create New Account"/></td>
	</tr>
	</table>
	</form>
	</center>
	<br>
	<h2><s:actionmessage/></h2>
	<table border="0" width="870" cellspacing=1 cellpadding=5 class="generalTable" style="margin-left:auto; margin-right:auto;">
		<tr class="head">
		<th>Name</th>
		<th>Email</th>
		<th>Employee ID</th>
		<th>Username</th>
		<th>Edit</th>
		<th>Delete</th>
		</tr>
		<s:iterator value="jdAdminAccounts" status="stat">
			<tr class="<s:if test='#stat.even'>evenRow</s:if>">
			<td><s:property value="jdAccName"/></td>
			<td><s:property value="jdAccEmail"/></td>
			<td><s:property value="jdEmpId"/></td>
			<td><s:property value="jdAccUsername"/></td>
			<td><input type="button" value="Edit" onclick="location.href='setting.action?section=editAdminAccount&jdAdminAccount.jdAccId=<s:property value="jdAccId"/>'"/></td>
			<td><input type="button" value="Delete" onclick="if(confirm('Are you sure you want to delete this admin account?')){location.href='deleteAdminAccount.action?jdAdminAccount.jdAccId=<s:property value="jdAccId"/>';}"/></td>
			</tr>
		</s:iterator>
	</table>
</s:elseif>
<s:elseif test='section=="editAdminAccount"'>
	<center>
	<h2>Edit Existing Admin Account</h2>
	<form method="post" action="editAdminAccount.action" onsubmit="return validateAdminInput()" >
	<input type="hidden" value="<s:property value="jdAdminAccount.jdAccId"/>" name="jdAdminAccount.jdAccId"/>
	<table>
	<tr>
	<td>Username </td>
	<td><input type="text" name="jdAdminAccount.jdAccUsername" id="uname" value="<s:property value="jdAdminAccount.jdAccUsername"/>"/></td>
	</tr>
	<tr>
	<td>Password</td>
	<td><input type="password" name="jdAdminAccount.jdAccPassword" id="password" value="<s:property value="jdAdminAccount.jdAccPassword"/>"/></td>
	</tr>
	<tr>
	<td>Confirm Password</td>
	<td><input type="password" id="password2" value="<s:property value="jdAdminAccount.jdAccPassword"/>"/></td>
	<tr>
	<td>Admin Name</td>
	<td><input type="text" name="jdAdminAccount.jdAccName" id="name" value="<s:property value="jdAdminAccount.jdAccName"/>"/></td>
	<tr>
	<td>Admin Email</td>
	<td><input type="text" name="jdAdminAccount.jdAccEmail" id="email" value="<s:property value="jdAdminAccount.jdAccEmail"/>"/></td>
	<tr>
	<tr>
	<td>Employee Id</td>
	<td><input type="text" name="jdAdminAccount.jdEmpId" id="empId" value="<s:property value="jdAdminAccount.jdEmpId"/>"/></td>
	<tr>
	<td colspan="2"><input type="submit" value="Update Admin Account" /></td>
	</tr>
	</table>
	</form>
	</center>
</s:elseif>
<s:else>
<br>
<br>
<h1>This section is setting/configuration on the job description content.</h1>
<br>
Changes on any section had to press the button "View Update Changes to Live Database" in main setting tab.<br>
A new revision will be created for the job code for any update.
<br><br>
</s:else>

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
function showJobFamilyInputBox(){
	var tempContent="<table border='0' style='margin-left:auto; margin-right:auto;'><tr><td>Job Code</td><td><input type='text' id='jobFamily.jfCode'/></td></tr><tr><td> Job Family Text</td><td> <input type='text' id='jobFamily.jfText' size='50'/></td></tr></table>";
	tempContent +="<br><center><input type='button' value='Save' onclick='addNewJf()'/></center>";
	document.getElementById("td_div_job_family").innerHTML=tempContent;
}
function showApprovalInputBox(){
	var tempContent="<table border='0' style='margin-left:auto; margin-right:auto;'><tr><td>Employee Id</td><td><input type='text' id='approvalDetail.adApproveId'/></td></tr>";
		tempContent+="<tr><td>Name</td><td> <input type='text' id='approvalDetail.adApproveName' size='50'/></td></tr>";
		tempContent+="<tr><td>Approve at Level (Min is 1)</td><td> <input type='text' id='approvalDetail.adApproveLevel' size='3'/></td></tr>";
		tempContent+="<tr><td>Approval is Admin (0=No or 1=Yes)</td><td> <input type='text' id='approvalDetail.adIsAdmin' size='3'/></td></tr>";
		tempContent+="<tr><td>Email for routing purpose</td><td> <input type='text' id='approvalDetail.adEmail' size='50'/></td></tr></table>";
	tempContent +="<br><center><input type='button' value='Save' onclick='addNewAd()'/></center>";
	document.getElementById("td_div_approval_detail").innerHTML=tempContent;
}
function showProKnowledgeInputBox(){
	var tempContent="<table border='0' style='margin-left:auto; margin-right:auto;'><tr><td>Professional Knowledge</td><td><input type='text' id='proKnowledge.pkText' size='100'/></td></tr></tr></table>";
	tempContent +="<br><center><input type='button' value='Save' onclick='addNewPk()'/></center>";
	document.getElementById("td_div_pro_knowledge").innerHTML=tempContent;
}
function showMainSettingInputBox(){
	var tempContent="<table border='0' style='margin-left:auto; margin-right:auto;'><tr><td>Doc No.</td><td><input type='text' id='mainSetting.msDocNo' size='50'/></td></tr><tr><td> Total Number of Approval</td><td> <input type='text' id='mainSetting.msNoApproval' size='5'/> (By Default is 2)</td></tr><tr><td>Recruitment Email</td><td><input type='text' id='mainSetting.msRecruitEmail' size='50'/></td></tr>";
	tempContent +="<tr><td>Doc Version</td><td><input type='text' id='mainSetting.msDocVersion' size='50'/></td></tr><tr><td>Document No. Date</td><td><input type='text' name='section' id='section' size='15' maxlength='10'  class='textfield'/> (FORMAT: yyyy/MM/dd e.g 2010/12/23)</td></tr></table>"
	tempContent +="<br><center><input type='button' value='Save' onclick='addNewMs()'/></center>";
	document.getElementById("td_div_main_setting").innerHTML=tempContent;
}
function showJobDimensionInputBox(){
	document.getElementById("hiddenJobDimension").style.display="inline";
}
function showDimensionDetailInputBox(){
	ajaxGetFunction2("displayFunc","jdmCodeSelection","section","jobDimension","setting.action","selectJobDimensionDetailJdmCode");
	document.getElementById("hiddenDimensionDetail").style.display="inline";
}
function showAuthorityInputBox(){
	var tempContent="<table border='0' style='margin-left:auto; margin-right:auto;'><tr><td>Limit and Authorization</td><td><input type='text' id='authority.auText' size='100'/></td></tr></tr></table>";
	tempContent +="<br><center><input type='button' value='Save' onclick='addNewAu()'/></center>";
	document.getElementById("td_div_authority").innerHTML=tempContent;
}
function addNewJf(){
	if(trim(document.getElementById("jobFamily.jfCode").value)!="" && trim(document.getElementById("jobFamily.jfText").value)!=""){
		ajaxGetFunction2("jobFamily.jfCode",document.getElementById("jobFamily.jfCode").value,"jobFamily.jfText",null,"addNewJobFamily.action","div_job_family");
	}else{
		alert("Please fill in all the details before submit!");
	}
}
function addNewAd(){
	if(trim(document.getElementById("approvalDetail.adApproveId").value)!="" && trim(document.getElementById("approvalDetail.adApproveName").value)!="" && trim(document.getElementById("approvalDetail.adApproveLevel").value)!=""  && trim(document.getElementById("approvalDetail.adIsAdmin").value)!="" && trim(document.getElementById("approvalDetail.adEmail").value)!=""){
		var tempValue=new Array();
		tempValue.push("approvalDetail.adApproveId");
		tempValue.push("approvalDetail.adApproveName");
		tempValue.push("approvalDetail.adApproveLevel");
		tempValue.push("approvalDetail.adIsAdmin");
		tempValue.push("approvalDetail.adEmail");
		ajaxGetFunction4(null,null,tempValue,tempValue,"addNewApprovalDetail.action","div_approval_detail");
	}else{
		alert("Please fill in all the details before submit!");
	}
}
function addNewPk(){
	if(trim(document.getElementById("proKnowledge.pkText").value)!=""){
		ajaxGetFunction2(null,null,"proKnowledge.pkText",null,"addNewProKnowledge.action","div_pro_knowledge");
	}else{
		alert("Please fill in all the details before submit!");
	}
}
function addNewMs(){
	if(trim(document.getElementById("mainSetting.msDocNo").value)!="" && trim(document.getElementById("mainSetting.msNoApproval").value)!="" &&trim(document.getElementById("section").value)!=""){
		var tempValue=new Array();	
		var tempValue2=new Array();	
		tempValue.push("mainSetting.msNoApproval");
		tempValue.push("mainSetting.msDocNo");
		tempValue.push("mainSetting.msDocVersion");
		tempValue.push("mainSetting.msRecruitEmail");
		tempValue.push("section");
		tempValue2.push("mainSetting.msNoApproval");
		tempValue2.push("mainSetting.msDocNo");
		tempValue2.push("mainSetting.msDocVersion");
		tempValue2.push("mainSetting.msRecruitEmail");
		tempValue2.push("mainSetting.msDocDate");
		ajaxGetFunction4(null,null,tempValue,tempValue,"addNewMainSetting.action","div_main_setting");
	}else{
		alert("Please fill in all the details before submit!");
	}
}
function addNewJdm(){
	var existRadio=true;
	var radioValue="jobDimension.jdmCareerStreamText";
	var alertError=false;
	if(document.getElementById("radioCs1")==null && document.getElementById("radioCs2")==null){
		existRadio=false;
	}else{
		if(document.getElementById("radioCs1").checked){
			radioValue=document.getElementById("radioCs1").value;
		}else if(document.getElementById("radioCs2").checked && trim(document.getElementById(document.getElementById("radioCs2").value).value)!=""){
			radioValue=document.getElementById("radioCs2").value;
		}else{
			alertError=true;
		}
		if(trim(document.getElementById(radioValue).value=="")){
			alertError=true;
		}
	}
	if(alertError==false && trim(document.getElementById("jobDimension.jdmCode").value)!="" && trim(document.getElementById("jobDimension.jdmCodeDesc").value)!=""){
		var tempValue=new Array();
		var tempValue2=new Array();
		tempValue.push("jobDimension.jdmCode");
		tempValue.push("jobDimension.jdmCodeDesc");
		tempValue.push("jobDimension.jdmCareerStream");
		tempValue2.push("jobDimension.jdmCode");
		tempValue2.push("jobDimension.jdmCodeDesc");
		tempValue2.push(radioValue);
		ajaxGetFunction4(null,null,tempValue,tempValue2,"addNewJobDimension.action","div_job_dimension");
	}else{
		alertError=true;
	}
	if(alertError){
		alert("Please fill in all the details before submit!");
	}
}
function addNewJdd(){
	if(document.getElementById("jobDimensionDetail.jobDimension.jdmCode")!=null && trim(document.getElementById("jobDimensionDetail.jobDimension.jdmCode").value)!=""&& trim(document.getElementById("jobDimensionDetail.jddText").value)!="" && trim(document.getElementById("jobDimensionDetail.jddTextDesc").value)!=""){
		var tempValue=new Array();
		tempValue.push("jobDimensionDetail.jobDimension.jdmCode");
		tempValue.push("jobDimensionDetail.jddText");
		tempValue.push("jobDimensionDetail.jddTextDesc");
		ajaxGetFunction4(null,null,tempValue,tempValue,"addNewJobDimensionDetail.action","div_dimension_detail");
	}else{
		alert("Please fill in all the details before submit!");
	}
}
function addNewAu(){
	if(trim(document.getElementById("authority.auText").value)!=""){
		ajaxGetFunction2(null,null,"authority.auText",null,"addNewAuthority.action","div_authority");
	}else{
		alert("Please fill in all the details before submit!");
	}
}
function editTe(id){
	var value=document.getElementById("span_te_"+id).innerHTML;
	value=value.replace(/\"/g,"&quot;");
	value=value.replace(/\n/g,'');
	value=value.replace(/\<BR\>/g,'<br>');
	value=value.replace(/\<br\>/g,'\n');
	var tempContent="<center><form><textarea id='trainingEffective.teValue_"+id+"' cols='80' rows='5'>"+value+"</textarea>";
	tempContent +="<br><input type='button' value='Save' onclick='saveEditTe("+id+")'/><input type='reset' value='reset'></center></form>";
	document.getElementById("div_te_"+id).innerHTML=tempContent;
}
function saveEditJf(id){
	var tempValue=document.getElementById("jobFamily.jfCode_"+id).value;
	var tempValue2=document.getElementById("jobFamily.jfText_"+id).value;
	if(trim(tempValue)!="" && trim(tempValue2)!=""){
		if(confirm("Are you sure you want to save edit this Job Family? Changes in Job Family may impact on other existing job code.")){
			ajaxGetFunction3("jobFamily.jfId",id,"jobFamily.jfCode","jobFamily.jfCode_"+id,"jobFamily.jfText","jobFamily.jfText_"+id,"saveEditJobFamily.action","div_job_family");
		}
	}else{
		alert("You cannot submit empty form!");
	}
}
function saveEditAd(id){
	if(trim(document.getElementById("approvalDetail.adApproveId_"+id).value)!="" && trim(document.getElementById("approvalDetail.adApproveName_"+id).value)!="" && trim(document.getElementById("approvalDetail.adApproveLevel_"+id).value)!=""  && trim(document.getElementById("approvalDetail.adIsAdmin_"+id).value)!="" && trim(document.getElementById("approvalDetail.adEmail_"+id).value)!=""){
		var tempValue=new Array();
		var tempValue2=new Array();
		tempValue.push("approvalDetail.adApproveId");
		tempValue.push("approvalDetail.adApproveName");
		tempValue.push("approvalDetail.adApproveLevel");
		tempValue.push("approvalDetail.adIsAdmin");
		tempValue.push("approvalDetail.adEmail");
		tempValue2.push("approvalDetail.adApproveId_"+id);
		tempValue2.push("approvalDetail.adApproveName_"+id);
		tempValue2.push("approvalDetail.adApproveLevel_"+id);
		tempValue2.push("approvalDetail.adIsAdmin_"+id);
		tempValue2.push("approvalDetail.adEmail_"+id);
		if(confirm("Are you sure you want to save edit this Approval? Changes in Approval may impact on other existing job code.")){
			ajaxGetFunction4("approvalDetail.adId",id,tempValue,tempValue2,"saveEditApprovalDetail.action","div_approval_detail");
		}
	}else{
		alert("Please fill in all the details before submit!");
	}
}
function saveEditPk(id){
	var tempValue=document.getElementById("proKnowledge.pkText_"+id).value;
	if(trim(tempValue)!=""){
		if(confirm("Are you sure you want to save edit this Professional Knowledge? Changes in Professional Knowledge may impact on other existing job code.")){
			ajaxGetFunction3("proKnowledge.pkId",id,"proKnowledge.pkText","proKnowledge.pkText_"+id,null,null,"saveEditProKnowledge.action","div_pro_knowledge");
		}
	}else{
		alert("You cannot submit empty form!");
	}
}
function saveEditMs(id){
	var tempValue=document.getElementById("mainSetting.msDocNo_"+id).value;
	var tempValue2=document.getElementById("mainSetting.msNoApproval_"+id).value;
	var t1=document.getElementById("verifyDocVersion").value;
	var t2=document.getElementById("verifyDocDate").value;
	if(trim(tempValue)!="" && trim(tempValue2)!=""){
		if(confirm("The previous document version was "+t1+" and the document no. date was "+t2+"\nIMPORTANT: Document version and document effective date cannot be less than the previous version.\nAre you sure you want to save edit this Main setting? Changes in Main setting may impact on other existing job code.")){
			var tempValue=new Array();
			var tempValue2=new Array();
			tempValue.push("mainSetting.msDocNo");
			tempValue.push("mainSetting.msDocVersion");
			tempValue.push("mainSetting.msNoApproval");
			tempValue.push("mainSetting.msRecruitEmail");
			tempValue.push("section");
			tempValue2.push("mainSetting.msDocNo_"+id);
			tempValue2.push("mainSetting.msDocVersion_"+id);
			tempValue2.push("mainSetting.msNoApproval_"+id);
			tempValue2.push("mainSetting.msRecruitEmail_"+id);
			tempValue2.push("mainSetting.msDocDate_"+id);
			ajaxGetFunction4("mainSetting.msId",id,tempValue,tempValue2,"saveEditMainSetting.action","div_main_setting");
		}
	}else{
		alert("You cannot submit empty form!");
	}
}
function saveEditJdm(id){
	var existRadio=true;
	var radioValue="jobDimension.jdmCareerStreamText_"+id;
	var alertError=false;
	if(document.getElementById("radioCs1_"+id)==null && document.getElementById("radioCs2_"+id)==null){
		existRadio=false;
	}else{
		if(document.getElementById("radioCs1_"+id).checked){
			radioValue=document.getElementById("radioCs1_"+id).value;
		}else if(document.getElementById("radioCs2_"+id).checked && trim(document.getElementById(document.getElementById("radioCs2_"+id).value).value)!=""){
			radioValue=document.getElementById("radioCs2_"+id).value;
		}else{
			alertError=true;
		}
		if(trim(document.getElementById(radioValue).value=="")){
			alertError=true;
		}
	}
	if(alertError==false && trim(document.getElementById("jobDimension.jdmCode_"+id).value)!="" && trim(document.getElementById("jobDimension.jdmCodeDesc_"+id).value)!=""){
		var tempValue=new Array();
		var tempValue2=new Array();
		tempValue.push("jobDimension.jdmCode");
		tempValue.push("jobDimension.jdmCodeDesc");
		tempValue.push("jobDimension.jdmCareerStream");
		tempValue2.push("jobDimension.jdmCode_"+id);
		tempValue2.push("jobDimension.jdmCodeDesc_"+id);
		tempValue2.push(radioValue);
		if(confirm("Are you sure you want to save edit this Job Dimension? Changes in Job Dimension may impact on other existing job code.")){
			ajaxGetFunction4(null,null,tempValue,tempValue2,"saveEditJobDimension.action","div_job_dimension");
		}
	}else{
		alertError=true;
	}
	if(alertError){
		alert("Please fill in all the details before submit!");
	}
}
function saveEditJdd(id){
	if(document.getElementById("jobDimensionDetail.jobDimension.jdmCode_"+id)!=null && trim(document.getElementById("jobDimensionDetail.jobDimension.jdmCode_"+id).value)!=""&& trim(document.getElementById("jobDimensionDetail.jddText_"+id).value)!="" && trim(document.getElementById("jobDimensionDetail.jddTextDesc_"+id).value)!=""){
		var tempValue=new Array();
		var tempValue2=new Array();
		tempValue.push("jobDimensionDetail.jobDimension.jdmCode");
		tempValue.push("jobDimensionDetail.jddText");
		tempValue.push("jobDimensionDetail.jddTextDesc");
		if(trim(document.getElementById("jddSortList").value)!=""){
			tempValue.push("strContent");
		}
		tempValue2.push("jobDimensionDetail.jobDimension.jdmCode_"+id);
		tempValue2.push("jobDimensionDetail.jddText_"+id);
		tempValue2.push("jobDimensionDetail.jddTextDesc_"+id);
		if(trim(document.getElementById("jddSortList").value)!=""){
			tempValue2.push("jddSortList");
		}
		if(confirm("Are you sure you want to save edit this Dimension Detail? Changes in Job Dimension Detail may impact on other existing job code.")){
			ajaxGetFunction4("jobDimensionDetail.jddId",id,tempValue,tempValue2,"saveEditJobDimensionDetail.action","div_dimension_detail");
		}
	}else{
		alert("Please fill in all the details before submit!");
	}
	
}
function saveEditAu(id){
	var tempValue=document.getElementById("authority.auText_"+id).value;
	if(trim(tempValue)!=""){
		if(confirm("Are you sure you want to save edit this item? Changes in this item may impact on other existing job code.")){
			ajaxGetFunction3("authority.auId",id,"authority.auText","authority.auText_"+id,null,null,"saveEditAuthority.action","div_authority");
		}
	}else{
		alert("You cannot submit empty form!");
	}
}
function viewDbChanges(){
	if(confirm("Are you sure you want to proceed?")){
		document.getElementById("viewChangesButton").disabled=true;
		ajaxGetFunction("displayFunc","viewDbLiveChanges","searchAutoRevisionList.action","liveDbDiv",0);
	}
}
function viewSelectedCjob(id,divID){
	ajaxGetFunction2('confirmJob.cjId',id,'displayFunc','generate','viewSelectedCjob.action','statusDetailTd');
	showStatusPanel(divID);	
	document.getElementById("transRow").style.height=document.body.scrollHeight+400;
	document.getElementById("transRow").style.width=document.body.scrollWidth+100;
	document.getElementById("bodyTrans").style.width=document.body.scrollWidth+100;
	mouseX=mouseX-300;
	mouseY=mouseY-100;
	document.getElementById("statusDetailDiv").style.left=mouseX+"px";
	document.getElementById("statusDetailDiv").style.top=mouseY+"px";
}
function captureDimensionCode(){
	document.getElementById("code1").value=document.getElementById("dimensionCode").value;
	document.getElementById("code2").value=document.getElementById("dimensionCode").value;
	document.getElementById("id1").value=document.getElementById("rev").value;
	document.getElementById("id2").value=document.getElementById("rev").value;
	return true;
}
function viewHideUpdates(id){
	if(document.getElementById("tr_detail_"+id).style.display=="none"){
		document.getElementById("tr_detail_"+id).style.display="inline";
	}else{
		document.getElementById("tr_detail_"+id).style.display="none";
	}
}
function executeUpdateJd(){
	var isUpdate=confirm("Are you sure you want to execute this function? Once updated, you are not able to revert back.\n A new revision for job description will be created");
	if(isUpdate){
		ajaxGetFunction("displayFunc","executeDbLiveChanges","executeAutoRevisionList.action","liveDbDiv",0);
	}
}
function sortDimensionDetail(){
	if(trim(document.getElementById("jddSortList").value)==""){
		ajaxGetFunction2('section','jobDimension','displayFunc','refreshJobDimensionDetail','setting.action','div_dimension_detail');
	}else{
		ajaxGetFunction2('strContent',trim(document.getElementById("jddSortList").value),'section','jobDimension','setting.action','div_dimension_detail');
	}
}
function validateAdminInput(){
	if(trim(document.getElementById("uname").value)==""){
		alert("Please enter the username");
		return false;
	}else if(trim(document.getElementById("password").value)==""){
		alert("Please enter the password");
		return false;
	}else if(trim(document.getElementById("password2").value)==""){
		alert("Please enter the confirm password");
		return false;
	}else if(trim(document.getElementById("name").value)==""){
		alert("Please enter the name");
		return false;
	}else if(trim(document.getElementById("email").value)==""){
		alert("Please enter the email");
		return false;
	}else if(trim(document.getElementById("empId").value)==""){
		alert("Please engeter the employee ID");
		return false;
	}else if(document.getElementById("password").value!=document.getElementById("password2").value){
		alert("Password is not match");
		return false;
	}else{
		if(confirm("Are you sure you want submit this admin account?")){
			return true;
		}
	}
	return false;;
}
</script>
