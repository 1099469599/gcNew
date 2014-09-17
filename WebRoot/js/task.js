//save task
function saveTask(t,tid,tname,kind,taskinfo)
{
	$(".asterisk")[0].innerHTML="";
	var tit;
	if(t=="add")
	{
		tit="添加任务";
		$("#tidx").val(0);
		$("#kindx").val(0);
	}
	else
	{
		tit="修改任务";
		$("#tidx").val(tid);
		$("#kindx").val(kind);
	}
	//
	$("#tnamex").val(tname);
	$("#taskinfox").val(taskinfo);
	$.layer({
		type: 1,
        title: tit,
        offset: [($(window).height() - 290)/2+'px', ''],
        border : [5, 0.5, '#666'],
        area: ['450px','300px'],
        shadeClose: false,
		bgcolor: '#EEF1F8',
		page:{dom:'#popDiv'}
	});
}

$(function(){
	$("#tnamex").bind("blur",checkTname);
});

//validate task name
function checkTname()
{
	var tname = $("#tnamex").val();
	if(!tname)
	{
		$(".asterisk")[0].innerHTML="任务名称不能为空";
		return false;
	}
	else
	{
		$(".asterisk")[0].innerHTML="";
		return true;
	}
}

//submit task

function saveTaskBtn()
{
	if(!checkTname()) return false;
	
	$("#form1").ajaxSubmit({ 
		success:function(data){ //提交成功的回调函数
			layer.closeAll();
			if(data=="updateok")
			{
				location.href="${pageContext.request.contextPath}/taskAction_home.action";
			}
			else if(data=="updateerr")
			{
				layer.msg("修改任务失败",2,5);
			}
			else if(data=="insertok")
			{
				
				location.href="${pageContext.request.contextPath}/taskAction_home.action";
				
			}
        }  
	}); 
    return false;	//not refresh page
}


//a->button
function deleteTaskPre(tid,tname,trn)
{
	if(trn>0)
	{
		layer.alert("请先清空任务中的号码，再删除该任务",111);
	}
	else
	{
		layer.confirm("确定要删除【"+tname+"】吗？",function(){
			deleteTask(tid,tname);
		});
	}
}

//delete task
function deleteTask(tid,tname)
{
	$("#del_tid").val(tid);
	$("#del_tname").val(tname);
	$("#form2").ajaxSubmit({ 
		success:function(data){ //提交成功的回调函数
			if(data=="ok")
			{
				location.href="${pageContext.request.contextPath}/taskAction_home.action";
			}
			else
			{
				layer.msg("删除任务前请清空任务队列中存在的号码",2,5);
			}
        }  
	}); 
    return false;	//not refresh page
}
