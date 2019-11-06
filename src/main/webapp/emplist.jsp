<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>emplist</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
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
						Welcome!
					</h1>
					<table class="table">
						<tr class="table_header">
							<td>
								ID
							</td>
							<td>
							    头像
							</td>
							<td>
								姓名
							</td>
							<td>
								工资
							</td>
							<td>
								年龄
							</td>
							<td>
								部门名称
							</td>
							<td>
								操作
							</td>
						</tr>

						<c:forEach items="${employees}" var="emp">
						<tr class="row1">						   
							<td>
								${emp.id}
							</td>
							 <td>
							  <a href="${pageContext.request.contextPath}/emp/download.do?fileName=${emp.image}"><img width="40px" height="40px" src="${pageContext.request.contextPath}/upload/${emp.image}" /></a>
							</td>
							
							<td>
									${emp.name}
							</td>
							<td>
									${emp.salary}
							</td>
							<td>
									${emp.age}
							</td>
							<td>
									${emp.dep.name}
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/emp/remove.do?id=${emp.id}">delete emp</a>&nbsp;<a href="${pageContext.request.contextPath}/emp/showOne.do?id=${emp.id}">update emp</a>
							</td>
						</tr>
						</c:forEach>

					</table>

					<p>
						<a href="${pageContext.request.contextPath}/departments.jsp"><input type="button" class="button" value="返回" /></a>
					</p>


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
