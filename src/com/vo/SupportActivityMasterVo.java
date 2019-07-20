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
@Table(name = "support_activity_master")
public class SupportActivityMasterVo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "support_activity_id", updatable = false, nullable = false)
	int supportActivityId;

	@Column(name = "support_activity_name")
	String supportActivityName;

	@Column(name = "support_activity_type")
	String supportActivityType;

	@Column(name = "support_activity_date_time")
	String supportActivityDateTime;

	@Column(name = "support_activity_outcome")
	String supportActivityOutcome;

	@Column(name = "support_description")
	String supportActivityDescription;

	@Column(name = "reminder_date")
	String supportActivityReminderDate;

	@Column(name = "reminder_time")
	String supportActivityReminderTime;

	@Column(name = "reminder_remark")
	String supportActivityReminderRemark;

	@ManyToOne
	@JoinColumn(name = "support_id")
	private SupportMasterVo supportId;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private UserMasterVo userId;

	public String getSupportActivityType() {
		return supportActivityType;
	}

	public void setSupportActivityType(String supportActivityType) {
		this.supportActivityType = supportActivityType;
	}

	public String getSupportActivityOutcome() {
		return supportActivityOutcome;
	}

	public void setSupportActivityOutcome(String supportActivityOutcome) {
		this.supportActivityOutcome = supportActivityOutcome;
	}

	public String getSupportActivityReminderRemark() {
		return supportActivityReminderRemark;
	}

	public void setSupportActivityReminderRemark(String supportActivityReminderRemark) {
		this.supportActivityReminderRemark = supportActivityReminderRemark;
	}

	public SupportMasterVo getSupportId() {
		return supportId;
	}

	public void setSupportId(SupportMasterVo supportId) {
		this.supportId = supportId;
	}

	public UserMasterVo getUserId() {
		return userId;
	}

	public void setUserId(UserMasterVo userId) {
		this.userId = userId;
	}

	public int getSupportActivityId() {
		return supportActivityId;
	}

	public void setSupportActivityId(int supportActivityId) {
		this.supportActivityId = supportActivityId;
	}

	public String getSupportActivityName() {
		return supportActivityName;
	}

	public void setSupportActivityName(String supportActivityName) {
		this.supportActivityName = supportActivityName;
	}

	public String getSupportActivityDateTime() {
		return supportActivityDateTime;
	}

	public void setSupportActivityDateTime(String supportActivityDateTime) {
		this.supportActivityDateTime = supportActivityDateTime;
	}

	public String getSupportActivityDescription() {
		return supportActivityDescription;
	}

	public void setSupportActivityDescription(String supportActivityDescription) {
		this.supportActivityDescription = supportActivityDescription;
	}

	public String getSupportActivityReminderDate() {
		return supportActivityReminderDate;
	}

	public void setSupportActivityReminderDate(String supportActivityReminderDate) {
		this.supportActivityReminderDate = supportActivityReminderDate;
	}

	public String getSupportActivityReminderTime() {
		return supportActivityReminderTime;
	}

	public void setSupportActivityReminderTime(String supportActivityReminderTime) {
		this.supportActivityReminderTime = supportActivityReminderTime;
	}

}