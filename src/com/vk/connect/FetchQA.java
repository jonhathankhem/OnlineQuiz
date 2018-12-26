package com.vk.connect;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.vk.view.QaViews;
import java.util.Map.Entry;

public class FetchQA extends HttpServlet{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	
    	doPost(request, response);
    }
 
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
	 	
	 response.setContentType("text/html");
		String user = request.getParameter("examlist");
		System.out.println("user: "+user);
		QaViews q2=new QaViews();
		//HashMap<String,String> arr=new HashMap<String,String>();
		
		//Map<String, String> arr = new LinkedHashMap<String, String>();
		List<Entry<String, String>> arr = new ArrayList<Map.Entry<String, String>>();
		
		try{
			arr=q2.QAList(user);
			System.out.println("Data 2 Frontend :"+arr);
			request.setAttribute("Exam", user);
			request.setAttribute("Questions", arr);
			for(int i=0;i<arr.size();i++)
			{
			Map.Entry<String, String> entry = arr.get(i);
			System.out.println(entry.getKey());
			}
			//System.out.println(entry.getValue());
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/QuestionsList.jsp");
			dispatcher.forward(request, response);
	 		//System.out.println(arr.get(0));
	 	}
	 	
		
		
		
	 	catch (Exception e) {
	 		System.out.println(e);
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
			
			 }
		
    }
}
