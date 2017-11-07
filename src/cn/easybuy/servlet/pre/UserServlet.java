package cn.easybuy.servlet.pre;

import java.io.IOException;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import cn.easybuy.entity.Buycar;
import cn.easybuy.service.impl.BuycarServiceImpl;
import cn.easybuy.service.impl.ProductServiceImpl;

import cn.easybuy.entity.User;
import cn.easybuy.service.UserService;
import cn.easybuy.service.impl.UserServiceImpl;
import cn.easybuy.util.MathUtil;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet(description = "用户和管理员的系列操作管理", urlPatterns = { "/UserServlet" })
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	@SuppressWarnings("null")
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String contextPath = request.getContextPath();
		PrintWriter out = response.getWriter();// 初始化准备


		String opr = request.getParameter("opr");// 判断操作种类



		if (opr.equals("login")) {
			UserService userService = new UserServiceImpl();
			String name = request.getParameter("userName");
			String password = request.getParameter("password");
			String [] isRemember=request.getParameterValues("isRemember");
			User user = null;

			try {
				user = userService.userLogin(name, password);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if (user == null) {
				out.print("<script type='text/javascript'>");
				out.print("alert('账户密码错误！');");
				out.print("history.back();");
				out.print("</script>");
			} else {




				if (user.getType() == 0) {// 代表前台用户


					if(isRemember!=null){

						Cookie cookie1=new Cookie("username",URLEncoder.encode(name,"UTF-8"));//生成用户名和密码cookie
						Cookie cookie2=new Cookie("userpassword",URLEncoder.encode(password,"UTF-8"));
						cookie1.setMaxAge(3600*24);
						cookie2.setMaxAge(3600*24);
						response.addCookie(cookie1);
						response.addCookie(cookie2);//千万记得要放回
					}
					
					/*将cookie里的购物车数据取出，放入在登用户的购物车里，同时设置这些cookie失效。*/
					Cookie[] cookies = request.getCookies();
					if(cookies!=null){
					  
					   try {
						for (int i = 0; i < cookies.length; i++) {
						    
							  String productid = cookies[i].getName();
							  String quantity = cookies[i].getValue();
							  if(MathUtil.isNumeric(productid)&&MathUtil.isNumeric(quantity)){
							      if(new ProductServiceImpl().findProductByid(Integer.parseInt(productid))!=null){//证明是有效cookie  
							        Buycar buycar = new Buycar();
							        buycar.setProductId(Integer.parseInt(productid));
							        buycar.setQuantity(Integer.parseInt(quantity));
							        buycar.setUserId(user.getId());
							        new BuycarServiceImpl().addBuycar(buycar);
							        cookies[i].setMaxAge(0);//使当前cookie失效
							        response.addCookie( cookies[i]);
							        
							      }
							  
							  }
							 
						   }
					} catch (NumberFormatException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					}
					
					
					request.getSession(). setAttribute("user", user);
					request.getRequestDispatcher("/pre/index.jsp").forward(
							request, response);

				} else {// 代表后台用户在登录
					Cookie cookie1=new Cookie("adminname",URLEncoder.encode(name,"UTF-8"));
					Cookie cookie2=new Cookie("adminpassword",URLEncoder.encode(password,"UTF-8"));
					cookie1.setMaxAge(3600);
					cookie2.setMaxAge(3600);
					response.addCookie(cookie1);
					response.addCookie(cookie2);
					if(isRemember!=null){
						request.getSession(). setAttribute("admin", user);
						request.getRequestDispatcher("").forward(request, response);
					}
				}

			}

		} else if (opr.equals("checkrepeat")){
			boolean used = false;
			String name = request.getParameter("name");
			try {
				if (new UserServiceImpl().findUserByname(name)!=null) {

					used = true;
				} else {
					used = false;

				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			out.print(used);
		}else if (opr.equals("register")){
			int result=-1;
			String userName=request.getParameter("tname");//真实姓名
			String loginName=request.getParameter("name");//登录名

			String password =request.getParameter("password");
			int sex =Integer.parseInt( request.getParameter("gender"));
			String email =request.getParameter("email");
			String identityCode =request.getParameter("ID");
			String mobile =request.getParameter("phone");

			User user=new User();

			user.setUserName(userName);
			user.setLoginName(loginName);
			user.setPassword(password);
			user.setSex(sex);
			user.setEmail(email);
			user.setIdentityCode(identityCode);
			user.setMobile(mobile);

			try {
				result=new UserServiceImpl().addUser(user);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(result>0){
				out.print("<script type='text/javascript'>");
				out.print("alert('注册成功！');");
				out.print("location.href='pre/loginpage.jsp';");
				out.print("</script>");

			}else{
				out.print("<script type='text/javascript'>");
				out.print("alert('注册失败请联系管理员！');");
				out.print("history.back();");
				out.print("</script>");
			}


		}else if(opr.equals("checkout")){//登出

			Cookie[] cookies = request.getCookies();
			//			out.print(cookies[i].getValue());
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					if (cookies[i].getName().equals("username")) {

						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);

					} else if (cookies[i].getName().equals("userpassword")) {

						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
					}

				}

			}
			request.getSession(). removeAttribute("user");
			response.sendRedirect("pre/index.jsp");


		}




		out.flush();
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		this.doGet(request, response);
	}

}
