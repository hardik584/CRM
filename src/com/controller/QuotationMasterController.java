package com.controller;
 

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
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

import com.dao.QuotationMasterDao;
import com.global.EmailUtility;
import com.vo.QuotationMasterVo;
import com.vo.RoleMasterVo;
import com.vo.UserMasterVo;

/**
 * Servlet implementation class QuotationMasterController
 */
@WebServlet("/QuotationMasterController")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,   // 2MB
maxFileSize = 1024 * 1024 * 10,         // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class QuotationMasterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	 
	private String host="smtp.gmail.com";
    private String user="**********";
    private String pass="**********";
    public QuotationMasterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String flag=request.getParameter("flag");
		if(flag.equals("sendEmail"))
		{
			sendEmail(request,response);
		}
		else if(flag.equals("listEmail"))
		{
			listEmail(request,response);
		}
		else if(flag.equals("listQuotation"))
		{
			listQuotation(request,response);
		}
		else if(flag.equals("deleteQuotation"))
		{
			deleteQuotation(response,request);
			
		}
	}
	private void deleteQuotation(HttpServletResponse response, HttpServletRequest request)throws IOException, ServletException 
	{
		 QuotationMasterVo quotationMasterVo=new QuotationMasterVo();
		 quotationMasterVo.setQuotationId(Integer.parseInt(request.getParameter("quotationId")));
		 
		 QuotationMasterDao quotationMasterDao=new QuotationMasterDao();
		 quotationMasterDao.deleteQuotation(quotationMasterVo);
		 listQuotation(request, response);
		 
		
	}

	private void listQuotation(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	{
		 
		HttpSession loginSession=request.getSession();
		int loginId=(int) loginSession.getAttribute("loginId");
		int loginRoleId=(int) loginSession.getAttribute("loginRoleId");
		RoleMasterVo roleId=new RoleMasterVo();
		roleId.setRoleId(loginRoleId);
		UserMasterVo userMasterVo=new UserMasterVo(); 
		userMasterVo.setUserId(loginId);
		userMasterVo.setRoleId(roleId);
		QuotationMasterDao quotationMasterDao=new  QuotationMasterDao();
		List listQuotation=quotationMasterDao.listQuotation(userMasterVo);
		HttpSession httpSession=request.getSession();
		httpSession.setAttribute("listQuotation",listQuotation);
		response.sendRedirect("mini-sidebar/quotation-list.jsp");
	}

	private void listEmail(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
		HttpSession httpSession=request.getSession();
		int userId=Integer.parseInt(httpSession.getAttribute("loginId").toString());
		int roleId=Integer.parseInt(httpSession.getAttribute("loginRoleId").toString());
		QuotationMasterDao quotationMasterDao=new QuotationMasterDao();
		List listEmail =quotationMasterDao.listEmail(userId,roleId);
		httpSession.setAttribute("listEmail", listEmail);
		response.sendRedirect("mini-sidebar/quotation-add.jsp");
	}

	private void sendEmail(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date inquiryDateTime = new Date();
		String quotationDateTime = sdf.format(inquiryDateTime);
		
		List<File> uploadedFiles = saveUploadedFiles(request);
        
        String recipient = request.getParameter("quotationEmail");
        String subject = request.getParameter("quotationSubject");
        String content = request.getParameter("quotationContent");
 
        String resultMessage = "";
        
        try {
            EmailUtility.sendEmailWithAttachment(host,user, pass,recipient, subject, content, uploadedFiles);
            UserMasterVo userId=new UserMasterVo();
            userId.setUserId(Integer.parseInt(request.getParameter("userId"))); 
            
            QuotationMasterVo quotationMasterVo=new QuotationMasterVo();
             quotationMasterVo.setQuotationEmail(recipient);
             quotationMasterVo.setQuotationSubject(subject);
             quotationMasterVo.setQuotationContent(content);
             quotationMasterVo.setQuotationDateTime(quotationDateTime);
             quotationMasterVo.setUserId(userId); 
             String quotationFile =request.getPart("file").getSubmittedFileName();
             quotationMasterVo.setQuotationFile(quotationFile);
             
             QuotationMasterDao quotationMasterDao=new QuotationMasterDao();
             quotationMasterDao.addQuotation(quotationMasterVo);
             resultMessage = "The e-mail was sent successfully";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "There were an error: " + ex.getMessage();
        } finally {
            deleteUploadFiles(uploadedFiles);
            request.setAttribute("message", resultMessage);
            getServletContext().getRequestDispatcher("/quotation-acknowleadge.jsp").forward(request, response);
             
        }
	}

	private List<File> saveUploadedFiles(HttpServletRequest request) throws IOException, ServletException ,IllegalStateException{
		// TODO Auto-generated method stub
		List<File> listFiles = new ArrayList<File>();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        Collection<Part> multiparts = request.getParts();
        if (multiparts.size() > 0) {
            for (Part part : request.getParts()) {
                // creates a file to be saved
                String fileName = extractFileName(part);
                if (fileName == null || fileName.equals("")) {
                    // not attachment part, continue
                    continue;
                }
                 
                File saveFile = new File(fileName);
                System.out.println("saveFile: " + saveFile.getAbsolutePath());
                FileOutputStream outputStream = new FileOutputStream(saveFile);
                 
                // saves uploaded file
                InputStream inputStream = part.getInputStream();
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                outputStream.close();
                inputStream.close();
                 
                listFiles.add(saveFile);
            }
        }
        return listFiles;
	}

	private String extractFileName(Part part) {
		// TODO Auto-generated method stub
		String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
	}
	private void deleteUploadFiles(List<File> uploadedFiles) {
		// TODO Auto-generated method stub
		if (uploadedFiles != null && uploadedFiles.size() > 0) {
            for (File aFile : uploadedFiles) {
                aFile.delete();
            }
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
