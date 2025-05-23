package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.klef.jfsd.springboot.model.Assignment;

@Repository
public interface AssignmentRepository extends JpaRepository<Assignment,Integer>
{
	
}