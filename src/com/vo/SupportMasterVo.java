package com.vo;

import java.io.Serializable;
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
@Table(name = "support_master")
public class SupportMasterVo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "support_id", updatable = false, nullable = false)
	int supportId;

	@ManyToOne
	@JoinColumn(name = "customer_id")
	private CustomerMasterVo customerId;

	@Column(name = "support_name", length = 100)
	String supportName;

	@Column(name = "support_date_time", length = 100)
	String supportDateTime;

	@ManyToOne
	@JoinColumn(name = "product_id")
	private ProductMasterVo productId;

	@Column(name = "support_source", length = 100)
	String supportSource;

	@Column(name = "support_status", length = 100)
	String supportStatus;

	@Column(name = "support_remark", length = 100)
	String remark;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private UserMasterVo userId;

	@ManyToOne
	@JoinColumn(referencedColumnName = "category_id", name = "category_id")
	private CategoryMasterVo categoryId;
	
	@LazyCollection(LazyCollectionOption.FALSE)
	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	@JoinColumn(name = "support_id", referencedColumnName="support_id")
	private Set<SupportActivityMasterVo> supportActivityMasterVos;

	public CategoryMasterVo getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(CategoryMasterVo categoryId) {
		this.categoryId = categoryId;
	}

	public void setUserId(UserMasterVo userId) {
		this.userId = userId;

	}

	public UserMasterVo getUserId() {
		return userId;
	}

	public int getSupportId() {
		return supportId;
	}

	public void setSupportId(int supportId) {
		this.supportId = supportId;
	}

	public CustomerMasterVo getCustomerId() {
		return customerId;
	}

	public void setCustomerId(CustomerMasterVo customerId) {
		this.customerId = customerId;
	}

	public String getSupportName() {
		return supportName;
	}

	public void setSupportName(String supportName) {
		this.supportName = supportName;
	}

	public String getSupportDateTime() {
		return supportDateTime;
	}

	public void setSupportDateTime(String supportDateTime) {
		this.supportDateTime = supportDateTime;
	}

	public ProductMasterVo getProductId() {
		return productId;
	}

	public void setProductId(ProductMasterVo productId) {
		this.productId = productId;
	}

	public String getSupportSource() {
		return supportSource;
	}

	public void setSupportSource(String supportSource) {
		this.supportSource = supportSource;
	}

	public String getSupportStatus() {
		return supportStatus;
	}

	public void setSupportStatus(String supportStatus) {
		this.supportStatus = supportStatus;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Set<SupportActivityMasterVo> getSupportActivityMasterVos() {
		return supportActivityMasterVos;
	}

	public void setSupportActivityMasterVos(Set<SupportActivityMasterVo> supportActivityMasterVos) {
		this.supportActivityMasterVos = supportActivityMasterVos;
	}

}