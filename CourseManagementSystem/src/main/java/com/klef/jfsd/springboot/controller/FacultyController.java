package com.klef.jfsd.springboot.controller;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.Assignment;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.FacultyService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class FacultyController 
{
	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("facultyhome")
	public ModelAndView facultyhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("facultyhome");
		return mv;
	}
	
	@GetMapping("viewstudentsf")
    public ModelAndView viewstudentsf()
    {
      ModelAndView mv = new ModelAndView();
      List<Student> studentlist = adminService.ViewAllStudents();
      mv.setViewName("viewstudentsfaculty");
      mv.addObject("studentlist",studentlist);
      return mv;
    }
	
	@GetMapping("addassignment")
	public ModelAndView addassignment() 
	{
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("addassignment");
	   return mv;
	}

	@PostMapping("insertassignment")
	public String insertassignment(HttpServletRequest request, @RequestParam("assignmentpdf") MultipartFile file) throws Exception {
	    String msg = null;
	    ModelAndView mv = new ModelAndView();
	    try {
	        String coursename = request.getParameter("coursename");
	        String coursecode = request.getParameter("coursecode");
	        int semester = Integer.parseInt(request.getParameter("semester"));
	        String submissiondate = request.getParameter("submissiondate");
	        
	        byte[] bytes = file.getBytes();
	        Blob pdfBlob = new javax.sql.rowset.serial.SerialBlob(bytes);
	        Assignment examPaper = new Assignment();
	        examPaper.setCoursename(coursename);
	        examPaper.setCoursecode(coursecode);
	        examPaper.setSemester(semester);
	        examPaper.setSubmissiondate(submissiondate);
	        examPaper.setAssignmentpdf(pdfBlob);
	        msg = facultyService.addAssignment(examPaper);
	        System.out.println(msg);
	        
	        mv.setViewName("assignmentmsg");
	        mv.addObject("message", msg);

	    } catch (Exception e) {
	        msg = e.getMessage();
	        System.out.println(msg);
	        
	        mv.setViewName("assignmenterror");
	        mv.addObject("message", msg);
	        System.out.println("catch");
	    }

	    return "addassignment";
	}
	@GetMapping("viewassignment")
	public ModelAndView viewexampapers() {
	    ModelAndView mv = new ModelAndView();
	    List<Assignment> assignments = facultyService.getAllAssignments();
	    mv.setViewName("viewassignment");
	    mv.addObject("assignment", assignments);
	    return mv;
	}

	@GetMapping("downloadassignment")
	public ResponseEntity<byte[]> downloadassignment(@RequestParam("id") int id) {
	    Assignment assignment = facultyService.getAssignmentById(id);
	    if (assignment != null && assignment.getAssignmentpdf() != null) {
	        byte[] pdfContent;
	        try {
	            pdfContent = assignment.getAssignmentpdf().getBytes(1, (int) assignment.getAssignmentpdf().length());
	            HttpHeaders headers = new HttpHeaders();
	            headers.setContentType(MediaType.APPLICATION_PDF);
	            headers.setContentDisposition(ContentDisposition.inline().filename(id+".pdf").build());

	            return new ResponseEntity<>(pdfContent, headers, HttpStatus.OK);
	        } catch (SQLException e) {
	            e.printStackTrace();
	            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    }
	    return new ResponseEntity<>(HttpStatus.NOT_FOUND);
	}
}
