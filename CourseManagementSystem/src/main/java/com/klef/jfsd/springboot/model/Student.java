package com.klef.jfsd.springboot.model;

import java.sql.Blob;
import java.util.HashSet;
import java.util.Set;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="student_table")
public class Student 
{
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int id;
	 @Column(nullable=false,length = 50)
	 private String name;
	 @Column(nullable=false,length = 20)
	 private String gender;
	 @Column(nullable=false,length = 20)
	 private String dateofbirth;
	 @Column(nullable=false,length = 50)
	 private String department;
	 @Column(nullable=false)
	 private int yearofstudy;
	 @Column(nullable=false)
	 private double fee;
	 @Column(nullable=false,unique = true,length = 50)
	 private String email;
	 @Column(nullable=false,length = 50)
	 private String password;
	 @Column(nullable=false,length=150)
	 private String address;
	 @Column(nullable=false,unique = true,length = 20)
	 private String contact;
	 @Column(nullable=false,unique = true,length = 20)
	 private String parentcontact;
	 @Column(name="profile_image",nullable = false)
	 private Blob image;
	 
	 @ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	    @JoinTable(
	        name = "student_course",
	        joinColumns = @JoinColumn(name = "student_id"),
	        inverseJoinColumns = @JoinColumn(name = "course_id")
	    )
	    private Set<Course> courses = new HashSet<>();
	 
	 public Set<Course> getCourses() {
	        return courses;
	    }

	    public void setCourses(Set<Course> courses) {
	        this.courses = courses;
	    }
	 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public int getYearofstudy() {
		return yearofstudy;
	}
	public void setYearofstudy(int yearofstudy) {
		this.yearofstudy = yearofstudy;
	}
	public double getFee() {
		return fee;
	}
	public void setFee(double fee) {
		this.fee = fee;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getParentcontact() {
		return parentcontact;
	}
	public void setParentcontact(String parentcontact) {
		this.parentcontact = parentcontact;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
}
