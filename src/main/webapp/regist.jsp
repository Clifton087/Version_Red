<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<html>
<head>
	<title>regist</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />

	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script type="application/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body>
<div id="wrap">
	<div id="top_content">
		<div id="header">
			<div id="rightheader">
				<p>
					2009/11/20
					<br />
				</p>
			</div>
			<div id="topheader">
				<h1 id="title">
					<a href="#">main</a>
				</h1>
			</div>
			<div id="navigation">
			</div>
		</div>
		<div id="content">
			<p id="whereami">
			</p>
			<h1>
				注册
			</h1>
			<form action="${pageContext.request.contextPath}/admin/add.do" method="post">
				<table cellpadding="0" cellspacing="0" border="0"
					   class="form_table">
					<tr>
						<td valign="middle" align="right">
							用户名:
						</td>
						<td valign="middle" align="left">
							<input type="text" class="inputgri" name="username" /><span id="span"></span>
						</td>
					</tr>
					<tr>
						<td valign="middle" align="right">
							真实姓名:
						</td>
						<td valign="middle" align="left">
							<input type="text" class="inputgri" name="realname" />
						</td>
					</tr>
					<tr>
						<td valign="middle" align="right">
							密码:
						</td>
						<td valign="middle" align="left">
							<input type="password" class="inputgri" name="password" />
						</td>
					</tr>
					<tr>
						<td valign="middle" align="right">
							性别:
						</td>
						<td valign="middle" align="left">
							男
							<input type="radio" class="inputgri" name="sex" value="m" checked="checked"/>
							女
							<input type="radio" class="inputgri" name="sex" value="f"/>
						</td>
					</tr>
				</table>
				<p>
					<input type="submit" class="button" value="Submit &raquo;" />
				</p>

				<c:if test="${requestScope.message!=null}">
					<script language="javascript">
                        layui.use('layer', function(){
                            var layer = layui.layer;
                            layer.msg('${requestScope.message}');
                        });
					</script>
				</c:if>

			</form>
		</div>
	</div>
	<div id="footer">
		<div id="footer_bg">
			ABC@126.com
		</div>
	</div>
</div>
</body>
</html>
