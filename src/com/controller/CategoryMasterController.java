package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CategoryMasterDao;
import com.vo.CategoryMasterVo;
import com.vo.RoleMasterVo;
import com.vo.UserMasterVo;
/**
 * Servlet implementation class CategoryMasterController
 */
@WebServlet("/CategoryMasterController")
public class CategoryMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag=request.getParameter("flag");
		
		if(flag.equals("addCategory") || flag.equals("addCategoryThrowProduct"))
		{
			addCategory(request,response);
		}
		else if(flag.equals("listCategory"))
		{
			listCategory(request,response);
		}
		else if(flag.equals("deleteCategory"))
		{
			deleteCategory(request,response);
		}
	}

	private void deleteCategory(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		
		try
		{
		CategoryMasterVo categoryMasterVo=new CategoryMasterVo();
		categoryMasterVo.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		
		CategoryMasterDao categoryMasterDao=new CategoryMasterDao();
		categoryMasterDao.deleteCategory(categoryMasterVo);
		response.sendRedirect("CategoryMasterController?flag=listCategory");
		}catch(Exception e)
		{
			response.sendRedirect("CategoryMasterController?flag=listCategory");
		}
	}

	private void listCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
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
		
		CategoryMasterDao categoryMasterDao=new CategoryMasterDao();
		List listCategory=categoryMasterDao.listCategory(categoryMasterVo);
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("listCategory", listCategory);
		response.sendRedirect("mini-sidebar/category-master.jsp");
		
		
	}

	private void addCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		HttpSession loginSession=request.getSession();
		int userId=(int) loginSession.getAttribute("loginId");
		UserMasterVo userMasterVo=new UserMasterVo();
		userMasterVo.setUserId(userId);
		CategoryMasterVo categoryMasterVo=new CategoryMasterVo();
		categoryMasterVo.setCategoryName(request.getParameter("categoryName"));
		categoryMasterVo.setUserId(userMasterVo);
		
		CategoryMasterDao categoryMasterDao=new CategoryMasterDao();
		categoryMasterDao.addCategory(categoryMasterVo);
		if(request.getParameter("flag").equals("addCategory"))
		{
		response.sendRedirect("CategoryMasterController?flag=listCategory");
		}
		else if(request.getParameter("flag").equals("addCategoryThrowProduct"))
		{
			response.sendRedirect("ProductMasterController?flag=listCategory");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
