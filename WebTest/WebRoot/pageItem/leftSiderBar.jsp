<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%-- <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%> --%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%-- <base href="<%=basePath%>"> --%>

<title>My JSP 'leftSiderBar.jsp' starting page</title>

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
#menu {
	width: 200px;
}
li.list-group-item{
   padding-left: 0px;
   padding-right: 0px;
}

ul.list-group{
   margin-top: 16px;
   margin-bottom: 0px;
}
span.lev1{
   margin-left: 10px;
   margin-right: 10px;
}
span.lev2{
    margin-left: 25px;
    margin-right: 10px;
}
.close{
    display: none;
}
.open{
    display: block;
}
</style>
<script type="text/javascript">
   $(function(){
      $("li").click(function(){
          //alert($(this).children().last().attr("class"));
          if($(this).children().last().attr("class")=="list-group close"){
             //alert("1111");
             $(this).children().last().attr("class","list-group open");
          }else if($(this).children().last().attr("class")=="list-group open"){
              // alert("222");
              $(this).children().last().attr("class","list-group close");
          }
      });
       $("li > ul").click(function(event){
           event.stopPropagation();
       });
   });
</script>
</head>

<body>
	<div id="menu">
		<ul class="list-group">
			<li class="list-group-item" ><span class="glyphicon glyphicon-cog lev1"></span><a >个人中心</a>
			    <ul class="list-group close">
					<li class="list-group-item"><span class="glyphicon glyphicon-th lev2"></span><a>账户信息</a></li>
					<li class="list-group-item"><span class="glyphicon glyphicon-signal lev2"></span><a>修改密码</a></li>
					<!-- <li class="list-group-item"><span class="glyphicon glyphicon-tasks lev2" ></span><a href="index.jsp">子菜单三</a></li> -->
				</ul>
			</li>
			<li class="list-group-item"><span class="glyphicon glyphicon-list-alt lev1"></span><a href="doFindAllEmps.jsp">员工管理</a></li>
			<li class="list-group-item"><span class="glyphicon glyphicon-th-list lev1"></span><a>请假管理</a>
			     <ul class="list-group close">
					<li class="list-group-item"><span class="glyphicon glyphicon-th lev2"></span><a>请假申请</a></li>
					<li class="list-group-item"><span class="glyphicon glyphicon-signal lev2"></span><a>个人请假记录</a></li>
					<!-- <li class="list-group-item"><span class="glyphicon glyphicon-tasks lev2" ></span><a href="index.jsp">子菜单三</a></li> -->
				</ul>
			</li>
		</ul>
	</div>
</body>
</html>
