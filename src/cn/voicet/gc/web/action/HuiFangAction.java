package cn.voicet.gc.web.action;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.voicet.gc.dao.HuiFangDao;
import cn.voicet.gc.web.form.HuiFangForm;

import com.opensymphony.xwork2.ModelDriven;

@Controller("huiFangAction")
@Scope(value="prototype")
@SuppressWarnings("serial")
public class HuiFangAction extends BaseAction implements ModelDriven<HuiFangForm>{
	private static Logger log = Logger.getLogger(HuiFangAction.class);
	@Resource(name=HuiFangDao.SERVICE_NAME)
	private HuiFangDao huiFangDao;
	private HuiFangForm huiFangForm = new HuiFangForm();
	
	public HuiFangForm getModel() {
		return huiFangForm;
	}
	
	public String home()
	{
		flag = (String)request.getParameter("flag");
		log.info("flag:"+flag);
		Map<String, Object> hfMap = huiFangDao.getHuiFangInfo(Integer.parseInt(flag));
		log.info("hfMap:"+hfMap);
		request.setAttribute("hfMap", hfMap);
		if(flag.equals("1"))
		{
			return "show_huifang1";
		}
		else if(flag.equals("2"))
		{
			return "show_huifang2";
		}
		else if(flag.equals("3"))
		{
			return "show_huifang3";
		}
		else
		{
			return ERROR;
		}
	}
	
	public String save()
	{
		huiFangDao.saveHuiFangInfo(Integer.parseInt(flag), huiFangForm);
		return home();
	}
	private String flag;
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
}
