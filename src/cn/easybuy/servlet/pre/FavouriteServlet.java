package cn.easybuy.servlet.pre;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.easybuy.entity.Buycar;
import cn.easybuy.entity.Favourite;
import cn.easybuy.service.BuycarService;
import cn.easybuy.service.FavouriteService;
import cn.easybuy.service.impl.BuycarServiceImpl;
import cn.easybuy.service.impl.FavouriteServiceImpl;

/**
 * Servlet implementation class collectionServlet
 */
@WebServlet(description = "添加收藏的系列后台操作", urlPatterns = { "/FavouriteServlet" })
public class FavouriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FavouriteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String contextPath = request.getContextPath();
		PrintWriter out = response.getWriter();// 初始化准备
		String opr = request.getParameter("opr");// 判断操作种类

		FavouriteService favouriteService = new FavouriteServiceImpl();

		if (opr.equals("addfavourite")) {//添加收藏
			String userId = request.getParameter("userid");
			String productId = request.getParameter("productid");
			String backJSON = "";
		

				
				if (userId.equals("") || userId == null || userId.length() == 0) {
					
					backJSON = "[{\"status\":\"notlogin\"}]";

				}else {
					int result=-1;
					Favourite  favourite=new Favourite();
					favourite.setProductId(Integer.parseInt(productId));
					favourite.setUserId(Integer.parseInt(userId));
					try {
						result=favouriteService.addFavourite(favourite);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					if(result>0){
						backJSON = "[{\"status\":\"success\"}]";
					}else if(result==0){
						backJSON = "[{\"status\":\"exist\"}]";
					}else{
						backJSON = "[{\"status\":\"error\"}]";
					}


				}


			out.print(backJSON);

		} else if (opr.equals("delfavourite")) {//取消收藏
			String favouriteid = request.getParameter("favouriteid");
			int id = Integer.parseInt(favouriteid);
			FavouriteService fs = new FavouriteServiceImpl();
			try {
				 fs.delFavouriteById(id);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			out.print("[{\"status\":\"success\"}]");
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
