<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>会员中心</title>

<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<%=basePath%>statics/css/jiazaitoubu.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>statics/css/css.css">

<link rel="stylesheet" type="text/css" href="<%=basePath%>statics/css/center.css">
<!--城市联动-->
<link rel="stylesheet" type="text/css" href="<%=basePath%>statics/css/city.css">

</head>
<body>
<!--top-->
<div class="top" id="wyqtb">
	<div class="top_in">
    	<em>地区选择</em>
        <!--插入插件-->
        <input type="text" id="city" style=" margin-top:8px; font-size:12px; text-align:center; color:#343434; height:24px; float:left" value="请输入地址范围...">
        <script type="text/javascript">
			$("#city").click(function (e) {
				SelCity(this,e);
			});
		</script>
        <!--注册/登录-->
        <div class="zcdl">
        	<a href="#" style="color: rgb(254, 254, 254);">注册</a>
            <i></i>
            <a href="#" style="color: rgb(254, 254, 254);">登录</a>
        </div>
        <!--客服电话-->
        <div class="kfdh">
        	客服热线：400-9022-567
        </div>
        <!--手机微信-->
        <div class="sjwx">
        	<em title="微信公众号" id="wxgzh"><img src="<%=basePath%>statics/images2/weixin.png"></em>
            <em title="移动app" id="sjapp"><img src="<%=basePath%>statics/images2/shouji.png"></em>
            <b class="wxgzh none"><img src="<%=basePath%>statics/images2/乐乐公众号.jpg" width="80" height="80"></b>
            <b class="sjapp none"><img src="<%=basePath%>statics/images2/乐乐官网二维码.jpg" width="80" height="80"></b>
        </div>
    </div>
</div>
<!--导航加搜索框-->
<div style=" width:100%; height:auto; background:#fff">
<div class="dhjssk">
	<a href="#" class="logo"><img src="./会员中心_files/logo.png"></a>
    <div class="searchk">
    	<div class="sjhcp">
        	<!--left-->
        	<div class="sjhcp_in">
            	<span>商家</span>
                <div class="little_list" style="display: none;">
                	<em>菜品</em>
                    <em>商家</em>
                </div>
            </div>
            <script>
				//模拟下拉菜单的js*/
				$(".sjhcp_in span").on("mouseenter", function(e){
					if($(".little_list").is(":hidden")){
						$(".little_list").show();
					}else{
						$(".little_list").hide();
					}
						$(".little_list em").click(function(){
							var txt=$(this).text();
							$(".sjhcp_in span").text(txt);
							$(".little_list").hide();
						})
						$(document).one("click", function(){
							$(".little_list").hide();
						});
							e.stopPropagation();
					});
						$(".little_list").on("click", function(e){
						e.stopPropagation();
				});
            </script>
            <!--right-->
            <div class="jiantou"><img src="<%=basePath%>statics/images2/jiantou.png"></div>
        </div>
    	<input type="text" style="width:307px;height:40px;background:#fff;float:left; font-size:16px; color:#adadad; text-indent:16px;line-height:40px" value="请输入..." onfocus="" onblur="">
        <div class="ssl" style="background: rgb(205, 0, 16);"><img src="<%=basePath%>statics/images2/fangdajing.png"></div>
    </div>
    
    
</div>
</div>
<!--导航-->
<div class="dao_hang">
	<div class="nav_css">
    	
    	<!--全部商品分类-->
    	<div class="important"><img src="<%=basePath%>statics/images2/all_list.png" style=" margin-top:13px">&nbsp;全部商品分类
         
        </div>
        <!--结束-->
        <div class="dao_list">
        	<a href="#">首页</a>
            <a href="#">商家</a>
            <a href="#">优惠活动</a>
            <a href="#">诚邀加盟</a>
        </div>    
    </div>
</div>
<script>
window.onload=function(){
	$(".aside").css({display:"none"})
	$(".important").mouseenter(function(){
		$(".aside").css({display:"block"})
		}).mouseleave(function(){
			$(".aside").css({display:"none"})
			})
	}
</script>
<!--当前位置-->
<div class="now_positionm">
<span>当前位置：</span><a href="#">首页&gt;</a><a href="#">个人中心</a>
</div>
<!--centers-->
<div class="centers_m">
	<!--清除浮动-->
    <div class="clear_sm"></div>
	<!--left-->
    <div class="centers_ml">
    	<!--头像-->
        <div class="center_header">
        	<a href="#"><img src="<%=basePath%>statics/images2/66f625e1ecfd7ad8244efabaa744aa73.png"></a>
            <em>您好，<font>admin</font></em>
        </div>
        <!--列表go-->
        <div class="centers_listm">
        	<div class="centers_listm_one">
            	<img src="<%=basePath%>statics/images2/zshy.png">
                <em>管理中心</em>
            </div>
            
            
            <!--一条开始-->
            <div class="centers_listm_one_in">
                <img src="<%=basePath%>statics/images2/ddgl.png">
                <em>订单管理</em>
                <b></b>
            </div>
            <span class="gjszmdm" >
                <a href="#" class="center_in_self"><font>我的订单</font></a>
                
                <a href="#" class="center_in_self"><font>全部订单</font></a>
               
            </span>
            <!--一条开始-->
            <div class="centers_listm_one_in">
                <img src="<%=basePath%>statics/images2/suo.png">
                <em>会员中心</em>
                <b></b>
            </div>
            <span class="gjszmdm">
                <a href="#" class="center_in_self"><font>用户信息</font></a>
                <a href="#" class="center_in_self"><font>用户列表</font></a>
          
            </span>    
            <!--一条开始-->
            <div class="centers_listm_one_in">
                <img src="<%=basePath%>statics/images2/wdssc.png">
                <a href="<%=basePath%>backend/addproductalist.jsp"><em>商品管理</em></a>
                <b></b>
            </div>
            <span class="gjszmdm">
            	<a href="#" class="center_in_self"><font>分类管理</font></a>
                <a href="#" class="center_in_self"><font>商品管理</font></a>
            </span>    
            <!--一条开始-->
            <div class="centers_listm_one_in">
                <img src="<%=basePath%>statics/images2/myfridend.png">
                <em>资讯中心</em>
                <b></b>
            </div>
            <span class="gjszmdm">
            	<a href="#" class="center_in_self"><font>资讯列表</font></a>
            	<a href="#" class="center_in_self"><font>资讯分类</font></a>
            </span>
        </div>
        <script type="text/javascript">
		$(function(){//第一步都得写这个
			$(".centers_listm_one_in").click(function(){
			$(this).next(".gjszmdm").slideToggle().siblings("gjszmdm").slideUp()
			});
		})
		</script>
    </div>
    <!--right-->
    <div class="centers_mr">
    <h1 class="welcom_tm">欢迎您，超级会员     <font>admin</font>！您上次登录时间为 2016-10-28 14:23</h1>
    <!--一条开始-->
    	<div class="public_m1">
        	<div class="public_m2">资料管理</div>
            <!--照片和内容-->	
            <div class="zp_nrm">
            	<!--left-->
                <div class="zp_nrm_l">
                	<img src="<%=basePath%>statics/images2/66f625e1ecfd7ad8244efabaa744aa73.png">
                    <a href="#">更换头像</a>
                </div>
                <!--right-->
                <div class="zp_nrm_r">
                	<p><em>用户名：</em><i>admin</i></p>
                    
                </div>
            </div>
        </div>
	
    	
    <!--一条开始-->
    	<div class="public_m1">
        	<div class="public_m2">订单状态</div>
            <!--各种进度-->	
            <div class="gezhong_jdm">
            	<img src="<%=basePath%>statics/images2/jkkll.png">
                <ul>
                	<li>状态填写</li>
                    <li>状态填写</li>
                    <li>状态填写</li>
                    <li>状态填写</li>
                </ul>
            </div>
            <!--各种信息-->
            <div class="gezhong_xxm">
            	<ul>
                	<li><em>商家：</em><a href="#">木木小店</a></li>
                    <li><em>订单号：</em><a href="#">2016102111523538</a></li>
                    <li><em>预约时间：</em><i>12:00-14:00</i></li>
                    <li><em>订购热线：</em><i>7310237</i></li>
                    <li><em>下单时间：</em><i>2016-10-21 11:52:38</i></li>
                    <li><em>订单状态：</em><i>已取消</i></li>
                    <li><em>订餐类型：</em><i>餐位订餐</i></li>
                </ul>
            </div>
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
						<tr>		
						  	<td><a href="#">青岛大虾</a></td>	 
							<td>￥288.00</td>		
							<td>3</td>
                            <td class="money">只</td>		
							<td>￥864.00</td>
                        </tr>
						<tr>		
						  	<td><a href="#">肉肉</a></td>	 
							<td>￥288.00</td>		
							<td>3</td>
                            <td class="money">盘</td>		
							<td>￥864.00</td>
                        </tr>
					</tbody>
                </table>
            </div>
            <!--位置信息-->
            <div class="weizhi_xxm">
            	位置信息：<font>大厅11号桌</font>
            </div>
            <!--合计金额-->
            <div class="heji_jem">
            	合计金额：<font>1038.00元</font>
            </div>
            <!--订餐留言-->
            <div class="dingcan_lym">
            	<em>订餐留言：</em>
                <p>最佳答案：APP是英文Application(应用)的简称,由于iPhone智能手机的流行,现在的APP多指移动设备(包括平板电脑、手机、和其他移动设备)上的第三方应用程序。 目前比...</p>
            </div>
        </div>
    
   
    <!--一条开始-->
    	<div class="public_m1">
        	<div class="public_m2">收藏店铺</div>
            <!--一个订单信息-->
            <div class="public_m5">
            	<table border="0" cellspacing="0" cellpadding="0">
                	<tbody>
						<tr style=" border-bottom:1px solid #000">       
                        	<th class="olist1">店铺名</th>       
                            <th class="olist2">店铺地址</th>       
                            <th class="olist3">收藏人气</th>		
                            <th class="olist4">菜系</th>		
                            <th class="olist5">操作</th>
                        </tr>	
						<tr>		
						  	<td><a href="#">我的店</a></td>	 
							<td>黄台家具广场...</td>		
							<td>3</td>
                            <td class="money">鲁菜</td>		
							<td><a href="#">取消收藏</a></td>
                        </tr>
					</tbody>
                </table>
            </div>
            <!--当没有东西时的东西-->
            <div class="public_m6">
            	<img src=".<%=basePath%>statics/images2/danmgydxm.png">
            </div>
        </div>
   
    <!--一条开始-->
    	<div class="public_m1">
        	<div class="public_m2">订单投诉</div>
            <!--一个订单信息-->
            <div class="public_m5">
            	<table border="0" cellspacing="0" cellpadding="0">
                	<tbody>
						<tr style=" border-bottom:1px solid #000">       
                        	<th class="olist1">订单编号</th>       
                            <th class="olist2">下单时间</th>       
                            <th class="olist4">订单商家</th>
                            <th class="olist4">截单时间</th>
                            <th class="olist4">状态</th>		
                        </tr>	
						<tr>		
						  	<td><a href="#">2016102111523538</a></td>	 
							<td>2016-10-21 12:03</td>
                            <td><a href="#">城南往事</a></td>	 
							<td>2016-10-21 12:03</td>		
							<td>正在点评</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            
            <!--我的牛评-->
            <div class="my_lm">
            	<em>我的牛评：</em>
                <textarea></textarea>
            </div>
            <!--选择上传文件-->
            <div class="myinput_lm">
            	<em>上传图拍：</em>
            	<input type="file">
                <input type="checkbox">
                <i>匿名上传</i>
            </div>
            <a href="#" class="public_m3">提交</a>
         </div>
   

</div>

<script src="statics/js/jquery-1.11.1.min.js"></script>
<script src="statics/js/index2.js"></script>
 <script src="statics/js/Popt.js"></script>
<script src="statics/js/cityJson.js"></script>
<script src="statics/js/citySet.js"></script> 
</body>


</html>