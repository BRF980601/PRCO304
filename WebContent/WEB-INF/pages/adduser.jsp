<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>网站信息</title>  
    <base href="<%=basePath %>"  />
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
    <script src="js/formCheck.js"></script>
    <script type="text/javascript">
	$(function(){
		$.ajax({
			type:"post",
			url:"preAdduserData",
			dataType:"json",
			success:function(data){
				for(var i=0; i<data.length; i++){
					$("#crenting").append("<option value="+data[i].roleid+">"+data[i].rolename+"</option>");
				}
			}
		})
			
	}); 
    </script>
    <style>
    	table{
    		border:1px solid #CCCCCC;
    		width: 70%;
    		margin: 50px auto;
    	}
    	td{
    		padding:10px;
    	}
    	.formtips{
			color:red;
		}
    </style>  
</head>
<body>
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>Add user</strong></div>
  <div class="body-content">
    <form method="post" class="form-x" action="addUser">
      <table>
			<tr>
				<td width="100px">Login name</td>
				<td width="300px"> <input type="text" name="username" id="cuserName" class="required"   /> * </td>
				<td width="100px">ID</td>
				<td width="300px"> <input type="text" name="identity" id="cidentity" class="required"   /> * </td>
			</tr>
			<tr>
				<td>User password</td>
				<td> <input type="password" name="userpwd" id="cuserPassword" class="required"  /> * </td>
				<td>Phone number</td>
				<td> <input type="text" name="phone" id="cphone" class="required"  /> * </td>
			</tr>
			<tr>
				<td>Address</td>
				<td> <input type="text" name="address" id="uaddress" /></td>
				<td>Gender</td>
				<td>
				<select name="sex" >
					<option value="男">male</option>
					<option value="女">female</option>
				</select> 
				 </td>
			</tr>
			
			<tr>
				<td>Real name</td>
				<td> <input type="text" name="realname" id="crealname" class="required"   /> * </td>
				<td>Position</td>
				<td> <input type="text" name="position" id="uposition" /> </td>
			</tr>
			<tr>
				<td>Role</td>
				<td> 
					<select name="roleid" id="crenting">
					</select>
				*</td>
				<td></td>
				<td></td>
			</tr>
		</table>
          <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
          <button class="button bg-main icon-check-square-o" type="submit" id="dataSub"> Submit</button>
        </div>
      </div>
    </form>
  </div>
</div>
</body></html>