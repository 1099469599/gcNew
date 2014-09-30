package cn.voicet.gc.dao;

import cn.voicet.util.DotSession;

public interface SysParamDao {
	public final static String SERVICE_NAME = "cn.voicet.gc.dao.impl.SysParamDaoImpl";
	int getAni();
	int getMaxwait();
	void saveParam(DotSession ds, int ani, int maxwait);
}