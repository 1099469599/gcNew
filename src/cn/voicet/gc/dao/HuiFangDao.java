package cn.voicet.gc.dao;

import java.util.Map;

public interface HuiFangDao{
	public final static String SERVICE_NAME = "cn.voicet.gc.dao.impl.HuiFangDaoImpl";
	Map<String,Object> getHuiFang1Info();
	void saveHuiFangOneInfo(String[] hf);
}
