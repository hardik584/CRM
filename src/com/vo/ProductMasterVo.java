package com.vo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product_master")
public class ProductMasterVo   implements Serializable{

	
		private static final long serialVersionUID = 1L;

		@Id
	    @GeneratedValue(strategy = GenerationType.AUTO)
	    @Column(name = "product_id" , updatable = false, nullable = false)
	    int productId;
		
		@Column(name = "product_name")
		String productName;
		
		@Column(name = "product_price")
		double  productPrice;
	
		@Column(name = "product_desc")
		String productDesc;
		
		@ManyToOne
	    @JoinColumn(referencedColumnName="category_id",name="category_id")
		private CategoryMasterVo categoryId;
		
		@ManyToOne
	    @JoinColumn(referencedColumnName="user_id",name="user_id")
		private UserMasterVo userId;

		public int getProductId() {
			return productId;
		}

		public void setProductId(int productId) {
			this.productId = productId;
		}

		public String getProductName() {
			return productName;
		}

		public void setProductName(String productName) {
			this.productName = productName;
		}

		public double getProductPrice() {
			return productPrice;
		}

		public void setProductPrice(double productPrice) {
			this.productPrice = productPrice;
		}

		public String getProductDesc() {
			return productDesc;
		}

		public void setProductDesc(String productDesc) {
			this.productDesc = productDesc;
		}

		public CategoryMasterVo getCategoryId() {
			return categoryId;
		}

		public void setCategoryId(CategoryMasterVo categoryId) {
			this.categoryId = categoryId;
		}

		public UserMasterVo getUserId() {
			return userId;
		}

		public void setUserId(UserMasterVo userId) {
			this.userId = userId;
		} 

}
