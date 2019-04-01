package com.manage;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.EASYBUY_COMMENT;
import com.dao.EASYBUY_COMMENTDao;

public class ChaManage extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
 		ArrayList<EASYBUY_COMMENT> list = EASYBUY_COMMENTDao.selectAll();
 		//¼Ä°ü¹ü
 	 	req.setAttribute("list", list);
 		//×ª·¢
 	 	req.getRequestDispatcher("guestbook.jsp").forward(req,resp);
 	}
}
