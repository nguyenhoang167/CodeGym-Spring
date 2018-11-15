package com.howtodoinjava.demo.service;

import java.util.List;

import com.howtodoinjava.demo.model.TodoEntity;

public interface TodoService {

	 public List<TodoEntity> getAllTodos();
	  
	 public TodoEntity get(Integer id);
	 
	 public TodoEntity create(TodoEntity todoEntity);
	 
	 public TodoEntity update(Integer id, TodoEntity todoEntity);
	 
	 public void delete(Integer id);
	 
}
