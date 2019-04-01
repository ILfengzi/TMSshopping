package com.Servlet;


import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.EASYBUY_COMMENT;
import com.dao.EASYBUY_COMMENTDao;

public class GueServlet extends HttpServlet {
		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			//����
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			//2.ȡֵ ----
			String guestName=request.getParameter("guestName");
			// String name=request.getParameter("name");
			String guestContent=request.getParameter("guestContent");
			//��dateתΪString 
			Date date=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			String time=sdf.format(date).toString();
			//System.out.println(guestContent);
			EASYBUY_COMMENT comment=new EASYBUY_COMMENT(0,guestContent,time,"",null,guestName);
			int num=EASYBUY_COMMENTDao.insert(comment);
			if(num>0){
				  response.sendRedirect("SelallServlet");
			}else{
				response.getWriter().print("<script>alert('���ʧ�ܣ�');history.back();</script>");
			
			}
			
		}
		
	}
