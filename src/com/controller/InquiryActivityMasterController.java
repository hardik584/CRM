package com.controller;

import java.io.File;
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
import javax.servlet.http.Part;

import com.dao.InquiryActivityMasterDao;
import com.vo.InquiryActivityMasterVo;
import com.vo.InquiryMasterVo;
import com.vo.UserMasterVo;

/**
 * Servlet implementation class InquiryActivityMasterController
 */
@WebServlet("/InquiryActivityMasterController")
public class InquiryActivityMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryActivityMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag=request.getParameter("flag");
		if(flag.equals("addInquiryActivity"))
		{
			addInquiryActivity(request,response);
		}
		else if(flag.equals("deleteinqact"))
		{
			deleteInquiryActivity(request,response);
		}
		 
		 
	}

	 


	private void deleteInquiryActivity(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException 
	{
		 try
		 {
			 InquiryMasterVo  inquiryMasterVo=new InquiryMasterVo();
			 inquiryMasterVo.setInquiryId(Integer.parseInt(request.getParameter("inquiryId")));
			 
			 InquiryActivityMasterVo inquiryActivityMasterVo=new InquiryActivityMasterVo();
			 inquiryActivityMasterVo.setInquiryActivityId(Integer.parseInt(request.getParameter("inquiryActivityId")));
			 inquiryActivityMasterVo.setInquiryId(inquiryMasterVo);
			 
			 InquiryActivityMasterVo inquiryActivityMasterVo1=new InquiryActivityMasterVo();
			 inquiryActivityMasterVo1.setInquiryActivityId(Integer.parseInt(request.getParameter("inquiryActivityId")));
			 InquiryActivityMasterDao inquiryActivityMasterDao=new InquiryActivityMasterDao();
			 inquiryActivityMasterDao.deleteInquiryActivity(inquiryActivityMasterVo1);
			 
			 List inquiryDetail=inquiryActivityMasterDao.inquiryDetail(inquiryActivityMasterVo);
				
			 HttpSession httpSession=request.getSession();
			 httpSession.setAttribute("inquiryDetail", inquiryDetail);
			
		 }
		 catch(Exception e)
		 {
			 response.sendRedirect("mini-sidebar/lead-detail.jsp");
		 }
	}

	private void addInquiryActivity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String inquiryActivityDateTime = sdf.format(date);
		InquiryMasterVo inquiryId=new InquiryMasterVo();
		inquiryId.setInquiryId(Integer.parseInt(request.getParameter("inquiryId")));
		UserMasterVo userId=new UserMasterVo();
		userId.setUserId(Integer.parseInt(request.getParameter("userId")));
		InquiryActivityMasterVo inquiryActivityMasterVo=new InquiryActivityMasterVo();
		inquiryActivityMasterVo.setInquiryActivityDateTime(inquiryActivityDateTime); 
		inquiryActivityMasterVo.setInquiryActivityName(request.getParameter("inquiryActivityName"));
		inquiryActivityMasterVo.setInquiryActivityOutcome(request.getParameter("inquiryActivityOutcome"));
		inquiryActivityMasterVo.setInquiryActivityRemark(request.getParameter("inquiryActivityRemark"));
		inquiryActivityMasterVo.setInquiryId(inquiryId);
		inquiryActivityMasterVo.setUserId(userId);
		inquiryActivityMasterVo.setRemainderDate(request.getParameter("remainderDate"));
		inquiryActivityMasterVo.setRemainderTime(request.getParameter("remainderTime"));
		inquiryActivityMasterVo.setRemainderRemark(request.getParameter("remainderRemark"));
		inquiryActivityMasterVo.setInquiryActivityType(request.getParameter("inquiryActivityType"));
		
		InquiryActivityMasterDao inquiryActivityMasterDao=new InquiryActivityMasterDao();
		inquiryActivityMasterDao.addInquiryActivity(inquiryActivityMasterVo);
		 
		List inquiryDetail=inquiryActivityMasterDao.inquiryDetail(inquiryActivityMasterVo);
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("inquiryDetail", inquiryDetail);
		response.sendRedirect("mini-sidebar/lead-detail.jsp");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
