package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Transaction;

import com.vo.CategoryMasterVo;
import com.vo.ProductMasterVo;

public class ProductMasterDao {
	DBConnection connection=new DBConnection();

	public List listCategory(CategoryMasterVo categoryMasterVo)
	{
		List listCategory=null;
	 
		if(categoryMasterVo.getUserId().getRoleId().getRoleId()== 2 || categoryMasterVo.getUserId().getRoleId().getRoleId()== 3)
		{
			connection.getConnection();
			listCategory = connection.session.createQuery("from CategoryMasterVo where userId="+categoryMasterVo.getUserId().getUserId()).list();
		}
		else if(categoryMasterVo.getUserId().getRoleId().getRoleId()== 1)
		{
			connection.getConnection();
			listCategory = connection.session.createQuery("from CategoryMasterVo").list();
		}
			return listCategory;
	}

	public void addProduct(ProductMasterVo productMasterVo) 
	{
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.save(productMasterVo);
		transaction.commit();
		connection.session.close();
		
	}

	public List listProduct(ProductMasterVo productMasterVo) {
		List listProduct = null;
		if(productMasterVo.getUserId().getRoleId().getRoleId()== 2 || productMasterVo.getUserId().getRoleId().getRoleId()== 3)
		{
			connection.getConnection();
			listProduct= connection.session.createQuery("from ProductMasterVo where userId="+productMasterVo.getUserId().getUserId()).list();
		}
		else if(productMasterVo.getUserId().getRoleId().getRoleId()==1)
		{
			connection.getConnection();
			listProduct= connection.session.createQuery("from ProductMasterVo").list();
		}
		return listProduct;
		
	}

	public void deleteProduct(ProductMasterVo productMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.delete(productMasterVo);
		transaction.commit();
		connection.session.close();
		
	}

	public List editProduct(ProductMasterVo productMasterVo) {
		
		connection.getConnection();
		//List list=new ArrayList<>();
		List editProduct= connection.session.createQuery("from ProductMasterVo where productId="+productMasterVo.getProductId()).list(); 
		//
		return editProduct;
		
	}

	public void updateProduct(ProductMasterVo productMasterVo) {
		connection.getConnection();
		Transaction transaction=connection.session.beginTransaction();
		connection.session.update(productMasterVo);
		transaction.commit();
		connection.session.close();
		
	}

	public List listallCategory(int userId) {
		// TODO Auto-generated method stub
		List listCategory=connection.session.createQuery("from CategoryMasterVo where userId="+userId).list();
		return listCategory;
	}

}
