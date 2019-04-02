<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>后台管理-商城</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="../scripts/function-manage.js"></script>
<script type="text/javascript" src="..//scripts/calendar.js"></script>
</head>
<body>
	<div id="header" class="wrap">
		<div class="help">
			<a href="../indexSelect"><button>返回前台页面</button></a>
		</div>
		<a href="index.jsp"><button>首页</button></a>
	</div>
	<div id="childNav">
		<div class="welcome wrap">管理员${name.EU_USER_ID}您好，欢迎回到管理后台。</div>
	</div>
	<div id="position" class="wrap">
		您现在的位置：<a href="index.jsp">商城</a> &gt; 管理后台
	</div>
	<div id="main" class="wrap">
		<div id="menu-mng" class="lefter">
			<div class="box">
				<dl>
					<dt>用户管理</dt>
					<dd>
						<em><a href="user-add.jsp">新增</a></em><a href="user">用户管理</a>
					</dd>
					<dt>商品信息</dt>
					<dd>
						<em><a href="productClassAdd">新增</a></em><a href="productClass">分类管理</a>
					</dd>
					<dd>
						<em><a href="productAdd">新增</a></em><a href="productSelect">商品管理</a>
					</dd>
					<dt>订单管理</dt>
					<dd>
						<a href="ordersel">订单管理</a>
					</dd>
					<dt>留言管理</dt>
					<dd>
						<a href="SelManage">留言管理</a>
					</dd>

				</dl>
			</div>
		</div>
		<div class="main">
			<h2>修改用户</h2>
			<div class="manage">
				<form action="userdoupdate">
					<table class="form">
						<tr>
							<td class="field">用户名：</td>
							<td><input type="text" class="text" name="userName"
								value="${user.EU_USER_ID }" readonly="readonly" /></td>
						</tr>
						<tr>
							<td class="field">用户类型：</td>
							<td><input type="text" class="text" name="name"
								value="${user.EU_USER_NAME }" /></td>
						</tr>
						<tr>
							<td class="field">密码：</td>
							<td><input type="text" class="text" name="passWord"
								value="${user.EU_PASSWORD }" /></td>
						</tr>
						<tr>
							<td class="field">性别：</td>
							<td><input type="radio" name="sex" value="男"
								${user.EU_SEX=='男' ? "checked" :""} />男
								 <input type="radio"
								name="sex" value="女" ${user.EU_SEX=='女' ? "checked" :""} />女</td>
						</tr>
						<tr>
							<td class="field">出生日期：</td>
							<td><input type="text" name="birthday"
								onfocus="c.showMoreDay = false;c.show(this);"
								value="${user.EU_BIRTHDAY }" readonly="readonly" /></td>
						</tr>
						<tr>
							<td class="field">邮箱：</td>
							<td><input type="text" class="text" name="email"
								value="${user.EU_EMAIL }" /></td>
						</tr>
						<tr>
							<td class="field">手机号码：</td>
							<td><input type="text" class="text" name="mobile"
								value="${user.EU_MOBILE}" /></td>
						</tr>
						<tr>
							<td class="field">送货地址：</td>
							<td><input type="text" class="text" name="address"
								value="${user.EU_ADDRESS }" /></td>
						</tr>

						<tr>
							<td></td>
							<td><label class="ui-blue"><input type="submit"
									name="submit" value="更新" /></label></td>
						</tr>

					</table>
				</form>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div id="footer">软件项目设计与开发：网上零食商城&nbsp;Jsp+Servlet+Mysql实现 <br> &nbsp;Copyright
		&copy; 2019&nbsp;&nbsp;&nbsp;&nbsp;Designer & Developer：林昌坤、蔡政堂、陈少鑫、梁俊杰</div>
</body>
</html>
