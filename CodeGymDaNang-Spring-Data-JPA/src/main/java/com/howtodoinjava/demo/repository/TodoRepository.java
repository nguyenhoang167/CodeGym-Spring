package com.howtodoinjava.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.howtodoinjava.demo.model.TodoEntity;

@Repository
@Transactional
public interface TodoRepository extends JpaRepository<TodoEntity, Integer> {
	
}
