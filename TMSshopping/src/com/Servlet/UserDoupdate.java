package com.Servlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.EASYBUY_USER;
import com.dao.EASYBUY_USERDao;
import com.util.EncodeUtil;

public class UserDoupdate extends HttpServlet {
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		EncodeUtil.encode(req);
		resp.setContentType("text/html;charset=utf-8");
		String username=req.getParameter("userName");
		String name=req.getParameter("name");
		String pwd=req.getParameter("passWord");
		String sex=req.getParameter("sex");
		String birthday=req.getParameter("birthday");
		String email=req.getParameter("email");
		String mobile=req.getParameter("mobile");
		String address=req.getParameter("address");
		EASYBUY_USER user=new EASYBUY_USER(username, name, pwd, sex, birthday,email, mobile, address, 1);
		int count=EASYBUY_USERDao.update(user);
		if(count>0){
			resp.sendRedirect("manage-result.jsp");
		}else{
			PrintWriter out=resp.getWriter();
			out.print("<script>");
			out.print("alert('ĞŞ¸ÄÊ§°Ü');");
			out.print("location.href='user'");
			out.print("</script>");
			out.close();
		}
	}
}
