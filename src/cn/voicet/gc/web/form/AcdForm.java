package cn.voicet.gc.web.form;

public class AcdForm {
	private String cts;	//统计服务器别名
	private String sdt;	//统计开始日期
	private String edt;	//统计结束日期
	
	public String getCts() {
		return cts;
	}
	public void setCts(String cts) {
		this.cts = cts;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getEdt() {
		return edt;
	}
	public void setEdt(String edt) {
		this.edt = edt;
	}
}
