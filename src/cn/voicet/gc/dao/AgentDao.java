package cn.voicet.gc.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import cn.voicet.gc.form.AgentForm;
import cn.voicet.util.DotSession;

public interface AgentDao{
	public final static String SERVICE_NAME = "cn.voicet.gc.dao.impl.AgentDaoImpl";
	void queryAgentList(DotSession ds);
	void queryAgentAnalyList(DotSession ds);
	String saveAgent(AgentForm agentForm);
	void deleteAgentByAccount(AgentForm agentForm);
	void initAgentpwdByAgtid(AgentForm agentForm);
	void exportAgentAnalyData(DotSession ds, HttpServletResponse response);
	void queryAgentAnswerList(DotSession ds, AgentForm agentForm);
	void emptyAnswerByAgent(DotSession ds);
	void queryAgentOnlineList(DotSession ds, AgentForm agentForm);
	List<Map<String, Object>> queryAgentAccountList();
	Map<String, Object> queryAgentWorkInfo(DotSession ds);
	List<Map<String, Object>> queryTaskCompleteInfo(AgentForm agentForm);
}
