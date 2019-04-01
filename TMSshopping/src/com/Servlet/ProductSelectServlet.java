package com.Servlet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.EASYBUY_PRODUCT;
import com.dao.EASYBUY_PRODUCTDao;
import com.dao.EASYBUY_PRODUCT_CATEGORYDao;

public class ProductSelectServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		
		int cpage = 1;//��ǰҳ��
		int count = 5;//ÿҳ����
		String cp = req.getParameter("cp");
		if(cp!=null){//���ҳ���ϴ�����ҳ��,����ǰҳ���ı��
			cpage = Integer.parseInt(cp);
		}
		//�����ҳ��
		int tpage = 0;
		ArrayList<EASYBUY_PRODUCT> eplist = EASYBUY_PRODUCTDao.selectAll(cpage, count);
		tpage = EASYBUY_PRODUCTDao.totalPage(count);
		
		req.setAttribute("eplist", eplist);
		//��ǰҳ��
		req.setAttribute("cpage", cpage);
		//��ҳ��
		req.setAttribute("tpage", tpage);
		req.getRequestDispatcher("product.jsp").forward(req, resp);
	}
}
