package org.travelers.domain;

public class UserVO {
	private String id;
	private String password;
	private String name;
	private String eng_Lastname;
	private String eng_Firstname;
	private String gender;
	private String birth;
	private String email;
	private String phone;
	private String role;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getEng_Lastname() {
		return eng_Lastname;
	}
	public void setEng_Lastname(String eng_Lastname) {
		this.eng_Lastname = eng_Lastname;
	}
	public String getEng_Firstname() {
		return eng_Firstname;
	}
	public void setEng_Firstname(String eng_Firstname) {
		this.eng_Firstname = eng_Firstname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", eng_Lastname=" + eng_Lastname
				+ ", eng_Firstname=" + eng_Firstname + ", gender=" + gender + ", birth=" + birth + ", email=" + email
				+ ", phone=" + phone + ", role=" + role + "]";
	}
	
	

}
