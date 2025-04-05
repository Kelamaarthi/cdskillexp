package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.FacultyCourseMapping;
import com.klef.jfsd.springboot.model.Course;

public interface AdminService 
{
	public Admin checkadminlogin(String uname,String pwd);
	public String AddFaculty(Faculty f);
	public String AddStudent(Student s);
	public String AddCourse(Course c);
	
	public List<Faculty> ViewAllFacultys();
	public Faculty displayfacultybyid(int fid);
	public List<Student> ViewAllStudents();
	public Student displaystudentbyid(int sid);
	public List<Course> ViewAllCourses();
	public Course displaycoursebyid(int cid); 
	
	public String deletefaculty(int fid);
	public String deletestudent(int sid);
	public String deletecourse(int cid);
	
	public String facultyCourseMapping(FacultyCourseMapping fcm);
	 public long checkFacultyCourseMapping(Faculty f,Course c,int section);
	 public List<Course> displayAllCourses();
	  public List<Faculty> displayAllFaculty();
	  public Faculty displayFacultyById(int fid);
	  public Course displayCourseById(int cid);
}
