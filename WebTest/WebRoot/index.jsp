<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
#loginDiv {
	width: 30%;
	margin: 50px auto;
}


</style>
<script type="text/javascript">
/* window.onbeforeunload = function(){
return "quit?";
}; */
   window.onbeforeunload = onbeforeunload_handler;  
    window.onunload = onunload_handler;  
    function onbeforeunload_handler(){  
        var warning="确认退出?";          
        return warning;  
    }  
      
    function onunload_handler(){  
        var warning="谢谢光临";  
        alert(warning);  
    } 

</script> 
</head>

<body>
	<span>===#</span>
	<a href="login.jsp">=====================登录===============</a>
	<!-- <a href="doOpr.jsp">===测试请求===</a> -->
	hello jsp!!!
	<!-- hello jsp!!!1111 -->
	<%--hello jsp!!!22222 --%>
	
	<div class="btn-group">
		<button type="button" class="btn btn-default dropdown-toggle"
			data-toggle="dropdown">
			Action <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<li><a href="#">Action</a>
			</li>
			<li><a href="#">Another action</a>
			</li>
			<li><a href="#">Something else here</a>
			</li>
			<li class="divider"></li>
			<li><a href="#">Separated link</a>
			</li>
		</ul>
	</div>
	<%!public int add(int a) {
		return ++a;
	}%>

	<%
		int num = 100;
		num++;
		num = add(num);
		System.out.print("========================" + num);
	%>
	<%=num%>

	<%-- <table>
		<%
            for(int i=0;i<100;i++){
         %>
		<tr>
			<td><%=(int)(Math.random()*1000) %></td>
			<td><%=(int)(Math.random()*1000) %></td>
			<td><%=(int)(Math.random()*1000) %></td>
		</tr>

		<%   
            }
          %>
	</table> --%>
</body>
</html>
