package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.FacultyCourseMapping;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.FacultyCourseMappingRepository;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private FacultyRepository facultyRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private CourseRepository courseRepository;
	
	@Autowired
	private FacultyCourseMappingRepository facultyCourseMappingRepository;

	@Override
	public Admin checkadminlogin(String uname, String pwd)
	{
		return adminRepository.checkadminlogin(uname, pwd);
	}
	
	@Override
	public String AddFaculty(Faculty f) 
	{
		facultyRepository.save(f);
		return "Faculty Added Successfully";
	}

	@Override
	public String AddStudent(Student s)
	{
		studentRepository.save(s);
		return "Student Added Successfully";
	}

	@Override
	public String AddCourse(Course c)
	{
		courseRepository.save(c);
		return "Course Added Successfully";
	}
	
	@Override
	public List<Faculty> ViewAllFacultys()
	{
		return facultyRepository.findAll();
	}


	@Override
	public Faculty displayfacultybyid(int fid)
	{
		return facultyRepository.findById(fid).get();
	}


	@Override
	public List<Student> ViewAllStudents() 
	{
		return studentRepository.findAll();

	}


	@Override
	public Student displaystudentbyid(int sid) 
	{
		return studentRepository.findById(sid).get();
	}

	@Override
	public List<Course> ViewAllCourses() 
	{
		return courseRepository.findAll();
	}

	@Override
	public Course displaycoursebyid(int cid) 
	{
		return courseRepository.findById(cid).get();
	}

	@Override
	public String deletefaculty(int fid)
	{
		facultyRepository.deleteById(fid);
		return "Faculty Deleted Successfully";
	}

	@Override
	public String deletestudent(int sid)
	{
		studentRepository.deleteById(sid);
		return "Student Deleted Successfully";
	}
	
	@Override
	public String deletecourse(int cid)
	{
		courseRepository.deleteById(cid);
		return "Course Deleted Successfully";
	}

	@Override
	public String facultyCourseMapping(FacultyCourseMapping fcm) {
		facultyCourseMappingRepository.save(fcm);
		return "Faculty Course Mapping Done";
	}

	@Override
	public long checkFacultyCourseMapping(Faculty f, Course c, int section) 
	{
		return facultyCourseMappingRepository.checkfcoursemapping(f, c, section);
	}

	@Override
	public List<Course> displayAllCourses() {
		// TODO Auto-generated method stub
		return courseRepository.findAll();
	}

	@Override
	public List<Faculty> displayAllFaculty() {
		// TODO Auto-generated method stub
		return facultyRepository.findAll();
	}

	@Override
	public Faculty displayFacultyById(int fid) {
		// TODO Auto-generated method stub
		return facultyRepository.findById(fid).get();
	}

	@Override
	public Course displayCourseById(int cid) {
		// TODO Auto-generated method stub
		return courseRepository.findById(cid).get();
	}

}
