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
    <title>Website Information</title>  
    <base href="<%=basePath %>"  />
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="My97DatePicker/WdatePicker.js"></script>
    <script src="js/formCheck.js"></script>
    <script type="text/javascript">
    	/* 使用插件绑定onchange方法不行，改用这种形式 */
    	function change(){
    		var rentStartTime = $("#rentStartTime").val();
			var rentEndTime = $("#rentEndTime").val();
			var rentPrice = $("#rentPriceNeed").val();
			if( rentStartTime!="" &&  rentEndTime!=""){
				if( rentEndTime<rentStartTime ){
					$("#priceShouldPay").parent().children("span").remove();
					$("#priceShouldPay").parent().append("<span class='formtips'>出租天数大于0</span>");
				}else{
					$("#priceShouldPay").parent().children("span").remove();
				}
				$.ajax({
					type:"post",
					url:"addRentDataHandler",
					data:{"rentStartTime":rentStartTime, "rentEndTime":rentEndTime, "rentPrice":rentPrice},
					dateType:"json",
					success:succFunction
				})
			}
		}
    	
    	function succFunction(d){
			var data= $.parseJSON(d);//为什么只能用这个方法去解析？？？
			$("#priceShouldPay").val(data.priceShouldPay);
			$("#imprestNeed").val(data.imprestNeed);
    	}
    </script>
    <style>
    	table{
    		border:1px solid #cccccc;
    		width: 80%;
    		margin: 50px auto;
    	}
    	td{
    		padding:10px;
    	}
    </style>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>Generate Rental Order</strong></div>
  <div class="body-content">
    <form  action="addRentTable"  method="post">
		<table>
			<tr>
				<td width="180px">Rental order number</td>
				<td width="600px"><input type="text" name="rentNo" readonly="readonly" value="${rentTableNo}" /></td>
				<td width="180px">Advance payment</td>
				<td width="600px">
					<input type="text" name="imprest" id="imprestNeed" readonly="readonly" />Pound(The current vehicle deposit is:${rentPrice})
					<input type="hidden" value="${rentPrice}" id="rentPriceNeed" />
				</td>
			</tr>
			<tr>
				<td>Price should pay</td>
				<td><input type="text" name="pricePayAble" id="priceShouldPay" readonly="readonly" class="required"/>pounds</td>
				<td>Actual delivery amount</td>
				<td><input type="text" name="realPay" class="required" id="crealPay"  />pounds</td>
			</tr>
			<tr>
				<td>Begin time</td>
				<td><input type="text" class="required" name="beginTime" onchange="change()" id="rentStartTime" class="Wdate" onfocus="WdatePicker({readOnly:true})" /></td>
				<td>End time</td>
				<td><input type="text" class="required" name="endTime" onchange="change()" id="rentEndTime"  class="Wdate" onfocus="WdatePicker({readOnly:true})" /></td>
			</tr>
			<tr>
				<td>Rental order status</td>
				<td>
					<select name="rentFlag">
						<option value="1">Leased</option>
					</select>
				</td>
				<td>Agent number</td>
				<td>
					<input type="text" name="userName" readonly="readonly" value="${currentUser.username}"/>
				</td>
			</tr>
			<tr>
				<td>Car number</td>
				<td><input type="text" name="carNumber" readonly="readonly" value="${carNumber}" /></td>
				<td>Customer ID</td>
				<td><input type="text" name="custIdentity" readonly="readonly" value="${custIdentity}"/></td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;"><button type="submit" id="dataSub" >Submit</button>&nbsp;&nbsp;<input type="reset" value="Reset" /></td>
				<td></td>
			</tr>
		</table>
	</form>
  </div>
</div>
</body></html>