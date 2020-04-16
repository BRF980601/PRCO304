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
    <title>Car list page</title>  
    <base href="<%=basePath %>"  />
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <style>
    	table{
    		width:99%;
    		margin: 10px auto;
    		border:1px solid #CCCCCC;
    	}
    	td,th{
    		vertical-align: middle; 
    		text-align: center;
    		margin:20px;
    		padding:5px;
    		border:1px solid #CCCCCC;
    	}
    	.priceStyle{
    		width:50px;
    	}
    	#cdes{
    		width:200px;
    	}
    </style>
<script type="text/javascript">
	function deleteTable(rentTableId){
		var flag = window.confirm("Are you sure you want to scrap this rental slip?");
		if(flag){
			$.ajax({
				type:"post",
				url:"dropRentTable",
				data:{"rentTableId":rentTableId},
				dataType:"json",
				success:function(data){
					if(data.flag == "true"){
						$("tr#"+rentTableId).remove();
					}else{
						alert("Abandonment failed!");
					}
				}
			})
		}
	}
	
	function updateTable(rentTableId){
		$.ajax({
			type:"post",
			url:"updateRentTable",
			data:{"rentTableId":rentTableId},
			dataType:"json",
			success:function(data){
				if(data.flag == "true"){
					$("tr td"+rentTableId+" td").remove();
				}else{
					alert("Abandonment failed！");
				}
			}
		})
	}
	
</script>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>Rental order management</strong></div>
  <div class="body-content">
    <table>
		<tr>
			<th>Rent number</th>
			<th>Advance payment</th>
			<th>Payable</th>
			<th>Begin data</th>
			<th>End data</th>
			<th>Real end data</th>
			<th>Customer id</th>
			<th>Car number</th>
			<th>Staff number</th>
			<th>Rental order status</th>
			<th>Operating</th>
		</tr>
		<c:forEach items="${tables}" var="table" >
			<tr id="${table.rentid}">
				<td>${table.rentNo}</td>
				<td>￥${table.imprest}</td>
				<td>￥${table.pricePayAble}</td>
				<td>${table.beginTime}</td>
				<td>${table.endTime}</td>
				<td>${table.realEndTime}</td>
				<td>${table.custIdentity}</td>
				<td>${table.carNumber}</td>
				<td>${table.userName}</td>
				<c:if test="${table.rentFlag eq 1}">
					<td>
						Leased
					</td>
					<td>
						<input type="hidden" name="rentid" id="rentTableId" value="${table.rentid}" />
						<a href="javascript:void(0)"  onclick="deleteTable('${table.rentid}')" >Void</a> | 
						<a href="preUpdateRentTable?rentid=${table.rentid}" >Modify</a>
					</td>
				</c:if>
				<c:if test="${table.rentFlag eq 2}">
					<td>
						<font color="green" >Settled</font>
					</td>
					<td>
						Obsolete | Modify
					</td>
				</c:if>
				<c:if test="${table.rentFlag eq 3}">
					<td>
						<font color="red" >cObsolete</font>
					</td>
					<td>
						Obsolete | Modify
					</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
  </div>
</div>
</body></html>