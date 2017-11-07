<%@page import="cn.easybuy.service.impl.ProductServiceImpl"%>
<%@page import="cn.easybuy.service.ProductService"%>
<%@page import="cn.easybuy.entity.Product"%>
<%@page import="cn.easybuy.entity.OrderDetail"%>
<%@page import="cn.easybuy.entity.Order"%>
<%@page import="cn.easybuy.service.impl.OrderServiceImpl"%>
<%@page import="cn.easybuy.service.OrderService"%>
<%@page import="cn.easybuy.service.impl.OrderDetailServiceImpl"%>
<%@page import="cn.easybuy.service.OrderDetailService"%>
<%@page import="cn.easybuy.entity.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">

<title>我的订单</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta charset="UTF-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=basePath%>statics/css/carts.css">
<style type="text/css">
#tagaa li:nth-of-type(2){
position:relative;
top:-20px;


}



</style>




</head>

<body>
	<div>
		<%@ include file="../common/head.jsp"%>

	</div>
	<h2 style="text-align:center;width:400px;margin:30px 0px;color:red">我的订单</h2>
	<section class="cartMain">
		<div class="cartMain_hd">
			<ul class="order_lists cartTop" id="tagaa" >
				<li class="list_con">商品名称</li>
				<li class="list_info">商品图片</li>
				<li class="list_amount">数量</li>
				<li class="list_sum">价格</li>
				<li class="list_op">操作</li>
			</ul>
		</div>

		<div class="cartBox" id="showArea">

			<div class="order_content">
				<form action="#" method="post" id="">
					<%
 						user = (User) request.getSession().getAttribute("user");
						int userid = user.getId();
						OrderService os = new OrderServiceImpl();
						List<Order> list = new ArrayList<Order>();
						List<OrderDetail> listod = new ArrayList<OrderDetail>();
						list = os.findOrderUserId(userid);	//(1)
						for (Order order : list) {
						
							OrderDetailService ods = new OrderDetailServiceImpl();
							listod = ods.getOrderDetailByOrderId(order.getId());	//(2)
							ProductService ps = new ProductServiceImpl();
							pageContext.setAttribute("order", order);
							%>
							<div style="border-top-color: orange; border-radius:2px;background-color: orange;">
							<p style="color: white;"><a href="javascript:;">订单编号：${order.serialNumber }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;查看详情;</a> 总计消费金额：${order.cost }</p>
							<p class="del" align="right" >
								<a href="javascript:;" class="delBtn" 
								Order="${order.id }" style="color: white;"> 删除订单 </a>
							</p>
							</div>
							<%
							//单独的一个订单
							for(OrderDetail od:listod){
							//分别每个订单详情
							Product product = new Product();
							product = ps.findProductByid(od.getProductId());	//(3)
							pageContext.setAttribute("product", product);
							pageContext.setAttribute("od", od);
							%>


					<ul class="order_lists">
					
						<li class="list_con">
							<div class="list_text">
								<a href="<%=basePath%>pre/productdetail.jsp?productid=${product.id }">${product.name }</a>
							</div></li>
						<li class="list_info">
							<div class="list_img">
								<a href="<%=basePath%>pre/productdetail.jsp?productid=${product.id }"><img
									src="<%=basePath%>statics/images/${product.fileName}" alt="" width="100px" height="70px">
								</a>
							</div></li>

						<li class="list_amount">
							<div class="amount_box">
								${od.quantity }
							</div></li>

						<li class="list_price">
							<p class="price">￥${od.cost }</p></li>


						<li class="list_op"></li>
					</ul>



					<%
							}
							
							}
					%>
				</form>
			</div>

		</div>


	</section>


	<section class="model_bg"></section>
	<!-- 删除框的大背景图 -->

	<!--删除确定询问区  -->
	<section class="my_model">
		<p class="title">
			删除宝贝<span class="closeModel">X</span>
		</p>
		<p>您确认要删除该宝贝吗？</p>
		<div class="opBtn">
			<a href="javascript:;" class="dialog-sure" id="dialog-sure"
				OrderDetail="">确定</a> <a href="javascript:;"
				class="dialog-close">关闭</a>
		</div>



	</section>

</body>
<script src="<%=basePath%>statics/js/carts.js"></script>
</html>
