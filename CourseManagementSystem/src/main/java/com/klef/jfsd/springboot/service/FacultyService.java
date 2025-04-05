package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.Assignment;

public interface FacultyService 
{
	public Faculty checkfacultylogin(String email,String pwd);
	
	public String addAssignment(Assignment assignment);
    public Assignment getAssignmentById(int id);
    public List<Assignment> getAllAssignments();
}
