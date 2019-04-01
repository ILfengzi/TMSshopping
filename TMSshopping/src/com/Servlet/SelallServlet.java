package com.Servlet;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.EASYBUY_COMMENT;
import com.bean.EASYBUY_PRODUCT_CATEGORY;
import com.bean.EASYBUY_USER;
import com.dao.EASYBUY_COMMENTDao;
import com.dao.EASYBUY_PRODUCT_CATEGORYDao;;
public class SelallServlet extends HttpServlet {
			@Override
			protected void service(HttpServletRequest req, HttpServletResponse resp)
					throws ServletException, IOException {
				req.setCharacterEncoding("utf-8");
				resp.setContentType("text/html;charset=utf-8");
				int page=1; //��ǰҳ��
				int pagesize=2;//ÿҳ����
				String spage=req.getParameter("page");
				ArrayList<EASYBUY_PRODUCT_CATEGORY> flist = EASYBUY_PRODUCT_CATEGORYDao.selectFather();
				req.setAttribute("flist", flist);
				ArrayList<EASYBUY_PRODUCT_CATEGORY> clist = EASYBUY_PRODUCT_CATEGORYDao.selectChild();
				req.setAttribute("clist", clist);
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
					//resp.getWriter().print("<script>alert('��ѯʧ�ܣ�');</script>");
					req.setAttribute("list", list);
					//����ҳ�����ݸ�guestbook.jsp ʹ��
					req.setAttribute("max_page", max_page);
					//�ѵ�ǰҳ�����ݸ�guestbook.jspʹ��
					req.setAttribute("page", page);
					// ��
				 	req.getRequestDispatcher("guestbook.jsp").forward(req,resp);
				}
				
			
			}
		 
		}
  
