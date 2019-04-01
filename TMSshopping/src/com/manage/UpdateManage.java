package com.manage;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.EASYBUY_COMMENT;
import com.dao.EASYBUY_COMMENTDao;

 

public class UpdateManage extends HttpServlet {
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
		EASYBUY_COMMENT comment=EASYBUY_COMMENTDao.selOne(id);
		if(comment!=null){
			request.setAttribute("list",comment);
			request.getRequestDispatcher("guestbook-modify.jsp").forward(request, response);
		}else{
			response.getWriter().print("<script>alert('≤È—Ø ß∞‹£°');history.back();</script>");
		}
	}
}
