package com.klef.jfsd.springboot.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.FacultyCourseMapping;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.FacultyService;
import com.klef.jfsd.springboot.service.StudentService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private FacultyService facultyService;
	
	@Autowired
	private StudentService studentService;
	
	@GetMapping("login")
	public ModelAndView index(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		session.removeAttribute("admin");
		session.removeAttribute("faculty");
		session.removeAttribute("student");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index");
		return mv;
	}

	@GetMapping("/")
	public ModelAndView front()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("front");
		return mv;
	}
	
	@GetMapping("loginfail")
	public ModelAndView loginfail()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("loginfail");
		return mv;
	}
	
	@PostMapping("checklogin")
	public ModelAndView checklogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
	
		String auname = request.getParameter("auname");
		String apwd = request.getParameter("apwd");
		Admin admin = adminService.checkadminlogin(auname, apwd);
		Faculty faculty = facultyService.checkfacultylogin(auname, apwd);
		Student student = studentService.checkstudentlogin(auname, apwd);
		if(admin!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
			mv.setViewName("adminhome");
		}
		else if(faculty!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("faculty", faculty);
			mv.setViewName("facultyhome");
		}
		else if(student!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("student", student);
			mv.setViewName("studenthome");
		}
		else
		{
			mv.setViewName("index");
			mv.addObject("message", "Login Failed");
		}
		return mv;
	}
	

	@GetMapping("adminhome")
	public ModelAndView adminhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminhome");
		return mv;
	}
	
	@GetMapping("addstudent")
	public ModelAndView addstudent()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addstudent");
		return mv;
	}
	
	@PostMapping("insertstudent")
	   public ModelAndView insertstudent(HttpServletRequest request,@RequestParam("profileimage") MultipartFile file) throws Exception
	   {
		   String msg = null;
		   
		   ModelAndView mv = new ModelAndView();
		   
		   try
		   {
		   String name = request.getParameter("name");
		   String gender = request.getParameter("gender");
		   String dateofbirth = request.getParameter("dateofbirth");
		   String department = request.getParameter("department");
		   int year = Integer.parseInt(request.getParameter("yearofstudy"));
		   double fee = Double.valueOf(request.getParameter("fee"));
		   String email = request.getParameter("email");
		   String password = request.getParameter("password");
		   String location = request.getParameter("location");
		   String contact = request.getParameter("contact");
		   String pcontact = request.getParameter("parentcontact");
		   
			  byte[] bytes = file.getBytes();
			  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			  //  creates a Blob object in Java from a byte array (bytes).
			  
			  Student s = new Student();
			  s.setName(name);
			  s.setGender(gender);
			  s.setDateofbirth(dateofbirth);
			  s.setDepartment(department);
			  s.setYearofstudy(year);
			  s.setFee(fee);
			  s.setEmail(email);
			  s.setPassword(password);
			  s.setAddress(location);
			  s.setContact(contact);
			  s.setParentcontact(pcontact);
			  s.setImage(blob);
			  
			  msg=adminService.AddStudent(s);
			  System.out.println(msg);
			  mv.setViewName("studentmsg");
			  mv.addObject("message",msg);
		   }	  
		   catch(Exception e)
		   {
			   msg = e.getMessage();
			   System.out.println(msg.toString());
			   mv.setViewName("studentmsg");
			   mv.addObject("message",msg);
		   }
		   return mv;
	   }
	
	@GetMapping("addfaculty")
	public ModelAndView addfaculty()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addfaculty");
		return mv;
	}
	
	@PostMapping("insertfaculty")
	   public ModelAndView insertfaculty(HttpServletRequest request,@RequestParam("profileimage") MultipartFile file) throws Exception
	   {
		   String msg = null;
		   
		   ModelAndView mv = new ModelAndView();
		   
		   try
		   {
		   String name = request.getParameter("name");
		   String gender = request.getParameter("gender");
		   String dateofbirth = request.getParameter("dateofbirth");
		   String department = request.getParameter("department");
		   double salary = Double.valueOf(request.getParameter("salary"));
		   String email = request.getParameter("email");
		   String password = request.getParameter("password");
		   String location = request.getParameter("location");
		   String contact = request.getParameter("contact");
		   String status = "Registered";
		   
			  byte[] bytes = file.getBytes();
			  Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
			  //  creates a Blob object in Java from a byte array (bytes).
			  
			  Faculty f = new Faculty();
			  f.setName(name);
			  f.setGender(gender);
			  f.setDateofbirth(dateofbirth);
			  f.setDepartment(department);
			  f.setSalary(salary);
			  f.setEmail(email);
			  f.setPassword(password);
			  f.setLocation(location);
			  f.setContact(contact);
			  f.setImage(blob);
			  
			  msg=adminService.AddFaculty(f);
			  System.out.println(msg);
			  mv.setViewName("facultymsg");
			  mv.addObject("message",msg);
		   }	  
		   catch(Exception e)
		   {
			   msg = e.getMessage();
			   System.out.println(msg.toString());
			   mv.setViewName("facultymsg");
			   mv.addObject("message",msg);
		   }
		   return mv;
	   }
	
	@GetMapping("addcourse")
	 public ModelAndView addcourse(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addcourse");
		return mv;

		
	}
	@PostMapping("insertcourse")
	public ModelAndView insertCourse(HttpServletRequest request) {
	    String courseName = request.getParameter("courseName");
	    String courseCode = request.getParameter("courseCode");
	    int credits = Integer.parseInt(request.getParameter("credits"));
	    String department = request.getParameter("department");
	    String ltps = request.getParameter("ltps");
	    String courseCoordinator = request.getParameter("courseCoordinator");
	    int semester = Integer.parseInt(request.getParameter("semester"));

	    Course course = new Course();
	    course.setCourseName(courseName);
	    course.setCourseCode(courseCode);
	    course.setCredits(credits);
	    course.setDepartment(department);
	    course.setLtps(ltps);
	    course.setCourseCoordinator(courseCoordinator);
	    course.setSemester(semester);
	    
	    
	    String msg = adminService.AddCourse(course);

	    ModelAndView mv = new ModelAndView("coursesuccess");
	    mv.addObject("message", msg);

	    return mv;
	}
	
	@GetMapping("updatecourse")
	public ModelAndView updatecourse()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updatecourse");
		return mv;
	}
	
	@GetMapping("feedbacks")
	public ModelAndView feedbacks()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("feedbacks");
		return mv;
	}
	
	@GetMapping("viewfaculty")
    public ModelAndView viewfaculty()
    {
      ModelAndView mv = new ModelAndView();
      List<Faculty> facultylist = adminService.ViewAllFacultys();
      mv.setViewName("viewfaculty");
      mv.addObject("facultylist",facultylist);
		
      return mv;
    }
	
	@GetMapping("viewstudents")
    public ModelAndView viewstudents()
    {
      ModelAndView mv = new ModelAndView();
      List<Student> studentlist = adminService.ViewAllStudents();
      mv.setViewName("viewstudents");
      mv.addObject("studentlist",studentlist);
      return mv;
    }
	
	@GetMapping("viewcourses")
	public ModelAndView viewcourses() 
	{
		ModelAndView mv = new ModelAndView();
	    List<Course> clist = adminService.ViewAllCourses();
	    mv.setViewName("viewcourses");
	    mv.addObject("courseslist",clist);
	    return mv;
	}
	
	
	@GetMapping("deletefaculty2")
	public String deletefaculty1(@RequestParam("id") int fid)
	{
		adminService.deletefaculty(fid);
		return "redirect:/viewfaculty";
	}
	
	@GetMapping("deletestudent")
	public String deletestudent(@RequestParam("id") int sid)
	{
		adminService.deletestudent(sid);
		return "redirect:/viewstudents";
	}
	
	@GetMapping("deletecourse")
	public String deletecourse(@RequestParam("id") int cid)
	{
		adminService.deletecourse(cid);
		return "redirect:/viewcourses";
	}
	
	@GetMapping("coursemapping")
	public ModelAndView coursemapping()
	{
		ModelAndView mv = new ModelAndView("coursemapping");
	    List<Course> courselist = adminService.displayAllCourses();
	    mv.addObject("coursedata", courselist);
	    List<Faculty> facultylist = adminService.displayAllFaculty();
		mv.addObject("facultydata", facultylist);
		return mv;
	}
	@PostMapping("fcoursemappinginsert")
	public ModelAndView fcoursemappinginsert(HttpServletRequest request)
	{
		  String msg=null;
		  ModelAndView mv = new ModelAndView("coursemapping");
		  int fid = Integer.parseInt(request.getParameter("fid"));
		  int cid = Integer.parseInt(request.getParameter("cid"));
		  int section = Integer.parseInt(request.getParameter("section"));
		  String ftype = request.getParameter("ftype");
		  
		  long n = adminService.checkFacultyCourseMapping(adminService.displayFacultyById(fid), adminService.displayCourseById(cid), section);
		  
		  if(n>0)
		  {
			  msg = "Mapping Already Done";
		  }
		  else
		  {
			  FacultyCourseMapping fcm = new FacultyCourseMapping();
			  fcm.setCourse(adminService.displayCourseById(cid));
			  fcm.setFaculty(adminService.displayFacultyById(fid));
			  fcm.setSection(section);
			  fcm.setFacultytype(ftype);
			  msg = adminService.facultyCourseMapping(fcm);  
		  }
		  mv.addObject("message", msg);
		  return mv;
	}
}
