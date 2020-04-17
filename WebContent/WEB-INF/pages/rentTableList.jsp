<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" 
			+ request.getServerPort() + path + "/";
	String carImgPath = request.getSession().getServletContext().getRealPath("/") + "WEB-INF/static/images/cars/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>Show rental</title>  
    <base href="<%=basePath %>"  />
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <style>
    	table{
    		width:90%;
    		margin: 10px auto;
    	}
    	td{
    		vertical-align: middle; 
    		text-align: center;
    		margin:20px;
    		padding:5px;
    		bos
    	}
    	.priceStyle{
    		width:50px;
    	}
    	#cdes{
    		width:200px;
    	}
    </style>
<script type="text/javascript"  src="js/jquery.js" ></script>
<script type="text/javascript">
</script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>Show rental</strong></div>
  <div class="body-content">
    <table >
		<tr>
			<th>Rent id</th>
			<th>Rent number</th>
			<th>Imprest</th>
			<th>Payable</th>
			<th>Real pay</th>
			<th>Begin data</th>
			<th>End data</th>
			<th>Real end data</th>
			<th>Customer name</th>
			<th>Car number</th>
			<th>Staff id</th>
			<th>Operating</th>
		</tr>
		<c:forEach items="${renttables}" var="renttable" >
		<!-- items="${renttables}" var="renttable" 正好对应下面的${.} -->
			<tr>
				<td>${renttable.rentid}</td>
				<td>${renttable.rentno}</td>
				<td>${renttable.imprest}</td>
				<td>${renttable.pricepayable}</td>
				<td>${renttable.realpay}</td>
				<td>${renttable.begintime}</td>
				<td>${renttable.endtime}</td>
				<td>${renttable.realendtime}</td>
				<td>${renttable.customer}</td>
				<td>${renttable.user}</td>
				<td>${renttable.carid}</td>
				<td>
					<a href="deleteById?userid=${user.userid}" />Delete</a> | 
					<a href="preUpdate?userid=${user.userid}
					          &username=${user.username}
					           &userpwd=${user.userpwd}
					             &realname=${user.realname}
					             &identity=${user.identity}
					             &sex=${user.sex}
					             &address=${user.address}
					             &phone=${user.phone}
					              &position=${user.position}
					            &roleid=${user.roleid}" />Modify</a>
				</td>
			</tr>
		</c:forEach>
	</table>
  </div>
</div>
</body></html>