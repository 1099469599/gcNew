<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 	<title>电话自动外呼系统</title>
	<link type="text/css" href="<c:url value='/style/common_cn.css?v=2'/>" rel="stylesheet" />
	<link type="text/css" href="<c:url value='/style/layout.css?v=1'/>" rel="stylesheet" />
	<script type="text/javascript" src="<c:url value='/js/jquery-1.11.1.min.js'/>"></script>
	<!-- 日期控件开始 -->
    <link type="text/css" href="<c:url value='/datePicker/skin/WdatePicker.css'/>" rel="stylesheet" />
	<script type="text/javascript" src="<c:url value='/datePicker/WdatePicker.js'/>"></script>
    <!-- 日期控件结束 -->
 	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 	<meta http-equiv="cache-control" content="no-cache"/>
 	<meta http-equiv="expires" content="0"/>
 	<!-- layer 弹出插件 start -->
	<script type="text/javascript" src="<c:url value='/layer/layer.min.js'/>"></script>
	<!-- layer 弹出插件 end -->
 	<!-- jPage 分页插件 start -->
 	<link type="text/css" href="<c:url value='/jPage/jPages.css'/>" rel="stylesheet" />
	<script type="text/javascript" src="<c:url value='/jPage/jPages.js'/>"></script>
 	<!-- jPage 分页插件  end -->
 	<script type="text/javascript" src="<c:url value='/js/changeTabColor.js'/>"></script>
 	<style>
 	.layer_notice {
		float: left;
		width: 330px;
		text-align:left;
		overflow: hidden;
		background: #78BA32;
		padding: 10px;
		border: 1px solid #628C1C;
		color:#fff;
	}
	.layer_notice li {
		line-height: 25px;
	}
	li {
		list-style: none;
	}
 	</style>
</head>
<body>
<div id="contentWrap">
	<h3 class="h3_title">接听查询&nbsp;[回访一详情]</h3>
	<div class="content_List615">
		<table cellpadding="0" cellspacing="0" class="tab_border">
			<thead class="tab_head2">
                 <tr>
                     <th width="6%">电话号码</th>
                     <th width="8%">姓名</th>
                     <th width="8%">手机套餐</th>
                     <th width="6%">通讯地址</th>
                     <th width="10%">二次电话</th>
                     <th width="8%">证件号码</th>
                     <th width="8%">预警生效时间</th>
                     <th width="10%">
                     	<input type="button" class="btn btn-primary" onclick="history.go(-1)" value="返回"/>
                     </th>
                 </tr>
             </thead>
             <tbody id="movies">
               	<s:iterator id="huif" value="#session.vts.list">
				<tr align="center">
					<td>${telnum }</td>
					<td>${xm }</td>
					<td>${sjtc }</td>
					<td>${tcdz }</td>
					<td>${ecdh }</td>
					<td>${zjhm }</td>
					<td>${yjsxsj }</td>
					<td>
						<a href="${pageContext.request.contextPath }/agentAnalyAction_viewhf.action?flag=1&tid=${tid }&ttid=${ttid }&telnum=${telnum}&xm=${xm}&sjtc=${sjtc}&txdz=${txdz}&ecdh=${ecdh}&zjhm=${zjhm}&yjsxsj=${yjsxsj}&hfqk=${hfqk}&hfname=${xm_n}&xb=${xb}&ywbwdc=${ywbwdc}&qdmyddc=${qdmyddc}&phonemodel=${sjppxh}&jkfl=${jkfl}&gkd=${gkd}">编辑</a>
					</td>
				</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
	<!-- jPage start -->
   	<div class="holder left"></div>
   	<div id="legend1" class="holder left"></div>
    <!-- Item oriented legend -->
    <div id="legend2" class="holder left"></div>
    <div class="left">
	    <input type="text" id="tzval" value="1" class="ipt20 inputDefault"/>
 		<button id="tiaozhuan" class="btn btn-primary">跳转</button>
	</div>
    <!-- jPage end -->
	
</div>
<script type="text/javascript">
	$(function(){
		var nowPage = parent.document.getElementById("curAgentAnalyPage").value;
		$("div.holder").jPages({
			containerID : "movies",
	        first : "首页",
	        previous : "上一页",
	        next : "下一页",
	        last : "尾页",
	        startPage : nowPage,
	        perPage : 28,
	        keyBrowse:true,
	        delay : 0,
	        callback : function( pages, items ){
				parent.document.getElementById("curAgentAnalyPage").value = pages.current;
		        $("#legend1").html("&nbsp;&nbsp;当前第"+pages.current+"页 ,&nbsp;&nbsp;总共"+pages.count+"页,&nbsp;&nbsp;");
		        $("#legend2").html("当前显示第"+items.range.start+" - "+items.range.end+"条记录,&nbsp;&nbsp;总共"+items.count+"条记录&nbsp;&nbsp;");
		    }
		});
	      /* when button is clicked */
    	$("#tiaozhuan").click(function(){
      		/* get given page */
			var page = parseInt( $("#tzval").val() );

      		/* jump to that page */
      		$("div.holder").jPages( page );

    	});
	});
</script>

</body>
</html>