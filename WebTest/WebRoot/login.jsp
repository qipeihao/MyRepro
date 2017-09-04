<%@page import="yh.util.DBUtil2"%>
<%@page import="java.net.URLDecoder"%>
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
<base href="<%=basePath%>" target="">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/iconfont.css" type="text/css"></link>
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<style type="text/css">
#loginDiv {
	width: 30%;
	margin: 50px auto;
}

#bar {
	width: 10%;
	margin: 50px auto;
}

li.list-group-item {
	padding: 10px 0;
}

span.li {
	margin-left: 20px;
}

span.l2 {
	margin-left: 25px;
}

ul {
	padding: 0px 0px 0px 8px;
}
</style>
<script type="text/javascript">
    $(function(){
        var uname;
        var pwd;
        //获取cookie信息
        var cookieStr = document.cookie;
        //alert(cookieStr);
        var cookieArr = cookieStr.split(";");
        for(var i=0;i<cookieArr.length;i++){
            //alert(cookieArr[i]);
            var cookieItemArr = cookieArr[i].split("=");
            //alert("key:"+cookieItemArr[0]+",value:"+cookieItemArr[1]);
            if(cookieItemArr[0].trim()=="userName"){
                //alert("用户名:"+URLDecoder.decode(cookieItemArr[1],"UTF-8"));
                $("#ck").attr("checked",true);
                uname= cookieItemArr[1];
                $("#uname").val(decodeURIComponent(uname) );
            }
            if(cookieItemArr[0].trim()=="pwd"){
                //alert("用户名:"+URLDecoder.decode(cookieItemArr[1],"UTF-8"));
                pwd= cookieItemArr[1];
                  $("#pwd").val(pwd);
            }
        }
     }); 
</script>
</head>

<body>
 <%
     DBUtil2 db = new DBUtil2();
     db.testJndi();
  %>
<!-- <i class="icon iconfont icon-weibiaoti4"></i> -->
	<%-- <%
       String uname="";
       String pwd="";
       Cookie[] cookieArr = request.getCookies();
       if(cookieArr!=null && cookieArr.length>0){
           for(int i=0;i<cookieArr.length;i++){
               Cookie c = cookieArr[i];
               if(c.getName().equals("userName")){
                   uname=URLDecoder.decode(c.getValue(), "UTF-8");
               }
               if(c.getName().equals("pwd")){
                   pwd=URLDecoder.decode(c.getValue(), "UTF-8");
               }
           }
       }
     %>
	<br>
	<%=uname %>@@@
	<button type="button" class="btn btn-default btn-lg">
		<span class="glyphicon glyphicon-cog"></span> Star
	</button> --%>
	<!-- <input type="button" value="按钮" class="btn btn-primary"> -->
	<div id="loginDiv">
		<form class="form-horizontal" role="form" action="doLogin.jsp"
			method="post">
			<div class="form-group">
				<label for="inputEmail3" class="col-sm-2 control-label">用户名:</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" name="uname" id="uname"
						  placeholder="请输入用户名">
				</div>
			</div>
			<div class="form-group">
				<label for="inputPassword3" class="col-sm-2 control-label">密码:</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="pwd"
						name="pwd"   placeholder="请输入密码">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> <input type="checkbox" id="ck" name="isRemeber"
							value="1"> 记住 </label>
					</div>
					<div class="register" style="float: right;">
						<a href="register.jsp">没有账号，立即注册</a>
					</div>
				</div>
			</div>
			<div class="form-group" style="text-align: center;">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="登 录 ">
				</div>
			</div>

		</form>
		<%
		    if(request.getAttribute("message")!=null){
		 %>
		###<%=request.getAttribute("message") %>###

		<%
		   }
		 %>
	</div>
	<img alt="" src="images/pic102.jpg" class="img-circle">
	<%-- <table border="1" class="table  table-condensed">
		<%
            for(int i=0;i<100;i++){
         %>
		<tr class="info">
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
