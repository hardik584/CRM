package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.InquiryMasterDao;
import com.dao.SupportMasterDao;
import com.vo.*;

/**
 * Servlet implementation class SupportMasterController
 */
@WebServlet("/SupportMasterController")
public class SupportMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag = request.getParameter("flag");
		if(flag.equals("AddSupportCustomer"))
		{
			AddSupportCustomer(request,response);
		}
		else if(flag.equals("listSupport"))
		{
			listSupport(request,response);
		}
		else if(flag.equals("addSupportDetail"))
		{
			addSupportDetail(request,response);
		}
		else if(flag.equals("listProduct"))
		{
			listProduct(request, response);
		}
		else if(flag.equals("supportDetail"))
		{
			supportDetail(request,response);
		}
		else if(flag.equals("editSupport"))
		{
			editSupport(request,response);
		}
		else if(flag.equals("updateSupport"))
		{
			updateSupport(request,response);
		}
		else if(flag.equals("deleteSupport"))
		{
			deleteSupport(request,response);
		}
	}

	private void deleteSupport(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  
	{
		try
		{
			SupportMasterVo supportMasterVo = new SupportMasterVo();
			supportMasterVo.setSupportId(Integer.parseInt( request.getParameter("supportId")));
			SupportMasterDao supportMasterDao = new SupportMasterDao();
			supportMasterDao.deletesupport(supportMasterVo);
			response.sendRedirect("SupportMasterController?flag=listSupport");
		}
		catch (Exception e) 
		{
			response.sendRedirect("SupportMasterController?flag=listSupport");
		}
	}

	private void updateSupport(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		
		HttpSession httpSession = request.getSession();
		int loginId = (int) httpSession.getAttribute("loginId");
		
		UserMasterVo userId = new UserMasterVo();
		userId.setUserId(loginId);
		
		ProductMasterVo productId = new ProductMasterVo();
		productId.setProductId(Integer.parseInt(request.getParameter("productId")));
		
		CategoryMasterVo categoryId = new CategoryMasterVo();
		categoryId.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		
		CustomerMasterVo customerId = new CustomerMasterVo();
		customerId.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String supportDateTime = sdf.format(date);
		
		SupportMasterVo supportMasterVo = new SupportMasterVo();
		supportMasterVo.setSupportId(Integer.parseInt(request.getParameter("supportId")));
		supportMasterVo.setSupportName(request.getParameter("supportName"));
		supportMasterVo.setSupportSource(request.getParameter("supportSource"));
		supportMasterVo.setSupportStatus(request.getParameter("supportStatus"));
		supportMasterVo.setRemark(request.getParameter("remark"));
		supportMasterVo.setSupportDateTime(supportDateTime);
		supportMasterVo.setCustomerId(customerId);
		supportMasterVo.setProductId(productId);
		supportMasterVo.setCategoryId(categoryId);
		supportMasterVo.setUserId(userId);
		
		SupportMasterDao supportMasterDao = new SupportMasterDao();
		supportMasterDao.updateSupport(supportMasterVo);
		response.sendRedirect("SupportMasterController?flag=listSupport");
	
	}

	private void editSupport(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		SupportMasterVo supportMasterVo = new SupportMasterVo();
		supportMasterVo.setSupportId(Integer.parseInt(request.getParameter("supportId")));
		System.out.println(request.getParameter("supportId"));
		HttpSession httpSession=request.getSession();
		int loginId=Integer.parseInt(httpSession.getAttribute("loginId").toString());
		
		UserMasterVo userMasterVo=new UserMasterVo();
		userMasterVo.setUserId(loginId);
		supportMasterVo.setUserId(userMasterVo);
		
		SupportMasterDao supportMasterDao = new SupportMasterDao();
		System.out.println(supportMasterVo.getSupportId());
		List editSupport=supportMasterDao.editSupport(supportMasterVo);
		List listCustomer=supportMasterDao.listCustomer(supportMasterVo);
		List listCategory= supportMasterDao.listCategory(supportMasterVo);
		List listProduct= supportMasterDao.listProduct(supportMasterVo);
	 
		httpSession.setAttribute("editSupport", editSupport);
		httpSession.setAttribute("listCustomer", listCustomer);
		httpSession.setAttribute("listCategory", listCategory);
		httpSession.setAttribute("listProduct", listProduct);
		response.sendRedirect("mini-sidebar/support-edit.jsp");
	
	}

	private void supportDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SupportMasterVo supportMasterVo = new SupportMasterVo();
		supportMasterVo.setSupportId(Integer.parseInt( request.getParameter("supportId")));
		
		SupportMasterDao supportMasterDao = new SupportMasterDao();
		List supportDetail=supportMasterDao.supportDetail(supportMasterVo);
		
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("supportDetail", supportDetail);
		response.sendRedirect("mini-sidebar/support-detail.jsp");
		
	}

	private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException    {
		
	String categoryId=request.getParameter("categoryId");
	 InquiryMasterDao inquiryMasterDao=new InquiryMasterDao();
	 List<ProductMasterVo> listProduct=inquiryMasterDao.listProduct(categoryId);
	 
	 String Product="";
	 Product+=" <option value='' disabled='disabled' selected='selected'>Select Product</option>";
	 PrintWriter out=response.getWriter();
	 
	 if(!listProduct.isEmpty())
	 {
		 for (ProductMasterVo vo : listProduct)
		 {
			 Product+= "<option value='"+vo.getProductId()+"'>"+vo.getProductName()+"</option>";
        }
	 }
	 out.print(Product);
	}

	private void addSupportDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException   {
		
		HttpSession httpSession = request.getSession();
		int loginId = (int) httpSession.getAttribute("loginId");
		
		UserMasterVo userId = new UserMasterVo();
		userId.setUserId(loginId);
		
		ProductMasterVo productId = new ProductMasterVo();
		productId.setProductId(Integer.parseInt(request.getParameter("productId")));
		
		CategoryMasterVo categoryId = new CategoryMasterVo();
		categoryId.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		
		CustomerMasterVo customerId = new CustomerMasterVo();
		customerId.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String supportDateTime = sdf.format(date);
		
		SupportMasterVo supportMasterVo = new SupportMasterVo();
		supportMasterVo.setSupportName(request.getParameter("supportName"));
		supportMasterVo.setSupportSource(request.getParameter("supportSource"));
		supportMasterVo.setSupportStatus(request.getParameter("supportStatus"));
		supportMasterVo.setRemark(request.getParameter("remark"));
		supportMasterVo.setSupportDateTime(supportDateTime);
		supportMasterVo.setCustomerId(customerId);
		supportMasterVo.setProductId(productId);
		supportMasterVo.setCategoryId(categoryId);
		supportMasterVo.setUserId(userId);
		
		SupportMasterDao supportMasterDao = new SupportMasterDao();
		supportMasterDao.addSupportDetail(supportMasterVo);
		response.sendRedirect("SupportMasterController?flag=listSupport");
			
	}

	private void listSupport(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException  
	{
		HttpSession loginSession =  request.getSession();
		int loginId = (int) loginSession.getAttribute("loginId");
		int loginRoleId = (int)loginSession.getAttribute("loginRoleId");
		RoleMasterVo roleMasterVo=new RoleMasterVo();
		roleMasterVo.setRoleId(loginRoleId);
		UserMasterVo userId = new UserMasterVo();
		userId.setUserId(loginId);
		userId.setRoleId(roleMasterVo);
		SupportMasterVo supportMasterVo  = new SupportMasterVo();
		supportMasterVo.setUserId(userId);
		
		SupportMasterDao supportMasterDao = new SupportMasterDao();
		List listSupport = supportMasterDao.listSupport(supportMasterVo);
		
		HttpSession httpSession = request.getSession();	
		httpSession.setAttribute("listSupport", listSupport);
		response.sendRedirect("mini-sidebar/support-list.jsp");
			
	}

	private void AddSupportCustomer(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException  {
		HttpSession loginSession = request.getSession();
		int loginId=(int) loginSession.getAttribute("loginId");
		int loginRoleId = (int)loginSession.getAttribute("loginRoleId");
		
		RoleMasterVo roleMasterVo=new RoleMasterVo();
		roleMasterVo.setRoleId(loginRoleId);
		UserMasterVo userId = new UserMasterVo();
		userId.setUserId(loginId);
		userId.setRoleId(roleMasterVo);
		
		SupportMasterVo supportMasterVo = new SupportMasterVo();
		supportMasterVo.setUserId(userId);
		
		SupportMasterDao supportMasterdao = new SupportMasterDao();
		
		List listCustomer = supportMasterdao.listCustomer(supportMasterVo);
		List listProduct = supportMasterdao.listProduct(supportMasterVo);
		List listCategory = supportMasterdao.listCategory(supportMasterVo);
		
		HttpSession httpsession = request.getSession();
		httpsession.setAttribute("listCustomer", listCustomer);
		httpsession.setAttribute("listProduct", listProduct);
		httpsession.setAttribute("listCategory", listCategory);
	
		response.sendRedirect("mini-sidebar/support-add.jsp");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
