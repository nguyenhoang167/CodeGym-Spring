package com.howtodoinjava.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.howtodoinjava.demo.model.TodoEntity;
import com.howtodoinjava.demo.service.TodoService;

@RestController
@RequestMapping("/")
public class TodoController {
    
	@Autowired
    TodoService todoService;
     
    @RequestMapping(value = "/todos", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> getAll() {
    	
    	return new ResponseEntity<>(todoService.getAllTodos(), HttpStatus.OK);
    }  
    
    @RequestMapping(value = "/todo/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> get(@PathVariable(value = "id") Integer id) {
    	return new ResponseEntity<>(todoService.get(id), HttpStatus.OK);
    }
    
    @RequestMapping(value = "/todo", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> create(@RequestBody TodoEntity todoEntity) {
    	return new ResponseEntity<>(todoService.create(todoEntity), HttpStatus.OK);
    }
    
    @RequestMapping(value = "/todo/{id}", method = RequestMethod.PUT, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> update(@PathVariable(value = "id") Integer id,
    								@RequestBody TodoEntity todoEntity) {
    	return new ResponseEntity<>(todoService.update(id, todoEntity), HttpStatus.OK);
    }
    
    @RequestMapping(value = "/todo/{id}", method = RequestMethod.DELETE, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<?> delete(@PathVariable(value = "id") Integer id) {
    	todoService.delete(id);
    	return new ResponseEntity<>(HttpStatus.OK);
    }
}