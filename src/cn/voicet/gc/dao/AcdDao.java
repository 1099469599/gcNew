package cn.voicet.gc.dao;

import cn.voicet.gc.web.form.AcdForm;
import cn.voicet.util.DotSession;

public interface AcdDao{
	public final static String SERVICE_NAME = "cn.voicet.gc.dao.impl.AcdDaoImpl";
	void queryAcdList(DotSession ds);
	void queryAcdAnalyList(DotSession ds, AcdForm acdForm);
}
