package priv.zt.ars.service;

public interface DataProcessService {
	public void loadAdminData();
	public void loadSystemSettings();
	public void loadStaffData(String id);
	public void loadAssessorData();
	public void out(String msg);
	public void out(int msg);
	public int getSystemOpenState();
}
