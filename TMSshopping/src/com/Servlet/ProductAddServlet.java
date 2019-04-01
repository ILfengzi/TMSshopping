package com.Servlet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.EASYBUY_PRODUCT_CATEGORY;
import com.dao.EASYBUY_PRODUCT_CATEGORYDao;

public class ProductAddServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		ArrayList<EASYBUY_PRODUCT_CATEGORY> flist = EASYBUY_PRODUCT_CATEGORYDao.selectFather();
		req.setAttribute("flist", flist);
		ArrayList<EASYBUY_PRODUCT_CATEGORY> clist = EASYBUY_PRODUCT_CATEGORYDao.selectChild();
		req.setAttribute("clist", clist);
		req.getRequestDispatcher("product-add.jsp").forward(req, resp);
	}
}
