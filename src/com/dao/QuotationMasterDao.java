package com.dao;

import java.util.List;

import org.hibernate.Transaction;

import com.vo.QuotationMasterVo;
import com.vo.UserMasterVo;

public class QuotationMasterDao {
	DBConnection connection=new DBConnection();
	
	public List listEmail(int userId, int roleId) {
		List listEmail=null;
		if(roleId==2 || roleId==3)
		{
		connection.getConnection();
		 listEmail=  connection.session.createQuery("from CustomerMasterVo where userId="+userId).list();
		}
		else if(roleId==1)
		{
			connection.getConnection();
			 listEmail=  connection.session.createQuery("from CustomerMasterVo").list();
		}
		 return listEmail;
	}

	public void addQuotation(QuotationMasterVo quotationMasterVo)
	{
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.save(quotationMasterVo);
		transaction.commit();
		connection.session.close();
		
	}

	public List listQuotation(UserMasterVo userMasterVo) {
		List listQuotation = null;
		if(userMasterVo.getRoleId().getRoleId()== 2 || userMasterVo.getRoleId().getRoleId()== 3)
		{
			connection.getConnection();
			listQuotation= connection.session.createQuery("from QuotationMasterVo where userId="+userMasterVo.getUserId()).list();
		}
		else if(userMasterVo.getRoleId().getRoleId()==1)
		{
			connection.getConnection();
			listQuotation= connection.session.createQuery("from QuotationMasterVo").list();
		}
		return listQuotation;
	}

	public void deleteQuotation(QuotationMasterVo quotationMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.delete(quotationMasterVo);
		transaction.commit();
		connection.session.close();
		
	}

}
