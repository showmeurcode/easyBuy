<%@page import="cn.easybuy.entity.ProductCategory"%>
<%@page import="cn.easybuy.service.impl.ProductCategoryServiceImpl"%>
<%@page import="cn.easybuy.service.ProductCategoryService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addproductalist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div>
    	<p>修改商品</p>
    	<form method="post" enctype="multipart/form-data" action="<%=basePath%>backend/procduct_control.jsp?opr=add">
	    	<p>
	    	<%
			           request.setCharacterEncoding("utf-8");
                       ProductCategoryService productCategoryService = new ProductCategoryServiceImpl();
                       List<ProductCategory> list = productCategoryService.getProductCategoryBytype(1);
                       request.setAttribute("list", list);
            %>
			<c:choose>
					<c:when test="${list==null}">
						<%response.sendRedirect("../backend/adminmanager.jsp");%>
					</c:when>
					<c:otherwise>
						一级分类
						<select name="classify1">
					        <c:forEach var="tempProductCategory" items="${list }">
					        	<option value="${tempProductCategory.type}">${tempProductCategory.name}</option>
					        </c:forEach> 
					    </select>
					</c:otherwise>
				</c:choose>
	    	</p>
	    	<p>
	    	<%
			           request.setCharacterEncoding("utf-8");
                       ProductCategoryService productCategoryService2 = new ProductCategoryServiceImpl();
                       List<ProductCategory> list2 = productCategoryService2.getProductCategoryBytype(2);
                       request.setAttribute("list2", list2);
            %>
			<c:choose>
					<c:when test="${list==null}">
						<%response.sendRedirect("../backend/adminmanager.jsp");%>
					</c:when>
					<c:otherwise>
						二级分类
						<select name="classify2">
					        <c:forEach var="tempProductCategory" items="${list2 }" varStatus="n">
					        	<option value="${tempProductCategory.type}">${tempProductCategory.name}</option>	
					        </c:forEach> 
				        </select>
					</c:otherwise>
				</c:choose>
    		</p>
    		<p>
    		<%
			           request.setCharacterEncoding("utf-8");
                       ProductCategoryService productCategoryService3 = new ProductCategoryServiceImpl();
                       List<ProductCategory> list3 = productCategoryService3.getProductCategoryBytype(3);
                       request.setAttribute("list3", list3);
            %>
			<c:choose>
					<c:when test="${list==null}">
						<%response.sendRedirect("../backend/adminmanager.jsp");%>
					</c:when>
					<c:otherwise>
						三级分类
						<select name="classify3">
					        <c:forEach var="tempProductCategory" items="${list3 }" varStatus="n">
					        	<option value="${tempProductCategory.type}">${tempProductCategory.name}</option>
					        </c:forEach> 
				        </select>
					</c:otherwise>
				</c:choose>
    		</p>
    		<p>商品名称<input type="text" name="name" required>(必填)</p>
    		
    		<p>商品图片<input type="file" name="picture"></p>	  
    		
			<p>单价<input type="text" name="rice" required></p>
             
         	<p>库存<input type="text" name="stock" required></p>
         	
         	<p>描述<textarea rows="2" cols="10" name="represent">订单</textarea></p>
         	
         	<input type="submit" value="确认上传" >
    	</form>
    
    </div>
  </body>
</html>
