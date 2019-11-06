<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<title>emplist</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
	
		<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
		<script type="application/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>
		
		<script type="application/javascript">
			$(function () {
                var html="";
				$.ajax({
					url:"${pageContext.request.contextPath}/dep/showAll.do",
					type:"GET",
					dataType:"json",
					success:function (message) {
						for (var i=0;i<message.length;i++){
						    html+="<tr class='row1'>"+
                            "<td>"+message[i].id+"</td>"+
                            "<td>"+message[i].number+"</td>"+
                            "<td>"+message[i].name+"</td>"+
                            "<td><a href='${pageContext.request.contextPath}/dep/showOne.do?id="+message[i].id+"'>更新</a>&nbsp;&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/emp/showAll.do?showid="+message[i].number+"'>员工列表</a></td>"+
                            "</tr>";
						}

						console.log(html);
                        $("table").append(html);
                    }
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
						Welcome!
					</h1>
					<table class="table">
						<tr class="table_header">
							<td>
								部门ID
							</td>
							<td>
								部门编号
							</td>
							<td>
								部门名称
							</td>
							<td>
								操作
							</td>
						</tr>

						<c:if test="${requestScope.message!=null}">
							<script language="javascript">
                                layui.use('layer', function(){
                                    var layer = layui.layer;
                                    layer.msg('${requestScope.message}');
                                });
							</script>
						</c:if>

					</table>
					<p>
						<input type="button" class="button" value="添加员工" onclick="location='${pageContext.request.contextPath}/addEmp.jsp'"/> <input type="button" class="button" value="添加部门" onclick="location='${pageContext.request.contextPath}/addDepartment.jsp'"/>
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
