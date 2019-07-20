package com.dao;

import java.util.List;

import org.hibernate.Transaction;

import com.vo.InquiryActivityMasterVo;

public class InquiryActivityMasterDao {
	DBConnection connection=new DBConnection();

	public void addInquiryActivity(InquiryActivityMasterVo inquiryActivityMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.save(inquiryActivityMasterVo);
		transaction.commit();
		connection.session.close();

	}

	public List listInquiryActivity(InquiryActivityMasterVo inquiryActivityMasterVo) {
		connection.getConnection();
		List listInquiryActivity= connection.session.createQuery("from InquiryActivityMasterVo where inquiryId="+inquiryActivityMasterVo.getInquiryId().getInquiryId()).list();
		connection.session.close();
		return listInquiryActivity;
	}

	public List inquiryDetail(InquiryActivityMasterVo inquiryActivityMasterVo) {
		connection.getConnection();
		List inquiryDetail= connection.session.createQuery("from InquiryMasterVo where inquiryId="+inquiryActivityMasterVo.getInquiryId().getInquiryId()).list();
		connection.session.close();
		return inquiryDetail;
	}

	public List listNotify() {
		connection.getConnection();
		List listNotify= connection.session.createQuery("from InquiryActivityMasterVo  WHERE DATE(remainderDate)= CURDATE()-1").list();
		connection.session.close();
		return listNotify;
	}

	public void deleteInquiryActivity(InquiryActivityMasterVo inquiryActivityMasterVo1) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.delete(inquiryActivityMasterVo1);
		transaction.commit();
		connection.session.close();

		
	}

}
