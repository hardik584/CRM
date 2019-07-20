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

@Entity
@Table(name = "target_master")
public class TargetMasterVo implements Serializable {

	 
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "target_id", updatable = false, nullable = false)
	int targetId;

	@Column(name = "target_size")
	String targetsize;

	@Column(name = "target_from_date")
	String targetFromDate;

	@Column(name = "target_to_date")
	String targetToDate;

	@ManyToOne
	@JoinColumn(referencedColumnName = "user_id", name = "user_id")
	private UserMasterVo userId;

	public int getTargetId() {
		return targetId;
	}

	public void setTargetId(int targetId) {
		this.targetId = targetId;
	}

	public String getTargetsize() {
		return targetsize;
	}

	public void setTargetsize(String targetsize) {
		this.targetsize = targetsize;
	}

	public UserMasterVo getUserId() {
		return userId;
	}

	public void setUserId(UserMasterVo userId) {
		this.userId = userId;
	}

	public String getTargetToDate() {
		return targetToDate;
	}

	public void setTargetToDate(String targetToDate) {
		this.targetToDate = targetToDate;
	}

	public String getTargetFromDate() {
		return targetFromDate;
	}

	public void setTargetFromDate(String targetFromDate) {
		this.targetFromDate = targetFromDate;
	}
}
