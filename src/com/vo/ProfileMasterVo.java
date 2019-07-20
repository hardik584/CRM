package com.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "profile_master")
public class ProfileMasterVo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	// @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "profile_id", updatable = false, nullable = false, unique = true)
	int profileId;

	@OneToOne
	@JoinColumn(referencedColumnName = "user_id", name = "user_id")
	UserMasterVo userId;

	@Column(name = "profile_gender")
	String profileGender;

	@Column(name = "profile_age")
	String profileAge;

	@Column(name = "profile_dob")
	String profileDateOfBirth;

	@Column(name = "bank_name")
	String bankName;

	@Column(name = "bank_account_no")
	String bankAccountNo;

	@Column(name = "bank_ifsc_code")
	String bankIfscCode;

	@Column(name = "pancard_no")
	String pancardNo;

	@Column(name="profile_image")
	String profileImage;
	
	@ManyToOne
	@JoinColumn(referencedColumnName = "role_id", name = "role_id")
	RoleMasterVo roleId;

	@Column(name = "profile_address")
	String profileAddress;

	@ManyToOne
	@JoinColumn(referencedColumnName = "state_id", name = "state_id")
	StateMasterVo stateId;

	@ManyToOne
	@JoinColumn(referencedColumnName = "city_id", name = "city_id")
	CityMasterVo cityId;

	@Column(name = "profile_pincode")
	String profilePincode;

	public int getProfileId() {
		return profileId;
	}

	public void setProfileId(int profileId) {
		this.profileId = profileId;
	}

	public UserMasterVo getUserId() {
		return userId;
	}

	public void setUserId(UserMasterVo userId) {
		this.userId = userId;
	}

	public String getProfileGender() {
		return profileGender;
	}

	public void setProfileGender(String profileGender) {
		this.profileGender = profileGender;
	}

	public String getProfileAge() {
		return profileAge;
	}

	public void setProfileAge(String profileAge) {
		this.profileAge = profileAge;
	}

	public String getProfileDateOfBirth() {
		return profileDateOfBirth;
	}

	public void setProfileDateOfBirth(String profileDateOfBirth) {
		this.profileDateOfBirth = profileDateOfBirth;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankAccountNo() {
		return bankAccountNo;
	}

	public void setBankAccountNo(String bankAccountNo) {
		this.bankAccountNo = bankAccountNo;
	}

	public String getBankIfscCode() {
		return bankIfscCode;
	}

	public void setBankIfscCode(String bankIfscCode) {
		this.bankIfscCode = bankIfscCode;
	}

	public RoleMasterVo getRoleId() {
		return roleId;
	}

	public void setRoleId(RoleMasterVo roleId) {
		this.roleId = roleId;
	}

	public String getProfileAddress() {
		return profileAddress;
	}

	public void setProfileAddress(String profileAddress) {
		this.profileAddress = profileAddress;
	}

	public StateMasterVo getStateId() {
		return stateId;
	}

	public void setStateId(StateMasterVo stateId) {
		this.stateId = stateId;
	}

	public CityMasterVo getCityId() {
		return cityId;
	}

	public void setCityId(CityMasterVo cityId) {
		this.cityId = cityId;
	}

	public String getProfilePincode() {
		return profilePincode;
	}

	public void setProfilePincode(String profilePincode) {
		this.profilePincode = profilePincode;
	}

	public String getPancardNo() {
		return pancardNo;
	}

	public String getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}

	public void setPancardNo(String pancardNo) {
		this.pancardNo = pancardNo;
	}

}
