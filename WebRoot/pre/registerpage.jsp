<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>



<!DOCTYPE HTML>
<html>
<head lang="en">
<meta charset="UTF-8">

<title>用户注册页面</title>

<link rel="stylesheet" href="<%=basePath%>statics/css/base.css">
<link rel="stylesheet" href="<%=basePath%>statics/css/register.css">
</head>

<body>
	<header id="headNav">
		<div class="innerNav cf">
			<a class="fl" href="#"><img
				src="<%=basePath%>statics/images/loginlogo.jpg" alt=""> </a>
			<div class="headFont fr">
				<span>您好，欢迎光临1号店！<a href="loginpage.jsp">请登录</a> </span> <a
					class="helpLink" href="#"><i class="runbun"></i>帮助中心<i
					class="turnb"></i> </a>
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
	<section id="secTab">
		<form action="<%=basePath%>UserServlet?opr=register" method="post"
			id="registerForm">
			<div class="innerTab">
				<h2>1号店注册</h2>
				<div>真实姓名</div>
				<div class="tableItem">
					<input type="text" name="tname" id="tname" required
						placeholder="真实姓名" />
				</div>
				<font color="#c00fff">*</font>
				<div id="tnameDiv" style="display: inline; color:red"></div>
				<div>用户名</div>
				<div class="tableItem">
					<input type="text" name="name" id="name" required placeholder="用户名" />
				</div>
				<font color="#c00fff">*</font>
				<div id="nameDiv" style="display: inline; color:red"></div>
				<div>设置密码(10---16数字和字母！)</div>
				<div class="tableItem">
					<input type="password" name="password" id="password1"
						class="password" required placeholder="设置密码" pattern="^\w{10,16}$"
						maxlength="16" />
				</div>
				<div>确认密码(10---16数字和字母！)</div>
				<div class="tableItem">
					<input type="password" name="password" required placeholder="确认密码"
						id="password2" pattern="^\w{10,16}$" class="password"
						maxlength="16" />
				</div>
				<font color="#c00fff">*</font>
				<div id="passwordDiv" style="display: inline; color:red"></div>

				<br>

				<form>
					<font color="#c00fff">*</font> 性别： <label for="male">男</label> <input
						type="radio" name="gender" value="1" checked="checked" /> <label
						for="female">女</label> <input type="radio" name="gender" value="0" />
				</form>
				<div>身份证</div>
				<div class="tableItem">
					<input name="ID" type="text" id='card_no' class="card"
						required placeholder="身份证" onBlur="javascript:checktheform()" />
				</div>
				<font color="#c00fff">*</font>
				<div id="IDDiv" style="display: inline; color:red"></div>
				<div>电子邮箱</div>
				<div class="tableItem">
					<input type="text" name="email" id="email" required
						placeholder="电子邮箱" />
				</div>
				<font color="#c00fff">*</font>
				<div id="emailDiv" style="display: inline; color:red"></div>
				<div>手机号码</div>
				<div class="tableItem">
					<input type="text" name="phone" id="phone" required
						placeholder="手机号码"  maxlength="11" />
				</div>
				<font color="#c00fff">*</font>
				<div id="phoneDiv" style="display: inline; color:red"></div>
				

				<p class="clickRegist">
					点击注册，表示您同意1号店 <a href="#">《服务协议》</a>
				</p>
				<input type="submit" class="tableBtn" id="submit" value="同意协议并注册">
			</div>
		</form>
	</section>
	<footer id="footNav">
		<p>
			<a href="#">沪ICP备13044278号</a>|&nbsp;&nbsp;合字B1.B2-20130004&nbsp;&nbsp;|<a
				href="#">营业执照</a>
		</p>
		<p>Copyright © 1号店网上超市 2007-2016，All Rights Reserved</p>
	</footer>
</body>
<script src="<%=basePath%>statics/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath%>statics/js/register.js"></script>


</html>