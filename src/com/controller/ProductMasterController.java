package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CategoryMasterDao;
import com.dao.ProductMasterDao;
import com.vo.CategoryMasterVo;
import com.vo.ProductMasterVo;
import com.vo.RoleMasterVo;
import com.vo.UserMasterVo;

/**
 * Servlet implementation class ProductMasterController
 */
@WebServlet("/ProductMasterController")
public class ProductMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag=request.getParameter("flag");
		if(flag.equals("addProduct"))
		{
			addProduct(request,response);
		}
		else if(flag.equals("listCategory"))
		{
			listCategory(request,response);
		}
		else if(flag.equals("listProduct"))
		{
			listProduct(request,response);
		}
		else if(flag.equals("deleteProduct"))
		{
			deleteProduct(request,response);
		}
		else if(flag.equals("editProduct"))
		{
			editProduct(request,response);
		}
		else if(flag.equals("updateProduct"))
		{
			updateProduct(request,response);
		}
	}

	private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		 ProductMasterVo productMasterVo=new ProductMasterVo();
		 productMasterVo.setProductId(Integer.parseInt(request.getParameter("productId")));
		 productMasterVo.setProductName(request.getParameter("productName"));
		 productMasterVo.setProductPrice(Double.parseDouble(request.getParameter("productPrice")));
		 productMasterVo.setProductDesc(request.getParameter("productDesc"));
		 
		 CategoryMasterVo categoryMasterVo=new CategoryMasterVo();
		 categoryMasterVo.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		 productMasterVo.setCategoryId(categoryMasterVo);
		 
		 UserMasterVo userMasterVo=new UserMasterVo();
		 userMasterVo.setUserId(Integer.parseInt(request.getParameter("userId")));
		 productMasterVo.setUserId(userMasterVo);

		 ProductMasterDao productMasterDao=new ProductMasterDao();
		 productMasterDao.updateProduct(productMasterVo);
		 response.sendRedirect("ProductMasterController?flag=listProduct");
	}

	private void editProduct(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		HttpSession loginSession=request.getSession();
		int userId=(int) loginSession.getAttribute("loginId");
		 
		UserMasterVo userMasterVo=new UserMasterVo();
		userMasterVo.setUserId(userId);
		ProductMasterVo productMasterVo=new ProductMasterVo();
		productMasterVo.setProductId(Integer.parseInt(request.getParameter("productId")));
		productMasterVo.setUserId(userMasterVo);
		
		ProductMasterDao productMasterDao=new ProductMasterDao();
		List<ProductMasterVo> editProduct=productMasterDao.editProduct(productMasterVo);
		List<CategoryMasterVo> listCategory=productMasterDao.listallCategory(userId);
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("editProduct", editProduct);
		httpSession.setAttribute("listCategory", listCategory);
		if(!editProduct.isEmpty())
		{
			response.setContentType("text/xml");
			productMasterVo =editProduct.get(0);
			int productId=productMasterVo.getProductId();
			int categoryId=productMasterVo.getCategoryId().getCategoryId();
			String productDesc=productMasterVo.getProductDesc();
			String productName=productMasterVo.getProductName();
			double productPrice=productMasterVo.getProductPrice();
			int user=productMasterVo.getUserId().getUserId();
			String categoryName=productMasterVo.getCategoryId().getCategoryName();
			
			PrintWriter out=response.getWriter();
			out.println("<xml>");
				out.println("<productId>"+productId+"</productId>");
				out.println("<categoryId>"+categoryId+"</categoryId>");
				out.println("<productDesc>"+productDesc+"</productDesc>");
				out.println("<productName>"+productName+"</productName>");
				out.println("<categoryName>"+categoryName+"</categoryName>");
				out.println("<productPrice>"+productPrice+"</productPrice>");
				out.println("<user>"+user+"</user>");
			out.println("</xml>");
			 
		}
		
		 
		
		 
	}

	private void deleteProduct(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		try
		{
		 ProductMasterVo productMasterVo=new ProductMasterVo();
		 productMasterVo.setProductId(Integer.parseInt(request.getParameter("productId")));
		 ProductMasterDao productMasterDao=new ProductMasterDao();
		 productMasterDao.deleteProduct(productMasterVo);
		 response.sendRedirect("ProductMasterController?flag=listProduct");
		}catch(Exception e)
		{
			PrintWriter out=response.getWriter();
			out.print("You Can't delete this product!!");
			response.sendRedirect("ProductMasterController?flag=listProduct");
		}
		
		
	}

	private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession loginSession=request.getSession();
		int userId=(int) loginSession.getAttribute("loginId");
		int roleId=(int) loginSession.getAttribute("loginRoleId");
		UserMasterVo userMasterVo=new UserMasterVo();
		userMasterVo.setUserId(userId);
		
		RoleMasterVo roleMasterVo=new RoleMasterVo();
		roleMasterVo.setRoleId(roleId);
		
		userMasterVo.setRoleId(roleMasterVo);
		CategoryMasterVo categoryMasterVo=new CategoryMasterVo();
		categoryMasterVo.setUserId(userMasterVo);
		
		ProductMasterVo productMasterVo=new ProductMasterVo();
		productMasterVo.setUserId(userMasterVo);
		
		ProductMasterDao productMasterDao=new ProductMasterDao();
		List listProduct=productMasterDao.listProduct(productMasterVo);
		List listCategory=productMasterDao.listCategory(categoryMasterVo);
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("listProduct", listProduct);
		httpSession.setAttribute("listCategory",listCategory );
		response.sendRedirect("mini-sidebar/product-list.jsp");
		 
		 
		
	}

	private void listCategory(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		 HttpSession loginSession=request.getSession();
		 int userId=(int) loginSession.getAttribute("loginId");
		 int loginRoleId = (int)loginSession.getAttribute("loginRoleId");
		 RoleMasterVo roleMasterVo=new RoleMasterVo();
		 roleMasterVo.setRoleId(loginRoleId);
		 UserMasterVo userMasterVo=new UserMasterVo();
		 userMasterVo.setUserId(userId);
		 userMasterVo.setRoleId(roleMasterVo);
		 CategoryMasterVo categoryMasterVo=new CategoryMasterVo();
		 categoryMasterVo.setUserId(userMasterVo);
		 
		 ProductMasterDao productMasterDao=new ProductMasterDao();
		 List listCategory=productMasterDao.listCategory(categoryMasterVo);
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("listCategory",listCategory );
		 response.sendRedirect("mini-sidebar/product-add.jsp");
		 
		
	}

	private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
			 HttpSession loginSession=request.getSession();
			 int userId=(int) loginSession.getAttribute("loginId");
			
			 UserMasterVo userMasterVo=new UserMasterVo();
			 userMasterVo.setUserId(userId);
			 CategoryMasterVo categoryMasterVo=new CategoryMasterVo();
			 categoryMasterVo.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
			 ProductMasterVo productMasterVo=new ProductMasterVo();
			 productMasterVo.setProductName(request.getParameter("productName"));
			 productMasterVo.setProductPrice(Double.parseDouble(request.getParameter("productPrice")));
			 productMasterVo.setProductDesc(request.getParameter("productDesc"));
			 productMasterVo.setCategoryId(categoryMasterVo);
			 productMasterVo.setUserId(userMasterVo);
			 
			 ProductMasterDao productMasterDao=new ProductMasterDao();
			 productMasterDao.addProduct(productMasterVo);
			 response.sendRedirect("ProductMasterController?flag=listProduct");
			 
			 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
