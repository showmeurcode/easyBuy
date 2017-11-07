package cn.easybuy.servlet.pre;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.easybuy.entity.Buycar;
import cn.easybuy.entity.Order;
import cn.easybuy.entity.OrderDetail;
import cn.easybuy.service.BuycarService;
import cn.easybuy.service.OrderDetailService;
import cn.easybuy.service.OrderService;
import cn.easybuy.service.ProductService;
import cn.easybuy.service.impl.BuycarServiceImpl;
import cn.easybuy.service.impl.OrderDetailServiceImpl;
import cn.easybuy.service.impl.OrderServiceImpl;
import cn.easybuy.service.impl.ProductServiceImpl;

public class OrderServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public OrderServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>

	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String contextPath = request.getContextPath();
		PrintWriter out = response.getWriter();// 初始化准备

		String opr = request.getParameter("opr");// 判断操作种类
		OrderService orderService=new OrderServiceImpl();
		OrderDetailService orderDetailService=new OrderDetailServiceImpl();
		BuycarService buycarService=new BuycarServiceImpl();
		ProductService productService= new ProductServiceImpl();

		if(opr.equals("addorder")){
			String  userId =request.getParameter("userId");
			String  loginName =request.getParameter("loginName");
			String  userAddress =request.getParameter("userAddress");
			String  createTime =request.getParameter("createTime");
			String   totalcost=request.getParameter("cost");
			String   status=request.getParameter("status");
			String   type=request.getParameter("type");
			String  serialNumber =request.getParameter("serialNumber");//以上用来生成新订单

			String[] buycarids=request.getParameterValues("buycarids");//用来生成订单详情，同时删除相关购物车条目

			Order order=new Order();
			order.setUserId(userId);
			order.setLoginName(loginName);
			order.setUserAddress(userAddress);
			order.setCreateTime(createTime);
			order.setCost(Float.parseFloat(totalcost));
			order.setStatus(Integer.parseInt(status));
			order.setType(Integer.parseInt(type));
			order.setSerialNumber(serialNumber);

			Order existOrder=null;

			try {
				orderService.addOrder(order);

				existOrder=orderService.findOrderByserialNumber(serialNumber);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}


			int orderid=existOrder.getId();
			OrderDetail orderDetail=null;
			Buycar buycar =null;
			for(int i=0;i<buycarids.length;i++){

				try {
					buycar =buycarService.getBuycarById(Integer.parseInt(buycarids[i]));
				} catch (NumberFormatException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}


				orderDetail=new OrderDetail();
				
				orderDetail.setOrderId(orderid);
				orderDetail.setProductId(buycar.getProductId());
				float price=0;
				try {
					price =  productService.findProductByid(buycar.getProductId()).getPrice();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				orderDetail.setQuantity(buycar.getQuantity());
				orderDetail.setCost(price*((float)buycar.getQuantity()));

				//删除相关购物车条目
				try {
					buycarService.deleteById(buycar.getId());
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}


				try {//加入购物车详情条目
					orderDetailService.addOrderDetail(orderDetail);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}


			request.getRequestDispatcher("/pre/orderbuildsuccess.jsp").forward(request, response);		



		}else if(opr.equals("")){


		}



		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
