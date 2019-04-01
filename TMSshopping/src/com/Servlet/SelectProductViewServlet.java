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

public class SelectProductViewServlet extends HttpServlet {
	@SuppressWarnings("unchecked")
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		ArrayList<EASYBUY_PRODUCT_CATEGORY> flist = EASYBUY_PRODUCT_CATEGORYDao.selectFather();
		req.setAttribute("flist", flist);
		ArrayList<EASYBUY_PRODUCT_CATEGORY> clist = EASYBUY_PRODUCT_CATEGORYDao.selectChild();
		req.setAttribute("clist", clist);
		String id = req.getParameter("id");
		HttpSession session = req.getSession();
		//��ѯ����������Ʒ
		ArrayList<Integer> ids = (ArrayList<Integer>)session.getAttribute("ids");
		if(ids==null){
			ids = new ArrayList<Integer>();
		}
		if(ids.size()>=5){
			ids.remove(0);
		}
		//System.out.println(!ids.contains(Integer.parseInt(id)));
		if(id!=null&&(!ids.contains(Integer.parseInt(id)))){
			ids.add(Integer.parseInt(id));
		}
		session.setAttribute("ids", ids);
		ids = (ArrayList<Integer>) session.getAttribute("ids");
		if(ids!=null){
			ArrayList<EASYBUY_PRODUCT> lastlylist = EASYBUY_PRODUCTDao.selectById(ids);
			req.setAttribute("lastlylist", lastlylist);
		}
		//��ѯ��Ʒ
		EASYBUY_PRODUCT p = null;
		if(id!=null){
			p = EASYBUY_PRODUCTDao.selectById(Integer.parseInt(id));
		}
		req.setAttribute("p", p);
		req.getRequestDispatcher("product-view.jsp").forward(req, resp);
	}
}
