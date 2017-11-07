<%@page import="cn.easybuy.service.impl.ProductCategoryServiceImpl"%>
<%@page import="cn.easybuy.service.ProductCategoryService"%>
<%@page import="cn.easybuy.entity.ProductCategory"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setCharacterEncoding("utf-8");
ProductCategoryService productCategoryService = new ProductCategoryServiceImpl();
List<ProductCategory> list = null;
list=productCategoryService.getProductCategory();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'ProductCategorylist.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="<%=basePath%>statics/css/pintuer.css">
<link rel="stylesheet" href="<%=basePath%>statics/css/admin.css">

</head>

<body>
	<div class="admin">
		<form method="post">
			<div class="panel admin-panel">
				<div class="panel-head">
					<strong>分类列表</strong>
				</div>
				<div class="padding border-bottom">
					<a href="<%=basePath%>backend/newadd.jsp"><input type="button"
						class="button button-small border-green" value="添加分类" /> </a>
				</div>
				<table class="table table-hover">
					<tr>
						<th width="65">选择</th>
						<th width="160">分类名称</th>
						<th width="*">分类级别</th>
						<th width="100">父级分类</th>
						<th width="100">操作</th>
					</tr>
						<%
				             int n=0;
				             for(ProductCategory ProductCategory:list){
				             n++;	 
                       
                          %>
					<tr>
						<td><input type="checkbox" name="id" value="" /></td>
						<td></td>
						<td></td>
						<td></td>
						<td><a class="button border-blue button-little"
							href="news/newupdate.jsp?tid=&ntid=">修改</a> <a
							class="button border-yellow button-little"
							href="news/news_control.jsp?opr=del&tid="
							onclick="{if(confirm('确认删除?')){return true;}return false;}">删除</a>
						</td>
					</tr>
						<%
                                    }  				
						%>
				</table>
				<div class="panel-foot text-center">
					<ul class="pagination">

						<li><a href="backend/productlist.jsp?opr=list&pageIndex=1">首页</a>
						</li>
						<li><a href="backend/productlist.jsp?opr=list&pageIndex=">上一页</a>
						</li>


					</ul>
					<ul class="pagination pagination-group">

					</ul>
					<ul class="pagination">

						<li><a href="news/newlist.jsp?opr=list&pageIndex=">下一页</a>
						</li>
						<li><a href="news/newlist.jsp?opr=list&pageIndex=">末页</a>
						</li>


					</ul>
				</div>
			</div>
		</form>
		<br />

	</div>
</body>
<script src="<%=basePath %>statics/js/jquery.js"></script>
<script src="<%=basePath %>statics/js/pintuer.js"></script>
</html>
