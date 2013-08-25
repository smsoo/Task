<%String text=request.getParameter("text");
if(text!=null){
	if(text.equals("esurvey.main.supportList")){
		
	}
	else if(text.equals("esurvey.main.title")){
		%>
		<center><font color="#B0B0B0">Application Form Asia Pacific Hand Hygiene Excellence Award Program 2010 & 2011</font></center>
		<%
	}
	else if(text.equals("esurvey.main.browserTitle")){
		%>
		Asia Pacific Hand Hygeine Excellence Award System
		<%
	}
	else if(text.equals("esurvey.main.naviquestion")){
		%>
		Section
		<%
	}
	else if(text.equals("esurvey.main.personalDetail")){
		%>
		Section 1
		<%
	}
	else if(text.equals("esurvey.main.hospitalDetail")){
		%>
		Section 2
		<%
	}
	else if(text.equals("esurvey.main.finalSubmission")){
		%>
		Form Submission
		<%
	}
	else if(text.equals("esurvey.main.addAccount")){
		%>
		User Account
		<%
	}
	else if(text.equals("esurvey.main.addAccountDesc")){
		%>
		You can create account for user to enter the form
		<%
	}
	else if(text.equals("esurvey.main.searchForm")){
		%>
		Search Form
		<%
	}
	else if(text.equals("esurvey.main.searchFormDesc")){
		%>
		Search Form
		<%
	}
	else if(text.equals("esurvey.main.personalDetailDesc")){
		%>
		Section 1: Personal Detail
		<%
	}
	else if(text.equals("esurvey.main.hospitalDetailDesc")){
		%>
		Section 2: Hospital Detail
		<%
	}
	else if(text.equals("esurvey.main.finalSubmissionDesc")){
		%>
		Please make sure you had completed the form before you click on the submit button.<br> After submission, you may not edit the form anymore.
		<%
	}
	else if(text.equals("esurvey.main.accountValuec")){
		%>Country<%
	}
	else if(text.equals("esurvey.main.accountValueh")){
		%>Hospital<%
	}
}
%>