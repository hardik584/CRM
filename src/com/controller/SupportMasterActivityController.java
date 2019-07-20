package com.controller;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SupportActivityMasterDao;
import com.vo.SupportActivityMasterVo;
import com.vo.SupportMasterVo;
import com.vo.UserMasterVo;

/**
 * Servlet implementation class SupportMasterActivityController
 */
@WebServlet("/SupportMasterActivityController")
public class SupportMasterActivityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SupportMasterActivityController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag = request.getParameter("flag");
		
		if(flag.equals("addSupportActivity")) 
		{
			addSupportActivity(request,response);
		}	
		else if(flag.equals("listsupportActivity"))
		{
			listSupportActivity(request,response);
		}
		else if(flag.equals("deletesupact"))
		{
			deleteSupportActivity(request,response);
		}
	}

	private void deleteSupportActivity(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException    
	{
		SupportMasterVo supportMasterVo= new SupportMasterVo();
		supportMasterVo.setSupportId(Integer.parseInt(request.getParameter("supportId")));
		SupportActivityMasterVo supportActivityMasterVo=new SupportActivityMasterVo();
		supportActivityMasterVo.setSupportActivityId(Integer.parseInt(request.getParameter("supportActivityId")));
		supportActivityMasterVo.setSupportId(supportMasterVo);
		
		SupportActivityMasterDao supportActivityMasterDao=new SupportActivityMasterDao();
		supportActivityMasterDao.deleteSupportActivity(supportActivityMasterVo);
		List<SupportMasterVo> supportDetail = supportActivityMasterDao.supportDetail(supportActivityMasterVo);
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("supportDetail", supportDetail);
		response.sendRedirect("mini-sidebar/support-detail.jsp");	
	}

	private void listSupportActivity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  
	{
		HttpSession loginsession = request.getSession();
		int loginId = (int) loginsession.getAttribute("loginId");
		UserMasterVo userId = new UserMasterVo();
		userId.setUserId(loginId);
		
		SupportActivityMasterVo supportActivityMasterVo = new SupportActivityMasterVo();
		supportActivityMasterVo.setUserId(userId);
		
		SupportActivityMasterDao supportActivityMasterDao = new SupportActivityMasterDao();
		List listsupportActivity =supportActivityMasterDao.listsupportActivity(supportActivityMasterVo);
		
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("listsupportActivity", listsupportActivity);
		response.sendRedirect("mini-sidebar/support-list.jsp");
		
	}

	private void addSupportActivity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
	 
		
		SupportMasterVo supportId = new SupportMasterVo();
		System.out.println(request.getParameter("supportId"));
		supportId.setSupportId(Integer.parseInt(request.getParameter("supportId")));
		
		UserMasterVo userId=new UserMasterVo();
		userId.setUserId(Integer.parseInt(request.getParameter("userId")));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String supportActivityDateTime = sdf.format(date);
		
		SupportActivityMasterVo supportActivityMasterVo =new SupportActivityMasterVo();
		supportActivityMasterVo.setSupportActivityName(request.getParameter("supportActivityName"));
		supportActivityMasterVo.setSupportActivityType(request.getParameter("supportActivityType"));
		supportActivityMasterVo.setSupportActivityOutcome(request.getParameter("supportActivityOutcome"));
		supportActivityMasterVo.setSupportActivityDescription(request.getParameter("supportActivityDescription"));
		supportActivityMasterVo.setSupportActivityReminderDate(request.getParameter("supportActivityReminderDate"));
		supportActivityMasterVo.setSupportActivityReminderTime(request.getParameter("supportActivityReminderTime"));
		supportActivityMasterVo.setSupportActivityReminderRemark(request.getParameter("supportActivityReminderRemark"));
		supportActivityMasterVo.setSupportId(supportId);
		supportActivityMasterVo.setSupportActivityDateTime(supportActivityDateTime);
		supportActivityMasterVo.setUserId(userId);
		
		SupportActivityMasterDao supportActivityMasterDao=new SupportActivityMasterDao();
		supportActivityMasterDao.addSupportActivity(supportActivityMasterVo);
		 
		List supportDetail = supportActivityMasterDao.supportDetail(supportActivityMasterVo);
		
		HttpSession httpSession=request.getSession();
		 
		httpSession.setAttribute("supportDetail", supportDetail);
		response.sendRedirect("mini-sidebar/support-detail.jsp");	
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}