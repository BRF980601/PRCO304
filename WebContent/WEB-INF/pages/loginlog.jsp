<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<base href="<%=basePath%>" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="css/pintuer.css" />
    <link rel="stylesheet" href="css/admin.css" />
    <script src="js/jquery.js"></script>
    <script src="js/pintuer.js"></script>
	<title></title>
	<style>
    	table{
    		width: 900px;
    		margin: 10px auto;
    	}
    	td,th{
    		text-align:center;
    		border:1px solid #cccccc;
    		vertical-align:middle;
    		padding:10px;
    	}
    	a{
    		margin:3px;
    		color:blue;
    	}
    	.search-content{
    		text-align:center;
    	}
    	.search-content span{
    		font-weight: bold;
    		font-size:20px;
    	}
    	.search-value{
    		width:200px;
    		height:30px;
    	}
    	.search-sub{
    		width:80px;
    		height:30px;
    		font-size:19px;
    	}
    </style>
<script type="text/javascript">
		function change(index,size,username) {
			location.href="findLoginlog?index="+index+"&size="+size+"&username="+username;
		}
</script>
</head>

	

<body >
<div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span>Log information management</strong></div>
   <div class="body-content">
	<form action="findLoginlog" method="post">
	<div class="search-content">
		<span class="newfont06">User name: </span>
		<input name="username" class="search-value" type="text" size="12" value="${username }"  />&emsp; 
		<input name="Submit" type="submit" class="search-sub" value="Inquire" />&nbsp;
	</div>
	
	<br />
	<table width="100%" border="1px" cellpadding="4">
		<tr>
			<th height="20" colspan="15" align="center"
				>Login log list</th>
		</tr>
		<tr>
			<th width="9%" height="20" align="center" bgcolor="#EEEEEE">Number</th>
			<th width="9%" align="center" bgcolor="#EEEEEE">User name</th>
			<th width="9%" align="center" bgcolor="#EEEEEE">User ip address</th>
			<th width="9%" align="center" bgcolor="#EEEEEE">Log in time</th>
		</tr>
		<c:forEach items="${mpb.list}" var="loginlog">
			<tr>
			<td align="center">${loginlog.loginid }</td>
			<td align="center">${loginlog.username }</td>
			<td align="center">${loginlog.loginip }</td>
			<td align="center">${loginlog.logintime }</td>
		</tr>
		</c:forEach>
		<tr>
    		<td colspan="11" align="center">
    			<a href="javascript:change(1,${mpb.size },'${username}')">Inder</a>
	    		<c:if test="${mpb.index !=1 }">
	    			<a href="javascript:change(${mpb.index-1 },${mpb.size },'${username}')">Previous page</a>
	    		</c:if>
	    		<c:if test="${mpb.index ==1 }">
	    			Previous page
	    		</c:if>
	    		<c:forEach items="${mpb.numbers }" var="number">
	    			<c:if test="${number == mpb.index }">
	    				[<a href="javascript:change(${number },${mpb.size },'${username}')">${number }</a>]
	    			</c:if>
	    			<c:if test="${number != mpb.index }">
	    				<a href="javascript:change(${number },${mpb.size },'${username}')">${number }</a>
	    			</c:if>
	    		</c:forEach>
	    		
	    		 <c:if test="${mpb.index != mpb.totalPageCount }">
	    			<a href="javascript:change(${mpb.index+1 },${mpb.size },'${username}')">Next page</a>
	    		</c:if>
	    		<c:if test="${mpb.index == mpb.totalPageCount }">
	    			Next page
	    		</c:if>   
	    		 
	    		<a href="javascript:change(${mpb.totalPageCount },${mpb.size },'${username}')">Last page</a>
	    		 
	    		Each page 
	    		<select onchange="change(1,this.value,'${username}')" id="size">
	    			<c:forEach begin="5" step="5" end="30" var="i">
	    				<c:if test="${i == mpb.size }">
	    					<option value="${i }" selected="selected">${i }</option>
	    				</c:if>
	    				<c:if test="${i != mpb.size }">
	    					<option value="${i }">${i }</option>
	    				</c:if>
	    			</c:forEach>
	    		</select>
	    		 records
	    		 
	    		 Jump to<input type="text" name="index" size="1">page
	    		 		<input type="hidden" name="size" value="${mpb.size }">
	    		 		<input type="submit" value="go">
	    		  
	    		Total${mpb.totalCount }records
    		</td>
    	</tr>
		</table>
	</form>
	</div>
	</div>
</body>
</html>