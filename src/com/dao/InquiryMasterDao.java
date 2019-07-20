package com.dao;

import java.util.List;

import org.hibernate.Transaction;

import com.vo.InquiryMasterVo;
import com.vo.ProductMasterVo;

public class InquiryMasterDao {
	DBConnection connection=new DBConnection();
	public List listCustomer(InquiryMasterVo inquiryMasterVo) {
		List listCustomer = null;
		if(inquiryMasterVo.getUserId().getRoleId().getRoleId()== 2 || inquiryMasterVo.getUserId().getRoleId().getRoleId()== 3)
		{
			connection.getConnection();
			listCustomer= connection.session.createQuery("from CustomerMasterVo where userId="+inquiryMasterVo.getUserId().getUserId()).list();
		}
		else if(inquiryMasterVo.getUserId().getRoleId().getRoleId()==1)
		{
			connection.getConnection();
			listCustomer= connection.session.createQuery("from CustomerMasterVo").list();
		}
		return listCustomer;
		 
	}
	public List listProduct(InquiryMasterVo inquiryMasterVo) {
		List listProduct = null;
		if(inquiryMasterVo.getUserId().getRoleId().getRoleId()== 2 || inquiryMasterVo.getUserId().getRoleId().getRoleId()== 3)
		{
			connection.getConnection();
			listProduct= connection.session.createQuery("from ProductMasterVo where userId="+inquiryMasterVo.getUserId().getUserId()).list();
		}
		 
		else if(inquiryMasterVo.getUserId().getRoleId().getRoleId()==1)
		{
			connection.getConnection();
			listProduct= connection.session.createQuery("from ProductMasterVo").list();
		}
		return listProduct;
	}
	 
	 
	public List listCategory(InquiryMasterVo inquiryMasterVo) {
		// TODO Auto-generated method stub
		List listCategory=null;
		if(inquiryMasterVo.getUserId().getRoleId().getRoleId()== 2 || inquiryMasterVo.getUserId().getRoleId().getRoleId()== 3)
		{
		connection.getConnection();
		listCategory= connection.session.createQuery("from CategoryMasterVo where userId="+inquiryMasterVo.getUserId().getUserId()).list();
		}
		else if(inquiryMasterVo.getUserId().getRoleId().getRoleId()==1)
		{
			connection.getConnection();
			listCategory= connection.session.createQuery("from CategoryMasterVo").list();
		}
		return listCategory;
	}
	public List<ProductMasterVo> listProduct(String categoryId) {
		connection.getConnection();
		List listProduct= connection.session.createQuery("from ProductMasterVo where categoryId="+ categoryId).list();
		return listProduct;
		 
	}
	public void addInquiry(InquiryMasterVo inquiryMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.save(inquiryMasterVo);
		transaction.commit();
		connection.session.close();
		
	}
	public List listInquiry(InquiryMasterVo inquiryMasterVo) {
		List listInquiry = null;
		if(inquiryMasterVo.getUserId().getRoleId().getRoleId()== 2)
		{
			connection.getConnection();
			listInquiry= connection.session.createQuery("from InquiryMasterVo where userId="+inquiryMasterVo.getUserId().getUserId()).list();
		}
		else if(inquiryMasterVo.getUserId().getRoleId().getRoleId()== 3)
		{
			connection.getConnection();
			listInquiry= connection.session.createQuery("from InquiryMasterVo where assignId='"+inquiryMasterVo.getUserId().getUserId()+"' or  userId="+inquiryMasterVo.getUserId().getUserId()).list();
			
		}
		else if(inquiryMasterVo.getUserId().getRoleId().getRoleId()==1)
		{
			connection.getConnection();
			listInquiry= connection.session.createQuery("from InquiryMasterVo").list();
		}
		return listInquiry;
	}
	public List inquiryDetail(InquiryMasterVo inquiryMasterVo) {
		connection.getConnection();
		List inquiryDetail= connection.session.createQuery("from InquiryMasterVo where inquiryId="+inquiryMasterVo.getInquiryId()).list();
		return inquiryDetail;
	}
	public void deleteInquiry(InquiryMasterVo inquiryMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.delete(inquiryMasterVo);
		transaction.commit();
		connection.session.close();
		
	}
	public List editInquiry(InquiryMasterVo inquiryMasterVo) {
		connection.getConnection();
		List editInquiry=connection.session.createQuery("from InquiryMasterVo where inquiryId="+inquiryMasterVo.getInquiryId()).list();
		return editInquiry;
	}
	public void updateInquiry(InquiryMasterVo inquiryMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.update(inquiryMasterVo);
		transaction.commit();
		connection.session.close();
		
	}
	public List activityDetail(InquiryMasterVo inquiryMasterVo) {
		connection.getConnection();
		List listInquiryActivity= connection.session.createQuery("from InquiryActivityMasterVo where inquiryId="+inquiryMasterVo.getInquiryId()).list();
		connection.session.close();
		return listInquiryActivity;
	}
	public List listInquiryForAdd() {
		connection.getConnection();
		List listInquiryForAdd =  connection.session.createQuery("from InquiryMasterVo order by inquiryId DESC").list();
		connection.session.close();
		return listInquiryForAdd;
	}
	public void updateInquiryPic(InquiryMasterVo inquiryMasterVo) {
		 connection.getConnection();
		 Transaction transaction=connection.session.beginTransaction();
		/*
		 * connection.session.createSQLQuery("update inquiry_master set visiting_card='"
		 * +inquiryMasterVo.getVisitingCard()+"' where inquiry_id='"+inquiryMasterVo.
		 * getInquiryId()+"'");
		 */
		 connection.session.update(inquiryMasterVo);
		 transaction.commit();
		 connection.session.close();
	}
	public List<InquiryMasterVo> inquiryImage(InquiryMasterVo inquiryMasterVo) {
		connection.getConnection();
		List inquiryImage =  connection.session.createQuery("from InquiryMasterVo where secureRandomNumber="+inquiryMasterVo.getSecureRandomNumber()).list();
		connection.session.close();
		return inquiryImage;
	}
	public List listBDE() {
		connection.getConnection();
		List listBDE =  connection.session.createQuery("from UserMasterVo where roleId=3").list();
		connection.session.close();
		return listBDE;
	}
	public List assignedName(InquiryMasterVo inquiryMasterVo) {
		connection.getConnection();
		List assignedName =  connection.session.createQuery("from UserMasterVo where userId="+inquiryMasterVo.getAssignId()).list();
		connection.session.close();
		return assignedName;
	}

}
