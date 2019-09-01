package com.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.dao.InquiryMasterDao;
import com.vo.CategoryMasterVo;
import com.vo.CustomerMasterVo;
import com.vo.InquiryMasterVo;
import com.vo.ProductMasterVo;
import com.vo.RoleMasterVo;
import com.vo.UserMasterVo;

/**
 * Servlet implementation class InquiryMasterController
 */
@WebServlet("/InquiryMasterController")
@MultipartConfig(fileSizeThreshold=1024*1024*1, // 5MB
maxFileSize=1024*1024*5,      // 10MB
maxRequestSize=1024*1024*20)


public class InquiryMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InquiryMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String flag=request.getParameter("flag");
		 System.out.println(flag);
		 if(flag.equals("listProductCustomer"))
		 {
			 listProductCustomer(request,response);
		 }
		 else if(flag.equals("listProduct"))
		 {
			 listProduct(request,response);
		 }
		 else if(flag.equals("addInquiry"))
		 {
			 try {
				addInquiry(request,response);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		 else if(flag.equals("listInquiry"))
		 {
			 listInquiry(request,response);
		 }
		 else if(flag.equals("inquiryDetail"))
		 {
			 inquiryDetail(request,response);
		 }
		 else if(flag.equals("deleteInquiry"))
		 {
			 deleteInquiry(request,response);
		 }
		 else if(flag.equals("editInquiry"))
		 {
			 editInquiry(request,response);
		 }
		 else if(flag.equals("updateInquiry"))
		 {
			 try {
				updateInquiry(request,response);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
	}

	private void updateInquiry(HttpServletRequest request, HttpServletResponse response)throws  ServletException, IOException, ParseException
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date inquiryDateTime = new Date();
		String d1 = sdf.format(inquiryDateTime);
		
		String in=request.getParameter("inquiryDateTime");
		Date date1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(in);
		CategoryMasterVo categoryId=new CategoryMasterVo();
		categoryId.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		
		CustomerMasterVo customerId=new CustomerMasterVo();
		customerId.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
		
		ProductMasterVo productId=new ProductMasterVo();
		productId.setProductId(Integer.parseInt(request.getParameter("productId")));
		
		UserMasterVo userId=new UserMasterVo();
		userId.setUserId(Integer.parseInt(request.getParameter("userId")));
		InquiryMasterVo inquiryMasterVo=new InquiryMasterVo();
		
		Part filePart;
		String ACCESS_KEY = " ";
	    String SECRET_KEY = " ";
	    String END_POINT_URL = "http://s3.amazonaws.com";// e.g http://s3.amazonaws.com
	     
	    String BUCKET =" ";
	    String IMAGE_LOCATION = "CRM/customerImage";
	    //IMG_20151231_153325_1.jpg
	    
	    String S3_CACHE = "60";
	    AmazonS3 s3;
	  
	    try
	    {
	    	filePart= request.getPart("fileName");
			if(filePart.getSize()>0)
			{
				String inquiryId= request.getParameter("inquiryId");
				AWSCredentials credentials = new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY);
				java.security.Security.setProperty("networkaddress.cache.ttl", S3_CACHE);
				s3 = new AmazonS3Client(credentials);
				s3.setEndpoint(END_POINT_URL);
				    
				InputStream stream =filePart.getInputStream();
				String fileName =request.getPart("fileName").getSubmittedFileName();
				File file=new File(fileName);
				
				
				String newFileName="inquiry"+inquiryId+"."+getFileExtension(file);
				//fileName = System.currentTimeMillis() + "_" + fileName;
				ObjectMetadata objectMetadata = new ObjectMetadata();
				PutObjectRequest putObjectRequest = new PutObjectRequest(BUCKET, IMAGE_LOCATION + "/" + newFileName, stream,objectMetadata);
				//skip if do not want to access the image directly from S3
				putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
				//skip if do not want to access the image directly from S3
				s3.putObject(putObjectRequest);
				inquiryMasterVo.setSecureRandomNumber(request.getParameter("secureRandomNumber"));
				inquiryMasterVo.setVisitingCard(newFileName);
			}
			else
			{
				inquiryMasterVo.setSecureRandomNumber(request.getParameter("secureRandomNumber"));
				inquiryMasterVo.setVisitingCard(request.getParameter("visitingCard"));
			}
		
	    }catch(Exception e)
	    {
	    	
	    }
		inquiryMasterVo.setInquiryId(Integer.parseInt(request.getParameter("inquiryId")));
		inquiryMasterVo.setInquiryTitle(request.getParameter("inquiryTitle"));
		inquiryMasterVo.setInquiryStatus(request.getParameter("inquiryStatus"));
		inquiryMasterVo.setInquirySource(request.getParameter("inquirySource"));
		inquiryMasterVo.setInquiryRemark(request.getParameter("inquiryRemark"));
		inquiryMasterVo.setAssignId(request.getParameter("assignId"));
		inquiryMasterVo.setInquiryDateTime(date1);
		inquiryMasterVo.setModifiedOn(d1);
		inquiryMasterVo.setCategoryId(categoryId);
		inquiryMasterVo.setCustomerId(customerId);
		inquiryMasterVo.setProductId(productId);
		inquiryMasterVo.setUserId(userId);
	
		
		InquiryMasterDao inquiryMasterDao=new InquiryMasterDao();
		inquiryMasterDao.updateInquiry(inquiryMasterVo);
		response.sendRedirect("InquiryMasterController?flag=listInquiry");
	}

	private void editInquiry(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
	{
		HttpSession loginSession=request.getSession();
		int loginId=(int) loginSession.getAttribute("loginId");
		int loginRoleId=(int) loginSession.getAttribute("loginRoleId");
		
		RoleMasterVo roleId=new RoleMasterVo();
		roleId.setRoleId(loginRoleId);
		
		UserMasterVo userId=new UserMasterVo(); 
		userId.setUserId(loginId);
		userId.setRoleId(roleId);
		
		InquiryMasterVo inquiryMasterVo=new InquiryMasterVo();
		inquiryMasterVo.setUserId(userId);
		 
		inquiryMasterVo.setInquiryId(Integer.parseInt(request.getParameter("inquiryId")));
		InquiryMasterDao inquiryMasterDao=new InquiryMasterDao();
		List editInquiry=inquiryMasterDao.editInquiry(inquiryMasterVo);
		List listCustomer=inquiryMasterDao.listCustomer(inquiryMasterVo);
		List listProduct=inquiryMasterDao.listProduct(inquiryMasterVo);
		List listCategory=inquiryMasterDao.listCategory(inquiryMasterVo);
		List listBDE=inquiryMasterDao.listBDE();
		
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("editInquiry", editInquiry);
		httpSession.setAttribute("listCategory", listCategory);
		httpSession.setAttribute("listCustomer",listCustomer);
		httpSession.setAttribute("listProduct",listProduct);
		httpSession.setAttribute("listBDE",listBDE);
		response.sendRedirect("mini-sidebar/lead-edit.jsp");
	}

	private void deleteInquiry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			 InquiryMasterVo inquiryMasterVo=new InquiryMasterVo();
			 inquiryMasterVo.setInquiryId(Integer.parseInt(request.getParameter("inquiryId")));
			 InquiryMasterDao inquiryMasterDao=new InquiryMasterDao();
			 inquiryMasterDao.deleteInquiry(inquiryMasterVo);
			 response.sendRedirect("InquiryMasterController?flag=listInquiry");
		}
		catch (Exception e)
		{
			response.sendRedirect("InquiryMasterController?flag=listInquiry");
		}
	}

	private void inquiryDetail(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		InquiryMasterVo inquiryMasterVo=new InquiryMasterVo();
		inquiryMasterVo.setInquiryId(Integer.parseInt(request.getParameter("inquiryId")));
		if(request.getParameter("assignId").equals(null))
		{
			inquiryMasterVo.setAssignId("0");
		}
		else 
		{
			inquiryMasterVo.setAssignId(request.getParameter("assignId"));
		}
		InquiryMasterDao inquiryMasterDao=new InquiryMasterDao();
		List inquiryDetail=inquiryMasterDao.inquiryDetail(inquiryMasterVo);
		 
		List<UserMasterVo> assignedName=inquiryMasterDao.assignedName(inquiryMasterVo);
		String assignName="";
		if(assignedName.size()!=0)
		{
			assignName= assignedName.get(0).getUserName();
		}
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("inquiryDetail",inquiryDetail);
		httpSession.setAttribute("assignName", assignName); 
		response.sendRedirect("mini-sidebar/lead-detail.jsp");
		
	}

	private void listInquiry(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		HttpSession loginSession=request.getSession();
		int loginId=(int) loginSession.getAttribute("loginId");
		int loginRoleId=(int) loginSession.getAttribute("loginRoleId");
		RoleMasterVo roleId=new RoleMasterVo();
		roleId.setRoleId(loginRoleId);
		UserMasterVo userId=new UserMasterVo(); 
		userId.setUserId(loginId);
		userId.setRoleId(roleId);
		
		InquiryMasterVo inquiryMasterVo=new InquiryMasterVo();
		inquiryMasterVo.setUserId(userId);
		
		InquiryMasterDao inquiryMasterDao=new InquiryMasterDao();
		List listInquiry=inquiryMasterDao.listInquiry(inquiryMasterVo);
		List listCustomer=inquiryMasterDao.listCustomer(inquiryMasterVo);
		List listProduct=inquiryMasterDao.listProduct(inquiryMasterVo);
		List listCategory=inquiryMasterDao.listCategory(inquiryMasterVo);
		List listBDE=inquiryMasterDao.listBDE();
		
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("listInquiry",listInquiry);
		httpSession.setAttribute("listCustomer",listCustomer);
		httpSession.setAttribute("listProduct",listProduct);
		httpSession.setAttribute("listCategory", listCategory);
		response.sendRedirect("mini-sidebar/lead-list.jsp");
		httpSession.setAttribute("listBDE", listBDE);
		 
		
	}

	private void addInquiry(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, NoSuchAlgorithmException
	{
		CategoryMasterVo categoryId=new CategoryMasterVo();
		categoryId.setCategoryId(Integer.parseInt(request.getParameter("categoryId")));
		 
		ProductMasterVo productId=new ProductMasterVo();
		productId.setProductId(Integer.parseInt(request.getParameter("productId")));
		
		CustomerMasterVo customerId=new CustomerMasterVo();
		customerId.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
		
		HttpSession loginSession=request.getSession();
		int loginId=Integer.parseInt(loginSession.getAttribute("loginId").toString());
		UserMasterVo userId=new UserMasterVo();
		userId.setUserId(loginId);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date inquiryDateTime = new Date();
		String d1 = sdf.format(inquiryDateTime);
		String a="";
		
		/*
		 * String path =
		 * "D:\\Workspace\\stsws\\CRM\\WebContent\\mini-sidebar\\customerImage"; Part
		 * part = request.getPart("fileName"); String fileName =
		 * part.getSubmittedFileName(); String fileLocation = path + File.separator +
		 * fileName ; part.write(fileLocation);
		 */
		SecureRandom prng = SecureRandom.getInstance("SHA1PRNG");
		String randomNum = Integer.valueOf(prng.nextInt()).toString();
		/*
		 * try { SecureRandom prng = SecureRandom.getInstance("SHA1PRNG"); String
		 * randomNum = Integer.valueOf(prng.nextInt()).toString(); MessageDigest sha =
		 * MessageDigest.getInstance("SHA-1"); byte[] result =
		 * sha.digest(randomNum.getBytes()); a=hexEncode(result);
		 * System.out.println("Random number: " + randomNum);
		 * System.out.println("Message digest: " + hexEncode(result)); } catch
		 * (NoSuchAlgorithmException ex) { System.err.println(ex); }
		 */
		  
		InquiryMasterVo inquiryMasterVo=new InquiryMasterVo();
		inquiryMasterVo.setInquiryTitle(request.getParameter("inquiryTitle"));
		inquiryMasterVo.setInquiryStatus(request.getParameter("inquiryStatus"));
		inquiryMasterVo.setInquirySource(request.getParameter("inquirySource"));
		inquiryMasterVo.setInquiryRemark(request.getParameter("inquiryRemark"));
		
		inquiryMasterVo.setCategoryId(categoryId);
		inquiryMasterVo.setProductId(productId);
		inquiryMasterVo.setCustomerId(customerId);
		inquiryMasterVo.setInquiryDateTime(inquiryDateTime);
		inquiryMasterVo.setUserId(userId);
		inquiryMasterVo.setSecureRandomNumber(randomNum+d1);
		inquiryMasterVo.setAssignId(request.getParameter("assignId"));
		
		InquiryMasterDao inquiryMasterDao=new InquiryMasterDao();
		inquiryMasterDao.addInquiry(inquiryMasterVo);
		
		
		
		List<InquiryMasterVo> inquiryPhoto=inquiryMasterDao.inquiryImage(inquiryMasterVo);
		
		
		inquiryMasterVo=inquiryPhoto.get(0);
		int InqIdforPic=inquiryMasterVo.getInquiryId();
		 
		Part filePart;
		String ACCESS_KEY = " ";
	    String SECRET_KEY = " ";
	    String END_POINT_URL = "http://s3.amazonaws.com";// e.g http://s3.amazonaws.com
	    //String BUCKET = "elasticbeanstalk-ap-south-1-354994832949";
	    String BUCKET =" ";
	    String IMAGE_LOCATION = "CRM/customerImage";
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
				
				String newFileName="inquiry"+InqIdforPic+"."+getFileExtension(file);
				//fileName = System.currentTimeMillis() + "_" + fileName;
				ObjectMetadata objectMetadata = new ObjectMetadata();
				PutObjectRequest putObjectRequest = new PutObjectRequest(BUCKET, IMAGE_LOCATION + "/" + newFileName, stream,objectMetadata);
				//skip if do not want to access the image directly from S3
				putObjectRequest.setCannedAcl(CannedAccessControlList.PublicRead);
				//skip if do not want to access the image directly from S3
				s3.putObject(putObjectRequest);
				inquiryMasterVo.setVisitingCard(newFileName);
				inquiryMasterVo.setInquiryId(InqIdforPic);
			}
		
	    }catch(Exception e)
	    {
	    	
	    }
		inquiryMasterDao.updateInquiryPic(inquiryMasterVo);
		
		response.sendRedirect("InquiryMasterController?flag=listInquiry");
	}
	
	 static private String hexEncode(byte[] input){
		    StringBuilder result = new StringBuilder();
		    char[] digits = {'0', '1', '2', '3', '4','5','6','7','8','9','a','b','c','d','e','f'};
		    for (int idx = 0; idx < input.length; ++idx) {
		      byte b = input[idx];
		      result.append(digits[ (b&0xf0) >> 4 ]);
		      result.append(digits[ b&0x0f]);
		    }
		    return result.toString();
		}
	    
    private static String getFileExtension(File file)
	{
        String fileName = file.getName();
        if(fileName.lastIndexOf(".") != -1 && fileName.lastIndexOf(".") != 0)
        	return fileName.substring(fileName.lastIndexOf(".")+1);
        else
        	return "";
    }

	private void listProduct(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		 String categoryId=request.getParameter("categoryId");
		 InquiryMasterDao inquiryMasterDao=new InquiryMasterDao();
		 List<ProductMasterVo> listProduct=inquiryMasterDao.listProduct(categoryId);
		// CityMasterVo cityMasterVo=(CityMasterVo) listCity.get(0);
		 String Product="<option value='' disabled selected>Select Product</option>";
		  
		 PrintWriter out=response.getWriter();
		 //vo=listCity.get(0);
		 if(!listProduct.isEmpty())
		 {
			 for (ProductMasterVo vo : listProduct)
			 {
				 Product+= "<option value='"+vo.getProductId()+"'>"+vo.getProductName()+"</option>";
             }
		 }
		 out.print(Product);
		
	}

	private void listProductCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		 
		HttpSession loginSession=request.getSession();
		int loginId=(int) loginSession.getAttribute("loginId");
		int loginRoleId=(int) loginSession.getAttribute("loginRoleId");
		
		RoleMasterVo roleId=new RoleMasterVo();
		roleId.setRoleId(loginRoleId);
		
		UserMasterVo userId=new UserMasterVo(); 
		userId.setUserId(loginId);
		userId.setRoleId(roleId);
		
		InquiryMasterVo inquiryMasterVo=new InquiryMasterVo();
		inquiryMasterVo.setUserId(userId);
		  
		InquiryMasterDao inquiryMasterDao= new InquiryMasterDao();
		List listCustomer=inquiryMasterDao.listCustomer(inquiryMasterVo);
		List listProduct=inquiryMasterDao.listProduct(inquiryMasterVo);
		List listCategory=inquiryMasterDao.listCategory(inquiryMasterVo);
		List listBDE=inquiryMasterDao.listBDE();
		 
		List listInquiry=inquiryMasterDao.listInquiryForAdd();
		inquiryMasterVo= (InquiryMasterVo) listInquiry.get(0);
		int lastInquiry=inquiryMasterVo.getInquiryId();
		
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("listCustomer",listCustomer);
		httpSession.setAttribute("listProduct",listProduct);
		httpSession.setAttribute("listCategory", listCategory);
		httpSession.setAttribute("lastInquiry", lastInquiry);
		httpSession.setAttribute("listBDE", listBDE);
		
		response.sendRedirect("mini-sidebar/lead-add.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
