<html>
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
footer {
    padding: 1em;
    color: white;
    background-color: STEELBLUE;
    clear: bottom;
    text-align: center;
    margin:280px 0 0 0;
}
.loader {
  border: 10px solid #f3f3f3;
  border-radius: 50%;
  border-top: 10px solid #3498db;
  width: 120px;
  height: 120px;
  margin-left:46px
  -webkit-animation: spin 20s linear infinite;
  animation: spin 20s linear infinite;
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
<title>Login</title>
</head>

<body>

<form action="login" method="POST">
 <header><h1 style="text-align: center;">Login Questions Web Access Portal!</h1></header>
<p>
<p>&nbsp;</p>


<p style="margin-left:46px">Username: &nbsp;<input name="user" type="text" value="" />
<p style="margin-left:46px">Password: &nbsp; <input name="pass" type="password" value="" />

 <br>
 <p><input type="submit"  value="Submit" style="margin-left:150px">
</form>
</body>
<footer>Made by Khemankar</footer>
</html>