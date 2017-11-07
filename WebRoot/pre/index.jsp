<%@page import="cn.easybuy.service.impl.NewsServiceImpl"%>
<%@page import="cn.easybuy.service.NewsService"%>
<%@page import="cn.easybuy.entity.ProductCategory"%>
<%@page import="cn.easybuy.service.impl.ProductCategoryServiceImpl"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<METAHTTP-EQUIV="Pragma"CONTENT="no-cache">

<METAHTTP-EQUIV="Cache-Control"CONTENT="no-cache">

<METAHTTP-EQUIV="Expires"CONTENT="0">
<title>欢迎来到易买</title>
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>statics/css/style.css" />



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<title>一号店</title>
</head>
<%
	request.setCharacterEncoding("UTF-8");
	NewsService newsService = new NewsServiceImpl();
	List newslist = newsService.getAllnews();
	request.setAttribute("newslist", newslist);
%>
<body>
	<!--网页头部-->
	<header>

		<%@ include file="../common/head.jsp"%>


		
			<%-- <div class="i_car">
				<div class="car_t">我是假购物车</div>
				<div class="last">
					<div class="noshop">
						<img src="images/icon_tips2.png" alt="" />
						<h3>你的1号店购物车还是空的</h3>
					</div>
					<div class="shop">
						<ul>
							<li>
								<h4>
									1号店满199减100 <span class="J_count">共1件商品</span>
								</h4>
								<div class="clear">
									<div class="shopImg">
										<img src="<%=basePath%>statics/images/shop1.png" alt="" />
									</div>
									<div class="shopText">
										<div class="clear">
											<h5>宝贝许愿坊 童装女装套装</h5>
											<a href="#" class="close J_btnDelete">X</a>
										</div>
										<p>深蓝 140码</p>
										<div class="clear">
											<div class="plush">
												<span class="J_btnDelCount">-</span> <input
													class="J_inputCount" type="text" value="1" /> <span
													class="J_btnAddCount">+</span>
											</div>
											<strong class="J_smallTotalPrice">￥190</strong>
										</div>
									</div>
								</div>
								<p>参加一项促销，节约成本￥100</p>
							</li>
							<li>
								<h4>
									1号店 <span class="J_count">共1件商品</span>
								</h4>
								<div class="clear">
									<div class="shopImg">
										<img src="<%=basePath%>statics/images/shop2.png" alt="" />
									</div>
									<div class="shopText">
										<div class="clear">
											<h5>亨氏 乐维滋清乐2+2果汁</h5>
											<a href="#" class="close J_btnDelete">X</a>
										</div>
										<p>草莓山楂枸杞</p>
										<div class="clear">
											<div class="plush">
												<span class="J_btnDelCount">-</span> <input
													class="J_inputCount" type="text" value="1" /> <span
													class="J_btnAddCount">+</span>
											</div>
											<strong class="J_smallTotalPrice">￥5.8</strong>
										</div>
									</div>
								</div>
							</li>
							<li>
								<h4>
									珠韵首饰旗舰店 <span class="J_count">共1件商品</span>
								</h4>
								<div class="clear">
									<div class="shopImg">
										<img src="<%=basePath%>statics/images/shop3.png" alt="" />
									</div>
									<div class="shopText">
										<div class="clear">
											<h5>珠韵首饰 大粒径 9.5-10.5mm近圆白色淡水珍珠项链 送妈妈白色45CM</h5>
											<a href="#" class="close J_btnDelete">X</a>
										</div>
										<p>淡水白色近圆珍珠</p>
										<div class="clear">
											<div class="plush">
												<span class="J_btnDelCount">-</span> <input
													class="J_inputCount" type="text" value="1" /> <span
													class="J_btnAddCount">+</span>
											</div>
											<strong class="J_smallTotalPrice">¥758 </strong>
										</div>
									</div>
								</div>
								<p>全场包邮</p>
							</li>
						</ul>
						<div class="option">
							<a href="#">意见反馈</a>
						</div>
						<div class="buy">
							<p>
								合计 <span class="J_totalPrice">￥300.8</span>
							</p>
							<a href="#">立即结算 <span class="J_totalCount">(3)</span> </a>
						</div>
					</div>
				</div>
			</div>
		</div> --%>
	</header>
	<!--网页主题部分-->

	


	<section class="center clear">
		<!--商品列表、焦点图-->
		<div class="clear">
			<div class="menu_bg">
				<div class="menu">
					<!--Begin 商品分类详情 Begin-->
					<nav class="nav">
						<div class="nav_t">全部商品分类</div>
						<div class="leftNav">
							<!--左边购物列表导航-->
							<ul>

								<%
									/*一二三级分类按钮 的显示     尹晓晨*/
									List<ProductCategory> firstCategoryList = new ProductCategoryServiceImpl()
											.getProductCategoryBytype(1);//获取所有一级分类的集合
									/* out.print(firstCategoryList.get(2).getName()) */;

									for (ProductCategory productCategory1 : firstCategoryList) {
								%>
								<li>

									<div class="fj">
										<span class="n_img"><span></span><img
											src="images/nav1.png" /> </span> <span class="fl"> <a
											style="color:orange" href="<%=basePath%>pre/categorylist.jsp?type1=1&type2=<%=productCategory1.getId()%>"><%=productCategory1.getName()%></a>
											<!--一级分类展示 --> </span>
									</div> <!--目前不显示，鼠标移入显示-->
									<div class="zj">
										<div class="zj_l">
											<%
												List<ProductCategory> secondCategoryList = new ProductCategoryServiceImpl()
															.getAllProductCategory(productCategory1.getId());
													for (ProductCategory productCategory2 : secondCategoryList) {
											%>
											<div class="zj_l_c">

												<h2>
													<a style="color:black" href="<%=basePath%>pre/categorylist.jsp?type1=2&type2=<%=productCategory2.getId()%>"><%=productCategory2.getName()%></a>
													<!-- 二级分类展示 -->
												</h2>

												<%
													List<ProductCategory> thirdCategoryList = new ProductCategoryServiceImpl()
																	.getAllProductCategory(productCategory2.getId());
															for (ProductCategory productCategory3 : thirdCategoryList) {
												%>

												<a href="<%=basePath%>pre/categorylist.jsp?type1=3&type2=<%=productCategory3.getId()%>"><%=productCategory3.getName()%></a>|
												<!-- 三级分类展示 -->

												<%
													}
															;
												%>

											</div>

											<%
												}
													;
											%>


										</div>
										<div class="zj_r">
											<a href="#"><img
												src="<%=basePath%>statics/images/n_img1.jpg" width="236"
												height="200" /> </a> <a href="#"><img
												src="<%=basePath%>statics/images/n_img2.jpg" width="236"
												height="200" /> </a>
										</div>
									</div>
								</li>

								<%
									}
									;
								%>











							</ul>
						</div>
					</nav>




					<!--End 商品分类详情 End-->
					<nav>
						
					</nav>
					<a href="#" class="m_ad"><img
						src="<%=basePath%>statics/images/phone.png" alt="" /> </a>
				</div>
			</div>
			<!--焦点图-->
			<div class="banner">
				<div class="top_slide_wrap">
					<ul class="slide_box ">
						<li class="active"><img
							src="<%=basePath%>statics/images/ban1.jpg" width="700"
							height="401" /></li>
						<li><img src="<%=basePath%>statics/images/ban1.jpg"
							width="700" height="401" /></li>
						<li><img src="<%=basePath%>statics/images/ban1.jpg"
							width="700" height="401" /></li>
					</ul>
					<ul class="num">
						<li class="active"><a href="#">1</a></li>
						<li class=""><a href="#">2</a></li>
						<li><a href="#">3</a></li>
					</ul>
					<!--<div class="op_btns">-->
					<!--<a href="#" class="op_btn op_prev"></a>-->
					<!--<a href="#" class="op_btn op_next"></a>-->
					<!--</div>-->
				</div>
			</div>
			<!--新闻列表-->
			<div class="inews">
				<div class="news_t">
					<h3 class="fl">快讯</h3>
					<span class="fr"><a href="#">更多 ></a> </span>
				</div>
				<!--资讯-->
				<ul id="express">
					<c:forEach items="${newslist}" var="News">
					
						<li><a href="#">${News.title}</a></li>

					</c:forEach>
				</ul>
				<div class="charge_t">
					<h3>话费充值</h3>
					<p>号码<input type="text" name="phoneno"  maxlength="11"/></p>
					<br>
					<form action="" method="post" class="money">
						面值
						<select name="bmon">
							<option value="">100元</option>
							<option value="1">50元</option>
							<option value="2">20元</option>
							<option value="3">200元</option>
							<option value="4">300元</option>
							<option value="5">80元</option>
							<option value="6">1000元</option>
						</select>	
					</form>
					<br>
					<button class="button border-red-light">
								立即充值</button>
								
					<img src="images/oneAD.jpg" alt="" />
				</div>
			</div>
		</div>

		<!--Begin 热门商品 Begin-->
		<%-- <div class="content clear ">
			<div class="hot">
				<div class="img">
					<img src="<%=basePath%>statics/images/l_img.jpg" width="188"
						height="188" />
				</div>
				<div class="pri_bg">
					<span class="price fl">￥53.00</span> <span class="fr">16R</span>
				</div>
			</div>
			<div class="hot_pro">
				<div id="feature">
					<ul class="featureUL">
						<li class="featureBox">
							<div class="h_icon">
								<img src="<%=basePath%>statics/images/hot.png" width="50"
									height="50" />
							</div>
							<div class="imgbg">
								<a href="#"><img src="<%=basePath%>statics/images/hot1.jpg"
									width="160" height="136" /> </a>
							</div>
							<div class="name">
								<a href="#">
									<h2>德国进口</h2> 德亚全脂纯牛奶200ml*48盒 </a>
							</div>
							<div class="price">
								<strong>￥<span>189</span> </strong> &nbsp; 26R
							</div>
						</li>
						<li class="featureBox">
							<div class="h_icon">
								<img src="<%=basePath%>statics/images/hot.png" width="50"
									height="50" />
							</div>
							<div class="imgbg">
								<a href="#"><img src="<%=basePath%>statics/images/hot2.jpg"
									width="160" height="136" /> </a>
							</div>
							<div class="name">
								<a href="#">
									<h2>iphone 6S</h2> Apple/苹果 iPhone 6s Plus公开版 </a>
							</div>
							<div class="price">
								<strong>￥<span>5288</span> </strong> &nbsp; 25R
							</div>
						</li>
						<li class="featureBox">
							<div class="h_icon">
								<img src="<%=basePath%>statics/images/hot.png" width="50"
									height="50" />
							</div>
							<div class="imgbg">
								<a href="#"><img src="<%=basePath%>statics/images/hot3.jpg"
									width="160" height="136" /> </a>
							</div>
							<div class="name">
								<a href="#">
									<h2>倩碧特惠组合套装</h2> 倩碧补水组合套装8折促销 </a>
							</div>
							<div class="price">
								<strong>￥<span>368</span> </strong> &nbsp; 18R
							</div>
						</li>
						<li class="featureBox">
							<div class="h_icon">
								<img src="<%=basePath%>statics/images/hot.png" width="50"
									height="50" />
							</div>
							<div class="imgbg">
								<a href="#"><img src="<%=basePath%>statics/images/hot4.jpg"
									width="160" height="136" /> </a>
							</div>
							<div class="name">
								<a href="#">
									<h2>品利特级橄榄油</h2> 750ml*4瓶装组合 西班牙原装进口 </a>
							</div>
							<div class="price">
								<strong>￥<span>280</span> </strong> &nbsp; 30R
							</div>
						</li>
					</ul>
					<a class="h_prev" href="#">Previous</a> <a class="h_next" href="#">Next</a>
				</div>
			</div>
		</div>
 --%>
		<!--广告-->
		<div class="content">
			<img src="images/mban_2.jpg" />
		</div>

		<!--Begin 进口 生鲜 Begin-->
		<section class="content clear">
			<div class="floorTitle ">
				<span class="floor_num">1F</span> <span class="fl">进口 <b>·</b>
					生鲜</span>
				<!-- <div class="i_mores fr">
					<a href="#">进口咖啡</a> <a href="#">进口酒</a> <a href="#">进口母婴</a> <a
						href="#">新鲜蔬菜</a> <a href="#">新鲜水果</a>
				</div> -->
			</div>
			<div class="main">
				<div class="fresh_left">
					<div class="fre_ban">
						<div id="imgPlay1">
							<ul class="imgs" id="actor1">
								<li><a href="javascript:;"><img
										src="<%=basePath%>statics/images/fre_r.jpg" width="211"
										height="286" /> </a></li>
							</ul>
						<!-- 	<div class="prevf">上一张</div>
							<div class="nextf">下一张</div> -->
						</div>
					</div>
					<div class="fresh_txt">
						<div class="fresh_txt_c">
							<h2>热门商品点击查看——————>>> </h2>
						</div>
					</div>
				</div>
				<div class="fresh_mid">
					<ul id="showfresh">

					</ul>
				</div>
				<div class="fresh_right">
					<ul>
						<li><a href="javascript:;"><h2 style="position:relative;top:100px;"> <<<< 热门商品点击查看 </h2> </a></li>
						<li><a href="javascript:;"><h2 style="position:relative;top:100px;"> <<<< 热门商品点击查看 </h2> </a></li>
					</ul>
				</div>
			</div>
		</section>
		<!--End 进口 生鲜 End-->

		

		<div class="content">
			<img src="<%=basePath%>statics/images/mban_2.jpg" width="1200"
				height="110" />
		</div>

		


	</section>
	<!--网页底部-->
	<footer class="center">
		<!-- Footer -->
		<div class="b_btm_bg b_btm_c">
			<ul class="b_btm">
				<li><a><img src="statics/images/b1.png" width="62"
						height="62" /> </a>
					<div>
						<h2>正品保障</h2>
						正品行货 放心购买
					</div>
				</li>
				<li><a><img src="statics/images/b2.png" width="62"
						height="62" /> </a>
					<div>
						<h2>满38包邮</h2>
						满38包邮 免运费
					</div>
				</li>
				<li><a><img src="statics/images/b3.png" width="62"
						height="62" /> </a>
					<div>
						<h2>天天低价</h2>
						天天低价 畅选无忧
					</div>
				</li>
				<li><a><img src="statics/images/b4.png" width="62"
						height="62" /> </a>
					<div>
						<h2>准时送达</h2>
						收货时间由你做主
					</div>
				</li>
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
					<img src="statics/images/er.gif" />
				</div>
				<img src="statics/images/ss.png" />
			</div>
		</div>
		<div class="btmbg">
			<div class="btm">
				备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright© 1号店网上超市
				2007-2016，All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
				<img src="statics/images/b_1.gif" /> <img
					src="statics/images/b_2.gif" /> <img src="statics/images/b_3.gif" />
				<img src="statics/images/b_4.gif" /> <img
					src="statics/images/b_5.gif" /> <img src="statics/images/b_6.gif" />
			</div>
		</div>
		<!--Footer -->
	</footer>
<script src="statics/js/jquery-1.11.1.min.js"></script>
<script src="statics/js/index.js"></script>
<script src="statics/js/public.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		function initMostNew(){
		  $("#showfresh").load("/easyBuy/ProductServlet","opr=loadmostnew&type=1&id=14");
		}
		initMostNew();
	
	});
</script>
</body>


</html>