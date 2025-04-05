package com.klef.jfsd.springboot.service;

import java.util.List;
import java.util.Optional;

import com.klef.jfsd.springboot.model.Course;

public interface CourseService {
    Optional<Course> findCourseById(int id);
    List<Course> getAllCourses();
    List<Course> getCoursesBySemesterAndDepartment(int semester, String department);
}
