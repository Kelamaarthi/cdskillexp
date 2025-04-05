package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Course;

@Repository
public interface CourseRepository extends JpaRepository<Course,Integer> {
	List<Course> findByDepartmentAndSemester(String department, int semester);

	List<Course> findBySemesterAndDepartment(int semester, String department);
}
