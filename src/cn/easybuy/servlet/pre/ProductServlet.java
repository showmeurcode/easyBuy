package cn.easybuy.servlet.pre;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import cn.easybuy.entity.Product;
import cn.easybuy.service.ProductService;
import cn.easybuy.service.impl.ProductServiceImpl;
import cn.easybuy.util.Page;


public class ProductServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		PrintWriter out = resp.getWriter();
		String opr = req.getParameter("opr");
		if("productlist".equals(opr)){
			/*
			String type1 = req.getParameter("type1");	//几级分类
			String type2 = req.getParameter("type2"); 	//产品分类
			String pageIndex = req.getParameter("pageIndex");//获得当前页数
			ProductService prs = new ProductServiceImpl();
			
			List<Product> list1 = null;
			try {
				list1 = prs.getAllPrductsByCid(Integer.parseInt(type1), Integer.parseInt(type2));
			} catch (NumberFormatException e1) {
				//					TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (SQLException e1) {
				//					TODO Auto-generated catch block
				e1.printStackTrace();
			}
			int size = 0;
			if(list1 == null){
				size = 0;
			}else{
				size = list1.size();
			}
			if (pageIndex == null
					|| (pageIndex = pageIndex.trim()).length() == 0) {
				pageIndex = "1";
			}
			int currPageNo = Integer.parseInt(pageIndex);
			if (currPageNo < 1)
				currPageNo = 1;
			Page pageObj = new Page();

			pageObj.setCurrPageNo(currPageNo); // 设置当前页码
			pageObj.setPageSize(20); // 设置每页显示条数

			try {
				prs.findPageObj(Integer.parseInt(type1), Integer.parseInt(type2), pageObj);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			req.setAttribute("pageObj", pageObj);	//分页信息
			req.setAttribute("size", size); 	//此分类下商品的所有数量
			req.setAttribute("list1", list1); 	//所有商品集合
			
			req.getRequestDispatcher("/pre/categorylist.jsp").forward(req, resp);
			*/
		}else if("listproductnowpage".equals(opr)){  //当页ajax动态加载

			String type = req.getParameter("type");	//几级分类
			String id= req.getParameter("id"); 	//分类id
			String pageIndex = req.getParameter("pageIndex");//获得当前页数
			
			ProductService productService = new ProductServiceImpl();
			
			Page pageObj = new Page();//生成page对象
			
			if (pageIndex == null
					|| (pageIndex = pageIndex.trim()).length() == 0) {
				pageIndex = "1";
			}
			
			pageObj.setCurrPageNo(Integer.parseInt(pageIndex)); // 设置当前页码
			pageObj.setPageSize(2); // 设置每页显示条数

			try {
				productService.findPageObj(Integer.valueOf(type), Integer.valueOf(id), pageObj);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			String productJSON=JSON.toJSONStringWithDateFormat(pageObj,"yyyy-MM-dd HH:mm", 
					SerializerFeature.WriteMapNullValue);
			
			out.print("[{\"type\":\""+type+"\",\"id\":\""+id+"\"},"+productJSON+"]");
			
		}else if("loadmostnew".equals(opr)){
			ProductService productService=new ProductServiceImpl();
			String html="";
			try {
				String type=req.getParameter("type");
				String id=req.getParameter("id");
				List<Product> ptlist =productService.getAllPrductsByCid(Integer.parseInt(type), Integer.parseInt(id));

				for(Product product:ptlist){
					html+="<li><div class='name'><a href='pre/productdetail.jsp?productid="+product.getId()+"'>"+product.getName()
							+"</a></div><div class='price'><span>"+product.getPrice()
							+"</span></div><div class='img'><a href='pre/productdetail.jsp?productid="+product.getId()+"'><img src='statics/images/"+product.getFileName()+"'  /></a></div></li>";

				}
				
				out.print(html);
				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		out.flush();
		out.close();

	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		this.doGet(req, resp);
	}
}
