package com.Servlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.EASYBUY_ORDER;
import com.dao.EASYBUY_ORDERDao;
import com.util.EncodeUtil;

public class OrderDoUServlet extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		EncodeUtil.encode(req);
		String orderId=req.getParameter("orderId");
		String name=req.getParameter("name");
		String addres=req.getParameter("addres");
		String cost=req.getParameter("cost");
		String tatus=req.getParameter("tatus");
		EASYBUY_ORDER order=new EASYBUY_ORDER(Integer.parseInt(orderId), "", name, addres, "", Integer.parseInt(cost), Integer.parseInt(tatus), 1);
		int count=EASYBUY_ORDERDao.update(order);
		if(count>0){
			resp.sendRedirect("manage-result.jsp");
		}else{
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.print("<script>");
			out.print("alert('ĞŞ¸ÄÊ§°Ü');");
			out.print("location.href='ordersel'");
			out.print("</script>");
			out.close();
		}
}
}
