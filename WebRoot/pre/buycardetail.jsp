<%@page import="cn.easybuy.util.MathUtil"%>
<%@page import="cn.easybuy.entity.User"%>
<%@page import="cn.easybuy.entity.Product"%>
<%@page import="cn.easybuy.service.impl.ProductServiceImpl"%>
<%@page import="cn.easybuy.service.ProductService"%>
<%@page import="java.sql.SQLException"%>
<%@page import="cn.easybuy.entity.Buycar"%>
<%@page import="cn.easybuy.service.impl.BuycarServiceImpl"%>
<%@page import="cn.easybuy.service.BuycarService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath(); 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>购物车</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link type="text/css" rel="stylesheet"
	href="<%=basePath%>statics/css/style.css" />


<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet" href="<%=basePath%>statics/css/reset.css">
<link rel="stylesheet" href="<%=basePath%>statics/css/carts.css">
</head>
<body>

<div>
<%@ include file="../common/head.jsp"%>

</div>
<h2 style="text-align:center;width:400px;margin:30px 0px;color:red">我的购物车</h2>

	<section class="cartMain">
		<div class="cartMain_hd">
			<ul class="order_lists cartTop">
				<li class="list_chk">
					<!--所有商品全选--> <input type="checkbox" id="all" class="whole_check">
					<label for="all"></label> 全选</li>
				<li class="list_con">商品信息</li>
				<li class="list_info">商品参数</li>
				<li class="list_price">单价</li>
				<li class="list_amount">数量</li>
				<li class="list_sum">金额</li>
				<li class="list_op">操作</li>
			</ul>
		</div>

		<div class="cartBox" id="showArea">

			<div class="order_content">
			<form action="#"method="post" id="">

				<%
					/* User user = null; */
									    user = (User) session.getAttribute("user");
										List<Buycar> list = null;
										if (user == null) {//游客状态
											/* Cookie[] cookies = request.getCookies(); */
											if(cookies!=null){
											   list=new ArrayList<Buycar>();
											   for (int i = 0; i < cookies.length; i++) {
											    
												  String productid = cookies[i].getName();
												  String quantity = cookies[i].getValue();
												  if(MathUtil.isNumeric(productid)&&MathUtil.isNumeric(quantity)){
												      if(new ProductServiceImpl().findProductByid(Integer.parseInt(productid))!=null){
												    
												        Buycar buycar = new Buycar();
												        buycar.setProductId(Integer.parseInt(productid));
												        buycar.setQuantity(Integer.parseInt(quantity));
												       list.add(buycar);
												      }
												  
												  }
										
											   }
											}
										} else {//用户正在登陆

											int userid = user.getId();
											BuycarService bcs = new BuycarServiceImpl();
											try {
												list = bcs.getBuycarsByUserId(userid);
											} catch (SQLException e) {
												// TODO Auto-generated catch block
												e.printStackTrace();
											} //获取该用户的所有购物车信息			
										}
										
										for (Buycar buycar : list) {
											ProductService ps = new ProductServiceImpl();
											Product product = null;
											try {
												product = ps.findProductByid(buycar.getProductId());
												//*********加减数量后价格不对********\\
												float totalPrice=product.getPrice()*((float)buycar.getQuantity());
												session.setAttribute("product", product);
												session.setAttribute("buycar",  buycar);
												session.setAttribute("totalPrice",  totalPrice);
											} catch (Exception e) {
												e.printStackTrace();
											}
				%>
				
				
				<ul class="order_lists">
					<!-- *************复选框不对************* -->
					<li class="list_chk"><input type="checkbox"
						value="${buycar.id }" id="${product.id }" class="son_check" name="goodschoice">
						<label for="${product.id }"></label>
					</li>
					<li class="list_con">
						<div class="list_img">
							<a href="<%=basePath%>pre/productdetail.jsp?productid=${product.id }"><img
								src="<%=basePath%>statics/images/${product.fileName}" alt="">
							</a>
						</div>
						<div class="list_text">
							<a href="<%=basePath%>pre/productdetail.jsp?productid=${product.id }">${product.name }</a>
						</div></li>
					<li class="list_info">
						<p>规格：默认</p>
						<p>尺寸：16*16*3(cm)</p></li>
					<li class="list_price">
						<p class="price">￥${product.price }</p></li>
					<li class="list_amount">
						<div class="amount_box" buycarid="${buycar.id }" product="${product.id }">
							<a href="javascript:;" class="reduce reSty">-</a> <input
								type="text" value="${buycar.quantity }" class="sum"> <a
								href="javascript:;" class="plus">+</a>
						</div></li>
					<li class="list_sum">
						<p class="sum_price">￥${totalPrice}</p></li>
					<li class="list_op">
						<p class="del">
							<a href="javascript:;" class="delBtn" buycarid="${buycar.id }"
								productid="${product.id }"> 移除商品 </a>
						</p></li>
				</ul>
				
				<%
					}
				%>
</form>
			</div>

		</div>


		<div class="bar-wrapper">
			<div class="bar-right">
				<div class="piece">
					已选商品<strong class="piece_num">0</strong>件
				</div>
				<div class="totalMoney">
					共计: <strong class="total_text" id="total_text">0.00</strong>
				</div>
				<div class="calBtn">

					<!--根据用户是否在线生成不同功能的结算按钮  -->
					<%
						if (user == null) {
					%>

					<a href="javascript:;" onclick="if(confirm('检测到您尚未登录，结算需要登录，现在登录吗？')){location.href='pre/loginpage.jsp';}else{return;}">结算</a>
					<%
						} else {
					%>
					<a href="javascript:;" id="clearing">结算</a>
					<%
						}
					%>



				</div>
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
				buycarid="" productid="">确定</a> <a href="javascript:;"
				class="dialog-close">关闭</a>
		</div>
	</section>


</body>

<script src="<%=basePath%>statics/js/jquery.min.js"></script>


<%-- <script src="<%=basePath%>statics/js/carts.js"></script> --%>

<script type="text/javascript">
	$(function() {

		var $showArea = $("#showArea");

		/** ————————————————————————————————————————————————删除购物车系列操作——————————————————————————————————————————————————————**/
		var $order_lists = null;
		var $order_content = "";
		$showArea.on("click", ".delBtn", function() {
			$order_lists = $(this).parents(".order_lists");
			$order_content = $order_lists.parents(".order_content");

			var buycarid = $(this).attr("buycarid"); //获取购物车条目ID
			var productid = $(this).attr("productid");//获取产品id

			$("#dialog-sure").attr("buycarid", buycarid); //传递属性至询问区		
			$("#dialog-sure").attr("productid", productid);
			$(".model_bg").fadeIn(300);
			$(".my_model").fadeIn(300);
		});

		//关闭模态框
		$(".closeModel,.dialog-close").click(function() {
			$(".model_bg").fadeOut(300);
			$(".my_model").fadeOut(300);
		});

		//确定按钮，移除商品
		$("#dialog-sure")
				.click(
						function() {

							var buycarid = $(this).attr("buycarid"); //获取购物车条目ID
							var productid = $(this).attr("productid");//获取产品id

							$.getJSON("BuycarServlet",
									"opr=delbuycar&buycarid=" + buycarid
											+ "&productid=" + productid,
									callbackDelBuycar);

							function callbackDelBuycar(data) {
								if (data[0].status == "success") {

									$order_lists.remove();
									if ($order_content.html().trim() == null
											|| $order_content.html().trim().length == 0) {
										$order_content.parents(".cartBox")
												.remove();
									}

								}
								$sonCheckBox = $(".son_check");
								totalMoney();
							}
							$(".model_bg").fadeOut(300);
							$(".my_model").fadeOut(300);

						});

		/**——————————————————————————————————————————————————单选与多选——————————————————————————————————————————————————————*/
		//全局的checkbox选中和未选中的样式
		var $allCheckbox = $("input[type='checkbox']"); //全局的全部checkbox
		var $wholeChexbox = $("#all");//全选按钮
		var $son_check=$(".son_check");//子选项
		
		 $("body").on("click",".son_check",function() {
			if ($(this).is(':checked')) {
				$(this).next().addClass('mark');
			} else {
				$(this).next().removeClass('mark');
			}
		}); 

		  //全局全选与单个商品的关系
		 $wholeChexbox.click(function() {
			
			if ($(this).is(':checked')) {
				$allCheckbox.prop("checked", true);
				$allCheckbox.next('label').addClass('mark');
			} else {
				$allCheckbox.prop("checked", false);
				$allCheckbox.next('label').removeClass('mark');
			}
			totalMoney();
		});

		
			$son_check.click(function() {
				if ($(this).is(':checked')) {
					//判断：所有单个商品是否勾选
					var len = $son_check.length;
				
					var num = 0;
					$son_check.each(function() {
						if ($(this).is(':checked')) {
							num++;
							
						}
					});
					if (num == len) {
						$wholeChexbox.prop("checked", true);
						$wholeChexbox.next('label').addClass('mark');
					}
				} else {
					//单个商品取消勾选，全局全选取消勾选
					$wholeChexbox.prop("checked", false);
					$wholeChexbox.next('label').removeClass('mark');
				}
				
				totalMoney();
			});
	    /**——————————————————————————————————————————————————计算总价——————————————————————————————————————————————————*/
		function totalMoney() {
			var total_money = 0;
			var total_count = 0;
			var calBtn = $('.calBtn a');
			$son_check.each(function() {
				if ($(this).is(':checked')) {
					var goods = parseInt($(this).parents('.order_lists').find(
							'.sum_price').html().substring(1));
					var num = parseInt($(this).parents('.order_lists').find(
							'.sum').val());
					total_money += goods;
					total_count += num;
				}
			});
			$('.total_text').html('￥' + total_money);
			$('.piece_num').html(total_count);

			// console.log(total_money,total_count);

			if (total_money != 0 && total_count != 0) {
				if (!calBtn.hasClass('btn_sty')) {
					calBtn.addClass('btn_sty');
				}
			} else {
				if (calBtn.hasClass('btn_sty')) {
					calBtn.removeClass('btn_sty');
				}
			}
		}
		
 


		/**——————————————————————————————————————————————————商品数量增加减少（ajax）——————————————————————————————————————————————————*/
		var $plus = $('.plus'), $reduce = $('.reduce'), $all_sum = $('.sum');
		$plus.click(function() {//增加
			var $inputVal = $(this).prev('input'), $count = parseInt($inputVal
					.val()) + 1, $obj = $(this).parents('.amount_box').find(
					'.reduce'), $priceTotalObj = $(this)
					.parents('.order_lists').find('.sum_price'), $price = $(
					this).parents('.order_lists').find('.price').html(), //单价
			$priceTotal = $count * parseInt($price.substring(1));
			$inputVal.val($count);
			$priceTotalObj.html('￥' + $priceTotal);
			if ($inputVal.val() > 1 && $obj.hasClass('reSty')) {
				$obj.removeClass('reSty');
			}
			var $buycarid = $(this).parents(".amount_box").attr("buycarid");
			var $product = $(this).parents(".amount_box").attr("product");
			$.get("BuycarServlet","opr=change&count="+$count+"&buycarid="+$buycarid+"&product="+$product);
			totalMoney();
		});

		$reduce.click(function() {//减少
			var $inputVal = $(this).next('input'), $count = parseInt($inputVal
					.val()) - 1, $priceTotalObj = $(this).parents(
					'.order_lists').find('.sum_price'), $price = $(this)
					.parents('.order_lists').find('.price').html(), //单价
			$priceTotal = $count * parseInt($price.substring(1));
			if ($inputVal.val() > 1) {
				$inputVal.val($count);
				$priceTotalObj.html('￥' + $priceTotal);
			}
			if ($inputVal.val() == 1 && !$(this).hasClass('reSty')) {
				$(this).addClass('reSty');
			}
			var $buycarid = $(this).parents(".amount_box").attr("buycarid");
			var $product = $(this).parents(".amount_box").attr("product");
			$.get("BuycarServlet","opr=change&count="+$count+"&buycarid="+$buycarid+"&product="+$product);
			totalMoney();
		});

		$all_sum.keyup(function() {//直接输入件数的操作
			var $count = 0, $priceTotalObj = $(this).parents('.order_lists')
					.find('.sum_price'), $price = $(this).parents(
					'.order_lists').find('.price').html(), //单价
			$priceTotal = 0;
			if ($(this).val() == '') {
				$(this).val('1');
			}
			$(this).val($(this).val().replace(/\D|^0/g, ''));
			$count = $(this).val();
			$priceTotal = $count * parseInt($price.substring(1));
			$(this).attr('value', $count);
			$priceTotalObj.html('￥' + $priceTotal);
			var $buycarid = $(this).parents(".amount_box").attr("buycarid");
			var $product = $(this).parents(".amount_box").attr("product");
			$.get("BuycarServlet","opr=change&count="+$count+"&buycarid="+$buycarid+"&product="+$product);
			totalMoney();
		});
		
		
		
		
		
		/** ———————————————————————————————————————————————————结算按钮———————————————————————————————————————————————————————*/
		
		 
		$("#clearing").click(function(){
		   var num = 0;
		   var data;
			$son_check.each(function() {
			  if ($(this).is(':checked')) {
			  
				num++;
						
			  }   
			});
			if (num == 0) {
				alert("您未选择任何商品，请选择！");
				return false;		
			}else{
			var data=$son_check.serialize();
			
			location.href="pre/orderbuild.jsp?"+data;
			}
		});
		 

	});
</script>

</html>