<%@page import="cn.easybuy.entity.Buycar"%>
<%@page import="cn.easybuy.service.impl.BuycarServiceImpl"%>
<%@page import="cn.easybuy.service.BuycarService"%>
<%@page import="cn.easybuy.entity.User"%>
<%@page import="cn.easybuy.entity.Favourite"%>
<%@page import="cn.easybuy.service.FavouriteService"%>
<%@page import="cn.easybuy.service.impl.FavouriteServiceImpl"%>
<%@page import="cn.easybuy.util.Page"%>
<%@page import="java.sql.SQLException"%>
<%@page import="cn.easybuy.entity.Product"%>
<%@page import="cn.easybuy.service.impl.ProductServiceImpl"%>
<%@page import="cn.easybuy.service.ProductService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>
<!DOCTYPE html>
<html>
<head lang="en">

<meta charset="UTF-8">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>statics/css/style.css" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>商品收藏页面</title>
</head>
<body>

	<!--网页头部-->
	<header> 
	<%@ include file="../common/head.jsp"%></header>
	<!--网页主体内容-->
	<section class="center">
		<!--Begin Menu Begin-->
		<div class="menu_bg">
			<div class="menu">
				<!--Begin 商品收藏页面 Begin-->
				<nav class="nav">
					<div class="nav_t">商品收藏页面</div>
				</nav>

				<!--End 商品收藏页面 End-->
				<nav>
					
				</nav>
				<a href="#" class="m_ad"><img src="images/phone.png" alt="" />
				</a>
			</div>
		</div>
		<!--End Menu End-->
		<div class="i_bg">
			<div class="postion">
				<span class="fl"><strong></strong> </span>
			</div>
			<!--Begin 筛选条件 Begin-->
			<div class="content "></div>
			<!--End 筛选条件 End-->

			<div class="content ">
				<div class="l_list">
					<div class="list_c">


						<!-- ---------------------------------------------------------------------------------------------- -->



						<!-- 商品内容显示区 -->

						<ul class="cate_list" id="productShowArea">
							<%
							user=(User)session.getAttribute("user");
										 int userId = user.getId();
										FavouriteService favouriteService=new FavouriteServiceImpl();
										List <Favourite>favouriteList=favouriteService.findFavouriteByUserId(userId);
										pageContext.setAttribute("favouriteList",favouriteList );
										ProductService productService = new ProductServiceImpl();
										
										
										
										Product product=null;
										for(Favourite favourite: favouriteList){
										    product=new Product();//new 出新的 product 对象
											product=productService.findProductByid(favourite.getProductId());
											
										
										
										
						%>


							<li class="list_con">
								<div class="list_img">
									<a href="<%=basePath%>pre/productdetail.jsp?productid=<%=product.getId()%>"><img
										src="<%=basePath%>statics/images/<%=product.getFileName()%>"
										alt=""> </a>
								</div>
								<div class="list_text">
									<a href="<%=basePath%>pre/productdetail.jsp?productid=<%=product.getId()%>"><%=product.getName()%></a>
								</div>
								<div>
									<a class="price">￥<%=product.getPrice()%></a>
								</div>
								<div>
									<a href="javascript:;" class="delete"
										favouriteid="<%=favourite.getId() %>">取消收藏</a>
								</div>
							</li>


							<%
							}
							 %>


						</ul>


						<!-- ---------------------------------------------------------------------------------------------- -->

					</div>
				</div>
			</div>
		</div>
	</section>
	<%
		
	
	
	 %>
	<!--网页底部-->
	<footer class="center">
		<!-- Footer -->
		<div class="b_btm_bg b_btm_c">
			<ul class="b_btm">
				<li><a><img src="<%=basePath%>statics/images/b1.png"
						width="62" height="62" /> </a>
					<div>
						<h2>正品保障</h2>
						正品行货 放心购买
					</div></li>
				<li><a><img src="<%=basePath%>statics/images/b2.png"
						width="62" height="62" /> </a>
					<div>
						<h2>满38包邮</h2>
						满38包邮 免运费
					</div></li>
				<li><a><img src="<%=basePath%>statics/images/b3.png"
						width="62" height="62" /> </a>
					<div>
						<h2>天天低价</h2>
						天天低价 畅选无忧
					</div></li>
				<li><a><img src="<%=basePath%>statics/images/b4.png"
						width="62" height="62" /> </a>
					<div>
						<h2>准时送达</h2>
						收货时间由你做主
					</div></li>
			</ul>
		</div>
		<div class="b_nav">
			<dl>
				<dt>
					<a href="#">新手上路</a>
				</dt>
				<dd>
					<a href="#">售后流程</a>
				</dd>
				<dd>
					<a href="#">购物流程</a>
				</dd>
				<dd>
					<a href="#">订购方式</a>
				</dd>
				<dd>
					<a href="#">隐私声明</a>
				</dd>
				<dd>
					<a href="#">推荐分享说明</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">配送与支付</a>
				</dt>
				<dd>
					<a href="#">货到付款区域</a>
				</dd>
				<dd>
					<a href="#">配送支付查询</a>
				</dd>
				<dd>
					<a href="#">支付方式说明</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">会员中心</a>
				</dt>
				<dd>
					<a href="#">资金管理</a>
				</dd>
				<dd>
					<a href="#">我的收藏</a>
				</dd>
				<dd>
					<a href="#">我的订单</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">服务保证</a>
				</dt>
				<dd>
					<a href="#">退换货原则</a>
				</dd>
				<dd>
					<a href="#">售后服务保证</a>
				</dd>
				<dd>
					<a href="#">产品质量保证</a>
				</dd>
			</dl>
			<dl>
				<dt>
					<a href="#">联系我们</a>
				</dt>
				<dd>
					<a href="#">网站故障报告</a>
				</dd>
				<dd>
					<a href="#">购物咨询</a>
				</dd>
				<dd>
					<a href="#">投诉与建议</a>
				</dd>
			</dl>
			<div class="b_tel_bg">
				<a href="#" class="b_sh1">新浪微博</a> <a href="#" class="b_sh2">腾讯微博</a>

				<p>
					服务热线：<br /> <span>400-123-4567</span>
				</p>
			</div>
			<div class="b_er">
				<div class="b_er_c">
					<img src="<%=basePath%>statics/images/er.gif" />
				</div>
				<img src="<%=basePath%>statics/images/ss.png" />
			</div>
		</div>
		<div class="btmbg">
			<div class="btm">
				备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright© 1号店网上超市
				2007-2016，All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
				<img src="<%=basePath%>statics/images/b_1.gif" /> <img
					src="<%=basePath%>statics/images/b_2.gif" /> <img
					src="<%=basePath%>statics/images/b_3.gif" /> <img
					src="images/b_4.gif" /> <img
					src="<%=basePath%>statics/images/b_5.gif" /> <img
					src="<%=basePath%>statics/images/b_6.gif" />
			</div>
		</div>
		<!--Footer -->
	</footer>
	<script src="<%=basePath%>statics/js/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>statics/js/CategoryList.js"></script>
	<script src="<%=basePath%>statics/js/public.js"></script>
	<script type="text/javascript">
							$("body").on("click",".delete",function(){
									var favouriteid=$(this).attr("favouriteid");
									
									$.getJSON("FavouriteServlet",
									"opr=delfavourite&"+"favouriteid=" + favouriteid,
									callbackDelFavourite);
									function  callbackDelFavourite(datas){
										location.reload();
										
									}
									
							
								});
						</script>

</body>

</html>

