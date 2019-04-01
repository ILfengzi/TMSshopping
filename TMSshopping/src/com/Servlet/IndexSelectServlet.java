package com.Servlet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.EASYBUY_PRODUCT;
import com.bean.EASYBUY_PRODUCT_CATEGORY;
import com.dao.EASYBUY_PRODUCTDao;
import com.dao.EASYBUY_PRODUCT_CATEGORYDao;

public class IndexSelectServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//��ѯ��������
		ArrayList<EASYBUY_PRODUCT_CATEGORY> flist = EASYBUY_PRODUCT_CATEGORYDao.selectFather();
		req.setAttribute("flist", flist);
		ArrayList<EASYBUY_PRODUCT_CATEGORY> clist = EASYBUY_PRODUCT_CATEGORYDao.selectChild();
		req.setAttribute("clist", clist);
		ArrayList<EASYBUY_PRODUCT> tlist = EASYBUY_PRODUCTDao.selectAllByT();
		req.setAttribute("tlist", tlist);
		ArrayList<EASYBUY_PRODUCT> hlist = EASYBUY_PRODUCTDao.selectAllByHot();
		req.setAttribute("hlist", hlist);
		
		HttpSession session = req.getSession();
		//��ѯ����������Ʒ
		ArrayList<Integer> ids = (ArrayList<Integer>)session.getAttribute("ids");
		if(ids!=null){
			ArrayList<EASYBUY_PRODUCT> lastlylist = EASYBUY_PRODUCTDao.selectById(ids);
			req.setAttribute("lastlylist", lastlylist);
		}
		req.getRequestDispatcher("index.jsp").forward(req, resp);
	}
}
