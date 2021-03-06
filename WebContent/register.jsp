<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<script src="js/jquery-1.11.3.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style2.css" type="text/css" />
<link rel="stylesheet" href="css/header.css" type="text/css" />
<!--引入表单校验插件validate.min.js  -->
<script  src="js/jquery.validate.min.js" type="text/javascript" ></script>
<style>
.error{
	color:red
}
.r_title{
		text-align:center
		
		}
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}
</style>
<script type="text/javascript">
	$.validator.addMethod(
		//规则名称
		"checkUsername",function(value,element,params){
			
			var flag = false;
			 
			//value:输入的内容
			//element:被校验元素对象
			//params:规则对应的参数值
			
			//目的：对输入的username进行ajax校验
			$.ajax({
				"async":false,//注意：如果用异步，直接执行return和ajax,可能在未赋值之前就return了
				"url":"${pageContext.request.contextPath}/checkUsername",
				"data":{"username":value},
				"type":"post",
				"dataType":"json",
				"success":function(data){
					flag = data.isExist;
				}
			});
			//如果返回false代表该校验器不通过
		
			return !flag;
		}
	);




$(function(){
		$("#myform").validate({
			rules:{
				"username":{
					"required":true,
					"checkUsername":true
				},
				"password":{
					"required":true,
					"rangelength":[6,12]
				},
				"repassword":{
					"required":true,
					"rangelength":[6,12],
				    "equalTo":"#password"
				},
				"email":{
					"required":true,
					"email":true
				},
				"name":{
					"required":false
				},
				"birthday":{
					"required":true
				},
				"sex":{
					"required":true
				}
			},
			messages:{
				"username":{
					"required":"用户名不能为空",
					"checkUsername":"用户名已存在"
				},
				"password":{
					"required":"密码不能为空",
					"rangelength":"密码长度6-12位"
				},
				"repassword":{
					"required":"确认密码不能为空",
					"rangelength":"密码长度6-12位",
					"equalTo":"两次密码不一致"
				},
				"email":{
					"required":"邮箱不能为空！",
					"email":"邮箱格式不正确"
				}
			}
		});
	});

</script>

</head>
<body>

	<!-- 引入header.jsp -->
		<%@ include file="header.jsp"%>

	<div class="container"
		style="width: 100%; background: url('image/regist_bg.jpg');">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8"
				style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
				<div class="r_title"><font>用户注册</font>User REGISTER</div><br/><br/>
				<form id = "myform" class="form-horizontal" action="${pageContext.request.contextPath}/user_register" method="post" style="margin-top: 5px;">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-6">
							<input type="text" class="form-control" id="username" name="username"
								placeholder="请输入用户名">
						</div>
					</div>
					<div class="form-group">
						<label for="inputPassword3" class="col-sm-2 control-label" >密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="password"
								placeholder="请输入密码" name="password">
						</div>
					</div>
					<div class="form-group">
						<label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-6">
							<input type="password" class="form-control" id="confirmpwd" name="repassword"
								placeholder="请输入确认密码">
						</div>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label" >Email</label>
						<div class="col-sm-6">
							<input type="email" class="form-control" id="inputEmail3"
								placeholder="Email" name="email">
						</div>
					</div>
				

					

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" width="100" value="注册" name="submit">
								
					</div>
				</form>
			</div>

			<div class="col-md-2"></div>

		</div>
	</div>

	<!-- 引入footer.jsp -->
	

</body>
</html>




