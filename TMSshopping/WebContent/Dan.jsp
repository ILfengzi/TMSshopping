<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商城-首页</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript" src="scripts/function.js"></script>

<script language="javascript">
	function ScrollImgLeft() {
		var speed = 20
		var scroll_begin = document.getElementById("scroll_begin");
		var scroll_end = document.getElementById("scroll_end");
		var scroll_div = document.getElementById("scroll_div");
		scroll_end.innerHTML = scroll_begin.innerHTML
		function Marquee() {
			if (scroll_end.offsetWidth - scroll_div.scrollLeft <= 0)
				scroll_div.scrollLeft -= scroll_begin.offsetWidth
			else
				scroll_div.scrollLeft++
		}
		var MyMar = setInterval(Marquee, speed)
		scroll_div.onmouseover = function() {
			clearInterval(MyMar)
		}
		scroll_div.onmouseout = function() {
			MyMar = setInterval(Marquee, speed)
		}
	}
	function selectname() {
		var name = document.getElementById("selectname").value;
		location.href = 'selectProductList?name=' + name;
	}
	function searchHot(name) {
		location.href = 'selectProductList?name=' + name;
	}
</script>


</head>
<body>
	<div id="header" class="wrap">
		<div class="help">
			<c:if test="${name!=null}">
				<a href="selectdd?dd=${name.EU_USER_ID }">个人订单</a>
			</c:if>
			<c:if test="${name!=null}">当前用户${name.EU_USER_ID }</c:if>
			<a href="ShopSelect" class="shopping">购物车</a>
			<c:if test="${name==null}">
				<a href="login.jsp">登录</a>|<a href="register.jsp">注册</a>
			</c:if>
			<c:if test="${name!=null}">
				<a href="zx">退出</a>
			</c:if>
			<a href="SelallServlet">留言</a>
			<c:if test="${name.EU_STATUS==2}">
				<a href="manage/index.jsp">去后台</a>
			</c:if>
		</div>
		<a href="indexSelect"><button>首页</button></a>
		
	</div>
	<div id="childNav">
		<div class="wrap">
			<ul class="clearfix">
			<li><a>热门搜索</a></li>
				<li class="first"><a href="javascript:searchHot('瓜子')">瓜子</a></li>
				<li><a href="javascript:searchHot('辣条')">辣条</a></li>
				<li><a href="javascript:searchHot('凤爪')">凤爪</a></li>
				<li><a href="javascript:searchHot('泡面')">泡面</a></li>
				<li><a href="javascript:searchHot('巧克力')">巧克力</a></li>
				<li><a href="javascript:searchHot('葡萄干')">葡萄干</a></li>
				<li><a href="javascript:searchHot('薯片')">薯片</a></li>
				<li><a href="javascript:searchHot('糖果')">糖果</a></li>
				<li><a href="javascript:searchHot('肉脯')">肉脯</a></li>
				<li><a href="javascript:searchHot('牛奶')">牛奶</a></li> 
				<li><a href="javascript:searchHot('特产')">特产</a></li>
				<li class="last"><input type="text" id="selectname" /><a
					href="javascript:selectname()">搜索</a></li>
			</ul>
		</div>
	</div>
	<div id="main" class="wrap">
		<div class="lefter">
			<div class="box">
				<h2>商品分类</h2>
				<dl>
					<dt>
						<a href="selectProductList">全部商品</a>
					</dt>
					<c:forEach var="f" items="${flist}">
						<dt>
							<a href="selectProductList?fid=${f.EPC_ID }">${f.EPC_NAME }</a>
						</dt>
						<c:forEach var="c" items="${clist}">
							<c:if test="${f.EPC_ID==c.EPC_PARENT_ID}">
								<c:if test="${p.EPC_CHILD_ID!=c.EPC_ID}">
									<dd>
										<a href="selectProductList?cid=${c.EPC_ID }">${c.EPC_NAME }</a>
									</dd>
								</c:if>
							</c:if>
						</c:forEach>
					</c:forEach>
				</dl>
			</div>
			<div class="spacer"></div>
			<div class="last-view">
				<h2>最近浏览</h2>
				<dl class="clearfix">
					<c:forEach var="lastp" items="${lastlylist}">
						<dt>
							<a href="selectProductView?id=${lastp.EP_ID }"><img
								height="40" src="images/product/${lastp.EP_FILE_NAME }" /></a>
						</dt>
						<dd>
							<a href="selectProductView?id=${lastp.EP_ID }">${lastp.EP_NAME }</a>
						</dd>
					</c:forEach>
				</dl>
			</div>
		</div>

		<div class="main">
			<div class="price-off">
				<h2>个人订单</h2>
				<c:if test="${not empty dan}">
					<table border="1" width="600px" height="100px" bordercolor="red">
						<tr align="center">
							<td class="field">订单号</td>
							<td class="field">用户ID</td>
							<td class="field">商品名称</td>
							<td class="field">商品图片</td>
							<td class="field">商品价格</td>
							<td class="field">购买数量</td>
							<td class="field">商品库存</td>
						</tr>
						<c:forEach var="d" items="${dan}">
							<tr align="center">
								<td>${d.EO_ID }</td>
								<td>${d.EO_USER_ID }</td>
								<td>${d.EP_NAME }</td>
								<td><img src="images/product/${d.EP_FILE_NAME }"
									height="100" width="100" /></td>
								<td>${d.EP_PRICE }</td>
								<td>${d.EOD_QUANTITY }</td>
								<td>${d.EP_STOCK }</td>
							</tr>
						</c:forEach>
					</table>
				</c:if>
				<c:if test=" ${dan==null}">
					<a href="indexSelect">快去购买吧</a>
				</c:if>
			</div>

		</div>
	</div>
	<div id="footer">软件项目设计与开发：网上零食商城&nbsp;Jsp+Servlet+Mysql实现 <br> &nbsp;Copyright
		&copy; 2019&nbsp;&nbsp;&nbsp;&nbsp;Designer & Developer：林昌坤、蔡政堂、陈少鑫、梁俊杰</div>
</body>
</html>


