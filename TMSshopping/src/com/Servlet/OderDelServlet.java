package com.Servlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.EASYBUY_ORDERDao;

public class OderDelServlet extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		String id=req.getParameter("id");
		int count=EASYBUY_ORDERDao.del(Integer.parseInt(id));
		if(count>0){
			resp.sendRedirect("manage-result.jsp");
		}else{
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.print("<srcipt>");
			out.print("alert('ɾ��ʧ��');");
			out.print("location.href='ordersel'");
			out.print("</srcipt>");
		}
}
}
