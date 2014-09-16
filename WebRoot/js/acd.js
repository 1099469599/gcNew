
//save acd
function saveAcd(t,grpid,cts,grpname,telnum,acw,maxwaittime,maxwaitnum,overflowto)
{
	$(".asterisk").each(function(){
		this.innerHTML="*";
	});
	$(".asterisk")[5].innerHTML="";
	//
	var tit;
	if(t=="add")
	{
		tit="为【"+cts+"】添加业务组";
	}
	else
	{
		tit="修改【"+cts+"】业务组信息";
	}
	//
	$("#grpidx").val(grpid);
	$("#ctsx").val(cts);
	$("#grpnamex").val(grpname);
	$("#telnumx").val(telnum);
	$("#acwx").val(acw);
	$("#maxwaittimex").val(maxwaittime);
	$("#maxwaitnumx").val(maxwaitnum);
	$("#overflowtox").val(overflowto);
	
	$.layer({
		type: 1,
        title: tit,
        offset: [($(window).height() - 290)/2+'px', ''],
        border : [5, 0.5, '#666'],
        area: ['450px','340px'],
        shadeClose: false,
		bgcolor: '#fff',
		page:{dom:'#popDiv'}
	});
}


$(function(){
	$("#grpnamex").bind("blur",checkGrpname);
	$("#telnumx").bind("blur",checkTelnum);
	$("#acwx").bind("blur",checkAcw);
	$("#maxwaittimex").bind("blur",checkMaxwaittime);
	$("#maxwaitnumx").bind("blur",checkMaxwatinum);
	$("#overflowtox").bind("blur",checkOverflowto);
});

function checkGrpname()
{
	var grpname = $("#grpnamex").val();
	if(!grpname)
	{
		$(".asterisk")[0].innerHTML="组名称不能为空";
		return false;
	}
	else
	{
		$(".asterisk")[0].innerHTML="";
		return true;
	}
}

function checkTelnum()
{
	var telnum = $("#telnumx").val();
	var regexp=/^([0-9]|[-])+$/g;
	
	if(!telnum)
	{
		$(".asterisk")[1].innerHTML="组号码不能为空";
		return false;
	}
	else if(!regexp.exec(telnum))
	{
		$(".asterisk")[1].innerHTML="电话号码不合理";
		return false;
	}
	else
	{
		$(".asterisk")[1].innerHTML="";
		return true;
	}
}

function checkAcw()
{
	var acw = $("#acwx").val();
	var regexp= /^\d+$/;
	if(!acw)
	{
		$(".asterisk")[2].innerHTML="结束等待不能为空";
		return false;
	}
	else if(!regexp.exec(acw))
	{
		$(".asterisk")[2].innerHTML="请输入合理的数字";
		return false;
	}
	else
	{
		$(".asterisk")[2].innerHTML="";
		return true;
	}
}
function checkMaxwaittime()
{
	var maxwtime = $("#maxwaittimex").val();
	var regexp= /^\d+$/;
	if(!maxwtime)
	{
		$(".asterisk")[3].innerHTML="等待时长不能为空";
		return false;
	}
	else if(!regexp.exec(maxwtime))
	{
		$(".asterisk")[3].innerHTML="请输入合理的数字";
		return false;
	}
	else
	{
		$(".asterisk")[3].innerHTML="";
		return true;
	}
}
function checkMaxwatinum()
{
	var maxwnum = $("#maxwaitnumx").val();
	var regexp= /^\d+$/;
	if(!maxwnum)
	{
		$(".asterisk")[4].innerHTML="等待线数不能为空";
		return false;
	}
	else if(!regexp.exec(maxwnum))
	{
		$(".asterisk")[4].innerHTML="请输入合理的数字";
		return false;
	}
	else
	{
		$(".asterisk")[4].innerHTML="";
		return true;
	}
}
function checkOverflowto()
{
	var overto = $("#overflowtox").val()
	var regexp= /^\d+$/;
	if(overto!="" && !regexp.exec(overto))
	{
		$(".asterisk")[5].innerHTML="请输入合理的数字";
		return false;
	}
	else
	{
		$(".asterisk")[5].innerHTML="";
		return true;
	}
}

function saveAcdBtn()
{
	if(!checkGrpname()) return false;
	if(!checkTelnum()) return false;
	if(!checkAcw()) return false;
	if(!checkMaxwaittime()) return false;
	if(!checkMaxwatinum()) return false;
	if(!checkOverflowto()) return false;
	
	//
	$("#form2").ajaxSubmit({ 
		success:function(data){ //提交成功的回调函数
			layer.closeAll();
			location.href="${pageContext.request.contextPath}/acdAction_home.action";
        }  
	}); 
    return false;	//not refresh page
}


function deleteAcdPre(grpid)
{
	$("#del_grpid").val(grpid)
	layer.confirm("确定要删除吗？",function(){
		deleteAcd();
	});
}
function deleteAcd()
{
	document.form3.submit();
}

//set acd task
function popSetTask(grpid,grpname,obj)
{
	var tid = obj.value;
	var tname = obj.options[obj.selectedIndex].text;
	$("#st_grpid").val(grpid);
	$("#st_taskid").val(tid);
	//
	/*
	layer.confirm("是否将【"+tname+"】指派到【"+grpname+"】",function(){
		document.form4.submit();
	},function(){
		history.go(0);
	});
	*/
	
	$.layer({
	    shade: [0.2,'#000'],
	    area: ['auto','auto'],
	    dialog: {
	        msg: "是否将【"+tname+"】指派到【"+grpname+"】",
	        btns: 2,                    
	        type: 4,
	        btn: ['确定','取消'],
	        yes: function(){
				document.form4.submit();
	        }, no: function(){
	        	history.go(0);
	        }
	    }
	});
}


