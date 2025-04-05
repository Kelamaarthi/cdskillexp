package com.klef.jfsd.springboot.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "assignment_table")
public class Assignment 
{
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="assignment_id")
    private int id;

    @Column(name="course_name", nullable = false, length = 100)
    private String coursename;

    @Column(name="course_code", nullable = false, length = 20)
    private String coursecode;

    @Column(name="semester", nullable = false)
    private int semester;

    @Column(name="submission_date", nullable = false, length = 20)
    private String submissiondate;

    @Column(name="assignment_pdf", nullable = false)
    private Blob assignmentpdf;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCoursename() {
		return coursename;
	}

	public void setCoursename(String coursename) {
		this.coursename = coursename;
	}

	public String getCoursecode() {
		return coursecode;
	}

	public void setCoursecode(String coursecode) {
		this.coursecode = coursecode;
	}

	public int getSemester() {
		return semester;
	}

	public void setSemester(int semester) {
		this.semester = semester;
	}

	public String getSubmissiondate() {
		return submissiondate;
	}

	public void setSubmissiondate(String submissiondate) {
		this.submissiondate = submissiondate;
	}

	public Blob getAssignmentpdf() {
		return assignmentpdf;
	}

	public void setAssignmentpdf(Blob assignmentpdf) {
		this.assignmentpdf = assignmentpdf;
	}

	
}
