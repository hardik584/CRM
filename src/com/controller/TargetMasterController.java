package com.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TargetMasterDao;
import com.vo.TargetMasterVo;
import com.vo.UserMasterVo;
/**
 * Servlet implementation class TargetMasterController
 */
@WebServlet("/TargetMasterController")
public class TargetMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TargetMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag=request.getParameter("flag");
		if(flag.equals("listUser"))
		{
			listUser(request,response);
		}
		else if(flag.equals("addTarget"))
		{
			try {
				addTarget(request,response);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(flag.equals("listTarget")||flag.equals("listTargetUser"))
		{
			listTarget(request,response);
		}
	}

	private void listTarget(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession httpSession=request.getSession();
		 int loginId=Integer.parseInt(httpSession.getAttribute("loginId").toString());
		 int loginRoleId=Integer.parseInt(httpSession.getAttribute("loginRoleId").toString());
		 List listTarget=null;
		 TargetMasterDao targetMasterDao=new TargetMasterDao();
		 if(request.getParameter("flag").equals("listTarget"))
		 {
		  listTarget=targetMasterDao.listTarget(loginId,loginRoleId);
		 }
		 else if(request.getParameter("flag").equals("listTargetUser"));
		 {
			listTarget=targetMasterDao.listTarget(loginId,loginRoleId); 
		 }
		 httpSession.setAttribute("listTarget",listTarget);
		 response.sendRedirect("mini-sidebar/target-list.jsp");
	}

	private void addTarget(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, ParseException  {
		 
		UserMasterVo userId = new UserMasterVo();
		userId.setUserId(Integer.parseInt(request.getParameter("userId")));

		TargetMasterVo targetMasterVo = new TargetMasterVo();
		targetMasterVo.setTargetsize(request.getParameter("targetsize"));
		targetMasterVo.setTargetFromDate(request.getParameter("targetFromDate"));
        System.out.println(request.getParameter("targetFromDate"));
		/*
		 * Date d=(Date)request.getParameter("targetFromDate"); String pattern =
		 * "yyyy-MM-dd"; SimpleDateFormat simpleDateFormat = new
		 * SimpleDateFormat(pattern); String date =
		 * simpleDateFormat.format(request.getParameter("targetFromDate"));
		 * System.out.println(date);
		 */
		targetMasterVo.setTargetToDate(request.getParameter("targetToDate"));
		targetMasterVo.setUserId(userId);
		TargetMasterDao targetMasterDao=new TargetMasterDao();
		targetMasterDao.addTarget(targetMasterVo);
		response.sendRedirect("TargetMasterController?flag=listTarget");
		
	}

	private void listUser(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		 
		TargetMasterDao targetMasterDao=new TargetMasterDao();
		List listUser=targetMasterDao.listUser();
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("listUser", listUser);
		response.sendRedirect("mini-sidebar/target-add.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
