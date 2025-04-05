package com.klef.jfsd.springboot.controller;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

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

import com.klef.jfsd.springboot.model.Assignment;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.Submission;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.FacultyService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class StudentController 
{	
	@Autowired
	private StudentService studentService;

	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("studenthome")
	public ModelAndView studenthome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("studenthome");
		return mv;
	}
	
	@GetMapping("mycourses")
	public ModelAndView mycourses()
	{
		ModelAndView mv = new ModelAndView();
		List<Course> clist = adminService.ViewAllCourses();
		mv.setViewName("mycourses");
		mv.addObject("courseslist",clist);
		return mv;
	}
	
	@GetMapping("/my-courses")
    public ModelAndView viewRegisteredCourses(@RequestParam("studentId") int studentId) {
        ModelAndView mv = new ModelAndView();

        Optional<Student> studentOptional = studentService.findStudentById(studentId);
        if (studentOptional.isPresent()) {
            Student student = studentOptional.get();
            Set<Course> registeredCourses = student.getCourses();
            mv.setViewName("my-courses");
            mv.addObject("registeredCourses", registeredCourses);
        } else {
            mv.setViewName("error");
            mv.addObject("message", "Student not found!");
        }

        return mv;
    }
	
	@GetMapping("course")
	public ModelAndView course()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("course");
		return mv;
	}
	
	
	@GetMapping("viewassign")
	public ModelAndView viewassign() {
	    ModelAndView mv = new ModelAndView();
	    List<Assignment> assignments = facultyService.getAllAssignments();
	    mv.setViewName("viewassign");
	    mv.addObject("assignment", assignments);
	    return mv;
	}
	
	@GetMapping("/student")
    public ModelAndView studentDashboard(@RequestParam("studentId") int studentId) {
        ModelAndView mv = new ModelAndView();

        Optional<Student> studentOptional = studentService.findStudentById(studentId);
        if (studentOptional.isPresent()) {
            Student student = studentOptional.get();
            mv.setViewName("student-dashboard");
            mv.addObject("student", student);
        } else {
            mv.setViewName("error");
            mv.addObject("message", "Student not found!");
        }

        return mv;
    }

    // Course Registration Page
    @GetMapping("/register-courses")
    public ModelAndView registerCoursesPage(@RequestParam("studentId") int studentId) {
        ModelAndView mv = new ModelAndView();

        Optional<Student> studentOptional = studentService.findStudentById(studentId);
        if (studentOptional.isPresent()) {
            Student student = studentOptional.get();
            // Filter courses by the student's year of study
            List<Course> availableCourses = adminService.ViewAllCourses()
                                                         .stream()
                                                         .filter(course -> course.getSemester() == student.getYearofstudy())
                                                         .collect(Collectors.toList());
            mv.setViewName("register-courses");
            mv.addObject("studentId", studentId);
            mv.addObject("availableCourses", availableCourses);
        } else {
            mv.setViewName("error");
            mv.addObject("message", "Student not found!");
        }

        return mv;
    }

    // Handle Course Registration
    @PostMapping("/register-courses")
    public ModelAndView handleCourseRegistration(@RequestParam("studentId") int studentId, 
                                                 @RequestParam("courseIds") List<Integer> courseIds) {
        ModelAndView mv = new ModelAndView();

        Optional<Student> studentOptional = studentService.findStudentById(studentId);
        if (studentOptional.isPresent()) {
            studentService.registerCourses(studentId, courseIds);
            mv.setViewName("studenthome");
            mv.addObject("message", "Courses registered successfully!");
        } else {
            mv.setViewName("error");
            mv.addObject("message", "Student not found!");
        }

        return mv;
    }

    // View Registered Courses
    

	@PostMapping("insertsubmission")
	public String insertassignment(HttpServletRequest request, @RequestParam("submissionpdf") MultipartFile file) throws Exception {
	    String msg = null;
	    ModelAndView mv = new ModelAndView();
	    try {
	        String submissiondate = request.getParameter("submissiondate");
	        
	        byte[] bytes = file.getBytes();
	        Blob pdfBlob = new javax.sql.rowset.serial.SerialBlob(bytes);
	        Submission submission = new Submission();
	        submission.setSubmissiondate(submissiondate);
	        submission.setSubmissionpdf(pdfBlob);
	        msg = studentService.addSubmission(submission);
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

	    return "studenthome";
	}
	@GetMapping("viewsubmission")
	public ModelAndView viewsubmissions() {
	    ModelAndView mv = new ModelAndView();
	    List<Submission> submissions = studentService.getAllSubmissions();
	    mv.setViewName("viewsubmission");
	    mv.addObject("submission", submissions);
	    return mv;
	}

	@GetMapping("downloadsubmission")
	public ResponseEntity<byte[]> downloadsubmission(@RequestParam("id") int id) {
		Submission submission = studentService.getSubmissionById(id);
	    if (submission != null && submission.getSubmissionpdf() != null) {
	        byte[] pdfContent;
	        try {
	            pdfContent = submission.getSubmissionpdf().getBytes(1, (int) submission.getSubmissionpdf().length());
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
