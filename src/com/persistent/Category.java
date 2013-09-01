package com.persistent;

@SuppressWarnings("serial")
public class Category implements java.io.Serializable{
	private int catId;
	private String catDesc;
	private int catIsDeleted;

	public Category(){
		
	}


	public Category(int catId, String catDesc, int catIsDeleted) {

		this.catId = catId;
		this.catDesc = catDesc;
		this.catIsDeleted = catIsDeleted;
		
	}

	public int getCatId() {
		return catId;
	}

	public void setCatId(int catId) {
		this.catId = catId;
	}

	public String getCatDesc() {
		return catDesc;
	}

	public void setCatDesc(String catDesc) {
		this.catDesc = catDesc;
	}

	public int getCatIsDeleted() {
		return catIsDeleted;
	}

	public void setCatIsDeleted(int catIsDeleted) {
		this.catIsDeleted = catIsDeleted;
	}
	
}

