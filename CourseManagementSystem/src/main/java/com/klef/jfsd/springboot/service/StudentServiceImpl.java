package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Assignment;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.Submission;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;
import com.klef.jfsd.springboot.repository.SubmissionRepository;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private SubmissionRepository submissionRepository;

	@Override
	public Student checkstudentlogin(String eemail, String epwd) 
	{
		return studentRepository.checkstudentlogin(eemail, epwd);
	}
	
	@Override
    public Optional<Student> findStudentById(int id) {
        return studentRepository.findById(id);
    }

	@Override
	public void registerCourses(int studentId, List<Integer> courseIds) {
	    Optional<Student> optionalStudent = studentRepository.findById(studentId);
	    if (optionalStudent.isPresent()) {
	        Student student = optionalStudent.get();
	        for (Integer courseId : courseIds) {
	            Optional<Course> courseOpt = courseRepository.findById(courseId);
	            courseOpt.ifPresent(course -> student.getCourses().add(course));
	        }
	        studentRepository.save(student); // Save the relationship
	    }
	}
	
	@Override
	public String addSubmission(Submission submission) {
		submissionRepository.save(submission);
		return "Submission Added Successfully";
	}

	@Override
	public Submission getSubmissionById(int id) {
		return submissionRepository.findById(id).get();
	}

	@Override
	public List<Submission> getAllSubmissions() {
		return submissionRepository.findAll();
	}
}
