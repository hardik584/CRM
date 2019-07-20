package com.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Transaction;

import com.vo.SupportActivityMasterVo;
import com.vo.UserMasterVo;

public class UserMasterDao {
	
	DBConnection connection=new DBConnection();
	
	
	public void registerUser(UserMasterVo userMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.save(userMasterVo);
		transaction.commit();
		connection.session.close();
		
	}
	public List loginUser(UserMasterVo userMasterVo) {
		
		connection.getConnection();
		List loginUser = connection.session.createQuery("from UserMasterVo where userEmail='"+userMasterVo.getUserEmail()+"' and userPassword='"+userMasterVo.getUserPassword()+"'").list();
		return loginUser;
	}
	public List showUserProfile(int loginId) {
		connection.getConnection();
		List showProfile = connection.session.createQuery("from UserMasterVo  where userId="+loginId).list();
		return showProfile;
	}
	public List totalCustomer(int loginId, int loginRoleId) {
		connection.getConnection();
		List totalCustomer=null;
		if(loginRoleId==2 || loginRoleId==3)
		{
		totalCustomer = connection.session.createQuery("from CustomerMasterVo where userId="+loginId).list();
		}
		else if(loginRoleId==1)
		{
			totalCustomer = connection.session.createQuery("from CustomerMasterVo").list();
		}
		return totalCustomer;
	}
	public List totalProduct(int loginId, int loginRoleId) {
		connection.getConnection();
		List totalProduct=null;
		if(loginRoleId==2 || loginRoleId==3)
		{
		totalProduct = connection.session.createQuery("from ProductMasterVo where userId="+loginId).list();
		}
		else if(loginRoleId==1)
		{
			totalProduct = connection.session.createQuery("from ProductMasterVo").list();
		}
		return totalProduct;
	}
	public List totalInquiry(int loginId, int loginRoleId) {
		connection.getConnection();
		List totalInquiry=null;
		if(loginRoleId==2 || loginRoleId==3)
		{
		 totalInquiry= connection.session.createQuery("from InquiryMasterVo where userId="+loginId).list();
		}
		else if(loginRoleId==1) 
		{
			totalInquiry= connection.session.createQuery("from InquiryMasterVo").list();
		}
		return totalInquiry;
	}
	 
	public List totalLead(String d2 , int loginId, int loginRoleId) {
		connection.getConnection();
		List todayLead=null;
		if(loginRoleId==2 || loginRoleId==3)
		{
		todayLead=connection.session.createSQLQuery("select * from inquiry_master where user_id='"+loginId+"' and inquiry_date_time LIKE '"+d2+"%' ").list();
		}
		else if(loginRoleId==1) 
		{
			todayLead=connection.session.createSQLQuery("select * from inquiry_master where  inquiry_date_time LIKE '"+d2+"%' ").list();
		}
		return todayLead;
	}
	public List target(int loginId, int loginRoleId) {
		connection.getConnection();
		List target=null;
		if(loginRoleId==2 || loginRoleId==3)
		{
			target= connection.session.createQuery("from TargetMasterVo  where userId='"+loginId+"' order by targetId DESC").list();
		}
		else if(loginRoleId==1) 
		{
			target= connection.session.createQuery("from  TargetMasterVo order by targetId DESC").list();
		}
			return target;
	}
	public List listAllState() {
		connection.getConnection();
		List listAllState= connection.session.createQuery("from StateMasterVo").list();
		return listAllState;
	}
	public List listAllCity() {
		connection.getConnection();
		List listAllCity= connection.session.createQuery("from CityMasterVo").list();
		return listAllCity;
	}
	public List listNotify(int loginId, int roleId) {
		List listNotify=null;
		if(roleId==2 || roleId==3)
		{
		connection.getConnection();
		listNotify= connection.session.createQuery("from InquiryActivityMasterVo  WHERE (DATE(remainderDate)= CURDATE()+1 or DATE(remainderDate)= CURDATE())    and userId="+loginId).list();
		connection.session.close();
		}
		else if(roleId==1) 
		{
			connection.getConnection();
			listNotify= connection.session.createQuery("from InquiryActivityMasterVo  WHERE (DATE(remainderDate)= CURDATE()+1 or DATE(remainderDate)= CURDATE())").list();
			connection.session.close();
		}
		return listNotify;
	}
	public List profileListDetail(UserMasterVo userMasterVo) {
			connection.getConnection();
			List profileListDetail =connection.session.createQuery("from ProfileMasterVo where userId="+userMasterVo.getUserId()).list();
			connection.session.close();
			return profileListDetail; 
	}
	public List profile(int loginId) {
		connection.getConnection();
		List profileImage =connection.session.createQuery("from ProfileMasterVo where userId="+loginId ).list();
		connection.session.close();
		return profileImage;
	}
	public List pendingInquiry(int loginId, int roleId) {
		connection.getConnection();
		List pendingInquiry=null;
		if(roleId==2 || roleId==3)
		{
			pendingInquiry= connection.session.createQuery("from InquiryMasterVo  where userId='"+loginId+"' and inquiryStatus='Pending' ").list();
		}
		else if(roleId==1) 
		{
			pendingInquiry= connection.session.createQuery("from  InquiryMasterVo where inquiryStatus='Pending'").list();
		}
			return pendingInquiry;
	}
	public List cancelInquiry(int loginId, int roleId) {
		connection.getConnection();
		List cancelInquiry=null;
		if(roleId==2 || roleId==3)
		{
			cancelInquiry= connection.session.createQuery("from InquiryMasterVo  where userId='"+loginId+"' and inquiryStatus='Cancle' ").list();
		}
		else if(roleId==1) 
		{
			cancelInquiry= connection.session.createQuery("from  InquiryMasterVo where inquiryStatus='Cancle'").list();
		}
			return cancelInquiry;
	}
	public List convertedInquiry(int loginId, int roleId) {
		connection.getConnection();
		List convertedInquiry=null;
		if(roleId==2 || roleId==3)
		{
			convertedInquiry= connection.session.createQuery("from InquiryMasterVo  where userId='"+loginId+"' and inquiryStatus='Converted' ").list();
		}
		else if(roleId==1) 
		{
			convertedInquiry= connection.session.createQuery("from  InquiryMasterVo where inquiryStatus='Converted'").list();
		}
			return convertedInquiry;
	}
	public List recoverCheck(UserMasterVo userMasterVo) {
		connection.getConnection();
		List recoverPassword =connection.session.createQuery("from UserMasterVo where userMobile='"+userMasterVo.getUserMobile()+"' and userEmail='"+userMasterVo.getUserEmail()+"'").list();
		connection.session.close();
		return recoverPassword; 
	}
	public void changePassword(UserMasterVo userMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.update(userMasterVo);
		transaction.commit();
		connection.session.close();
		
	}
	public List checkMobile(UserMasterVo userMasterVo) {
		connection.getConnection();
		List checkMobile =connection.session.createQuery("from UserMasterVo where userMobile='"+userMasterVo.getUserMobile()+"'and userEmail='"+userMasterVo.getUserEmail()+"'").list();
		connection.session.close();
		return checkMobile; 
	}
	public List checkEmail(UserMasterVo userMasterVo) {
		connection.getConnection();
		List checkEmail =connection.session.createQuery("from UserMasterVo where userEmail='"+userMasterVo.getUserEmail()+"'").list();
		connection.session.close();
		return checkEmail; 
	}
	public List checkMobileReg(UserMasterVo userMasterVo) {
		connection.getConnection();
		List checkMobile =connection.session.createQuery("from UserMasterVo where userMobile='"+userMasterVo.getUserMobile()+"'").list();
		connection.session.close();
		return checkMobile; 
	}
	public List checkPassword(UserMasterVo userMasterVo) {
		connection.getConnection();
		List checkPassword =connection.session.createQuery("from UserMasterVo where userId='"+userMasterVo.getUserId()+"'and userPassword='"+userMasterVo.getUserPassword()+"'").list();
		connection.session.close();
		return checkPassword; 
	}
	public void setNewPassword(UserMasterVo userMasterVo) 
	{
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.update(userMasterVo);
		transaction.commit();
		connection.session.close();
		
	}
	public List<SupportActivityMasterVo> listSupport(int loginId, int roleId) {
		List listNotify=null;
		if(roleId==2 || roleId==3)
		{
			connection.getConnection();
			listNotify= connection.session.createQuery("from SupportActivityMasterVo  WHERE (DATE(supportActivityReminderDate)= CURDATE()+1 or DATE(supportActivityReminderDate)= CURDATE())    and userId="+loginId).list();
			connection.session.close();
		}
		else if(roleId==1)
		{
			connection.getConnection();
			listNotify= connection.session.createQuery("from SupportActivityMasterVo  WHERE (DATE(supportActivityReminderDate)= CURDATE()+1 or DATE(supportActivityReminderDate)= CURDATE())").list();
			connection.session.close();
		}
		return listNotify;
	}
}
