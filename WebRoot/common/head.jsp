<%@page import="java.net.URLDecoder"%>
<%@page import="cn.easybuy.entity.User"%>
<%@page import="cn.easybuy.service.impl.UserServiceImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path1 = request.getContextPath();
	String basePath1 = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path1 + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath1%>">

<title>My JSP 'hand.jsp' starting page</title>
<link type="text/css" rel="stylesheet"
	href="<%=basePath1%>statics/css/style.css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<%
		request.setCharacterEncoding("UTF-8");
		response.setContentType("charset=UTF-8");
		Cookie[] cookies = request.getCookies();
		String name = "";
		String password = "";
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				if (cookies[i].getName().equals("username")) {
					name = URLDecoder.decode(cookies[i].getValue(), "UTF-8");
				} else if (cookies[i].getName().equals("userpassword")) {
					password= URLDecoder
							.decode(cookies[i].getValue(), "UTF-8");

				}

			}

		}
		User user = new UserServiceImpl().userLogin(name, password);
	
		if (user != null) {			
			session.setAttribute("user", user);

		}
	%>
	<div class="soubg">
		<div class="sou fl">
			<div class="s_city_b">
				<span><a href="<%=basePath1%>/pre/index.jsp">商城首页</span>
			</div>
		</div>
		<div class="fr top_right">
			<c:if test="${sessionScope.user==null }">
					你好! 请&nbsp;<a href="<%=basePath1%>pre/loginpage.jsp">登录</a>
				<a href="<%=basePath1%>pre/registerpage.jsp" style="color:#ff4e00;">免费注册</a>
			</c:if>
			<ul class="ss">
				<li class="ss_list">
				</li>
				<!--需要有向下的小箭头就添加ss_listBg-->
				<!-- <li class="ss_list ss_listBg"><a href="#">客户服务</a>

					<div class="ss_list_bg">
						<div class="ss_list_c">
							<ul>
								<li><a href="#">包裹跟踪</a>
								</li>
								<li><a href="#">常见问题</a>
								</li>
								<li><a href="#">在线退款</a>
								</li>
								<li><a href="#">在线投诉</a>
								</li>
								<li><a href="#">配送范围</a>
								</li>
							</ul>
						</div>
					</div></li> -->
				<li class="ss_list"><a href="<%=basePath1%>pre/buycardetail.jsp?opr=loadbuycardetail">
						&nbsp;购物车&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
			</ul>
			<%-- <span class="fl">&nbsp;|&nbsp;关注我们：</span> <span class="s_sh">
				<a href="#" class="sh1">新浪</a> <a href="#" class="sh2">微信</a> </span> <span
				class="fr">|&nbsp; <a href="#">手机版&nbsp; <img
					src="<%=basePath1%>statics/images/s_tel.png" align="absmiddle" />
					&nbsp;</a> --%>
			<c:if test="${sessionScope.user!=null }">
			<a href="pre/orderlist.jsp">我的订单&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a>
			<a href="pre/favouritedetail.jsp">收藏夹&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|</a>
				<a href="#">${sessionScope.user.userName }在线</a>
				<a href="UserServlet?opr=checkout">退出</a>
			</c:if>
			</span>
		</div>
	</div>

	<div class="top">
		<div class="logo">
			<a href="<%=basePath1%>/pre/index.jsp"> <img src="<%=basePath1 %>statics/images/baozou.png" width="100px" />
			</a>
		</div>
		<div class="search">
			<form action="#">
				<input type="search" value="" placeholder="请输入关键字" class="s_ipt" />
				<input type="submit" value="搜索" class="s_btn" onclick="{return false;}"/>
			</form>
			<div class="fl">
				<!-- <a href="#">咖啡</a> <a href="#">iphone 6S</a> <a href="#">新鲜美食</a> <a
						href="#">蛋糕</a> <a href="#">日用品</a> <a href="#">连衣裙</a> -->
			</div>
		</div>
</body>
<script src="<%=basePath1%>statics/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath1%>statics/js/CategoryList.js"></script>
<script src="<%=basePath1%>statics/js/public.js"></script>
</html>
