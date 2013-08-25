package com.persistent;

import java.util.Date;

public class MainSetting implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int msId;
	private String msDocNo;
	private int msApproval2;
	private int msNoApproval;
	private Date msDocDate;
	private String msDocVersion;
	private String msRecruitEmail;
	public MainSetting(){
		
	}
	public MainSetting(int msId, String msDocNo, int msApproval2,
			int msNoApproval, Date msDocDate, String msDocVersion,
			String msRecruitEmail) {
		this.msId = msId;
		this.msDocNo = msDocNo;
		this.msApproval2 = msApproval2;
		this.msNoApproval = msNoApproval;
		this.msDocDate = msDocDate;
		this.msDocVersion = msDocVersion;
		this.msRecruitEmail = msRecruitEmail;
	}
	public int getMsId() {
		return msId;
	}
	public void setMsId(int msId) {
		this.msId = msId;
	}
	public String getMsDocNo() {
		return msDocNo;
	}
	public void setMsDocNo(String msDocNo) {
		this.msDocNo = msDocNo;
	}
	public int getMsApproval2() {
		return msApproval2;
	}
	public void setMsApproval2(int msApproval2) {
		this.msApproval2 = msApproval2;
	}
	public int getMsNoApproval() {
		return msNoApproval;
	}
	public void setMsNoApproval(int msNoApproval) {
		this.msNoApproval = msNoApproval;
	}
	public Date getMsDocDate() {
		return msDocDate;
	}
	public void setMsDocDate(Date msDocDate) {
		this.msDocDate = msDocDate;
	}
	public String getMsDocVersion() {
		return msDocVersion;
	}
	public void setMsDocVersion(String msDocVersion) {
		this.msDocVersion = msDocVersion;
	}
	public String getMsRecruitEmail() {
		return msRecruitEmail;
	}
	public void setMsRecruitEmail(String msRecruitEmail) {
		this.msRecruitEmail = msRecruitEmail;
	}
	
}
