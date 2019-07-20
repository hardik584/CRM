package com.dao;

import java.util.List;

import org.hibernate.Transaction;
import com.vo.InquiryMasterVo;
import com.vo.ProductMasterVo;
import com.vo.SupportMasterVo;
import com.vo.UserMasterVo;


public class SupportMasterDao {
	DBConnection connection = new DBConnection();

		public List listCustomer(SupportMasterVo supportMasterVo)
		{
				List listCustomer = null;
				if(supportMasterVo.getUserId().getRoleId().getRoleId()==2 || supportMasterVo.getUserId().getRoleId().getRoleId()==3)
			  	{
				connection.getConnection();
				listCustomer=connection.session.createQuery("from CustomerMasterVo where userId="+supportMasterVo.getUserId().getUserId()).list();
			  	}
				else if(supportMasterVo.getUserId().getRoleId().getRoleId()==1)
				{
					connection.getConnection();
					listCustomer=connection.session.createQuery("from CustomerMasterVo").list();
				}
				return listCustomer;
		}
		public List listProduct(SupportMasterVo supportMasterVo) 
		{
			List listProduct = null;
			if(supportMasterVo.getUserId().getRoleId().getRoleId()==2 || supportMasterVo.getUserId().getRoleId().getRoleId()==3)
		  	{
				connection.getConnection();
				listProduct=connection.session.createQuery("from ProductMasterVo where userId="+supportMasterVo.getUserId().getUserId()).list();
		  	}
			else if(supportMasterVo.getUserId().getRoleId().getRoleId()==1)
			{
				connection.getConnection();
				listProduct=connection.session.createQuery("from ProductMasterVo").list();
			}
			return listProduct;
		}
			public List listCategory(SupportMasterVo supportMasterVo) 
		{
			List listCategory = null;
			if(supportMasterVo.getUserId().getRoleId().getRoleId()==2 || supportMasterVo.getUserId().getRoleId().getRoleId()==3)
		  	{
				connection.getConnection();
				listCategory=connection.session.createQuery("from CategoryMasterVo where userId="+supportMasterVo.getUserId().getUserId()).list();
		  	}
			else if(supportMasterVo.getUserId().getRoleId().getRoleId()==1)
			{
				connection.getConnection();
				listCategory=connection.session.createQuery("from CategoryMasterVo ").list();
			}
			return listCategory;
		}
	
	
		  public List<ProductMasterVo> listProduct(String categoryId)
		  {
			  connection.getConnection();
			  List listProduct=  connection.session.createQuery("from ProductMasterVo where categoryId="+categoryId).list(); 
			  return listProduct;
		  }
		 
		  public void addSupportDetail(SupportMasterVo supportMasterVo) 
		  {
				connection.getConnection();
				Transaction transaction=connection.session.beginTransaction();
				connection.session.save(supportMasterVo);
				transaction.commit();
				connection.session.close();
		  }
		  public List listSupport(SupportMasterVo supportMasterVo) 
			{
			  	List listSupport=null;
			  	if(supportMasterVo.getUserId().getRoleId().getRoleId()==2 || supportMasterVo.getUserId().getRoleId().getRoleId()==3)
			  	{
			  		connection.getConnection();
				  listSupport =  connection.session.createQuery("from SupportMasterVo where userId="+supportMasterVo.getUserId().getUserId()).list();
			  	}
			  	else if(supportMasterVo.getUserId().getRoleId().getRoleId()==1)
			  	{
			  		connection.getConnection();
					  listSupport =  connection.session.createQuery("from SupportMasterVo ").list();
			  	}
				
				return listSupport;
			}
			public List supportDetail(SupportMasterVo supportMasterVo)
			{
				connection.getConnection();
				List supportDetail = connection.session.createQuery("from SupportMasterVo where supportId="+supportMasterVo.getSupportId()).list();
				return supportDetail;	
			}
	
	public void updateSupport(SupportMasterVo supportMasterVo)
	{
		connection.getConnection();
		Transaction transaction = connection.session.beginTransaction();
		connection.session.update(supportMasterVo);
		transaction.commit();
		connection.session.close();
		
	}
	public void deletesupport(SupportMasterVo supportMasterVo)
	{
		connection.getConnection();
		Transaction transaction = connection.session.beginTransaction();
		connection.session.delete(supportMasterVo);
		transaction.commit();
		connection.session.close();
	}
	public List editSupport(SupportMasterVo supportMasterVo)
	{
			connection.getConnection();
			List editSupport=connection.session.createQuery("from SupportMasterVo where supportId="+supportMasterVo.getSupportId()).list();
			connection.session.close();
			return editSupport;
	}
	
	public List listsupportActivity(SupportMasterVo supportMasterVo)
	{
		connection.getConnection();
		List listsupportActivity = connection.session.createQuery("from SupportActivityMasterVo where supportId="+supportMasterVo.getSupportId()).list();
		return listsupportActivity;
	}
	
}