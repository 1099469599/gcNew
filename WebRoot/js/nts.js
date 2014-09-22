//pop
function saveNts(t,account,pwd,ipallow,anyonemsg,content)
{
	
	$(".asterisk").each(function(){
		this.innerHTML="*";
	});
	
	var tit;
	if(t=="add")
	{
		tit="添加NTS";
		$("#addup").val(0);
		$("#accountx").attr("readonly",false);
		$("#accountx").addClass("inputDefault");
	}
	else
	{
		tit="修改NTS";
		$("#accountx").attr("readonly","readonly");
		$("#accountx").removeClass("inputDefault");
		$("#addup").val(1);
	}
	$("#accountx").val(account);
	if(anyonemsg==1)
	{
		$("#anyonemsgx")[0].checked=true;
	}
	else
	{
		$("#anyonemsgx")[0].checked=false;
	}	
	//
	$("#pwdx").val(pwd);
	$("#ipallowx").val(ipallow);
	$("#anyonemsgx").val(anyonemsg);
	$("#contentx").val(content);
	
	
	$.layer({
		type: 1,
        title: tit,
        offset: [($(window).height() - 290)/2+'px', ''],
        border : [5, 0.5, '#666'],
        area: ['450px','400px'],
        shadeClose: false,
		bgcolor: '#EEF1F8',
		page:{dom:'#popDiv'}
	});
}

//
function checkAnyonemsg(obj)
{
	if(obj.checked)
	{
		$("#isanyonemsgx").val(1);
	}
	else
	{
		$("#isanyonemsgx").val(0);
	}
}

//validate
$(function(){
	$("#accountx").bind("blur",checkAccount);
	$("#pwdx").bind("blur",checkPwd);
});
function checkAccount()
{
	var acc = $("#accountx").val();
	if(!acc)
	{
		$(".asterisk")[0].innerHTML="账号不能为空";
		return false;
	}
	else
	{
		$(".asterisk")[0].innerHTML="";
		return true;
	}
}
function checkPwd()
{
	var pwd = $("#pwdx").val();
	if(!pwd)
	{
		$(".asterisk")[1].innerHTML="密码不能为空";
		return false;
	}
	else
	{
		$(".asterisk")[1].innerHTML="";
		return true;
	}
}

//save
function submitSaveNtsBtn()
{
	if(!checkAccount()) return false;
	if(!checkPwd()) return false;
	//
	$("#form2").ajaxSubmit({ 
		success:function(data){ //提交成功的回调函数
			layer.closeAll();
			location.href="${pageContext.request.contextPath}/ntsAction_home.action";
        }  
	}); 
    return false;	//not refresh page
}

//delete agent
function deleteNtsPre(account)
{
	$("#del_account").val(account);
	layer.confirm("确定要删除吗？",function(){
		deleteNts();
	});
}
function deleteNts()
{
	document.form3.submit();
}
