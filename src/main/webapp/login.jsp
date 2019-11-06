<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>login</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css"
			href="${pageContext.request.contextPath}/css/style.css" />

		<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
		<script type="application/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>

		<script type="application/javascript">
            $(function () {
                $(".inputgri").blur(function () {
                    var username = $(".inputgri").val();
                    $.ajax({
                        url:"${pageContext.request.contextPath}/admin/check",
                        type:"GET",
                        data:"username="+username,
                        dataType:"text",
                        success:function (message) {
                            $("#span").text(message);
                        }
                    })
                })
            })
		</script>
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
						登录
					</h1>
					<form action="${pageContext.request.contextPath}/admin/login.do" method="post">
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
									密码:
								</td>
								<td valign="middle" align="left">
									<input type="password" class="inputgri" name="password" />
								</td>
							</tr>
						</table>
						<p>
							<input type="submit" class="button" value="登录" />
							<input type="button" class="button" onclick="location.href='${pageContext.request.contextPath}/regist.jsp'" value="注册" />
						</p>

						<c:if test="${requestScope.message!=null}">
							<script language="javascript">
                                layui.use('layer', function(){
                                    var layer = layui.layer;
                                    layer.msg('${requestScope.message}');
                                });
							</script>
						</c:if>

						<c:if test="${requestScope.msg!=null}">
							<script language="javascript">
                                layui.use('layer', function(){
                                    var layer = layui.layer;
                                    layer.msg('${requestScope.msg}');
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
