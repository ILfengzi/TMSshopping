package com.manage;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.EASYBUY_COMMENTDao;

 

public class DelManage extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		int id=Integer.parseInt(request.getParameter("id"));
		int num=EASYBUY_COMMENTDao.del(id);
		if(num>0){
			response.sendRedirect("manage-result.jsp");
			//response.getWriter().print("<script>alert('É¾³ý³É¹¦!');history.back();<script>");
		}else{
			response.getWriter().print("<script>alert('É¾³ýÊ§°Ü!');location.href='SelManage'<script>");
		}
	}
}
