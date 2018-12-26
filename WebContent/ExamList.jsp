<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="ca" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cb" %>
 <%@page import="java.util.ArrayList"%>

<%@page import="com.vk.controller.QaController"%><html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
header{
    padding: 1em;
    color: white;
    background-color: STEELBLUE;
    clear: left;
    text-align: center;
   
}
#logdet
{
	
     color: white;
    background-color: STEELBLUE;
    
    
}
.no-js #loader { display: none;  }
.js #loader { display: block; position: absolute; left: 100px; top: 0; }
.se-pre-con {
	position: fixed;
	left: 0px;
	top: 0px;
	width: 100%;
	height: 100%;
	z-index: 9999;
	background: url(Preloader_3.gif) center no-repeat #fff;
}
.images ul li img {
	width: 400px;
	height: 266px;
}
.images ul li {
	display: inline-block;
}
.loader {
  border: 10px solid #f3f3f3;
  border-radius: 50%;
  border-top: 10px solid #3498db;
  width: 120px;
  height: 120px;
  /*margin:auto;*/
  -webkit-animation: spin 1s linear infinite;
  animation: spin 1s linear infinite;
}
@-webkit-keyframes spin {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}
@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

</style>

<title>Exam Menu</title>

<link rel="icon" href="<%=request.getContextPath() %>/search.PNG" />
</head>

<body >
 <header><h1 style="text-align: center;">Login Questions Web Access Portal!</h1></header>
<p>
<p></p>
<form action="FetchQA" method="POST">  
<p style="text-align: center;">Select the Exam:
<select  style="text-align: center;" name="examlist" id="examlist">
	<% ArrayList<String> arl= (ArrayList<String>) request.getAttribute("articles");
	for(String ele:arl){ %>
 	  
 	<option value=<%out.print(ele); %>><%out.print(ele); %></option>
 	<%}%>
  </select></p>
  <p><div style="margin:0 auto;width:120%;text-align:center;overflow:auto;"><input type="submit"  name="submit"  value="Submit"></div></p>
  </form>
</body>

</html>