<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" 
			+ request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>Add new customer information</title>
<base href="<%=basePath %>">
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>

<script type="text/javascript">

	$(function() {

		$("#send").click(function() {
			$("input.required").trigger("blur");
		
			$.ajax({
				type : "post",
				url : "insertCustomer",
				dataType : "json",
				data : {
					"name" : $("#custName").val(),
					"pwd" : $("#cuserPassword").val(),
					"sex" : $("#csex").val(),
					"identity" : $("#cidentity").val(),
					"phone" : $("#cphone").val(),
					"career" : $("#ccareer").val(),
					"address" : $("#caddress").val()
				},
				success : function(data) {
					if (data.flag == "ok") {
						location.href = "success";
					} else if (data.flag == "ng") {
						alert("Add failed");
					}
				}
			});
		});
	});
</script>
<script src="js/formCheck.js"></script>
<style>
table{
	border:1px solid #CCCCCC;
	width: 70%;
	margin: 50px auto;
}
td{
	vertical-align:middel;
	padding:10px;
}
</style>


</head>
<body  >
<div class="panel admin-panel">
  	<div class="panel-head"><strong><span class="icon-pencil-square-o"></span>Add customer</strong></div>
  	<div class="body-content">
		<table>
			<tr>
				<td width="100px">Customer name</td>
				<td width="300px"> <input type="text" id="custName"  name="name" class="required" /> * </td>
				<td width="100px">ID</td>
				<td > <input type="text" id="cidentity"  name="identity" class="required"   /> * </td>
			</tr>
			<tr>
				<td width="100px">Password</td>
				<td> <input type="password" id="cuserPassword"  name="pwd" class="required"  /> * </td>
				<td>Gender:</td>
				<td><select select id="csex" class="select-sex" name="sex">
					<option value="Male">Male</option>
					<option value="Female">Female</option>
				</select>
				 *</td>
			</tr>
			<tr>
				<td>Phone number</td>
				<td> <input type="text" id="cphone"  name="phone" class="required"  /> * </td>
				<td>Career</td>
				<td> <input type="text" id="ccareer"  name="career" /> </td>
			</tr>
			<tr>
				<td>Address</td>
				<td colspan="3"><input type="text" id="caddress" style="width:400px;height:50px"  name="address" /> </td>

			</tr>
		</table>
		<div class="field">
			<button id="send" class="button bg-main icon-check-square-o"	type="submit">Submit</button>
		</div>
	</div>
</div>
</body>
</html>