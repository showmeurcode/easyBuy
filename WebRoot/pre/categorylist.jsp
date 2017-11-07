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
<link rel="stylesheet" type="text/css" href="<%=basePath%>statics/css/pintuer.css">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>statics/css/style.css" />
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<title>商品分类详细表</title>
</head>
<body>
	<!--网页头部-->
	<header>
		<%@ include file="../common/head.jsp"%>
		<!-- 错误提示框内容 -->
	<div id="msg1" class="alert alert-green" hidden>
		</div>
		<div id="msg2" class="alert alert-yellow" hidden>
		</div>
	</header>
	<!--网页主体内容-->
	<section class="center">
		<!--Begin Menu Begin-->
		<div class="menu_bg">
			<div class="menu">
				<!--Begin 商品分类详情 Begin-->
				<nav class="nav">
					<div class="nav_t">商品分类详细页</div>
				</nav>
				<!--End 商品分类详情 End-->
				<nav></nav>
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
<%

String type=request.getParameter("type1");
String id=request.getParameter("type2");

request.setAttribute("type", type);
request.setAttribute("id", id);

 %>


						<!-- ---------------------------------------------------------------------------------------------- -->
<a id="gettype" href="${type}"></a>
<a id="getid" href="${id}"></a>
<a id="getuserid" href="${sessionScope.user.id}"></a>


	
	
	
						<!-- 商品内容显示区 -->
						<ul class="cate_list" id="productShowArea">
					<%-- 		<c:choose>

								<c:when test="${empty pageObj.productList }">
								没有找到此类产品
								</c:when>

								<c:otherwise>
									<c:forEach items="${pageObj.productList }" var="product">
										<li>
											<div class="img">
												<a href="#?productId=${product.id }"><img
													src="<%=basePath%>statics/images/per_1.jpg" width="210"
													height="185" /> </a>
											</div>
											<div class="price">
												<span>${product.price}</span>
											</div>
											<div class="name">
												<a href="#">${product.name }</a>
											</div>
											<div class="carbg">
												<a href="#" class="ss">收藏</a> <a href="#" class="j_car">加入购物车</a>
											</div></li>
									</c:forEach>
								</c:otherwise>

							</c:choose>
 --%>
						</ul>

						<!-- ---------------------------------------------------------------------------------------------- -->

						<!-- 按钮显示区 -->
						<div class="pages" id="pageButtonArea">
							<!-- <a href=""class="p_pre">上一页</a>
								<a href=""class="cur">1</a> 
								<a href="">2</a>
								<a href="">3</a> 
			                 <a	href=""class="p_pre">下一页</a> -->
						</div>




						<!-- ---------------------------------------------------------------------------------------------- -->



					</div>
				</div>
			</div>
		</div>
	</section>
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
					</div>
				</li>
				<li><a><img src="<%=basePath%>statics/images/b2.png"
						width="62" height="62" /> </a>
					<div>
						<h2>满38包邮</h2>
						满38包邮 免运费
					</div>
				</li>
				<li><a><img src="<%=basePath%>statics/images/b3.png"
						width="62" height="62" /> </a>
					<div>
						<h2>天天低价</h2>
						天天低价 畅选无忧
					</div>
				</li>
				<li><a><img src="<%=basePath%>statics/images/b4.png"
						width="62" height="62" /> </a>
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
		$(function() {
			
			var begintype=$("#gettype").attr("href");
			var beginid=$("#getid").attr("href");
			var userid=$("#getuserid").attr("href");
			
			var $pageButtonArea= $("#pageButtonArea");
			var $productShowArea = $("#productShowArea");
			var $msg1 = $("#msg1");
			var $msg2 = $("#msg2");
			
			
			
			
			
			
			
			
			
			
			/* 添加购物车的操作 */
		$productShowArea .on("click",".j_car",function () {
		 
             var   productid= $(this).attr("id");//获取商品id
             
            
            var data="opr=addbuycar&productid="+productid;
            
            data+="&userid="+userid;
            
            $.getJSON("BuycarServlet",data,CallbackAddBuycar);
            
            function CallbackAddBuycar(datas) {
            
                if(datas[0].status=="success"){
                    $msg1.html("添加购物车成功！").stop(true, true)
                        .fadeIn(1000).fadeOut(5000);
                }else {
                    $msg2.html("添加购物车失败，请联系管理员！").stop(true, true)
                        .fadeIn(1000).fadeOut(5000);
                }
            } 
            
            
        });
			/*添加收藏的  */
			 $productShowArea .on("click",".addfavourite",function () {

            var   productid= $(this).attr("id");//获取商品id

		
            var data="opr=addfavourite&productid="+productid;

            data+="&userid="+userid;

            $.getJSON("FavouriteServlet",data,CallbackAddBuycar);

            function CallbackAddBuycar(datas) {
	        
                if(datas[0].status=="success"){
                    $msg1.html("添加收藏成功！").stop(true, true)
                            .fadeIn(1000).fadeOut(5000);
                }else if(datas[0].status=="exist") {
                    $msg2.html("您已经收藏该物品，请勿重复收藏！（取消收藏请去收藏页面！）").stop(true, true)
                            .fadeIn(1000).fadeOut(5000);
                }else if(datas[0].status=="error"){
                    $msg2.html("添加收藏失败，请联系管理员！").stop(true, true)
                            .fadeIn(1000).fadeOut(5000);
                }else{
                    $msg2.html("您未登录，无法添加收藏，请登录！").stop(true, true)
                            .fadeIn(1000).fadeOut(5000);
                }
            }


        });
			
			
			//设置xiansh触发函数
			function getPagi(type,id, pageIndex) {//type:分类层级，id:分类id，pageIndex：页码
			
				
				
				var data = "opr=listproductnowpage&type="+type+"&id="+id;
				
				
				
				if (pageIndex && pageIndex > 0) {
					data += "&pageIndex=" + pageIndex;
					
				}

				$.getJSON("<%=basePath%>ProductServlet", data, callBackProducts);

			}

			/*  设置回调函数*/

			function callBackProducts(datas) {
        
			
				$productShowArea.html("");
				var type= datas[0].type;
   				var id= datas[0].id;
				var pagedata = datas[1];
				if (pagedata.productList == null) {
					$productShowArea.html("<h2>出现错误！请与管理员联系</h2>");
					
				} else if (pagedata.productList.length == 0) {
					$productShowArea.html("<h2>抱歉，没有找到相关的商品</h2>");
				} else {
					var  product;
					
					for ( var i = 0; i <pagedata.productList.length; i++) {
						product = pagedata.productList[i];
							
						
							$productShowArea.append("<li><div class='img'>"
											+	"<a href='<%=basePath%>pre/productdetail.jsp?productid="+product.id+"'><img src='statics/images/"+product.fileName+"' width='210'height='185' /> </a>"
											+"</div><div class='price'><span>"+product.price+"</span>"
											+"</div><div class='name'><a href='<%=basePath%>pre/productdetail.jsp?productid="+product.id+"'>"+product.name+"</a>"
											+"</div><div class='carbg'>"
											+"	<a href='javascript:;'id='"+product.id+"' class='ss addfavourite'>收藏</a> <a href='javascript:;' class='j_car' id='"+product.id+"' >加入购物车</a>"
											+"</div></li> "
											
											
											);

					}
					
				}
				
				
		
				$pageButtonArea.html("");
				/* 按钮样式和功能设置 */
				//首页和上一页
				var $first = $("<a href='javascript:;'class='p_pre '>首页</a>").on(
						"click", function() {
							getPagi(type,id, 1);

						});
				var $prev = $("<li ><a href='javascript:;'class='p_pre  '>上一页</a> </li>").on(
						"click", function() {
							getPagi(type,id, parseInt(pagedata.currPageNo) - 1);

						});
				$pageButtonArea.append($first).append($prev);

				//中间数字按钮

				for ( var i = 1; i <= pagedata.totalPageCount; i++) {
					var $middle;
					if (i == pagedata.currPageNo) {
						$middle = $("<a  class='cur middle' name='"+type+"' id='"+id+"' href='javascript:;'>"
								+ i + "</a> ");
					} else {
						$middle = $("<a class='middle' name='"+type+"' id='"+id+"' href='javascript:;'>"
								+ i + "</a> ");
					}

					$pageButtonArea.append($middle);

				}
				$(".middle").each(function() {
					$(this).off();
					$(this).on("click", function() {
						getPagi($(this).attr("name"),$(this).attr("id"), $(this).html());
					});
				});

				//下一页和末页
				var $next = $("<a href='javascript:;' class='p_pre '>下一页</a>").on(
						"click", function() {
							getPagi(type,id, pagedata.currPageNo + 1);

						});
				var $last = $("<a href='javascript:;' class='p_pre '>末页</a> ").on(
						"click", function() {
							getPagi(type,id, pagedata.totalPageCount);

						});
				$pageButtonArea.append($next).append($last);

			}
		//页面加载即运行触发函数 
		 getPagi(begintype,beginid, 1); 
		 
		 
		 

	});
	</script>
	
</body>
</html>

