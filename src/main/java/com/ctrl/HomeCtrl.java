package com.ctrl;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.dao.TodoDao;
import com.entities.Todo;

@Controller
public class HomeCtrl {
	@Autowired
	ServletContext context;
	
	@Autowired
	TodoDao todoDao;
	
	@RequestMapping("/home")
	public String home(Model m) {
		String str="home";
		m.addAttribute("page",str);
		List<Todo> list = this.todoDao.getAll();
		m.addAttribute("todos",list);
		return "home";
	}
	@RequestMapping("/add")
	public String addTodo(Model m) {
		Todo t = new Todo();
		m.addAttribute("page","add");
		m.addAttribute("todo",t);
		return "home";
	}
	
	@Transactional
	@RequestMapping(value="/saveTodo" ,method=RequestMethod.POST)
	public String saveTodo(@ModelAttribute("todo") Todo t,Model m ) {
		m.addAttribute("page","home");
		System.out.println(t);
		t.setTodoDate(new Date());
		this.todoDao.save(t);
		m.addAttribute("msg", "successfully added");
		return "home";
	}
	
//	@RequestMapping("/home")
//	public String home(Model m) {
//		m.addAttribute("name","Priya Saini");
//		m.addAttribute("internship", "internship in Java Development");
//		return "home";
//	}
//	
	
	//delete handler
	@RequestMapping("/delete/{todoId}")
	public RedirectView delete(@PathVariable("todoId")int todoId,HttpServletRequest request) {
		this.todoDao.deleteTodo(todoId);
		RedirectView redirectview = new RedirectView();
		redirectview.setUrl(request.getContextPath()+"/");
		return redirectview;
	}

	//update handler
	@RequestMapping(value="update/{todoId}" )
	public String updateform(@PathVariable("todoId") int todoId,Model model) {
	  Todo data= this.todoDao.getTodo(todoId);
	  model.addAttribute("todo",data);
		return "update_form";
	
	}
	
	
}
