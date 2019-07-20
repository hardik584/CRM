package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.dao.ProfileMasterDao;
import com.vo.CityMasterVo;
import com.vo.ProfileMasterVo;
import com.vo.RoleMasterVo;
import com.vo.StateMasterVo;
import com.vo.UserMasterVo;

/**
 * Servlet implementation class ProfileMasterController
 */
@WebServlet("/ProfileMasterController")
@MultipartConfig(fileSizeThreshold=1024*1024*1, // 5MB
maxFileSize=1024*1024*5,      // 10MB
maxRequestSize=1024*1024*20)
public class ProfileMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String flag = request.getParameter("flag");
		if(flag.equals("addprofiledetail"))
		{
			addprofiledetail(request,response);
		}
		else if(flag.equals("listCity"))
		{
			listCity(request,response);
		}
		else if(flag.equals("listStateCity")) 
		{
			listStateCity(request,response);
		}
		else if(flag.equals("editProfile"))
		{
			editProfile(request,response);
		}
		else if(flag.equals("updateProfile"))
		{
			updateProfile(request,response);
		}
		else if(flag.equals("profileDetail"))
		{
			profileDetail(request,response);
		}
		else if(flag.equals("addProfileButton"))
		{
			addProfilecheck(request,response);
		}
		
	}

	
	private void addProfilecheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  
	{
		ProfileMasterVo profileMasterVo=new ProfileMasterVo();
		profileMasterVo.setProfileId(Integer.parseInt(request.getParameter("profileId")));
		
		ProfileMasterDao profileMasterDao = new ProfileMasterDao();
		List checkProfile=profileMasterDao.checkProfile(profileMasterVo);
		int check=checkProfile.size();
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("checkProfile", checkProfile);
		httpSession.setAttribute("listSize", check);
		response.sendRedirect("mini-sidebar/profile-add.jsp");
	}

	private void updateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException    {
		ProfileMasterVo profileMasterVo = new ProfileMasterVo();
		profileMasterVo.setBankAccountNo(request.getParameter("bankAccountNo"));
		profileMasterVo.setBankIfscCode(request.getParameter("bankIfscCode"));
		profileMasterVo.setBankName(request.getParameter("bankName"));
		profileMasterVo.setPancardNo(request.getParameter("pancardNo"));
		profileMasterVo.setProfileAddress(request.getParameter("profileAddress"));
		profileMasterVo.setProfileAge(request.getParameter("profileAge"));
		profileMasterVo.setProfileDateOfBirth(request.getParameter("profileDateOfBirth"));
		profileMasterVo.setProfileGender(request.getParameter("profileGender"));
		profileMasterVo.setProfilePincode(request.getParameter("profilePincode"));

		
		 RoleMasterVo roleId = new RoleMasterVo();
		 roleId.setRoleId(Integer.parseInt(request.getParameter("roleId")));
		 profileMasterVo.setRoleId(roleId);
			
		 StateMasterVo stateId=new StateMasterVo();
		 stateId.setStateId(Integer.parseInt(request.getParameter("stateId")));
		 profileMasterVo.setStateId(stateId);
		 
		 CityMasterVo cityId=new CityMasterVo();
		 cityId.setCityId(Integer.parseInt(request.getParameter("cityId")));
		 profileMasterVo.setCityId(cityId);
		 
		 HttpSession loginSession=request.getSession();
		 int loginId=(int) loginSession.getAttribute("loginId");
		
		 UserMasterVo userMasterVo=new UserMasterVo(); 
		 userMasterVo.setUserId(loginId);
		 profileMasterVo.setUserId(userMasterVo);
		 profileMasterVo.setProfileId(loginId);
		
		 userMasterVo.setUserPassword(request.getParameter("userPassword"));
		 userMasterVo.setUserName(request.getParameter("userName"));
		 userMasterVo.setUserMobile(request.getParameter("userMobile"));
		 userMasterVo.setUserEmail(request.getParameter("userEmail"));
		 userMasterVo.setUserId(loginId);
		 userMasterVo.setRoleId(roleId);
	 
		 ProfileMasterDao profileMasterDao = new ProfileMasterDao();
		 profileMasterDao.updateProfile(profileMasterVo);
		 profileMasterDao.updateUser(userMasterVo);
		 
		 response.sendRedirect("UserMasterController?flag=userProfile");
		
	}

	private void editProfile(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException   {
		ProfileMasterVo profileMasterVo = new ProfileMasterVo();
		//profileMasterVo.setProfileId(Integer.parseInt(request.getParameter("profileId")));
	
		HttpSession httpSession = request.getSession();
		int loginId=Integer.parseInt(httpSession.getAttribute("loginId").toString());
		
		UserMasterVo userId=new UserMasterVo();
		userId.setUserId(loginId);
		profileMasterVo.setUserId(userId);
		profileMasterVo.setProfileId(loginId);
		
		//UserMasterDao userMasterDao = new UserMasterDao();
		ProfileMasterDao profileMasterDao = new ProfileMasterDao();
		List editProfile=profileMasterDao.editProfile(profileMasterVo);
		//List userProfile=userMasterDao.showUserProfile(loginId);
		
		List liststate = profileMasterDao.listallState();
		List listcity = profileMasterDao.listallCity();
		
		httpSession.setAttribute("editProfile", editProfile);
		//httpSession.setAttribute("userProfile", userProfile);
		httpSession.setAttribute("liststate", liststate);
		httpSession.setAttribute("listcity", listcity);
		response.sendRedirect("mini-sidebar/profile-edit.jsp");
	
		
	}

	private void profileDetail(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException  {
		HttpSession loginSession =  request.getSession();
		int loginId = (int) loginSession.getAttribute("loginId");
		UserMasterVo userId = new UserMasterVo();
		userId.setUserId(loginId);
		
		ProfileMasterVo profileMasterVo = new ProfileMasterVo();
		profileMasterVo.setUserId(userId);
		
		ProfileMasterDao profileMasterDao = new ProfileMasterDao();
		List profileDetail = profileMasterDao.profileDetail(profileMasterVo);
		List profileListDetail = profileMasterDao.profileListDetail(profileMasterVo);
		
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("profileDetail",profileDetail);
		httpSession.setAttribute("profileListDetail", profileListDetail);
		response.sendRedirect("mini-sidebar/user-profile.jsp");

		
	}

	private void listStateCity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ProfileMasterDao profileMasterDao = new ProfileMasterDao();
		
		List liststate = profileMasterDao.listallState();
		List listcity = profileMasterDao.listallCity();
		
		HttpSession httpSession = request.getSession();
		httpSession.setAttribute("liststate",liststate);
		httpSession.setAttribute("listcity",listcity);
		response.sendRedirect("mini-sidebar/profile-master.jsp");
		
	}

	private void listCity(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String StateId=request.getParameter("stateId");
		 ProfileMasterDao profileMasterDao = new ProfileMasterDao();
		 List<CityMasterVo> listCity=profileMasterDao.listCity(StateId);
		
		 String city="";
		 city+="<option value='' disabled selected>Select City</option>";
		 PrintWriter out=response.getWriter();
		 
		 if(!listCity.isEmpty())
		 {
			 
			 for (CityMasterVo vo : listCity) {
				 city+= "<option value='"+vo.getCityId()+"'>"+vo.getCityName()+"</option>";
            	 
			}
		 }
		 out.print(city);
				
		
	}

	private void addprofiledetail(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException  {
		HttpSession loginSession=request.getSession();
		 int loginId=(int) loginSession.getAttribute("loginId");
		ProfileMasterVo profileMasterVo = new ProfileMasterVo();
		Part filePart;
		String ACCESS_KEY = " ";
	    String SECRET_KEY = " ";
	    String END_POINT_URL = "http://s3.amazonaws.com";// e.g http://s3.amazonaws.com
	    //String BUCKET = "elasticbeanstalk-ap-south-1-354994832949";
	    String BUCKET =" ";
	    String IMAGE_LOCATION = "CRM/profileImage";
	    //IMG_20151231_153325_1.jpg
	    
	    String S3_CACHE = "60";
	    AmazonS3 s3;
	  
	    try
	    {
	    	filePart= request.getPart("fileName");
			if(filePart.getSize()>0)
			{
				AWSCredentials credentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);
				java.security.Security.setProperty("networkaddress.cache.ttl", S3_CACHE);
				s3 = new AmazonS3Client(credentials);
				s3.setEndpoint(END_POINT_URL);
				    
				InputStream stream =filePart.getInputStream();
				String fileName =request.getPart("fileName").getSubmittedFileName();
				File file=new File(fileName);
				
				
				String newFileName="my"+loginId+"."+getFileExtension(file);
				//fileName = System.currentTimeMillis() + "_" + fileName;
				ObjectMetadata objectMetadata = new ObjectMetadata();
				PutObjectRequest putObjectRequest = new PutObjectRequest(BUCKET, IMAGE_LOCATION + "/" + newFileName, stream,objectMetadata);
				//skip if do not want to access the image directly from S3
				putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
				//skip if do not want to access the image directly from S3
				s3.putObject(putObjectRequest);
				 
				profileMasterVo.setProfileImage(newFileName);
			}
			else
			{
				profileMasterVo.setProfileImage(request.getParameter("profileImage"));
			}
		
	    }catch(Exception e)
	    {
	    	
	    }
		
		profileMasterVo.setBankAccountNo(request.getParameter("bankAccountNo"));
		profileMasterVo.setBankIfscCode(request.getParameter("bankIfscCode"));
		profileMasterVo.setBankName(request.getParameter("bankName"));
		profileMasterVo.setPancardNo(request.getParameter("pancardNo"));
		profileMasterVo.setProfileAddress(request.getParameter("profileAddress"));
		profileMasterVo.setProfileAge(request.getParameter("profileAge"));
		profileMasterVo.setProfileDateOfBirth(request.getParameter("profileDateOfBirth"));
		profileMasterVo.setProfileGender(request.getParameter("profileGender"));
		profileMasterVo.setProfilePincode(request.getParameter("profilePincode"));
		
		RoleMasterVo roleId = new RoleMasterVo();
		roleId.setRoleId(Integer.parseInt(request.getParameter("roleId")));
		profileMasterVo.setRoleId(roleId);
			
		 StateMasterVo stateId=new StateMasterVo();
		 stateId.setStateId(Integer.parseInt(request.getParameter("stateId")));
		 profileMasterVo.setStateId(stateId);
		 
		 CityMasterVo cityId=new CityMasterVo();
		 cityId.setCityId(Integer.parseInt(request.getParameter("cityId")));
		 profileMasterVo.setCityId(cityId);
		 
		 
		
		 UserMasterVo userId=new UserMasterVo(); 
		 userId.setUserId(loginId);
		 userId.setRoleId(roleId);
		 userId.setUserEmail(request.getParameter("userEmail"));
		 userId.setUserMobile(request.getParameter("userMobile"));
		 userId.setUserName(request.getParameter("userName"));
		 userId.setUserPassword(request.getParameter("userPassword"));
		 
		 profileMasterVo.setUserId(userId);
		 profileMasterVo.setProfileId(loginId);
		 
		 
		 ProfileMasterDao profileMasterDao = new ProfileMasterDao();
		 profileMasterDao.updateUser(userId);
		 profileMasterDao.addprofiledetail(profileMasterVo);
		 
		
		 List userProfile = profileMasterDao.userProfile(profileMasterVo);
		 List profileListDetail = profileMasterDao.profileListDetail(profileMasterVo);
			
		 HttpSession httpSession = request.getSession();
		 httpSession.setAttribute("userProfile",userProfile);
		 httpSession.setAttribute("profileListDetail", profileListDetail);
		 response.sendRedirect("mini-sidebar/user-profile.jsp");
		
	}
	private static String getFileExtension(File file)
	{
        String fileName = file.getName();
        if(fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
        	return fileName.substring(fileName.lastIndexOf(".")+1);
        else
        	return "";
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
