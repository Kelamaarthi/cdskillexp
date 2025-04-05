package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Assignment;
import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.repository.AssignmentRepository;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class FacultyServiceImpl implements FacultyService
{
	@Autowired
	private FacultyRepository facultyRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private AssignmentRepository  assignmentRepository;
	
	@Override
	public Faculty checkfacultylogin(String email, String pwd) 
	{
		return facultyRepository.checkfacultylogin(email, pwd);
	}

	@Override
	public String addAssignment(Assignment assignment) {
		assignmentRepository.save(assignment);
		return "Assignment Added Successfully";
	}

	@Override
	public Assignment getAssignmentById(int id) {
		return assignmentRepository.findById(id).get();
	}

	@Override
	public List<Assignment> getAllAssignments() {
		return assignmentRepository.findAll();
	}

}
