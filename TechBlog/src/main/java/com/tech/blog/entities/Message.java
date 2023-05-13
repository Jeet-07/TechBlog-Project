package com.tech.blog.entities;

public class Message {
	private String content;
	private String type;
	private String cssclass;
	private boolean done;
	public Message(String content, String type, String cssclass) {
		super();
		this.content = content;
		this.type = type;
		this.cssclass = cssclass;
	}
	public Message(String type) {
		super();
		this.type=type;
	}
	public Message(String content,boolean done) {
		super();
		this.content=content;
		this.done=done;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCssclass() {
		return cssclass;
	}
	public void setCssclass(String cssclass) {
		this.cssclass = cssclass;
	}
	public boolean isDone() {
		return done;
	}
	public void setDone(boolean done) {
		this.done = done;
	}
	
	
	
}
