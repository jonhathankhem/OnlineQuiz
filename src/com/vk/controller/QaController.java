package com.vk.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vk.view.QaViews;

public class QaController extends HttpServlet{

	
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    	
	    	doPost(request, response);
	    }
	 
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    	response.setContentType("text/html");
			String user = request.getParameter("user");
			String pass = request.getParameter("pass");
			
			ArrayList<String> arr=new ArrayList<String>();
		 	QaViews qa=new QaViews();
		 	try{
		 		arr=qa.login(user,pass);
		 		//System.out.println("kj1"+arr);
				//System.out.print("kj "+arr.get(0));
				request.setAttribute("articles", arr);
				request.getSession().setAttribute("articles", arr);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/ExamList.jsp");
				dispatcher.forward(request, response);
			
		 	
		 	//System.out.println(arr);
		 		
		 	}
		 	
		 	
		 	
		 	
		 	catch (Exception e) {
				//try {
					response.setContentType("text/html");
					String a=e.toString();
					if (a.contains("DB"))
					{	
						request.setAttribute("message", "DB Connectivity Failed!!");
					}else if (a.contains("SQL"))
					{	
						request.setAttribute("message", "Couldn't fetch data from DB!!");
					}else if (a.contains("LOGS"))
					{	
						request.setAttribute("message", "No Logs Found!!");
					}else if (a.contains("DATA"))
					{	
						request.setAttribute("message", "Wrong Schema or Environment selected!!");
					}
					/*System.out.println("kj1"+arr);
					System.out.print("kj "+arr.get(0));
					request.setAttribute("articles", arr);
					request.getSession().setAttribute("articles", arr);

					RequestDispatcher dispatcher = request.getRequestDispatcher("/ExamList.jsp");
					dispatcher.forward(request, response);*/
				//} catch (ServletException e1) {
					
					
				//}		
			
				 }
			
	    }
}
