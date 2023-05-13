package com.tech.blog.entities;

import java.sql.Timestamp;

public class Post {
	private int pid;
	private int catid;
	private int uid;
	private String pTitle;
	private String pContent;
	private String pCode;
	byte[] pPic;
	private Timestamp pDate;
	public Post(int pid,int uid, int catid, String pTitle, String pContent, String pCode, byte[] pPic, Timestamp pDate) {
		super();
		this.uid=uid;
		this.pid = pid;
		this.catid = catid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
	}
	public Post(int catid,int uid, String pTitle, String pContent, String pCode, byte[] pPic, Timestamp pDate) {
		super();
		this.uid=uid;
		this.catid = catid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.pPic = pPic;
		this.pDate = pDate;
	}
	public Post(String pTitle, String pContent, String pCode,int catid,int uid,byte[] pic) {
		super();
		this.catid = catid;
		this.pTitle = pTitle;
		this.pContent = pContent;
		this.pCode = pCode;
		this.uid=uid;
		this.pPic=pic;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public int getCatid() {
		return catid;
	}
	public void setCatid(int catid) {
		this.catid = catid;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpContent() {
		return pContent;
	}
	public void setpContent(String pContent) {
		this.pContent = pContent;
	}
	public String getpCode() {
		return pCode;
	}
	public void setpCode(String pCode) {
		this.pCode = pCode;
	}
	public byte[] getpPic() {
		return pPic;
	}
	public void setpPic(byte[] pPic) {
		this.pPic = pPic;
	}
	public Timestamp getpDate() {
		return pDate;
	}
	public void setpDate(Timestamp pDate) {
		this.pDate = pDate;
	}
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	@Override
	public String toString() {
		return "Post [pid=" + pid + ", catid=" + catid + ", pTitle=" + pTitle + ", pContent=" + pContent + ", pCode="
				+ pCode +", pDate=" + pDate + "]";
	}
	
	
}
