<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单提交成功页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <h1 style="width:1500px;text-align:center;margin:200px auto">订单提交成功！<span id="secondShow"style="color:red">8</span>秒后转到我的订单页面 。<a style="color:red" href="<%=basePath%>pre/orderlist.jsp">现在就去</a> </h1>
    
    <script type="text/javascript" src="<%=basePath%>statics/js/jquery-1.11.1.min.js"></script> 
    <script type="text/javascript">
    $(function(){
    var second=8;
    var myinterval;
    myinterval=setInterval(function(){
    	second--;
    	$("#secondShow").html(second);
    	if(second==0){
    		location.href="pre/orderlist.jsp";
    		
    	}
    	
    	
    },1000);
    
    
    });
    </script>
    
    
  </body>
</html>
