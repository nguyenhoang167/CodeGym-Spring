package com.howtodoinjava.demo.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.howtodoinjava.demo.model.TodoEntity;
import com.howtodoinjava.demo.repository.TodoRepository;

@Service
public class TodoServiceImpl implements TodoService {
	
	@Autowired
	TodoRepository todoRepository;
	
	@Override
	public List<TodoEntity> getAllTodos() {
		return todoRepository.findAll();
	}

	@Override
	public TodoEntity get(Integer id) {
		return todoRepository.findOne(id);
	}

	@Override
	public TodoEntity create(TodoEntity todoEntity) {
		todoEntity.setCreatedAt(new Date());
		todoEntity.setUpdatedAt(new Date());
		return todoRepository.save(todoEntity);
	}

	@Override
	public TodoEntity update(Integer id, TodoEntity todoEntity) {
		TodoEntity oldTodoEntity = todoRepository.findOne(id);
		oldTodoEntity.setName(todoEntity.getName());
		oldTodoEntity.setDescription(todoEntity.getDescription());
		oldTodoEntity.setCreatedAt(new Date());
		oldTodoEntity.setUpdatedAt(new Date());
		
		return todoRepository.save(oldTodoEntity);
	}

	@Override
	public void delete(Integer id) {
		todoRepository.delete(id);
	}
	
}
