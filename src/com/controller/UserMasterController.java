package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserMasterDao;
import com.vo.InquiryActivityMasterVo;
import com.vo.ProfileMasterVo;
import com.vo.RoleMasterVo;
import com.vo.SupportActivityMasterVo;
import com.vo.TargetMasterVo;
import com.vo.UserMasterVo;

/**
 * Servlet implementation class UserMasterController
 */
@WebServlet("/UserMasterController")
public class UserMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserMasterController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag = request.getParameter("flag");
		if (flag.equals("registerUser")) {
			registerUser(request, response);
		} else if (flag.equals("loginUser") || flag.equals("ajaxLogin")) {
			loginUser(request, response);
		} else if (flag.equals("logoutUser")) {
			logoutUser(request, response);
		} else if (flag.equals("userProfile")) {
			userProfile(request, response);
		} else if (flag.equals("listDashboard")) {
			listDashboard(request, response);
		} else if (flag.equals("notify")) {
			notify(request, response);
		} else if (flag.equals("recoverPassword")) {
			recoverPassword(request, response);
		} else if (flag.equals("checkContact")) {
			checkContact(response, request);
		} else if (flag.equals("checkEmail")) {
			checkEmail(request, response);
		} else if (flag.equals("checkMobileReg")) {
			checkMobileReg(request, response);
		} else if(flag.equals("changePassword")) {
			changePassword(request,response);
		}

	}

	private void changePassword(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		HttpSession loginSession = request.getSession();
		int loginId = Integer.parseInt(loginSession.getAttribute("loginId").toString());
		
		 UserMasterVo userMasterVo=new UserMasterVo();
		 userMasterVo.setUserId(loginId);
		 userMasterVo.setUserPassword(request.getParameter("currentPassword"));
		 UserMasterDao userMasterDao=new UserMasterDao();
		 
		 List<UserMasterVo> checkPassword=userMasterDao.checkPassword(userMasterVo);
		 PrintWriter out=response.getWriter();
		 if(checkPassword.size()==0)
		 {	
			 out.print("Please enter correct password");
			 
		 }
		 else
		 {
			 userMasterVo = checkPassword.get(0);
			 RoleMasterVo roleId=new RoleMasterVo();
			 roleId.setRoleId(userMasterVo.getRoleId().getRoleId());
			 userMasterVo.setUserId(userMasterVo.getUserId());
			 userMasterVo.setUserPassword(request.getParameter("newPassword"));
			 userMasterVo.setUserEmail(userMasterVo.getUserEmail());
			 userMasterVo.setUserMobile(userMasterVo.getUserMobile());
			 userMasterVo.setUserName(userMasterVo.getUserName());
			 userMasterVo.setRoleId(roleId);
			 userMasterDao.setNewPassword(userMasterVo);
			 out.print("Your password has been changed successfully");
			 
		 }
		
	}

	private void checkMobileReg(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		 UserMasterVo userMasterVo=new UserMasterVo();
		 userMasterVo.setUserMobile(request.getParameter("userMobile"));
		 
		 UserMasterDao userMasterDao=new UserMasterDao();
		 List checkMobile= userMasterDao.checkMobileReg(userMasterVo);
		 PrintWriter out=response.getWriter();
		 if(checkMobile.size()>0)
		 {
			 out.print("Mobile number already exists!");
		 }
		 else 
		 {
			 
		 }
		 
		
	}

	private void checkEmail(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  
	{
		 UserMasterVo userMasterVo=new UserMasterVo();
		 userMasterVo.setUserEmail(request.getParameter("userEmail"));
		 
		 UserMasterDao userMasterDao=new UserMasterDao();
		 List checkEmail= userMasterDao.checkEmail(userMasterVo);
		 PrintWriter out=response.getWriter();
		 if(checkEmail.size()>0)
		 {
			 out.print("Email Id already exists!");
		 }
		 else 
		 {
			 
		 }
	}

	private void checkContact(HttpServletResponse response, HttpServletRequest request)throws ServletException, IOException  
	{
		 UserMasterVo userMasterVo=new UserMasterVo();
		 userMasterVo.setUserMobile(request.getParameter("userMobile"));
		 userMasterVo.setUserEmail(request.getParameter("userEmail"));
		 
		 UserMasterDao userMasterDao=new UserMasterDao();
		 List checkMobile= userMasterDao.checkMobile(userMasterVo);
		 PrintWriter out=response.getWriter();
		 if(checkMobile.size()>0)
		 {
			
		 }
		 else 
		 {
			 out.print("Contact or Email not correct");
		 }
		 
		
	}

	private void recoverPassword(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  
	{
		 UserMasterVo userMasterVo=new UserMasterVo();
		 userMasterVo.setUserMobile(request.getParameter("userMobile"));
		 userMasterVo.setUserEmail(request.getParameter("userEmail"));
		 
		 UserMasterDao userMasterDao=new UserMasterDao();
		 
		 List<UserMasterVo> recoverCheck=userMasterDao.recoverCheck(userMasterVo);
		 
		 if(recoverCheck!=null)
		 {
			 userMasterVo=recoverCheck.get(0);
			 userMasterVo.setUserEmail(userMasterVo.getUserEmail());
			 userMasterVo.setUserId(userMasterVo.getUserId());
			 userMasterVo.setUserMobile(userMasterVo.getUserMobile());
			 userMasterVo.setUserName(userMasterVo.getUserName());
			 userMasterVo.setUserPassword(request.getParameter("userPassword"));
			 RoleMasterVo roleId=new RoleMasterVo();
			 roleId.setRoleId(userMasterVo.getRoleId().getRoleId());
			 userMasterVo.setRoleId(roleId);
			 userMasterDao.changePassword(userMasterVo);
			 HttpSession httpSession=request.getSession();
			 httpSession.setAttribute("recover",recoverCheck.size());
			 response.sendRedirect("mini-sidebar/user-login.jsp");
		 }
		 else 
		 {
			 HttpSession httpSession=request.getSession();
			 httpSession.setAttribute("recover",recoverCheck.size());
			 response.sendRedirect("mini-sidebar/user-recover-password.jsp");
		 }
		 	
		
	}

	private void notify(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  
	{ try
	{
		HttpSession loginSession = request.getSession();
		int loginId = Integer.parseInt(loginSession.getAttribute("loginId").toString());
		int roleId=Integer.parseInt( loginSession.getAttribute("loginRoleId").toString());
		UserMasterDao userMasterDao = new UserMasterDao();
		List<InquiryActivityMasterVo> listNotify = userMasterDao.listNotify(loginId,roleId);
		List<SupportActivityMasterVo> listSupport =userMasterDao.listSupport(loginId,roleId);
		String Notify = "";
		 
		
		 
		if(!listNotify.isEmpty())
		{
		for (InquiryActivityMasterVo vo : listNotify) {
			Notify += " <a href='../InquiryMasterController?flag=inquiryDetail&inquiryId="+vo.getInquiryId().getInquiryId()+"&assignId="+vo.getInquiryId().getAssignId()+"'><div class='btn btn-primary btn-circle ti-user'></div><div class='mail-contnet'>"
					+ "<h5>INQ000" + vo.getInquiryId().getInquiryId()+"("+vo.getInquiryId().getCustomerId().getCustomerName() + ")</h5> <span class='mail-desc'>"+vo.getRemainderRemark()+"</span>"
					+ " <span class='time'>" + vo.getRemainderDate() +" "+  vo.getRemainderTime()
					+ "</span> </div></a> ";
		}
		}
		if(!listSupport.isEmpty())
		{
			for (SupportActivityMasterVo vo : listSupport) {
				Notify += " <a href='../SupportMasterController?flag=supportDetail&supportId="+vo.getSupportId().getSupportId()+"'><div class='btn btn-danger btn-circle fa fa-link'></div><div class='mail-contnet'>"
						+ "<h5>SUP000" +vo.getSupportId().getSupportId()+"("+vo.getSupportId().getCustomerId().getCustomerName() + ")</h5> <span class='mail-desc'>"+vo.getSupportActivityReminderRemark()+"</span>"
						+ " <span class='time'>" + vo.getSupportActivityReminderDate()+" "+  vo.getSupportActivityReminderTime()
						+ "</span> </div></a> ";
			}
		}
		
		 
		PrintWriter out = response.getWriter();
		out.print(Notify);
	}
	catch(Exception e)
	{
		 e.printStackTrace();
	}
	}

	private void listDashboard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/xml");
		HttpSession loginSession = request.getSession();
		int loginId = Integer.parseInt(loginSession.getAttribute("loginId").toString());
		int loginRoleId = Integer.parseInt(loginSession.getAttribute("loginRoleId").toString());
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yy");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		Date inquiryDateTime = new Date();
		String d1 = sdf.format(inquiryDateTime);
		String d2 = sdf1.format(inquiryDateTime);
		System.out.println(inquiryDateTime);
		System.out.println(d1);
		UserMasterDao userMasterDao = new UserMasterDao();

		List totalCustomer = userMasterDao.totalCustomer(loginId, loginRoleId);
		List totalProduct = userMasterDao.totalProduct(loginId, loginRoleId);
		List totalInquiry = userMasterDao.totalInquiry(loginId, loginRoleId);
		List todayLead = userMasterDao.totalLead(d2, loginId, loginRoleId);
		List target = userMasterDao.target(loginId, loginRoleId);
		List pendingInquiry=userMasterDao.pendingInquiry(loginId, loginRoleId);
		List cancelInquiry=userMasterDao.cancelInquiry(loginId, loginRoleId);
		List convertedInquiry=userMasterDao.convertedInquiry(loginId, loginRoleId);
		 

		if (loginRoleId == 2 || loginRoleId == 3) {
			String targetSize = "";
			String targetFromDate = "";
			String targetToDate = "";
			String Notify = "";

			if (!target.isEmpty()) {
				TargetMasterVo targetMasterVo = new TargetMasterVo();
				targetMasterVo = (TargetMasterVo) target.get(0);
				targetSize = targetMasterVo.getTargetsize();
				targetFromDate = targetMasterVo.getTargetFromDate();
				targetToDate = targetMasterVo.getTargetToDate();
			} else {
				targetSize = "0";
				targetFromDate = "-";
				targetToDate = "-";

			}

			int tCustomer = totalCustomer.size();
			int tProduct = totalProduct.size();
			int tInquiry = totalInquiry.size();
			int tLead = todayLead.size();
			 
			PrintWriter out = response.getWriter();
			out.print("<dashboard>");
			out.print("<product>" + tProduct + "</product>");
			out.print("<customer>" + tCustomer + "</customer>");
			out.print("<inquiry>" + tInquiry + "</inquiry>");
			out.print("<lead>" + tLead + "</lead>");
			out.print("<targetSize>" + targetSize + "</targetSize>");
			out.print("<targetFromDate>" + targetFromDate + "</targetFromDate>");
			out.print("<targetToDate>" + targetToDate + "</targetToDate>");
			out.print("<notify>" + Notify + "</notify>");
			out.print("<pendingInquiry>" + pendingInquiry.size() + "</pendingInquiry>");
			out.print("<convertedInquiry>" + convertedInquiry.size() + "</convertedInquiry>");
			out.print("<cancelInquiry>" + cancelInquiry.size() + "</cancelInquiry>");
			out.print("</dashboard>");
			loginSession.setAttribute("allCustomer", tCustomer);
			loginSession.setAttribute("allProduct",tProduct);
			loginSession.setAttribute("allInquiry", tInquiry);
			loginSession.setAttribute("tLead", tLead);
			loginSession.setAttribute("targetToDate",targetToDate );
			loginSession.setAttribute("targetFromDate", targetFromDate);
			loginSession.setAttribute("targetSize", targetSize);
			loginSession.setAttribute("pendingInquiry", pendingInquiry.size());
			loginSession.setAttribute("cancelInquiry", cancelInquiry.size());
			loginSession.setAttribute("convertedInquiry", convertedInquiry.size());
			 
		} else if (loginRoleId == 1) {

			int tCustomer = totalCustomer.size();
			int tProduct = totalProduct.size();
			int tInquiry = totalInquiry.size();
			int tLead = todayLead.size();
			int totalTarget = target.size();
			PrintWriter out = response.getWriter();
			out.print("<dashboard>");
			out.print("<product>" + tProduct + "</product>");
			out.print("<customer>" + tCustomer + "</customer>");
			out.print("<inquiry>" + tInquiry + "</inquiry>");
			out.print("<lead>" + tLead + "</lead>");
			out.print("<totalTarget>" + totalTarget + "</totalTarget>");
			out.print("</dashboard>");
			loginSession.setAttribute("allCustomer", tCustomer);
			loginSession.setAttribute("allProduct",tProduct);
			loginSession.setAttribute("allInquiry", tInquiry);
			loginSession.setAttribute("tLead", tLead);
			 
			loginSession.setAttribute("pendingInquiry", pendingInquiry.size());
			loginSession.setAttribute("cancelInquiry", cancelInquiry.size());
			loginSession.setAttribute("convertedInquiry", convertedInquiry.size());
			 
		}
		

	}

	private void userProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession loginSession=request.getSession();
		int loginId=Integer.parseInt(loginSession.getAttribute("loginId").toString());
	
		UserMasterVo userMasterVo=new UserMasterVo();
		userMasterVo.setUserId(loginId);
		
		ProfileMasterVo profileMasterVo = new ProfileMasterVo();
		profileMasterVo.setProfileId(loginId);
		
		UserMasterDao userMasterDao=new UserMasterDao();
		List userProfile=userMasterDao.showUserProfile(loginId);
		List profileListDetail = userMasterDao.profileListDetail(userMasterVo);
		
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("userProfile",userProfile);
		httpSession.setAttribute("profileListDetail", profileListDetail);
		response.sendRedirect("mini-sidebar/user-profile.jsp");


	}

	private void logoutUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession loginSession = request.getSession();
		loginSession.invalidate();
		response.sendRedirect("mini-sidebar/user-login.jsp");

	}

	private void loginUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserMasterVo userMasterVo = new UserMasterVo();
		userMasterVo.setUserEmail(request.getParameter("userEmail"));
		userMasterVo.setUserPassword(request.getParameter("userPassword"));

		UserMasterDao userMasterDao = new UserMasterDao();
		List loginUser = userMasterDao.loginUser(userMasterVo);
		PrintWriter out = response.getWriter();

		if (loginUser.size() != 0) {
			userMasterVo(request,response);
			userMasterVo = (UserMasterVo) loginUser.get(0);
			int roleId = userMasterVo.getRoleId().getRoleId();
			int loginId=userMasterVo.getUserId();
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			Date inquiryDateTime = new Date();
			String d2 = sdf1.format(inquiryDateTime);
			String targetSize = "";
			String targetFromDate = "";
			String targetToDate = "";
			List listState = userMasterDao.listAllState();
			List listCity = userMasterDao.listAllCity();
			List totalCustomer = userMasterDao.totalCustomer(loginId, roleId);
			List totalProduct = userMasterDao.totalProduct(loginId, roleId);
			List totalInquiry = userMasterDao.totalInquiry(loginId, roleId);
			List todayLead = userMasterDao.totalLead(d2, loginId, roleId);
			List target = userMasterDao.target(loginId, roleId);
			List profile=userMasterDao.profile(loginId);
			List pendingInquiry=userMasterDao.pendingInquiry(loginId,roleId);
			List cancelInquiry=userMasterDao.cancelInquiry(loginId,roleId);
			List convertedInquiry=userMasterDao.convertedInquiry(loginId,roleId);
			String profileImage="";
			if(profile.size()!=0)
			{
			ProfileMasterVo profileMasterVo=new ProfileMasterVo();
			profileMasterVo=(ProfileMasterVo) profile.get(0);
			profileImage=profileMasterVo.getProfileImage();
			}
			 
			if (roleId == 2 || roleId == 3) {
				
				 

				if (!target.isEmpty()) {
					TargetMasterVo targetMasterVo = new TargetMasterVo();
					targetMasterVo = (TargetMasterVo) target.get(0);
					targetSize = targetMasterVo.getTargetsize();
					targetFromDate = targetMasterVo.getTargetFromDate();
					targetToDate = targetMasterVo.getTargetToDate();
				} else {
					targetSize = "0";
					targetFromDate = "-";
					targetToDate = "-";

				}
			}

			
			int allCustomer=totalCustomer.size();
			int allProduct=totalProduct.size();
			int allInquiry=totalInquiry.size();
			int tLead=todayLead.size();
			int pendingLead=pendingInquiry.size();
			int cancelLead=cancelInquiry.size();
			int convertedLead=convertedInquiry.size();
			
			HttpSession loginSession = request.getSession();
			loginSession.setAttribute("loginId", userMasterVo.getUserId());
			loginSession.setAttribute("loginRoleId", roleId);
			loginSession.setAttribute("profileImage", profileImage);
			loginSession.setAttribute("loginName", userMasterVo.getUserName());
			loginSession.setAttribute("loginEmail", userMasterVo.getUserEmail());
			loginSession.setAttribute("loginRole", userMasterVo.getRoleId().getRoleName());
			loginSession.setAttribute("allCustomer", allCustomer);
			loginSession.setAttribute("allProduct",allProduct);
			loginSession.setAttribute("allInquiry", allInquiry);
			loginSession.setAttribute("tLead", tLead);
			loginSession.setAttribute("targetToDate",targetToDate );
			loginSession.setAttribute("targetFromDate", targetFromDate);
			loginSession.setAttribute("targetSize", targetSize);
			loginSession.setAttribute("pendingInquiry", pendingLead);
			loginSession.setAttribute("cancelInquiry", cancelLead);
			loginSession.setAttribute("convertedInquiry", convertedLead);
			 
			HttpSession httpSession = request.getSession();

			httpSession.setAttribute("listState", listState);
			httpSession.setAttribute("listCity", listCity);
			// response.sendRedirect("mini-sidebar/index.jsp");

			out.print("login Success");

		} else if (loginUser.size() == 0) {
			String loginError = "Please Enter Valid Email Or Password!";
			out.print(loginError);
		}

	}

	private void registerUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserMasterVo userMasterVo = new UserMasterVo();
		userMasterVo.setUserName(request.getParameter("userName"));
		userMasterVo.setUserEmail(request.getParameter("userEmail"));
		userMasterVo.setUserMobile(request.getParameter("userMobile"));
		userMasterVo.setUserPassword(request.getParameter("userPassword"));

		RoleMasterVo roleMasterVo = new RoleMasterVo();
		roleMasterVo.setRoleId(Integer.parseInt(request.getParameter("roleId")));
		userMasterVo.setRoleId(roleMasterVo);

		UserMasterDao userMasterDao = new UserMasterDao();
		userMasterDao.registerUser(userMasterVo);

		response.sendRedirect("mini-sidebar/user-login.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void userMasterVo(HttpServletRequest request, HttpServletResponse response) {
		Date date = new Date();
		InetAddress ip;
		try
		{
			ip = InetAddress.getLocalHost();
			NetworkInterface network = NetworkInterface.getByInetAddress(ip);
			byte[] mac = network.getHardwareAddress();
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < mac.length; i++) {
				sb.append(String.format("%02X%s", mac[i], (i < mac.length - 1) ? "-" : ""));		
			}
			System.out.println("sb");
			String host="smtp.gmail.com";
			String user=" ";
			String pass=" ";
			String  to=" "; 
			String from=" ";
			String subject="Login History";
			String messageText="current ip = " + ip.getHostAddress() + " \n" 
					+ " mac address = " + sb.toString() + " \n"
					+ " localport = " + request.getLocalPort() + "\n"
					+ " protocol = " + request.getProtocol() + " \n"
					+ " remoteAddress = " + request.getRemoteAddr() + "\n"
					+ " remoteHost = " + request.getRemoteHost() + "\n"
					+ " remotePort = " + request.getRemotePort() + "\n"
					+ " remoteuser = " + request.getRemoteUser() + "\n"
					+ " remoteUri = " + request.getRequestURI() + "\n"
					+ " servletpath = " + request.getServletPath() + "\n"
					+ " date-time = " + date + "";
			boolean sessionDebug=false;
			
			Properties properties=System.getProperties();
			properties.put("mail.smtp.starttls.enable", "true");
			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.port", "587");
			properties.put("mail.smtp.auth","true");
			properties.put("mail.smtp.starttls.required","true");
			
			java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
			Session session=Session.getDefaultInstance(properties, null);
			session.setDebug(sessionDebug);
			Message message=new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			
			  InternetAddress[] addresses= {new InternetAddress(to)};
			 
			  
			message.setRecipients(Message.RecipientType.TO,addresses);
			message.setSubject(subject);
			message.setSentDate(new Date());
			message.setText(messageText);

			Transport transport=session.getTransport("smtp");
			transport.connect(host, user, pass);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
		}
		catch (Exception e) {
			System.out.println(e);
		}
	}

}
