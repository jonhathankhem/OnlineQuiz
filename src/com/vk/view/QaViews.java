package com.vk.view;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.vk.DAO.CustomException;
import com.vk.DAO.DBConnection;

public class QaViews {

	
	public ArrayList<String> login(String user,String pass) throws CustomException {
		DBConnection db=new DBConnection();
		Connection con=db.getConnection();
		
			
			PreparedStatement stmt=null;
			boolean flag=false;
			ResultSet  rs,rs1=null;
			String e1="";
			
			try {
				stmt=con.prepareStatement("select exam from khem.usertable where username=? and pass=?");
				stmt.setString(1,user);
				stmt.setString(2,pass);
				rs=stmt.executeQuery();
				System.out.println("logged in");
			if (!rs.next()) {
				flag=true;
				con.close();
				throw new CustomException("LOGS");
			}
			else
			{	System.out.println("Fetching List: "+rs.getString("exam"));
				e1=rs.getString("exam");
				//StringBuffer e2=new StringBuffer(e1);
				ArrayList<String> s1=new ArrayList<String>();
				stmt=con.prepareStatement("select * from khem.EXAMLIST");
				//stmt.setString(1,user);
				rs1=stmt.executeQuery();
				//System.out.println(rs1.next());
				//System.out.println(rs1.getString("EXAM"));
				String i="";
				while(rs1.next()){
					//System.out.println("hi"+rs1.getInt("S_No"));
					i=String.valueOf(rs1.getInt("S_No"));
					if(e1.contains(i))
					{//System.out.println(rs1.getString("exam"));
						s1.add(rs1.getString("exam"));
					}
				}
				con.close();
				System.out.println("Fetched List: "+s1);
				return s1;
			}
		
		
		}
		catch (SQLException  e) {
			try {
				
				//System.out.print(e);
				if (flag) {
					throw new CustomException("LOGS");
				} else {
					con.close();
					throw new CustomException("SQL");
				}
				
			} catch (SQLException e3) {
				//System.out.println("con fail");
				throw new CustomException("SQL");
			}
			
	}
	}
	
	
	
	
	public List<Entry<String,String>> QAList(String exam) throws CustomException {
		DBConnection db=new DBConnection();
		Connection con=db.getConnection();
		PreparedStatement stmt=null;
		boolean flag=false;
		ResultSet  rs=null;
		//HashMap<String,String> s1=new HashMap<String,String>();
		
		//HashMap<String,ArrayList<String>> s2=new HashMap<String,ArrayList<String>>();
	
		
		Map<String, String> s1 = new LinkedHashMap<String, String>();
		
		
		System.out.println("QAList: "+exam);
			try {
				stmt=con.prepareStatement("select * from khem.QAList where examlist=?");
				stmt.setString(1,exam);
				rs=stmt.executeQuery();
				if (!rs.next()) {
					flag=true;
					con.close();
					throw new CustomException("LOGS");
				}
				else
				{	int i=1;
					
					do{String e1=rs.getString("QUESTION");
					//System.out.println("Question fetched: "+e1);
					s1.put(e1, "-1");
					//System.out.println(i++);
					}while(rs.next());
					//IndList.add(1,s1.put(e1, "-1"));
					con.close();
					//System.out.println(IndList);
					List<Entry<String, String>> IndList = new ArrayList<Map.Entry<String, String>>(s1.entrySet());
					return IndList;
				}
				
			}
			catch (SQLException  e) {
			try {
				System.out.println(e);
				if (flag) {
					throw new CustomException("LOGS");
				} else {
					con.close();
					throw new CustomException("SQL");
				}
				
			} catch (SQLException e3) {
				throw new CustomException("SQL");
				}
		}
	}
}
