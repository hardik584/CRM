package com.dao;

import com.vo.CityMasterVo;
import com.vo.CustomerMasterVo;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Transaction;

import com.dao.DBConnection;

public class CustomerMasterDao {

	DBConnection connection = new DBConnection();
	public void addCustomer(CustomerMasterVo customerMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.save(customerMasterVo);
		transaction.commit();
		connection.session.close();
		 
		
	}
	public List listCustomer(CustomerMasterVo customerMasterVo) {
		 
		List listCustomer = null;
		if(customerMasterVo.getUserId().getRoleId().getRoleId()== 2 || customerMasterVo.getUserId().getRoleId().getRoleId()== 3)
		{
			connection.getConnection();
			listCustomer= connection.session.createQuery("from CustomerMasterVo where userId="+customerMasterVo.getUserId().getUserId()).list();
		}
		else if(customerMasterVo.getUserId().getRoleId().getRoleId()==1)
		{
			connection.getConnection();
			listCustomer= connection.session.createQuery("from CustomerMasterVo").list();
		}
		return listCustomer;
	}
	public List editCustomer(CustomerMasterVo customerMasterVo) {
		 
		connection.getConnection();
		List editCustomer= connection.session.createQuery("from CustomerMasterVo where customerId="+customerMasterVo.getCustomerId()).list();
		
		return editCustomer;
	}
	public List profileCustomer(CustomerMasterVo customerMasterVo) {
		connection.getConnection();
		List profileCustomer= connection.session.createQuery("from CustomerMasterVo where customerId="+customerMasterVo.getCustomerId()).list();
		return profileCustomer;
	}
	public void updateCustomer(CustomerMasterVo customerMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.update(customerMasterVo);
		transaction.commit();
		connection.session.close();
		 
		
	}
	public void deleteCustomer(CustomerMasterVo customerMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.delete(customerMasterVo);
		transaction.commit();
		connection.session.close();
		
	}
	 
	/*
	 * public List listCity(String stateId) { connection.getConnection(); List
	 * listCity=
	 * connection.session.createQuery("from CityMasterVo where stateId="+stateId).
	 * list(); return listCity; }
	 */
	public List<CityMasterVo> listCity(String stateId) {
		// TODO Auto-generated method stub
		connection.getConnection();
		List listCity= connection.session.createQuery("from CityMasterVo where stateId="+stateId).list();
		return listCity;
	} 
}
