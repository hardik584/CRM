package com.dao;

import java.util.List;

import org.hibernate.Transaction;

import com.vo.SupportActivityMasterVo;

public class SupportActivityMasterDao {
		DBConnection connection = new DBConnection();

	public List supportActivity(SupportActivityMasterVo supportActivityMasterVo) {
		connection.getConnection();
		List supportActivity = connection.session.createQuery("from SupportActivityMasterVo where supportId="+supportActivityMasterVo.getSupportId().getSupportId()).list();
		 
		return supportActivity;
	}

	public List supportDetail(SupportActivityMasterVo supportActivityMasterVo) {
		List supportDetail = connection.session.createQuery("from SupportMasterVo where supportId="+supportActivityMasterVo.getSupportId().getSupportId()).list();
		return supportDetail;
	}

	public void addSupportActivity(SupportActivityMasterVo supportActivityMasterVo) {
		connection.getConnection();
		Transaction transaction = connection.session.beginTransaction();
		connection.session.save(supportActivityMasterVo);
		transaction.commit();
	
	}

	public List listsupportActivity(SupportActivityMasterVo supportActivityMasterVo) {
		connection.getConnection();
		List listsupportActivity=connection.session.createQuery("from SupportActivityMasterVo userId="+supportActivityMasterVo.getUserId().getUserId()).list();
		return listsupportActivity;
	}

	public void deleteSupportActivity(SupportActivityMasterVo supportActivityMasterVo) {
		connection.getConnection();
		Transaction transaction = connection.session.beginTransaction();
		connection.session.delete(supportActivityMasterVo);
		transaction.commit();
	}
}