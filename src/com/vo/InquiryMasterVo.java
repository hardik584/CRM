package com.vo;

import java.io.Serializable;
import java.util.Date;
 
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name = "inquiry_master")
public class InquiryMasterVo  implements Serializable {

	 
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "inquiry_id", updatable = false, nullable = false)
	int inquiryId;

	@ManyToOne
	@JoinColumn(referencedColumnName = "customer_id", name = "customer_id")
	private CustomerMasterVo customerId;

	@Column(name = "inquiry_title", length = 100)
	String inquiryTitle;

	@Column(name = "inquiry_date_time", length = 100)
	Date inquiryDateTime;

	@ManyToOne
	@JoinColumn(referencedColumnName = "category_id", name = "category_id")
	private CategoryMasterVo categoryId;
	
	@ManyToOne
	@JoinColumn(referencedColumnName = "product_id", name = "product_id")
	private ProductMasterVo productId;

	@Column(name = "inquiry_source", length = 100)
	String inquirySource;

	@Column(name = "inquiry_status", length = 100)
	String inquiryStatus;

	@Column(name = "inquiry_remark", length = 100)
	String inquiryRemark;

	@Column(name = "visiting_card", length = 256)
	String visitingCard;
	
	@Column(name = "modified_on", length = 256)
	String modifiedOn;
	
	@Column(name="secure_random_number")
	String secureRandomNumber;
	
	@Column(name="assign_id")
	String assignId;
	 
	
	@ManyToOne
	@JoinColumn(referencedColumnName = "user_id", name = "user_id")
	private UserMasterVo userId;

	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinColumn(name = "inquiry_id", referencedColumnName="inquiry_id")
	private Set<InquiryActivityMasterVo> inquiryActivityMasterVos;
	
	public int getInquiryId() {
		return inquiryId;
	}

	public void setInquiryId(int inquiryId) {
		this.inquiryId = inquiryId;
	}

	public CustomerMasterVo getCustomerId() {
		return customerId;
	}

	public void setCustomerId(CustomerMasterVo customerId) {
		this.customerId = customerId;
	}

	 
	public ProductMasterVo getProductId() {
		return productId;
	}

	public void setProductId(ProductMasterVo productId) {
		this.productId = productId;
	}

	public String getInquirySource() {
		return inquirySource;
	}

	public void setInquirySource(String inquirySource) {
		this.inquirySource = inquirySource;
	}

	public String getInquiryStatus() {
		return inquiryStatus;
	}

	public void setInquiryStatus(String inquiryStatus) {
		this.inquiryStatus = inquiryStatus;
	}

	 

	public UserMasterVo getUserId() {
		return userId;
	}

	public void setUserId(UserMasterVo userId) {
		this.userId = userId;
	}

	public Date getInquiryDateTime() {
		return inquiryDateTime;
	}

	public void setInquiryDateTime(Date inquiryDateTime) {
		this.inquiryDateTime = inquiryDateTime;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}

	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}

	public CategoryMasterVo getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(CategoryMasterVo categoryId) {
		this.categoryId = categoryId;
	}

	public String getInquiryRemark() {
		return inquiryRemark;
	}

	public void setInquiryRemark(String inquiryRemark) {
		this.inquiryRemark = inquiryRemark;
	}

	public String getVisitingCard() {
		return visitingCard;
	}

	public String getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(String modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	public void setVisitingCard(String visitingCard) {
		this.visitingCard = visitingCard;
	}

	public Set<InquiryActivityMasterVo> getInquiryActivityMasterVos() {
		return inquiryActivityMasterVos;
	}

	public void setInquiryActivityMasterVos(Set<InquiryActivityMasterVo> inquiryActivityMasterVos) {
		this.inquiryActivityMasterVos = inquiryActivityMasterVos;
	}

	public String getSecureRandomNumber() {
		return secureRandomNumber;
	}

	public void setSecureRandomNumber(String secureRandomNumber) {
		this.secureRandomNumber = secureRandomNumber;
	}

	public String getAssignId() {
		return assignId;
	}

	public void setAssignId(String assignId) {
		this.assignId = assignId;
	}

	 
}
