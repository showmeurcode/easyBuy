/**
 * 
 */
package cn.easybuy.servlet.pre;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import cn.easybuy.entity.UserAddress;
import cn.easybuy.service.UserAddressService;
import cn.easybuy.service.impl.UserAddressServiceImpl;

/**
 * @author yinxiaochen
 *
 */
public class UserAddressServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public UserAddressServlet() {
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
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String contextPath = request.getContextPath();
		PrintWriter out = response.getWriter();// 初始化准备
		UserAddressService userAddressService=new UserAddressServiceImpl();
		
		String opr = request.getParameter("opr");// 判断操作种类
		if(opr.equals("addAddress")){
			
			String addressJSON="";
			
			String createTime =  request.getParameter("addAddressTime");
			String userId =  request.getParameter("addAddressuserid");
			String address  =  request.getParameter("addAddressAddress");
			String remark =  request.getParameter("addAddressRemark");
			
			int isDefault=0;
			String[] isDefaults  =  request.getParameterValues("addAddressDefault");
			if(isDefaults!=null){
				isDefault=1;
			}
			UserAddress userAddress=new UserAddress();
			userAddress.setAddress(address);
			userAddress.setCreateTime(createTime);
			userAddress.setUserId(Integer.parseInt(userId));
			userAddress.setIsDefault(isDefault);
			userAddress.setRemark(remark);
			
			List<UserAddress> addressList=null;
			try {
				userAddressService.addAddress(userAddress);
			
			
			 addressList=userAddressService.findAddressByUserId(Integer.parseInt(userId));
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			addressJSON=JSON.toJSONString(addressList,SerializerFeature.WriteNullStringAsEmpty);
			out.print(addressJSON);
		
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
