package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.entities.Todo;

@Component
public class TodoDao {
	@Autowired
    HibernateTemplate hibernateTemplate;
 
	@Transactional
//	public int save(Todo t) {
//		Integer i =(Integer)this.hibernateTemplate.save(t);
//		return i;
//		
//	}
	public void save(Todo t) {
		this.hibernateTemplate.saveOrUpdate(t);
	}
	public List<Todo> getAll(){
		List<Todo> todos=this.hibernateTemplate.loadAll(Todo.class);
		return todos;
		
	}
	
//	get the single Product
	public Todo getTodo(int pid) {
		return this.hibernateTemplate.get(Todo.class,pid);
	}
	
	
	@Transactional
	public void deleteTodo(int id) {
		Todo p = this.hibernateTemplate.load(Todo.class,id);
		this.hibernateTemplate.delete(p);
	}
}
