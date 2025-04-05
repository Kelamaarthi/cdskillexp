package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.Submission;

public interface StudentService 
{
	public Student checkstudentlogin(String eemail,String epwd);
	Optional<Student> findStudentById(int id);
    void registerCourses(int studentId, List<Integer> courseIds);
    
    public String addSubmission(Submission submission);
    public Submission getSubmissionById(int id);
    public List<Submission> getAllSubmissions();
}
