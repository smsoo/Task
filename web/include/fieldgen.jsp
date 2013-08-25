<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test='displayFunc=="loginForm"'>

<div id="statusDetailTd">
	<table border="0" id="divTable" bgcolor="#00A28A" cellspacing="0" cellpadding="5" style="margin-left:auto; margin-right:auto;" >
	<tr>
	  <td width="100%" bgcolor="#FFFFFF" style="padding:5px" colspan="2">
		<s:form action="loginProcess" method="post" namespace="/" onsubmit="return true;">
		<table class="wwFormTable" cellspacing="0" cellpadding="5">
			<tr class="head">
			<td colspan="2" >
			<strong>
			Login
			</strong>
			</td>	
			</tr>
			<tr>
			<td colspan="2">
				<s:actionerror/>
				<s:fielderror/>
				</td>
			</tr>
				<s:textfield name="account.accUsername" id="account.accUsername" label="Username" cssClass="textfield" />
				<s:password name="account.accPassword" id="account.accPassword" label="Password" cssClass="textfield"/>
				<s:submit value="Login" align="center"/>
		</table>
		</s:form>
	  </td>
	  </tr>

	</table>
</div>
</s:if>
<s:if test='displayFunc!="sessionEnd" && displayFunc!="verifyResult"'>
	<s:actionmessage/>
</s:if>

<s:if test='displayFunc=="verifyResult"'>
<s:property value="message"/>
</s:if>
<s:if test='displayFunc=="sessionEnd"'>
	session_end_refresh_page
</s:if>