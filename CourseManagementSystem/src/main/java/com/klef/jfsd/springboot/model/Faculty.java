package com.klef.jfsd.springboot.model;

import java.sql.Blob;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="faculty_table")
public class Faculty 
{
	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY) 
	 @Column(name="faculty_id")
	 private int id;
	 @Column(name="faculty_name",nullable=false,length = 50)
	 private String name;
	 @Column(name="faculty_gender",nullable=false,length = 20)
	 private String gender;
	 @Column(name="faculty_dob",nullable=false,length = 20)
	 private String dateofbirth;
	 @Column(name="faculty_department",nullable=false,length = 50)
	 private String department;
	 @Column(name="faculty_salary",nullable=false)
	 private double salary;
	 @Column(name="faculty_email",nullable=false,unique = true,length = 50)
	 private String email;
	 @Column(name="faculty_password",nullable=false,length = 50)
	 private String password;
	 @Column(name="faculty_location",nullable=false,length=50)
	 private String location;
	 @Column(name="faculty_contact",nullable=false,unique = true,length = 20)
	 private String contact;
	 @Column(name="profile_image",nullable = false)
	 private Blob image;
	 
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
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	 
	
}
