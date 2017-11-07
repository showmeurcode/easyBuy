<%@page import="cn.easybuy.entity.UserAddress"%>
<%@page import="cn.easybuy.entity.User"%>
<%@page import="cn.easybuy.service.impl.UserAddressServiceImpl"%>
<%@page import="cn.easybuy.entity.Product"%>
<%@page import="cn.easybuy.service.impl.ProductServiceImpl"%>
<%@page import="cn.easybuy.service.ProductService"%>
<%@page import="cn.easybuy.entity.Buycar"%>
<%@page import="cn.easybuy.service.impl.BuycarServiceImpl"%>
<%@page import="cn.easybuy.service.BuycarService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
<head>
<base href="<%=basePath%>">

<title>确认订单</title>
<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>statics/css/jiazaitoubu.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>statics/css/css.css">

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>statics/css/center.css">
<!--城市联动-->
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>statics/css/city.css">
<link rel="stylesheet" href="<%=basePath%>statics/css/base.css">
<link rel="stylesheet" href="<%=basePath%>statics/css/register.css">

<link rel="stylesheet" href="<%=basePath%>statics/css/index1.css"
	type="text/css"></link>
</head>
<%
	String []buycardIds= request.getParameterValues("goodschoice");
 BuycarService buycarService=new BuycarServiceImpl();
 User user= (User)session.getAttribute("user");
 
 List <Buycar>buycarlist=new ArrayList<Buycar>();
 for (String buycarId:buycardIds){
 	Buycar buycar=buycarService.getBuycarById(Integer.parseInt(buycarId));
     buycarlist.add(buycar);

 
 }
 pageContext.setAttribute("buycardIds",buycardIds );
%>
<body>



	<div id="all" style="width:1000px;margin:auto">

		<div class="public_m1">
			<div class="public_m2">订单状态</div>
			<!--各种进度-->

			<!--各种信息-->
			<div class="gezhong_xxm">
				<ul>
					<li><em>商家：</em><a href="javascript:;">易买商城</a></li>

					<li><em>买家姓名：</em><i>${sessionScope.user.userName }</i></li>
					<li><em>订单号：</em><a href="javascript:;" id="orderno">2016102111523538</a>
					</li>

					<li><em>下单时间：</em><i id="ordertime"></i></li>
					<li><em>订单状态：</em><i>待审核</i></li>

				</ul>
			</div>





			<div class="public_m2">选择地址</div>
			<!--各种进度-->

			<!--地址下显示区-->
			<div class="gezhong_xxm">
				<ul  id="addressShowArea">
					<%
						List<UserAddress> userAddressList=new UserAddressServiceImpl().findAddressByUserId(user.getId());
														if(userAddressList.size()!=0){
														
														   for(UserAddress userAddress:userAddressList){
														      if(userAddress.getIsDefault()==1){
					%>

					<li><em><input name="Address" type="radio"
							value="<%=userAddress.getAddress()%>" checked><%=userAddress.getRemark()%>：
					</em><i><%=userAddress.getAddress()%></i></li>

					<%
						}else{
					%>

					<li><em><input name="Address" type="radio"
							value="<%=userAddress.getAddress()%>"><%=userAddress.getRemark()%>：
					</em><i><%=userAddress.getAddress()%></i></li>

					<%
						}
									                           }
														}else{
					%>
					<h1 style="padding:20px;color:red;font-size:20px">您当前没有已存地址！！！</h1>

					<%
						}
					%>


				</ul>


			</div>
			<a id="addAddress" href="javascript:;"
				style="display:inline-block;border:solid;padding:10px;color:red">添加地址</a>


			<!--一个订单信息-->
			<div class="public_m5">
				<table border="0" cellspacing="0" cellpadding="0">
					<tbody>
						<tr style=" border-bottom:1px solid #000">
							<th class="olist1">菜品</th>
							<th class="olist2">单价（元）</th>
							<th class="olist3">数量</th>
							<th class="olist4">单位</th>
							<th class="olist5">小计</th>
						</tr>

						<%
							ProductService productService=new ProductServiceImpl();
																														String productname="";
																														int quantity=0;
																														float price=0;
																														float totalPriceForOne=0;
																														float allPrice=0;
																														
																														for(Buycar buycar:buycarlist){
																															Product product=productService.findProductByid(buycar.getProductId());
																															productname= product.getName();
																															price=product.getPrice();
																															quantity=buycar.getQuantity();
																															totalPriceForOne=((float)quantity)*price;
																															allPrice+=totalPriceForOne;
						%>


						<tr>
							<td><a href="#"><%=productname%></a></td>
							<td>￥<%=price%></td>
							<td><%=quantity%></td>
							<td class="money">个</td>
							<td>￥<%=totalPriceForOne%></td>
						</tr>

						<%
							}
						%>



					</tbody>
				</table>
			</div>


			<!--合计金额-->
			<div class="heji_jem">
				合计金额：<font>￥<%=allPrice%>元</font>
			</div>

		</div>
		<a href="javascript:;" class="public_m3" id="orderbuild">提交订单</a>

	</div>



	<!--——————————————————————————————参数获取区——————————————————————————————————————  -->

	<form action="#" method="get" hidden id="getparams">

		<input type="text" name="userId" value="<%=user.getId()%>"> <input
			type="text" name="loginName" value="<%=user.getLoginName()%>">
		<input type="text" name="userAddress" value="" id="userAddress">
		<input type="text" name="createTime" value="" id="createTime">
		<input type="text" name="cost" value="<%=allPrice%>"> <input
			type="text" name="status" value="0"> <input type="text"
			name="type" value="0"> <input type="text" name="serialNumber"
			value="" id="serialNumber">

		<c:forEach items="${buycardIds }" var="buycardId">
			<input type="checkbox" name="buycarids" value="${buycardId}" checked>
		</c:forEach>

	</form>


	<!-- 增加地址显示区  ————————————————————————————————————————————-->



<form action="#" method="get">
	<div class="full" id="addAddressArea">
		<div class="full-wrap">
			<div class="full-top">
				<img src="img/add.png">添加地址<span>X</span>
			</div>
			<!-- 获取时间，用户id -->
			
			<input type="text" name="addAddressTime"id="addAddressTime"value="" hidden/>
			
			<input type="text" name="addAddressuserid"value="<%=user.getId()%>" hidden/>
			
			<div class="full-content">
				<div class="full-inp">
					<span>详细地址：</span> <input type="text" id="addAddressAddress"name="addAddressAddress"required  placeholder="请填写详细地址"
						style="border:solid blue">
				</div>
				<div class="full-inp">
					<span>备注：</span> <input type="text" id="addAddressRemark"name="addAddressRemark"required  placeholder="备注（如：我家）"
						style="border:solid blue">
				</div>
				<div class="full-inp">
					<span>是否默认：</span> <input type="checkbox" name="addAddressDefault"
						value="yes"   style="border:solid blue">
				</div>

				<div class="full-inp">
				
				<botton id="addAddressSubmit">确 认</botton>
				
				</div>
			</div>
		</div>
	</div>

</form>







	<script type="text/javascript"
		src="<%=basePath%>statics/js/jquery-1.11.1.min.js"></script>
	<script src="<%=basePath%>statics/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="<%=basePath%>statics/js/tab.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".wrap").tabs();
			/**——————————————————————————————————初始化获取时间和订单号————————————————————————————————————  */

			function getorderno() {
				var d = new Date();
				var vYear = d.getFullYear();
				var vMon = d.getMonth() + 1;
				var vDay = d.getDate();
				var h = d.getHours();
				var m = d.getMinutes();
				var se = d.getSeconds();
				var orderno = vYear + "" + (vMon < 10 ? "0" + vMon : vMon) + ""
						+ (vDay < 10 ? "0" + vDay : vDay) + ""
						+ (h < 10 ? "0" + h : h) + "" + (m < 10 ? "0" + m : m)
						+ "" + (se < 10 ? "0" + se : se);
				return orderno;
			}
			function getordertime() {
				var d = new Date();
				var vYear = d.getFullYear();
				var vMon = d.getMonth() + 1;
				var vDay = d.getDate();
				var h = d.getHours();
				var m = d.getMinutes();
				var se = d.getSeconds();

				var ordertime = vYear + "年" + (vMon < 10 ? "0" + vMon : vMon)
						+ "月" + (vDay < 10 ? "0" + vDay : vDay) + "日"
						+ (h < 10 ? "0" + h : h) + "时" + (m < 10 ? "0" + m : m)
						+ "分" + (se < 10 ? "0" + se : se) + "秒";
				return ordertime;

			}

			$("#ordertime").html(getordertime());
			$("#orderno").html(getorderno());

			/**——————————————————————————————————点击增加地址按钮————————————————————————————————————  */

			$("#addAddress").click(function() {//显示输入界面
				$("#addAddressArea").show();
				

			});
			$("#addAddressSubmit").click(function() {
				if($("#addAddressAddress").val()==""){
					alert("请填写地址！");
					return false;	
				}
				if($("#addAddressRemark").val()==""){
					alert("请填写备注！");
					return false;	
				}
				
				$("#addAddressTime").val(getordertime());
				var data1="opr=addAddress&"+$("#addAddressArea").find("input").serialize();
				$("#addAddressArea").hide();
				$.getJSON("UserAddressServlet",data1,addAddressCallback);
				
				function addAddressCallback(datas){//回调函数
					
					location.reload();//后面懒得做了 直接刷新页面了事（尹晓晨）。
					
				}
				
				

			});
			
			
			
			

			/**——————————————————————————————————点击提交订单按钮————————————————————————————————————  */

			$("#orderbuild").click(
					function() {
						if ($("input[name='Address']:checked").length == 0) {
							alert("您尚未选择任何地址！请选择！");
							return false;
						}

						//填充未完成参数
						$("#userAddress").attr("value",
								$("input[name='Address']:checked").val());
						$("#createTime").attr("value", $("#ordertime").html());
						$("#serialNumber").attr("value", $("#orderno").html());

						var $inputs = $("#getparams").find("input");
						var data = $inputs.serialize();//获取参数

						location.href = "OrderServlet?opr=addorder&" + data;//跳转至servlet

					});

		});
	</script>




</body>
</html>
