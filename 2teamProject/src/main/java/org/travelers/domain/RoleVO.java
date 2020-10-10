package org.travelers.domain;

public class RoleVO {
	private String role;
	private String roleName;
	private String description;

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public String toString() {
		return "RoleVO [role=" + role + ", roleName=" + roleName + ", description=" + description + "]";
	}
	
}