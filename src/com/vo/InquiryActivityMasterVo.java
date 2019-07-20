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
@Table(name="inquiry_activity_master")

public class InquiryActivityMasterVo  implements Serializable{

	 
		private static final long serialVersionUID = 1L;

		@Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    @Column(name = "inq_activity_id" , updatable = false, nullable = false)
	    int inquiryActivityId;
		
		@ManyToOne
		@JoinColumn(referencedColumnName="inquiry_id",name="inquiry_id")
		private InquiryMasterVo inquiryId;
		
		@Column(name = "inq_activity_name")
		String inquiryActivityName;
			
		@Column(name = "inq_activity_type")
		String inquiryActivityType;
		
		@Column(name = "inq_activity_date_Time")
		String inquiryActivityDateTime;
			
		
		@Column(name = "inq_activity_remark")
		String inquiryActivityRemark;
			
		@Column(name = "remainder_date")
		String remainderDate;
		
		@Column(name = "remainder_time")
		String  remainderTime;
			
		@Column(name="remainder_remark")
		String remainderRemark;
		
		@Column(name = "inq_activity_outcome")
		String inquiryActivityOutcome;
		
		@ManyToOne
		@JoinColumn(referencedColumnName="user_id",name="user_id")
		private UserMasterVo userId;

		public int getInquiryActivityId() {
			return inquiryActivityId;
		}

		public void setInquiryActivityId(int inquiryActivityId) {
			this.inquiryActivityId = inquiryActivityId;
		}

		public InquiryMasterVo getInquiryId() {
			return inquiryId;
		}

		public void setInquiryId(InquiryMasterVo inquiryId) {
			this.inquiryId = inquiryId;
		}

		public String getInquiryActivityName() {
			return inquiryActivityName;
		}

		public void setInquiryActivityName(String inquiryActivityName) {
			this.inquiryActivityName = inquiryActivityName;
		}

		 

		public String getInquiryActivityRemark() {
			return inquiryActivityRemark;
		}

		public void setInquiryActivityRemark(String inquiryActivityRemark) {
			this.inquiryActivityRemark = inquiryActivityRemark;
		}

		 
		public String getRemainderRemark() {
			return remainderRemark;
		}

		public void setRemainderRemark(String remainderRemark) {
			this.remainderRemark = remainderRemark;
		}

		public String getInquiryActivityOutcome() {
			return inquiryActivityOutcome;
		}

		public void setInquiryActivityOutcome(String inquiryActivityOutcome) {
			this.inquiryActivityOutcome = inquiryActivityOutcome;
		}

		public UserMasterVo getUserId() {
			return userId;
		}

		public void setUserId(UserMasterVo userId) {
			this.userId = userId;
		}

		public String getInquiryActivityDateTime() {
			return inquiryActivityDateTime;
		}

		public void setInquiryActivityDateTime(String inquiryActivityDateTime) {
			this.inquiryActivityDateTime = inquiryActivityDateTime;
		}

		public String getRemainderDate() {
			return remainderDate;
		}

		public void setRemainderDate(String remainderDate) {
			this.remainderDate = remainderDate;
		}

		public String getRemainderTime() {
			return remainderTime;
		}

		public void setRemainderTime(String remainderTime) {
			this.remainderTime = remainderTime;
		}

		public String getInquiryActivityType() {
			return inquiryActivityType;
		}

		public void setInquiryActivityType(String inquiryActivityType) {
			this.inquiryActivityType = inquiryActivityType;
		}

		 
}
