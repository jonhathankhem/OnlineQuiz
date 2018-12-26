<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="ca" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="cb" %>
 <%@page import="java.util.ArrayList"%>
<%@page import="java.lang.*" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map.Entry" %>
<%@page import="java.util.StringTokenizer" %>
<%@page import="com.vk.controller.QaController"%><html>
<%@page import="javax.swing.ButtonGroup" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>

* {
    box-sizing: border-box;
}

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
.sidenav a {
 	height: 100%;
    width: 0;
   z-index: 1;
    top: 0;
    left: 0;
   overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
   

}

/* Create three unequal columns that floats next to each other */
.column {
    float: left;
    padding: 10px;
}

.column.side { 
	background-color: WHITE;
	border-style: solid;
    border-width: 5px;
    width: 25%;
    height:60%;
}
.column.main {
	background-color: WHITE;
	border-style: solid;
    border-width: 5px;
    width: 75%;
     height:60%;
}

/* Clear floats after the columns */
.row:after {
    content: "";
    display: table;
    clear: both;
}

/* Responsive layout - makes the three columns stack on top of each other instead of next to each other */
@media (max-width: 600px) {
    .column.side, .column.main {
        width: 100%;
    }
}
.footer {
    background-color: STEELBLUE;
    padding: 5px;
    text-align: center;
 
     
}
</style>

<title>Test Page</title>

<link rel="icon" href="<%=request.getContextPath() %>/search.PNG" />
</head>

<body >
 <header><h1 style="text-align: center;"><% out.print(request.getAttribute("Exam"));%></h1></header>
 

<p id="demo"></p>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	  

<p>

<%List<Entry<String, String>> arr = new ArrayList<Map.Entry<String, String>>(); %>
<%arr= (List<Entry<String, String>>) request.getAttribute("Questions");%>
<%int c=1;int a1=30;int a2=5;int x=0;%>

<% Map.Entry<String, String> entry = arr.get(x); %>
 <script type="text/javascript">

	function fetchquestion(a)
	{	x=a;
		document.getElementById("quest").innerHTML=x ;
	
   }
	
	
</script>



<p></p>
<div class="row">
<form action="FetchQA" method="POST">
	<div class="column main" id="quest">
		<%out.print(x); %>
		<h2>Question No. <% out.print(x+1);%></h2>
		<%String[] str=entry.getKey().split("\\?"); %>
		
		<p><%out.print(str[0]); %></p>
		<%String[] opt=str[1].split(";"); %>
	  	<div><INPUT TYPE="radio" name="A" value="A"/><b>A.  </b><%out.print(opt[0]); %></div>
	  	<div><INPUT TYPE="radio" name="B" value="B"/><b>B.  </b><%out.print(opt[1]); %></div>
	  	<div><INPUT TYPE="radio" name="C" value="C"/><b>C.  </b><%out.print(opt[2]); %></div>
	  	<div><INPUT TYPE="radio" name="D" value="D"/><b>D. </b><%out.print(opt[3]); %></div>
	  	
  	</div>

  	
  	  	<div class="column side">
  		<h3>Question List</h3>
		
		
		<table style="height:60%;width:100%;border-style: solid;border-width:1px;" >
		<% for( int i=1; i<=Math.ceil((float)a1/a2); i++) {%>	
 			
 			<tr style="border-style: solid;border-width:1px">
 			
 			<%for(int j=1;j<=a2;j++){ if(c<=a1){%>
 			
			    <td> <button type="button" id="butno<%=c %>" onclick="fetchquestion(<%=c %>)"   style="width:100%;height:100%" value="<%=c %>" ><%=c%></button></td> 
			   <%c++; %>
	    	<%} }%>
 			</tr>
  			
		  	<%} %>
		  
	</table>	
	
<nav aria-label="Page navigation" style="text-align: center;" class="pagination">
<a href=/1>1</a>
<a href=/2>2</a>
<a href=/3>3</a>
<a href=/4>4</a>
<a href=/5>5</a>
 </nav>
  	</div>

	 <div style="left:30%;bottom:100px;position:absolute;">
    <button type="button" onclick="" style="float:left;">Previous</button><div style="float:left;width:10px"></div><button style="float:right;" type="button" onclick="">Next</button>  
	</div> 

	
	
	</form>
</div>


</body>

</html>