<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>登录</title>
	<link rel="stylesheet" href="<%=basePath %>statics/css/base.css">
	<link rel="stylesheet" href="<%=basePath %>statics/css/load.css">
</head>
<body>
	<header id="headNav">
		<div class="innerNav cf">
			<a class="fl" href="#"><img src="<%=basePath %>statics/images/loginlogo.jpg" alt=""/></a>
			<div class="headFont fr">
				<span>您好，欢迎光临1号店！<a href="registerpage.jsp">请注册</a></span>
				<a class="helpLink" href="#"><i class="runbun"></i>帮助中心<i class="turnb"></i></a>
			</div>
			<div class="outHelp">
				<ul class="helpYou" style="display: none;">
					<li><a href="#">包裹跟踪</a></li>
					<li><a href="#">常见问题</a></li>
					<li><a href="#">在线退换货</a></li>
					<li><a href="#">在线投诉</a></li>
					<li><a href="#">配送范围</a></li>
				</ul>
			</div>
		</div>
	</header>
	
	
	<section id="secBody">
		<form action="<%=basePath %>UserServlet?opr=login" method="post"id="loadForm">
			<div class="innerBody cf">
				<img class="fl" src="<%=basePath %>statics/images/loadimg.jpg" alt=""/>
				<div class="tableWrap fr">
					<div class="tableTap cf">
						<h3 class="fl">1号店用户登录</h3>
						<a class="fr" href="registerpage.jsp">注册账号</a>
					</div>
					<div class="tableItem">
						<i class="userHead"></i>
						<!--邮箱、以13、15、18开头的电话或者是2~4个汉字-->
						<input type="text" name="userName" placeholder="用户名" required
							   />
					</div>
					<div class="tableItem">
						<i class="userLock"></i>
						<input type="password" name="password" placeholder="密码" required/>
					</div>
					<div class="tableAuto cf">
						<a class="autoMatic fl" href="#"><input name="isRemember" class="loadGiet" value="yes"  type="checkbox"/>自动登录</a>
						<a class="fr" href="#">忘记密码？</a>
					</div>
					<!--<button class="tableBtn">登录</button>-->
					<input type="submit" class="tableBtn" value="登录"id="commentSubmit"/>
					<h2 class="moreWeb">更多合作网站账号登录</h2>
					<div class="outType cf">
						<ul class="loadType cf">
							<li class="fl"><a href="#"></a></li>
							<li class="fl"><a href="#"></a></li>
							<li class="fl"><a href="#"></a></li>
							<li class="fl"><a href="#"></a></li>
							<li class="loadMore fr">更多合作网站<i></i></li>
						</ul>
					</div>
					<ul class="typeWeb cf">
						<li class="fl"><i></i><a href="#">百度</a></li>
						<li class="fl"><i></i><a href="#">百度</a></li>
						<li class="fl"><i></i><a href="#">百度</a></li>
						<li class="fl"><i></i><a href="#">百度</a></li>
						<li class="fl"><i></i><a href="#">百度</a></li>
					</ul>
				</div>
			</div>
		</form>
	</section>
	<footer id="footNav">
		<p><a href="#">沪ICP备13044278号</a>|&nbsp;&nbsp;合字B1.B2-20130004&nbsp;&nbsp;|<a href="#">营业执照</a></p>
		<p>Copyright © 1号店网上超市 2007-2016，All Rights Reserved</p>
	</footer>
</body>
<script src="<%=basePath %>statics/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath %>statics/js/loadpage.js"></script>
</html>
