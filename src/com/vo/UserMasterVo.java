package com.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.vo.UserMasterVo;

@Entity
@Table(name = "user_master")
public class UserMasterVo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "user_id", updatable = false, nullable = false)
	int userId;

	@Column(name = "user_name")
	String userName;

	@Column(name = "user_mobile")
	String userMobile;

	@Column(name = "user_email")
	String userEmail;

	@Column(name = "user_password")
	String userPassword;

	@ManyToOne
	@JoinColumn(referencedColumnName = "role_id", name = "role_id")
	private RoleMasterVo roleId;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public String getUserEmail() {
		return userEmail;
	}	

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public RoleMasterVo getRoleId() {
		return roleId;
	}

	public void setRoleId(RoleMasterVo roleId) {
		this.roleId = roleId;
	}

}
