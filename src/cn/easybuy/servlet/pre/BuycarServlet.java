package cn.easybuy.servlet.pre;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.easybuy.entity.Buycar;
import cn.easybuy.service.BuycarService;
import cn.easybuy.service.impl.BuycarServiceImpl;

/**
 * Servlet implementation class BuycarServlet
 */
@WebServlet(description = "购物车的系列后台操作", urlPatterns = { "/BuycarServlet" })
public class BuycarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuycarServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String contextPath = request.getContextPath();
		PrintWriter out = response.getWriter();// 初始化准备

		BuycarService buycarService=new BuycarServiceImpl();



		String opr = request.getParameter("opr");// 判断操作种类

		if(opr.equals("addbuycar")){
			String userid = request.getParameter("userid");
			String productid = request.getParameter("productid");
			String backJSON="";
			if(userid.equals("")||userid==null||userid.length()==0){//游客在添加购物车 进行cookie操作
				Cookie [] cookies=request.getCookies();//获取全部cookie
				if(cookies!=null){
					boolean exist=false;
					for(int i=0;i<cookies.length;i++){
						if(cookies[i].getName().equals(productid)){//判断有没有存储该商品信息的cookie
							int nowValue=Integer.parseInt( cookies[i].getValue()) ;
							cookies[i].setValue(String.valueOf(nowValue+1));
							response.addCookie(cookies[i]);//一定要记住要再放回去
							exist=true;
							break;//中断循环

						}
					}
					if(!exist){//如果不存在 生成新cookie
						Cookie cookie =new Cookie(productid, "1");
						cookie.setMaxAge(3600);
						response.addCookie(cookie);

					}

				}
				backJSON="[{\"status\":\"success\"}]";


			}else{//用户在添加购物车，进行数据库操作
				int result =-1;
				Buycar buycar=new Buycar();
				buycar.setProductId(Integer.parseInt(productid));
				buycar.setQuantity(1);
				buycar.setUserId(Integer.parseInt(userid));
				try {
					result=buycarService.addBuycar(buycar);//servcie层已经做去重处理，此处不需要处理
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(result>0){
					backJSON="[{\"status\":\"success\"}]";
				}else if(result==0){
					backJSON="[{\"status\":\"exist\"}]";
				}else{
					backJSON="[{\"status\":\"error\"}]";
				}

			}

			out.print(backJSON);


		}else if(opr.equals("delbuycar")){
			String backJSON = "";
			String buycarid = request.getParameter("buycarid");
			String productid = request.getParameter("productid");
			
			if(buycarid.equals("0")){
				
				boolean is=false;
				Cookie[] cookies = request.getCookies();
				if(cookies !=null){
					for(int i = 0;i < cookies.length;i++){
						if(cookies[i].getName().equals(productid)){
							is=true;
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
							
						}
						
					}
				}
				
				
				if(is){
				backJSON="[{\"status\":\"success\"}]";	
				}else{
					backJSON="[{\"status\":\"error\"}]";
				}
				
				
			
			}else{
				int id = Integer.parseInt(buycarid);
				BuycarService bs = new BuycarServiceImpl();
				int result = 0;
				try {
					result = bs.deleteById(id);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}


				if(result>0){
					backJSON="[{\"status\":\"success\"}]";
				}else if(result==0){
					backJSON="[{\"status\":\"exist\"}]";
				}else{
					backJSON="[{\"status\":\"error\"}]";
				}

			}
			
			out.print(backJSON);

		} else if (opr.equals("change")){
			String count = request.getParameter("count");
			String buycarid = request.getParameter("buycarid");
			String product = request.getParameter("product");
			BuycarService bs = new BuycarServiceImpl();
			Buycar buycar = null;
			try {
				buycar = bs.getBuycarById(Integer.parseInt(buycarid));
				if(buycar == null){
					Cookie[] cookies = request.getCookies();
					if(cookies != null){
						for(int i = 0;i < cookies.length;i++){
							if(cookies[i].getName().equals(product)){
								cookies[i].setValue(count);
							}else{
								Cookie cookie =new Cookie(product, count);
								cookie.setMaxAge(3600);
								response.addCookie(cookie);
							}
						}
					}
				}else{
					buycar.setQuantity(Integer.parseInt(count));
					bs.updateBuycar(buycar);
				}
				
			} catch (NumberFormatException e1) {
				e1.printStackTrace();
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
		}

		out.flush();
		out.close();

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
