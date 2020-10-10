package org.travelers.domain;

public class GenderVO {
	
	private String gender;
	private String genderName;

	public String getGenderName() {
		return genderName;
	}

	public void setGenderName(String genderName) {
		this.genderName = genderName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "GenderVO [gender=" + gender + ", genderName=" + genderName + "]";
	}
}
