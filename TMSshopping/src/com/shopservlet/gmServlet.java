package com.shopservlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.EASYBUY_ORDER_DETAIL;
import com.bean.EASYBUY_USER;
import com.dao.ESDao;
import com.util.EncodeUtil;


public class gmServlet extends HttpServlet {
@Override
protected void service(HttpServletRequest arg0, HttpServletResponse arg1)
		throws ServletException, IOException {
	arg1.setContentType("text/html;charset=utf-8");
	PrintWriter out=arg1.getWriter();
	EncodeUtil.encode(arg0);
	HttpSession session=arg0.getSession();
	EASYBUY_USER list=(EASYBUY_USER)session.getAttribute("name");
	//�û�id
	String id=list.getEU_USER_ID();
	//�û�����
	String name=list.getEU_USER_NAME();
	//�û���ַ
	String address=list.getEU_ADDRESS();
	//�ܼ�Ǯ
	String price=arg0.getParameter("jstext");
	//������Ʒ����

	//String EP_IDs=arg0.getParameter("spID");
	////////////////
	//��Ʒid
	String [] EP_ID=arg0.getParameterValues("spID");
	//��������
	String [] quantity=arg0.getParameterValues("number");
	//��Ʒ����
	String [] sPPrice=arg0.getParameterValues("sPPrice");
	
	//����pay.jsp����Ʒ����
	String [] sid = arg0.getParameterValues("sid");
	String sids ="";
	StringBuffer sb = new StringBuffer();
	for(int i=0; i<sid.length; i++) {
		sb.append(sid[i]+"*"+quantity[i] + "  ");
	}
	sids = sb.toString();
	
	//��������Ʒ��Ŀ������޸�
	for(int i=0;i<EP_ID.length;i++){
		int count5=ESDao.updateStock(Integer.parseInt(quantity[i]),Integer.parseInt(EP_ID[i]));
	}
	//��Ʒ�����ܼ�
	int [] pprice=new int[EP_ID.length];
	for(int i=0;i<EP_ID.length;i++){
		pprice[i]=Integer.parseInt(quantity[i])*Integer.parseInt(sPPrice[i]);
	} 
	/////////////////�õ�����
	//�����������������
	int count=ESDao.insertDD(id, name, address,Integer.parseInt(price));
	int getSequenceId=ESDao.getSequenceId();
	//ѭ���������������
	for(int i=0;i<EP_ID.length;i++){
		EASYBUY_ORDER_DETAIL eod=new EASYBUY_ORDER_DETAIL(1,getSequenceId,Integer.parseInt(EP_ID[i]),Integer.parseInt(quantity[i]),pprice[i]);
		int count2=ESDao.eodInsert(eod);
	}
	
	
	////////////////////
	// �������޸Ĺ��ﳵ
	String [] esID=arg0.getParameterValues("esID");
	for(int i=0;i<esID.length;i++){
		int count3 =ESDao.esdelete(Integer.parseInt(esID[i]));
	}
	/////
	if(count>0){
			
		session.setAttribute("WIDout_trade_no", EP_ID);//��ƷID
		session.setAttribute("WIDtotal_amount", price);//�ܼ�Ǯ
		session.setAttribute("WIDbody", sids);//��Ʒ����
		out.print("<script>");
		//out.print("alert('����ɹ�');");
		//out.print("location.href='shopping-result.jsp';");
		out.print("location.href='pay.jsp';");
		out.print("</script>");
		out.close();
	}else{
		out.print("<script>");
		out.print("alert('����ʧ�ܣ�������ѡ����Ʒ');");
		out.print("location.href='ShopSelect';");
		out.print("</script>");
		out.close();
	}
}
}
