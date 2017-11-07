<%@page import="cn.easybuy.service.ProductService"%>
<%@page import="cn.easybuy.service.impl.ProductServiceImpl"%>
<%@page import="cn.easybuy.entity.Product"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>statics/css/pintuer.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath %>statics/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>statics/css/ShopShow.css"/>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>商品详情介绍</title>
</head>
<body>
<!--网页头部-->
<header>

<%@ include file= "../common/head.jsp" %>
<!-- 错误提示框内容 -->
	
	</header>
	
    <div class="top">
       
        <%-- <div class="i_car">
            <div class="car_t">购物车</div>
            <div class="last">
                <div class="noshop">
                    <img src="images/icon_tips2.png" alt=""/>
                    <h3>你的1号店购物车还是空的</h3>
                </div>
                <div class="shop">
                    <ul>
                        <li >
                            <h4>1号店满199减100 <span class="J_count">共1件商品</span></h4>
                            <div class="clear">
                                <div class="shopImg">
                                    <img src="<%=basePath %>statics/images/shop1.png" alt=""/>
                                </div>
                                <div class="shopText">
                                    <div class="clear">
                                        <h5>宝贝许愿坊 童装女装套装 </h5>
                                        <a href="#" class="close J_btnDelete">X</a>
                                    </div>
                                    <p>深蓝 140码</p>
                                    <div class="clear">
                                        <div class="plush">
                                            <span class="J_btnDelCount">-</span>
                                            <input class="J_inputCount" type="text" value="1"/>
                                            <span class="J_btnAddCount">+</span>
                                        </div>
                                        <strong class="J_smallTotalPrice">￥190</strong>
                                    </div>
                                </div>
                            </div>
                            <p>参加一项促销，节约成本￥100</p>
                        </li>
                        <li >
                            <h4>1号店 <span class="J_count">共1件商品</span></h4>
                            <div class="clear">
                                <div class="shopImg">
                                    <img src="<%=basePath %>statics/images/shop2.png" alt=""/>
                                </div>
                                <div class="shopText">
                                    <div class="clear">
                                        <h5>亨氏 乐维滋清乐2+2果汁 </h5>
                                        <a href="#" class="close J_btnDelete">X</a>
                                    </div>
                                    <p>草莓山楂枸杞</p>
                                    <div class="clear">
                                        <div class="plush">
                                            <span class="J_btnDelCount">-</span>
                                            <input class="J_inputCount" type="text" value="1"/>
                                            <span class="J_btnAddCount">+</span>
                                        </div>
                                        <strong class="J_smallTotalPrice">￥5.8</strong>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li >
                            <h4>珠韵首饰旗舰店 <span class="J_count">共1件商品</span></h4>
                            <div class="clear">
                                <div class="shopImg">
                                    <img src="<%=basePath %>statics/images/shop3.png" alt=""/>
                                </div>
                                <div class="shopText">
                                    <div class="clear">
                                        <h5>珠韵首饰 大粒径 9.5-10.5mm近圆白色淡水珍珠项链 送妈妈白色45CM</h5>
                                        <a href="#" class="close J_btnDelete">X</a>
                                    </div>
                                    <p>淡水白色近圆珍珠</p>
                                    <div class="clear">
                                        <div class="plush">
                                            <span class="J_btnDelCount">-</span>
                                            <input class="J_inputCount" type="text" value="1"/>
                                            <span class="J_btnAddCount">+</span>
                                        </div>
                                        <strong class="J_smallTotalPrice">¥758 </strong>
                                    </div>
                                </div>
                            </div>
                            <p>全场包邮</p>
                        </li>
                    </ul>
                    <div class="option"><a href="#">意见反馈</a></div>
                    <div class="buy">
                        <p>合计 <span class="J_totalPrice">￥300.8</span></p>
                        <a href="#">立即结算 <span class="J_totalCount">(3)</span></a>
                    </div>
                </div>
            </div> --%>
        </div>
    </div>
</header>

<!--主体部分-->
<section class="center">
    <!--Begin Menu Begin-->
       
    <div class="menu_bg">
        <div class="menu">
     
            <!--Begin 商品分类详情 Begin-->
            <nav class="nav">
                <div class="nav_t">商品详情介绍————</div>
            </nav>
            <!--End 商品分类详情 End-->
           
            </nav>
            <a href="#" class="m_ad"><img src="images/phone.png" alt=""/></a>
        </div>
    </div>
    <!--End Menu End-->
    <div class="i_bg">

        <div class="postion">
           
        </div>

        <div class="clear" >
            <div id="tsShopContainer">
                <div id="tsImgS">
                
                	<%
                		String productId=request.getParameter("productid");
                		ProductService  productService = new ProductServiceImpl();
                		Product product =  productService.findProductByid(Integer.parseInt(productId));
                		request.setAttribute("product", product);
                	 %>
                	 
              
              
             		<a href="<%=basePath %>statics/images/p_big.jpg" class="MagicZoom">
                		<img src="statics/images/${product.fileName}" width="390" height="390"/>
              			
                    </a>
                </div>
                <div id="tsPicContainer">
                    <div id="tsImgSArrL"></div>
                    <div id="tsImgSCon">
                        <ul>
                            <li><img src="statics/images/${product.fileName}" /></li>
                            <li><img src="statics/images/${product.fileName}" width="79"/>
                            <li><img src="statics/images/${product.fileName}" width="79"/></li>
                            <li><img src="statics/images/${product.fileName}" width="79"/></li>
                        </ul>
                    </div>
                    <div id="tsImgSArrR"></div>
                </div>
            </div>

            <div class="pro_des">
                <div class="des_name">
                    <p>${product.name }</p>
                    全国包邮 送妈妈，正圆级淡水珍珠，白色S925银链扣，使用方便，尊贵礼物。
                </div>
                <div class="des_price">
                    本店价格：<b>¥${product.price }</b><br/>
                    参考价：<span>¥3886</span>
                </div>
                <div id="choice1" class="des_choice">
                    <span class="fl">尺码：</span>
                    <ul>
                        <li class="checked">43cm
                            <div class="ch_img"></div>
                        </li>
                        <li>45cm
                            <div class="ch_img"></div>
                        </li>
                        <li>50cm
                            <div class="ch_img"></div>
                        </li>
                    </ul>
                </div>
                <div id="choice2"  class="des_choice">
                    <span class="fl">颜色选择：</span>
                    <ul>
                        <li>粉色
                            <div class="ch_img"></div>
                        </li>
                        <li class="checked">白色
                            <div class="ch_img"></div>
                        </li>
                    </ul>
                </div>
                <div class="des_share">
                    <div class="d_sh">
                        分享
                        <div class="d_sh_bg">
                            <a href="#"><img src="<%=basePath %>statics/images/sh_1.gif"/></a>
                            <a href="#"><img src="<%=basePath %>statics/images/sh_2.gif"/></a>
                            <a href="#"><img src="<%=basePath %>statics/images/sh_3.gif"/></a>
                            <a href="#"><img src="<%=basePath %>statics/images/sh_4.gif"/></a>
                            <a href="#"><img src="<%=basePath %>statics/images/sh_5.gif"/></a>
                        </div>
                    </div>
                    <div class="d_care"><a >关注商品</a></div>
                </div>
                <div class="des_join" id="productShowArea">
                   <!--  <div class="j_nums">
                        <input type="text" value="1" name="" class="n_ipt"/>
                        <input type="button" value="" class="n_btn_1"/>
                        <input type="button" value="" class="n_btn_2"/>
                    </div> -->
                   <a href="javascript:;"id= "${product.id }" name="${sessionScope.user.id }"class="addcar" ><img src="<%=basePath %>statics/images/j_car.png"/></a>
                </div>
<div id="msg1" class="alert alert-green" hidden>
		</div>
		<div id="msg2" class="alert alert-yellow" hidden>
		</div>
            </div>


	
	
	
	
            <div class="s_brand">
                <div class="s_brand_img"><img src="<%=basePath %>statics/images/sbrand.jpg" width="188" height="132"/></div>
                <div class="s_brand_c"><a href="#">进入品牌专区</a></div>
            </div>
        </div>

        <div class="content">
            <!--用户还喜欢-->
            <div class="l_history">
                <div class="fav_t">用户还喜欢</div>
                <ul>
                    <li>
                        <div class="img"><a href="#"><img src="images/his_1.jpg" /></a></div>
                        <div class="name"><a href="#">科爱KEAL儿童日本书包减负护脊</a></div>
                        <div class="price">
                            <span>¥599</span>
                        </div>
                    </li>
                    <li>
                        <div class="img"><a href="#"><img src="images/his_2.jpg" /></a></div>
                        <div class="name"><a href="#">科爱KEAL小学生减负护脊书包超轻</a></div>
                        <div class="price">
                            <span>¥79</span>
                        </div>
                    </li>
                    <li>
                        <div class="img"><a href="#"><img src="images/his_3.jpg"/></a></div>
                        <div class="name"><a href="#">珠韵首饰 天然白色珍珠项链</a></div>
                        <div class="price">
                            <span>¥339</span>
                        </div>
                    </li>
                    <li>
                        <div class="img"><a href="#"><img src="images/his_4.jpg" /></a></div>
                        <div class="name"><a href="#">珠韵首饰 新品18K黄金珍珠耳钉</a></div>
                        <div class="price">
                            <span>¥1860</span>
                        </div>
                    </li>
                    <li>
                        <div class="img"><a href="#"><img src="images/his_5.jpg" /></a></div>
                        <div class="name"><a href="#">珠韵首饰 姝丽大珍珠项链</a></div>
                        <div class="price">
                            <span>¥758</span>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="l_list">
                <!--推荐搭配-->
                <div class="des_border">
                    <div class="des_tit">
                        <ul>
                            <li class="current">推荐搭配</li>
                        </ul>
                    </div>
                    <div class="team_list">
                        <div class="img"><a href="#"><img src="images/mat_1.jpg" /></a></div>
                        <div class="name"><a href="#">粤通国际珠宝 999足金</a></div>
                        <div class="price">
                            <div class="checkbox">
                                <input type="checkbox" name="zuhe" checked="checked"/>
                            </div>
                           <span>￥76</span>
                        </div>
                    </div>
                    <div class="team_icon"><img src="images/jia_b.gif"/></div>
                    <div class="team_list">
                        <div class="img"><a href="#"><img src="images/mat_2.jpg"/></a></div>
                        <div class="name"><a href="#">珠韵 9.5-10.5mm珍珠项链</a></div>
                        <div class="price">
                            <div class="checkbox">
                                <input type="checkbox" name="zuhe"/>
                            </div>
                            <span>￥1890</span>
                        </div>
                    </div>
                    <div class="team_icon"><img src="images/jia_b.gif"/></div>
                    <div class="team_list">
                        <div class="img"><a href="#"><img src="images/mat_3.jpg"/></a></div>
                        <div class="name"><a href="#">清新耳环</a></div>
                        <div class="price">
                            <div class="checkbox">
                                <input type="checkbox" name="zuhe" checked/>
                            </div>
                            <span>￥232</span>
                        </div>
                    </div>
                    <div class="team_icon"><img src="images/equl.gif"/></div>
                    <div class="team_sum">
                        套餐价：￥<span>2000</span><br/>
                        <input type="text" value="1" class="sum_ipt"/><br/>
                        <a href="#"><img src="images/z_buy.gif"/></a>
                    </div>
                </div>
                <!--商品属性-->
                <div class="des_border">
                    <div class="des_tit">
                        <ul>
                            <li class="current"><a href="#p_attribute">商品属性</a></li>
                            <li><a href="#p_details">商品详情</a></li>
                            <li><a href="#p_comment">商品评论</a></li>
                        </ul>
                    </div>
                    <div class="des_con" id="p_attribute">
                        <table border="0" align="center" style="width:100%; margin:10px auto;"
                               cellspacing="0" cellpadding="0">
                            <tr>
                                <td>商品名称：天然淡水珍珠</td>
                                <td>商品编号：1546211</td>
                                <td>品牌： 珠韵首饰</td>
                                <td>上架时间：2015-09-06 09:19:09</td>
                            </tr>
                            <tr>
                                <td>商品毛重：160.00g</td>
                                <td>商品产地：法国</td>
                                <td>珍珠形状：正圆</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>镶嵌材质：纯银</td>
                                <td>款式：项链</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <!--商品详情-->
                <div class="des_border" id="p_details">
                    <div class="des_t">商品详情</div>
                    <div class="des_con">

                        <p align="center">
                            <img src="<%=basePath %>statics/images/de2.jpg"/><br/><br/>
                            <img src="<%=basePath %>statics/images/de3.jpg"/><br/><br/>
                            <img src="<%=basePath %>statics/images/de4.jpg"/><br/><br/>
                            <img src="<%=basePath %>statics/images/de5.jpg"/><br/><br/>
                            <img src="<%=basePath %>statics/images/de6.jpg"/><br/><br/>
                            <img src="<%=basePath %>statics/images/de7.jpg"/><br/><br/>
                            <img src="<%=basePath %>statics/images/de8.jpg"/><br/><br/>
                        </p>

                    </div>
                </div>
                <!--商品评论-->
                <div class="des_border" id="p_comment">
                    <div class="des_t">商品评论</div>
                    <table border="0" class="jud_tab" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="175" class="jud_per">
                                <p>80.0%</p>好评度
                            </td>
                            <td width="300">
                                <table border="0" style="width:100%;" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="90">好评<font color="#999999">（80%）</font></td>
                                        <td><img src="images/pl.gif" align="absmiddle"/></td>
                                    </tr>
                                    <tr>
                                        <td>中评<font color="#999999">（20%）</font></td>
                                        <td><img src="images/pl.gif" align="absmiddle"/></td>
                                    </tr>
                                    <tr>
                                        <td>差评<font color="#999999">（0%）</font></td>
                                        <td><img src="images/pl.gif" align="absmiddle"/></td>
                                    </tr>
                                </table>
                            </td>
                            <td width="185" class="jud_bg">
                                购买过珠韵首饰 天然银扣珍珠项链的顾客，在收到商品才可以对该商品发表评论
                            </td>
                            <td class="jud_bg">您可对已购买商品进行评价<br/><a href="#"><img src="<%=basePath %>statics/images/btn_jud.gif"/></a></td>
                        </tr>
                    </table>
                    <table border="0" class="jud_list" style="width:100%; margin-top:30px;" cellspacing="0" cellpadding="0">
                        <tr valign="top">
                            <td width="160"><img src="<%=basePath %>statics/images/peo1.jpg" width="20" height="20" align="absmiddle"/>&nbsp;向死而生
                            </td>
                            <td width="180">
                                颜色分类：<font color="#999999">粉色</font> <br/>
                                型号：<font color="#999999">43cm</font>
                            </td>
                            <td>
                                产品很好，香味很喜欢，必须给赞。 <br/>
                                <font color="#999999">2015-09-24</font>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td width="160"><img src="<%=basePath %>statics/images/peo2.jpg" width="20" height="20" align="absmiddle"/>&nbsp;就是这么想的
                            </td>
                            <td width="180">
                                颜色分类：<font color="#999999">粉色</font> <br/>
                                型号：<font color="#999999">43cm</font>
                            </td>
                            <td>
                                送朋友，她很喜欢，大爱。 <br/>
                                <font color="#999999">2015-09-24</font>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td width="160"><img src="<%=basePath %>statics/images/peo3.jpg" width="20" height="20" align="absmiddle"/>&nbsp;墨镜墨镜
                            </td>
                            <td width="180">
                                颜色分类：<font color="#999999">白色</font> <br/>
                                型号：<font color="#999999">43cm</font>
                            </td>
                            <td>
                                大家都说不错<br/>
                                <font color="#999999">2015-09-24</font>
                            </td>
                        </tr>
                        <tr valign="top">
                            <td width="160"><img src="<%=basePath %>statics/images/peo4.jpg" width="20" height="20" align="absmiddle"/>&nbsp;那*****洋
                                <br/><font color="#999999">（匿名用户）</font></td>
                            <td width="180">
                                颜色分类：<font color="#999999">白色</font> <br/>
                                型号：<font color="#999999">43cm</font>
                            </td>
                            <td>
                                下次还会来买，推荐。<br/>
                                <font color="#999999">2015-09-24</font>
                            </td>
                        </tr>
                    </table>
                    <div class="pages">
                        <a href="#" class="p_pre">上一页</a><a href="#" class="cur">1</a><a href="#">2</a><a
                            href="#">3</a>...<a href="#">20</a><a href="#" class="p_pre">下一页</a>
                    </div>
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
            <li>
                <a><img src="<%=basePath %>statics/images/b1.png" width="62" height="62"/></a>
                <div><h2>正品保障</h2>正品行货 放心购买</div>
            </li>
            <li >
                <a><img src="<%=basePath %>statics/images/b2.png" width="62" height="62"/></a>
                <div><h2>满38包邮</h2>满38包邮 免运费</div>
            </li>
            <li>
                <a><img src="<%=basePath %>statics/images/b3.png" width="62" height="62"/></a>
                <div><h2>天天低价</h2>天天低价 畅选无忧</div>
            </li>
            <li>
                <a><img src="<%=basePath %>statics/images/b4.png" width="62" height="62"/></a>
                <div><h2>准时送达</h2>收货时间由你做主</div>
            </li>
        </ul>
    </div>
    <div class="b_nav">
        <dl>
            <dt><a href="#">新手上路</a></dt>
            <dd><a href="#">售后流程</a></dd>
            <dd><a href="#">购物流程</a></dd>
            <dd><a href="#">订购方式</a></dd>
            <dd><a href="#">隐私声明</a></dd>
            <dd><a href="#">推荐分享说明</a></dd>
        </dl>
        <dl>
            <dt><a href="#">配送与支付</a></dt>
            <dd><a href="#">货到付款区域</a></dd>
            <dd><a href="#">配送支付查询</a></dd>
            <dd><a href="#">支付方式说明</a></dd>
        </dl>
        <dl>
            <dt><a href="#">会员中心</a></dt>
            <dd><a href="#">资金管理</a></dd>
            <dd><a href="#">我的收藏</a></dd>
            <dd><a href="#">我的订单</a></dd>
        </dl>
        <dl>
            <dt><a href="#">服务保证</a></dt>
            <dd><a href="#">退换货原则</a></dd>
            <dd><a href="#">售后服务保证</a></dd>
            <dd><a href="#">产品质量保证</a></dd>
        </dl>
        <dl>
            <dt><a href="#">联系我们</a></dt>
            <dd><a href="#">网站故障报告</a></dd>
            <dd><a href="#">购物咨询</a></dd>
            <dd><a href="#">投诉与建议</a></dd>
        </dl>
        <div class="b_tel_bg">
            <a href="#" class="b_sh1">新浪微博</a>
            <a href="#" class="b_sh2">腾讯微博</a>

            <p>
                服务热线：<br/>
                <span>400-123-4567</span>
            </p>
        </div>
        <div class="b_er">
            <div class="b_er_c"><img src="<%=basePath %>statics/images/er.gif" /></div>
            <img src="<%=basePath %>statics/images/ss.png"/>
        </div>
    </div>
    <div class="btmbg">
        <div class="btm">
            备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com Copyright© 1号店网上超市 2007-2016，All Rights Reserved. 复制必究 ,
            Technical Support: Dgg Group <br/>
            <img src="<%=basePath %>statics/images/b_1.gif"/>
            <img src="<%=basePath %>statics/images/b_2.gif"/>
            <img src="<%=basePath %>statics/images/b_3.gif"/>
            <img src="<%=basePath %>statics/images/b_4.gif"/>
            <img src="<%=basePath %>statics/images/b_5.gif"/>
            <img src="<%=basePath %>statics/images/b_6.gif"/>
        </div>
    </div>
    <!--Footer -->
</footer>
</body>
<script src="<%=basePath %>statics/js/jquery-1.11.1.min.js"></script>
<script src="<%=basePath %>statics/js/Product.js"></script>
<script src="<%=basePath %>statics/js/public.js"></script>
<script type="text/javascript">
		$(function() {
		    var $msg1 = $("#msg1");
			var $msg2 = $("#msg2");
		
			var $productShowArea = $("#productShowArea");
			
			$productShowArea.on("click",".addcar",function () {
			
		   
              var  productid = $(this).attr("id");//获取商品id
             
            var  userid =$(this).attr("name");//获取userid属性  用来判断有无
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
			
			
			
			
		
		
	});
	</script>

</html>
