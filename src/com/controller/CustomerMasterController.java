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

import com.vo.CityMasterVo;
import com.vo.CustomerMasterVo;
import com.vo.RoleMasterVo;
import com.vo.StateMasterVo;
import com.vo.UserMasterVo;
import com.dao.CustomerMasterDao;
/**
 * Servlet implementation class CustomerMasterController
 */
@WebServlet("/CustomerMasterController")
public class CustomerMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag=request.getParameter("flag");
		if(flag.equals("addCustomer") || flag.equals("addCustomerthrowInquiry"))
		{
			addCustomer(request,response);
		}
		else if(flag.equals("listCustomer"))
		{
			listCustomer(request,response);
		}
		else if(flag.equals("editCustomer"))
		{
			editCustomer(request,response);
		}
		else if(flag.equals("profileCustomer"))
		{
			profileCustomer(request,response);
		}
		else if(flag.equals("updateCustomer"))
		{
			updateCustomer(request,response);
		}
		else if(flag.equals("deleteCustomer"))
		{
			deleteCustomer(request,response);
		}	
		 
		else if(flag.equals("listCity"))
		{
			listCity(request,response);
		}
		
	}

	private void listCity(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException 
	{
		
		 String StateId=request.getParameter("stateId");
		 CustomerMasterDao customerMasterDao=new CustomerMasterDao();
		 List<CityMasterVo> listCity=customerMasterDao.listCity(StateId);
		  
		 String city=" <option value='' disabled selected>Select City</option>";
		 PrintWriter out=response.getWriter();
		  
		 if(!listCity.isEmpty())
		 {
			for (CityMasterVo vo : listCity) 
			{
				city+= "<option value='"+vo.getCityId()+"'>"+vo.getCityName()+"</option>";
            }
		 }
		 out.print(city);
	}
	
	private void deleteCustomer(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException 
	{
		try 
		{
			CustomerMasterVo customerMasterVo=new CustomerMasterVo();
			customerMasterVo.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
			
			CustomerMasterDao customerMasterDao=new CustomerMasterDao();
			customerMasterDao.deleteCustomer(customerMasterVo);
			response.sendRedirect("CustomerMasterController?flag=listCustomer");
		}catch(Exception e)
		{
			response.sendRedirect("CustomerMasterController?flag=listCustomer");
		}
	}

	private void updateCustomer(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException 
	{
		String[] emailId=request.getParameterValues("emailId");
		String allEmailId="";
		int emailSize=emailId.length;
		for(int i=0;i<emailId.length;i++)
		{
			if(i==emailSize-1)
			{
			allEmailId+=emailId[i];
			}
			else
			{
			allEmailId+=emailId[i]+",";
			}
			
		}
		
		String[] mobileNumber=request.getParameterValues("mobileNumber");
		String allMobileNumber="";
		int mobileSize=mobileNumber.length;
		for(int i=0;i<mobileNumber.length;i++)
		{
			if(i==mobileSize-1)
			{
				allMobileNumber+=mobileNumber[i];
			}
			else
			{
				allMobileNumber+=mobileNumber[i]+",";
			}
			
		}
		
		 CustomerMasterVo customerMasterVo= new CustomerMasterVo();
		 customerMasterVo.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
		 customerMasterVo.setCustomerName(request.getParameter("customerName"));
		 customerMasterVo.setCompanyName(request.getParameter("companyName"));
		 customerMasterVo.setEmailId(allEmailId);
		 customerMasterVo.setMobileNumber(allMobileNumber);
		 customerMasterVo.setTelephone(request.getParameter("telephone"));
		 customerMasterVo.setDesignation(request.getParameter("designation"));
		 customerMasterVo.setAddress(request.getParameter("address"));
		 
		 
		 StateMasterVo stateId=new StateMasterVo();
		 stateId.setStateId(Integer.parseInt(request.getParameter("stateId")));
		 customerMasterVo.setStateId(stateId);
		 
		 CityMasterVo cityId=new CityMasterVo();
		 cityId.setCityId(Integer.parseInt(request.getParameter("cityId")));
		 customerMasterVo.setCityId(cityId);
		 
		 customerMasterVo.setPincode(Integer.parseInt(request.getParameter("pincode")));
		 customerMasterVo.setGstNo(request.getParameter("gstNo"));
		 
		 
		  UserMasterVo userId=new UserMasterVo(); 
		  userId.setUserId(Integer.parseInt(request.getParameter("userId")));
		  customerMasterVo.setUserId(userId);
		 
		 
		 CustomerMasterDao customerMasterDao=new CustomerMasterDao();
		 customerMasterDao.updateCustomer(customerMasterVo);
		 response.sendRedirect("CustomerMasterController?flag=listCustomer");
		
	}

	private void profileCustomer(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException 
	{
		 CustomerMasterVo customerMasterVo=new CustomerMasterVo();
		 customerMasterVo.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
		 CustomerMasterDao customerMasterDao=new CustomerMasterDao();
		 List profileCustomer=customerMasterDao.profileCustomer(customerMasterVo);
		 HttpSession httpSession=request.getSession();
		 httpSession.setAttribute("profileCustomer", profileCustomer);
		 response.sendRedirect("mini-sidebar/customer-detail.jsp");
		
	}

	private void editCustomer(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException  {
		CustomerMasterVo customerMasterVo=new CustomerMasterVo();
		customerMasterVo.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
		
		CustomerMasterDao customerMasterDao=new CustomerMasterDao();
		List editCustomer=customerMasterDao.editCustomer(customerMasterVo);
		 
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("editCustomer", editCustomer);
		 
		response.sendRedirect("mini-sidebar/customer-edit.jsp");
		
	}

	private void listCustomer(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
		
		HttpSession loginSession=request.getSession();
		int loginId=(int) loginSession.getAttribute("loginId");
		int loginRoleId=(int) loginSession.getAttribute("loginRoleId");
		
		
		
		RoleMasterVo roleId=new RoleMasterVo();
		roleId.setRoleId(loginRoleId);
		
		UserMasterVo userId=new UserMasterVo(); 
		userId.setUserId(loginId);
		userId.setRoleId(roleId);
		
		CustomerMasterVo customerMasterVo=new CustomerMasterVo();
		customerMasterVo.setUserId(userId);
		
		CustomerMasterDao customerMasterDao=new CustomerMasterDao();
		List listCustomer=customerMasterDao.listCustomer(customerMasterVo);
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("listCustomer", listCustomer);
		response.sendRedirect("mini-sidebar/customer-list.jsp");
		
		
	}

	private void addCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
		
		String[] emailId=request.getParameterValues("emailId");
		String allEmailId="";
		int emailSize=emailId.length;
		for(int i=0;i<emailId.length;i++)
		{
			if(i==emailSize-1)
			{
			allEmailId+=emailId[i];
			}
			else
			{
			allEmailId+=emailId[i]+",";
			}
			
		}
		
		String[] mobileNumber=request.getParameterValues("mobileNumber");
		String allMobileNumber="";
		int mobileSize=mobileNumber.length;
		for(int i=0;i<mobileNumber.length;i++)
		{
			if(i==mobileSize-1)
			{
				allMobileNumber+=mobileNumber[i];
			}
			else
			{
				allMobileNumber+=mobileNumber[i]+",";
			}
			
		}
		 
		 CustomerMasterVo customerMasterVo= new CustomerMasterVo();
		 customerMasterVo.setCustomerName(request.getParameter("customerName"));
		 customerMasterVo.setCompanyName(request.getParameter("companyName"));
		 customerMasterVo.setEmailId(allEmailId);
		 customerMasterVo.setMobileNumber(allMobileNumber);
		 customerMasterVo.setTelephone(request.getParameter("telephone"));
		 customerMasterVo.setDesignation(request.getParameter("designation"));
		 customerMasterVo.setAddress(request.getParameter("address"));
		 
		 
		 StateMasterVo stateId=new StateMasterVo();
		 stateId.setStateId(Integer.parseInt(request.getParameter("stateId")));
		 customerMasterVo.setStateId(stateId);
		 
		 CityMasterVo cityId=new CityMasterVo();
		 cityId.setCityId(Integer.parseInt(request.getParameter("cityId")));
		 customerMasterVo.setCityId(cityId);
		 
		 customerMasterVo.setPincode(Integer.parseInt(request.getParameter("pincode")));
		 customerMasterVo.setGstNo(request.getParameter("gstNo"));
		 
		  HttpSession loginSession=request.getSession();
		  int loginId=(int) loginSession.getAttribute("loginId");
		  UserMasterVo userId=new UserMasterVo(); 
		  userId.setUserId(loginId);
		  customerMasterVo.setUserId(userId);
		 
		 
		 CustomerMasterDao customerMasterDao=new CustomerMasterDao();
		 customerMasterDao.addCustomer(customerMasterVo);
		 if(request.getParameter("flag").equals("addCustomer"))
		 {
		 response.sendRedirect("CustomerMasterController?flag=listCustomer");
		 }
		 else if(request.getParameter("flag").equals("addCustomerthrowInquiry"))
		 {
			 response.sendRedirect("InquiryMasterController?flag=listProductCustomer");
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
