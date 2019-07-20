package com.dao;

import java.util.List;

import org.hibernate.Transaction;

import com.vo.TargetMasterVo;

public class TargetMasterDao {
	DBConnection connection=new DBConnection();
	public List listUser() {
		connection.getConnection();
		List listUser=connection.session.createQuery("from UserMasterVo where roleId!=1").list();
		return listUser;
	}
	public void addTarget(TargetMasterVo targetMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.save(targetMasterVo);
		transaction.commit();
		connection.session.close();
		
		
	}
	public List listTarget(int loginId, int loginRoleId) {
		connection.getConnection();
		List listTarget=null;
		if(loginRoleId==1)
		{
			listTarget=connection.session.createQuery("from TargetMasterVo").list();
		}
		else if(loginRoleId==2 || loginRoleId==3)
		{
			listTarget=connection.session.createQuery("from TargetMasterVo where userId="+loginId).list();
		}
		return listTarget;
	 
	}

}
