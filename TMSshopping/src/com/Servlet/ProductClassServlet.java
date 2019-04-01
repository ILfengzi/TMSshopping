package com.Servlet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.EASYBUY_PRODUCT_CATEGORY;
import com.dao.EASYBUY_PRODUCT_CATEGORYDao;

public class ProductClassServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ArrayList<EASYBUY_PRODUCT_CATEGORY> epclist = EASYBUY_PRODUCT_CATEGORYDao.selectAll();
		req.setAttribute("epclist", epclist);
		req.getRequestDispatcher("productClass.jsp").forward(req, resp);
	}
}
