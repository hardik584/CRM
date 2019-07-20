package com.dao;

import java.util.List;

import org.hibernate.Transaction;

import com.vo.CategoryMasterVo;

public class CategoryMasterDao {
	
	DBConnection connection=new DBConnection();
	public void addCategory(CategoryMasterVo categoryMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.save(categoryMasterVo);
		transaction.commit();
		connection.session.close();
		
	}
	public List listCategory(CategoryMasterVo categoryMasterVo) {
		List listCategory = null;
		if(categoryMasterVo.getUserId().getRoleId().getRoleId()== 2 || categoryMasterVo.getUserId().getRoleId().getRoleId()== 3)
		{
			connection.getConnection();
			listCategory= connection.session.createQuery("from CategoryMasterVo where userId="+categoryMasterVo.getUserId().getUserId()).list();
		}
		else if(categoryMasterVo.getUserId().getRoleId().getRoleId()==1)
		{
			connection.getConnection();
			listCategory= connection.session.createQuery("from CategoryMasterVo").list();
		}
		return listCategory;
		
	}
	public void deleteCategory(CategoryMasterVo categoryMasterVo) 
	{
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.delete(categoryMasterVo);
		transaction.commit();
		connection.session.close();
		 
	}

}
