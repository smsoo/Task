package com.persistent;

@SuppressWarnings("serial")
public class Status implements java.io.Serializable{
	private int statusId;
	private String statusDesc;
	private int statusIsDeleted;

	public Status(){
		
	}


	public Status(int statusId, String statusDesc, int statusIsDeleted) {

		this.statusId = statusId;
		this.statusDesc = statusDesc;
		this.statusIsDeleted = statusIsDeleted;
		
	}

	public int getStatusId() {
		return statusId;
	}

	public void setStatusId(int statusId) {
		this.statusId = statusId;
	}

	public String getStatusDesc() {
		return statusDesc;
	}

	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}

	public int getStatusIsDeleted() {
		return statusIsDeleted;
	}

	public void setStatusIsDeleted(int statusIsDeleted) {
		this.statusIsDeleted = statusIsDeleted;
	}
	
}

