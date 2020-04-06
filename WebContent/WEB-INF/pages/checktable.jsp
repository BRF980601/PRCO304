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
    <meta http-equiv="Content-Type" constent="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>网站信息</title>  
    <base href="<%=basePath %>"  />
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="My97DatePicker/WdatePicker.js"></script>
    <style>
    	table{
    		width:90%;
    		margin: 50px auto;
    	}
    	td,th{
    		vertical-align: middle; 
    		margin:20px;
    		padding:5px;
    		border:1px solid #CCCCCC;
    		border-left:none;
    		border-right:none;
    	}
    	.tableInfo{
    		color:red;
    		font-weight: 600;
    		font-size: 20px;
    		text-align:center;
    	}
    </style>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>Vehicle storage</strong></div>
  <div class="body-content">
    <form  action="addchecktable"  method="post">
		<table>
			<tr>
				<td>Check number:</td>
				<td><input type="text" name="checkno" readonly="readonly" value="${checktable.checkno}" /></td>
				<td>Check time:</td>
				<td><input type="text" name="checktime" readonly="readonly" value="${checktable.checktime}"  /></td>
			</tr>
			<tr>
				<td>User name:</td>
				<td><input type="text" name="username" readonly="readonly" value="${checktable.username}" /></td>
				<td>Rent id:</td>
				<td><input type="text" name="rentid" readonly="readonly" value="${checktable.rentid}" /></td>
				
			</tr>
			<tr>
				<td>Remarks:</td>
				<td><input type="text" name="type" value="${checktable.type}" /></td>
				<td>Compensation:</td>
				<td><input type="text" name="paying" value="${checktable.paying}" /></td>
			</tr>
			<tr>
				<td>Problem:</td>
				<td colspan="3"><input type="text" name="problem" value="${checktable.problem}" /></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="还车" id="send" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" value="重置" /></td>
				<td></td>
			</tr>
		</table>
	</form>
	
	
		<table>
			<tr> 
			<td colspan="6" class="tableInfo">Car order information</td>
		</tr>
			<tr>
				<td>Rental order number</td>
				<td>${table.rentNo}</td>
				<td>Advance payment</td>
				<td>${table.imprest}</td>
			</tr>
			<tr>
				<td>Amounts payable</td>
				<td>${table.pricePayAble}</td>
				<td>Actual delivery amount</td>
				<td>${table.realPay}pounds</td>
			</tr>
			<tr>
				<td>Begin time</td>
				<td>${table.beginTime}</td>
				<td>End time</td>
				<td>${table.endTime}</td>
			</tr>
			<tr>
				<td>Username</td>
				<td>
					${currentUser.username}
				</td>
				<td>Rental order status</td>
				<td>
					Leased
				</td>
			</tr>
		</table>
	
	<table>
		<tr> 
			<td colspan="6" class="tableInfo">Customer Information</td>
		</tr>
		<tr>
			<td>ID</td>
			<td>${customer.identity}</td>
			<td>name</td>
			<td>${customer.name}</td>
			<td>Gender</td>
			<td>${customer.sex}</td>
		</tr>
		<tr>
			<td>Address</td>
			<td>${customer.address}</td>
			<td>Phone</td>
			<td>${customer.phone}</td>
			<td>Career</td>
			<td>${customer.career}</td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td colspan="6" class="tableInfo">Car information</td>
		</tr>
		<tr>
			<td>Car number</td>
			<td>${car.number}</td>
			<td>Car type</td>
			<td>${car.type}</td>
			<td>color</td>
			<td>${car.color}</td>
		</tr>
		<tr>
			<td>Price</td>
			<td>${car.price}</td>
			<td>Rent price</td>
			<td>${car.rentprice}</td>
			<td>Deposit</td>
			<td>${car.deposit}</td>
		</tr>
		<tr>
			<td>Rental situation</td>
			<td>
			<c:if test="${car.isrenting eq 0}">
					Not leased
				</c:if>
				<c:if test="${car.isrenting eq 1}">
					Leased
				</c:if>
			</td>
			<td cospan="2">Description</td>
			<td>${car.description}</td>
		</tr>
	</table>
  </div>
</div>
</body></html>