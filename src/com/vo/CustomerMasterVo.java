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
@Table(name="customer_master")
public class CustomerMasterVo implements Serializable {
	
	 
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "customer_id" , updatable = false, nullable = false)
    int customerId;
     
    @Column(name = "customer_name",length = 100, nullable=false)
     String customerName;
     
    @Column(name = "email",length = 100, nullable=false)
    String emailId;

    @Column(name = "company_name",length = 100, nullable=false)
    String companyName;

    @Column(name = "address",length = 100, nullable=false)
    String address;
    
    
    @ManyToOne
    @JoinColumn(referencedColumnName="state_id",name="state_id", nullable=false)
	private StateMasterVo stateId;
     
    @ManyToOne
    @JoinColumn(referencedColumnName="city_id",name="city_id", nullable=false)
    private CityMasterVo cityId;
    
    @Column(name = "pincode",length = 100, nullable=false)
    int pincode;
    
    @Column(name = "designation",length = 100)
    String designation;
    
    @Column(name = "mobile",length = 100, nullable=false)
    String mobileNumber;
    
    @Column(name = "telephone",length = 100)
    String telephone;
    
    @Column(name = "gst_no",length = 100)
    String gstNo;
    
    @ManyToOne
    @JoinColumn(referencedColumnName="user_id",name="user_id")
    private UserMasterVo userId;

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getEmailId() {
		return emailId;
	}

	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public int getPincode() {
		return pincode;
	}

	public void setPincode(int pincode) {
		this.pincode = pincode;
	}

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
	}

	public String getMobileNumber() {
		return mobileNumber;
	}

	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getGstNo() {
		return gstNo;
	}

	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}

	public UserMasterVo getUserId() {
		return userId;
	}

	public void setUserId(UserMasterVo userId) {
		this.userId = userId;
	}

}
