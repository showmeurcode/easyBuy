<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemFactory"%>
<%@page import="cn.easybuy.service.impl.ProductServiceImpl"%>
<%@page import="cn.easybuy.service.ProductService"%>
<%@page import="cn.easybuy.entity.Product"%>
<%@page import="cn.easybuy.service.impl.ProductCategoryServiceImpl"%>
<%@page import="cn.easybuy.service.ProductCategoryService"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

  <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
  	request.setCharacterEncoding("utf-8");
    String opr = request.getParameter("opr");
    ProductService productService=new ProductServiceImpl();
    
    
   //----------书上的--------------
    String uploadFileName="";//上传的文件名
    String fieldName="";//表单字段元素的name属性值
    //请求信息中的内容是否是multipart类型
    boolean isMultipart=ServletFileUpload.isMultipartContent(request);
    //上传文件的存储路径（服务器文件系统上的绝对文件路径）
    String uploadFilePath=request.getSession().getServletContext().getRealPath("statics/images2/");
    //判断是否是文件上传表单
    if(isMultipart){
	    //创建FileItm
	    FileItemFactory factory=new DiskFileItemFactory();
	    ServletFileUpload upload=new ServletFileUpload(factory);
	    
  		//获取FileItem集合
    	List<FileItem> items=upload.parseRequest(request);
    	Iterator<FileItem>iter=items.iterator();
    	while(iter.hasNext()){
    		FileItem item=(FileItem) iter.next();
    		if(item.isFormField()){
    			//注意获取普通组件名称使用getFieldName
    			fieldName=item.getFieldName();
    			String fileName =item.getName();
    			File fullFile=new File(item.getName());
    			File saveFile=new File(uploadFilePath,fullFile.getName());
    			item.write(saveFile);
    			uploadFileName=fullFile.getName();
    			}
    		}
    }else{
    	out.print("非法文件上传");
   	}
    	
    //-----------视频上的---------------
   //创建FileItm
    FileItemFactory factory=new DiskFileItemFactory();
    ServletFileUpload upload=new ServletFileUpload(factory);
    ServletFileUpload.isMultipartContent(request);
    //判断是否是文件上传表单
    boolean isMultipart1=ServletFileUpload.isMultipartContent(request);
    if(isMultipart){
    //获取FileItem集合
    	List<FileItem> items=upload.parseRequest(request);
    	System.out.println("size>>>>>>>>>>"+items.size());
    	for(FileItem item:items){
    		//确定是否是文件组件
    		boolean isFormField=item.isFormField();
    		if(isFormField){
    			//注意获取普通组件名称使用getFieldName
    			String name =item.getFieldName();
    			String value=item.getString();
    			System.out.println("name>>>>>>>>>>"+name+"value>>>>>>>>"+value);
    			
    		}else{
    			String savepath=application.getRealPath("statics/images2");
    			String fileName=item.getName();
    			File file =new File(savepath+"/"+fileName);
    			item.write(file);
    			
    		}
    	}
    }else{
    	out.print("非法文件上传");
    }
    
    if (opr.equals("add")) {//添加
    
    	String categorylevel1=request.getParameter("classify1");
    	String categorylevel2=request.getParameter("classify2");
    	String categorylevel3=request.getParameter("classify3");
    	String name=request.getParameter("name");
    	String fileName=request.getParameter("picture");
    	String price=request.getParameter("rice");
    	String stock=request.getParameter("stock");
    	String description=request.getParameter("represent");
    	
    	Product comment=new Product();
    	
    	comment.setCategoryLevel1(Integer.parseInt(categorylevel1));
    	comment.setCategoryLevel2(Integer.parseInt(categorylevel2));
    	comment.setCategoryLevel3(Integer.parseInt(categorylevel3));
    	comment.setName(name);
    	comment.setFileName(fileName);
    	comment.setPrice(Float.parseFloat(price));
    	comment.setStock(Integer.parseInt(stock));
    	comment.setDescription(description);
    	
    	try {
            productService.addProduct(comment);
	    	out.print("<script type=\"text/javascript\">");
	        out.print("alert(\"添加成功，点击确认返回列表页面\");");
	        out.print("location.href=\"adminmanager.jsp\";");
	        out.print("</script>");
        } catch (Exception e) {
            out.print("<script type=\"text/javascript\">");
            out.print("alert(\"添加失败！请联系管理员查找原因！点击确认返回列表页面\");");
            out.print("location.href=\"adminmanager.jsp\";");
            out.print("</script>");
        }
    	}
   %>

