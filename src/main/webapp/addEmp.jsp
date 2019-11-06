<%@page isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; utf-8" %>
<html >
<head>
	<title>add Emp</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" type="text/css"
		  href="${pageContext.request.contextPath}/css/style.css" />

	<script type="application/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>

	<script type="application/javascript">
		$(function () {
			$.ajax({
				url:"${pageContext.request.contextPath}/dep/showAll.do",
				type:"GET",
				dataType:"json",
				success:function (message) {
				    var html="";
					for (var i=0;i<message.length;i++){
                        html+="<option value="+message[i].number+">"+message[i].name+"</option>"
					}

					$("#choose").html(html);
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
					<a href="#">Main</a>
				</h1>
			</div>
			<div id="navigation">
			</div>
		</div>
		<div id="content">
			<p id="whereami">
			</p>
			<h1>
				add Emp info:
			</h1>
			<form action="${pageContext.request.contextPath}/emp/add.do" method="post" enctype="multipart/form-data">
				<table cellpadding="0" cellspacing="0" border="0"
					   class="form_table">
					<tr>
						<td valign="middle" align="right">
							头像:
						</td>
						<td valign="middle" align="left">
							<input type="file" name="upload" />
						</td>
					</tr>
					<tr>
						<td valign="middle" align="right">
							姓名:
						</td>
						<td valign="middle" align="left">
							<input type="text" class="inputgri" name="name" />
						</td>
					</tr>
					<tr>
						<td valign="middle" align="right">
							工资:
						</td>
						<td valign="middle" align="left">
							<input type="text" class="inputgri" name="salary" />
						</td>
					</tr>
					<tr>
						<td valign="middle" align="right">
							年龄:
						</td>
						<td valign="middle" align="left">
							<input type="text" class="inputgri" name="age" />
						</td>
					</tr>
					<tr>
						<td valign="middle" align="right">
							部门:
						</td>
						<td valign="middle" align="left">
							<select id="choose" name="depNo">

							</select>
						</td>
					</tr>


				</table>
				<p>
					<input type="submit" class="button" value="提交" />
				</p>
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
