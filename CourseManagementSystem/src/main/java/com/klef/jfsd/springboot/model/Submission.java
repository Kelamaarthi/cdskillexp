package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;

import java.sql.Blob;
import java.time.LocalDateTime;

@Entity
public class Submission {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="submission_date", nullable = false, length = 20)
    private String submissiondate;

    @Column(name="submission_pdf", nullable = false)
    private Blob submissionpdf;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSubmissiondate() {
		return submissiondate;
	}

	public void setSubmissiondate(String submissiondate) {
		this.submissiondate = submissiondate;
	}

	public Blob getSubmissionpdf() {
		return submissionpdf;
	}

	public void setSubmissionpdf(Blob submissionpdf) {
		this.submissionpdf = submissionpdf;
	}

    
}
