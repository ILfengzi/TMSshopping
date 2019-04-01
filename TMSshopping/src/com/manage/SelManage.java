package com.manage;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.EASYBUY_COMMENT;
import com.dao.EASYBUY_COMMENTDao;

public class SelManage extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//����
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		int page=1; //��ǰҳ��
		int pagesize=3;//ÿҳ����
		String spage=req.getParameter("page");
		if(spage!=null){ //���ҳ���ϴ�����ҳ��,����ǰҳ���ı��
			page=Integer.parseInt(spage);
		
		}
		//�����ҳ��
		ArrayList<EASYBUY_COMMENT> list=EASYBUY_COMMENTDao.selPage(page, pagesize);
		int max_page=EASYBUY_COMMENTDao.getMax(pagesize);
		if(list.size()>0&&max_page>0){ 
			req.setAttribute("list", list);
			//����ҳ�����ݸ�guestbook.jsp ʹ��
			req.setAttribute("max_page", max_page);
			//�ѵ�ǰҳ�����ݸ�guestbook.jspʹ��
			req.setAttribute("page", page);
			// ��
		 	req.getRequestDispatcher("guestbook.jsp").forward(req,resp);
		}else{
			resp.getWriter().print("<script>alert('��ѯʧ�ܣ�');<script>");
		}
 
	
	}
 
}
