package com.vo;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="quotation_master")

public class QuotationMasterVo  implements Serializable {	
	
	 
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "quotation_id" , updatable = false, nullable = false)
    int quotationId;
	
	@Column(name = "quotation_email")
	String quotationEmail;
	
	@Column(name = "quotation_subject")
	String quotationSubject;
	
	@Column(name = "quotation_Content")
	String quotationContent;
	
	@Column(name = "quotation_date")
	String quotationDateTime;
	
	@Column(name = "quotation_file")
	String quotationFile;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private UserMasterVo userId;

	public int getQuotationId() {
		return quotationId;
	}

	public void setQuotationId(int quotationId) {
		this.quotationId = quotationId;
	}

	public String getQuotationEmail() {
		return quotationEmail;
	}

	public void setQuotationEmail(String quotationEmail) {
		this.quotationEmail = quotationEmail;
	}

	public String getQuotationSubject() {
		return quotationSubject;
	}

	public void setQuotationSubject(String quotationSubject) {
		this.quotationSubject = quotationSubject;
	}

	public String getQuotationContent() {
		return quotationContent;
	}

	public void setQuotationContent(String quotationContent) {
		this.quotationContent = quotationContent;
	}

	public String getQuotationDateTime() {
		return quotationDateTime;
	}

	public void setQuotationDateTime(String quotationDateTime) {
		this.quotationDateTime = quotationDateTime;
	}

	public String getQuotationFile() {
		return quotationFile;
	}

	public void setQuotationFile(String quotationFile) {
		this.quotationFile = quotationFile;
	}

	public UserMasterVo getUserId() {
		return userId;
	}

	public void setUserId(UserMasterVo userId) {
		this.userId = userId;
	}
}