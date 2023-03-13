package com.entities;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.Generated;

@Entity
public class Todo {
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int todoId;
	private String todoTitle;
	private String todoContent;
	private java.util.Date todoDate;
	public int getTodoId() {
		return todoId;
	}
	public void setTodoId(int todoId) {
		this.todoId = todoId;
	}
	public String getTodoTitle() {
		return todoTitle;
	}
	public void setTodoTitle(String todoTitle) {
		this.todoTitle = todoTitle;
	}
	public String getTodoContent() {
		return todoContent;
	}
	public void setTodoContent(String todoContent) {
		this.todoContent = todoContent;
	}
	public java.util.Date getTodoDate() {
		return todoDate;
	}
	public void setTodoDate(java.util.Date todoDate) {
		this.todoDate = todoDate;
	}
	public Todo(int todoId, String todoTitle, String todoContent, java.util.Date todoDate) {
		super();
		this.todoId = todoId;
		this.todoTitle = todoTitle;
		this.todoContent = todoContent;
		this.todoDate = todoDate;
	}
	public Todo() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Todo [todoId=" + todoId + ", todoTitle=" + todoTitle + ", todoContent=" + todoContent + ", todoDate="
				+ todoDate + "]";
	}
	
	
}
