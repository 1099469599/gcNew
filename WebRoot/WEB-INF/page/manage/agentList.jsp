<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 	<title>电话自动外呼系统</title>
	<link type="text/css" href="<c:url value='/style/common_cn.css'/>" rel="stylesheet" />
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
	<script type="text/javascript" src="<c:url value='/layer/extend/layer.ext.js'/>"></script>
	<!-- layer 弹出插件 end -->
 	<!-- jPage 分页插件 start -->
 	<link type="text/css" href="<c:url value='/jPage/jPages.css'/>" rel="stylesheet" />
	<script type="text/javascript" src="<c:url value='/jPage/jPages.js'/>"></script>
 	<!-- jPage 分页插件  end -->
 	
</head>
<body>
<div id="contentWrap">
	<h3 class="h3_title">话务员档案管理</h3>
	<div class="queryDiv">
	   	<ul class="queryWrap_ul_w600 left">
	        <li><input type="button" class="btn4" onclick="saveAgent('add','','','','','')" value="添加"/></li>
		</ul>
		<ul class="queryWrap_ul_w100 right">
	        <li></li>
		</ul>
	</div>
	<div class="content_List568">
		<table cellpadding="0" cellspacing="0" class="tab_border">
			<thead class="tab_head">
                 <tr>
                     <th width="20%">话务员号码</th>
                     <th width="20%">登录账号</th>
                     <th width="20%">姓名</th>
                     <th width="20%">电子邮箱</th>
                     <th width="20%">操作</th>
                 </tr>
             </thead>
             <tbody id="movies">
               	<s:iterator id="agent" value="#session.vts.list">
				<tr align="center">
					<td>${agent.telnum }</td>
					<td>${agent.account }</td>
					<td>${agent.agtname }</td>
					<td>${agent.email }</td>
					<td>
						<a href="javascript:saveAgent('edit','${agent.account }','${agent.telnum }','${agent.agtname }','${agent.email }')">修改</a>&nbsp;&nbsp;
						<a href="javascript:deleteAgentPre()">删除</a>
						<input type="button" class="hide" onclick="deleteAgent()" value="删除"/>
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
	    <input type="text" id="tzval" value="5" class="ipt20 inputDefault"/>
 		<button id="tiaozhuan" class="btn btn-primary">跳转</button>
	</div>
    <!-- jPage end -->
    
    <!--POP LAYER START-->
	<div id="popDiv" style="display:none;"> 
		<form name="form2" action="<c:url value='/agentAction_saveAgent.action'/>" method="post">
	    <input type="hidden" id="addeditx" name="agttxt"/>
	    <div class="lab_ipt_item">
	    	<span class="lab120">登录账号：</span>
	        <div class="ipt-box">
	        	<input type="text" id="accountx" name="agttxt" class="ipt_text_w150 inputDefault" />
	            <span class="asterisk">*</span>
	        </div>
	    </div>
	    <div class="lab_ipt_item">
	    	<span class="lab120">话务员号码：</span>
	        <div class="ipt-box">
	        	<input type="text" id="telnumx" name="agttxt" class="ipt_text_w150 inputDefault" />
	            <span class="asterisk">*</span>
	        </div>
	    </div>
	    <div class="lab_ipt_item" id="whnum">
	    	<span class="lab120">姓名：</span>
	        <div class="ipt-box">
	        	<input type="text" id="agtnamex" name="agttxt" value="0" class="ipt_text_w150 inputDefault" />
	            <span class="asterisk"></span>
	        </div>
	    </div>
	    <div class="lab_ipt_item">
	    	<span class="lab120">电子邮箱：</span>
	        <div class="ipt-box">
	        	<input type="text" id="emailx" name="agttxt" class="ipt_text_w150 inputDefault" />
	            <span class="asterisk">*</span>
	        </div>
	    </div>
		<div class="lab_ipt_item">
			<span class="lab120"></span>
			<div class="ipt-box"><input type="submit" class="btn4" value="确定"/></div>
			<div class="ipt-box" style="margin-left:20px;"><input type="button" class="btn4" value="取消" onclick="layer.closeAll()"/></div>
		</div>	
		</form>
	</div>
	<!--POP LAYER END-->
	
	<form name="form3" action="<c:url value='/agentAction_deleteAgent.action'/>" method="post">
		<input type="hidden" name="account" value="${agent.account }"/>
	</form>
	
</div>

<script type="text/javascript">
	function saveAgent(t,account,telnum,agtname,email)
	{
		var tit;
		if(t=="add")
		{
			tit="添加话务员";
			$("#addeditx").val(0);
		}
		else
		{
			tit="修改话务员信息";
			$("#addeditx").val(1);
		}
		//
		$("#accountx").val(account);
		$("#telnumx").val(telnum);
		$("#agtnamex").val(agtname);
		$("#emailx").val(email);
		
		$.layer({
			type: 1,
	        title: tit,
	        offset: [($(window).height() - 290)/2+'px', ''],
	        border : [5, 0.5, '#666'],
	        area: ['450px','300px'],
	        shadeClose: false,
			bgcolor: '#fff',
			page:{dom:'#popDiv'}
		});
	}

	//
	function deleteAgentPre()
	{
		layer.confirm("确定要删除吗？",function(){
			deleteAgent();
		});
	}
	function deleteAgent()
	{
		document.form3.submit();
	}
	
</script>
<script type="text/javascript">
	$(function(){
		$("div.holder").jPages({
			containerID : "movies",
	        first : "首页",
	        previous : "上一页",
	        next : "下一页",
	        last : "尾页",
	        perPage : 26,
	        keyBrowse:true,
	        delay : 5,
	        callback : function( pages, items ){
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