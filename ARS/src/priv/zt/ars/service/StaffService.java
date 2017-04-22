package priv.zt.ars.service;


import java.util.List;

import priv.zt.ars.domain.Staff;
import priv.zt.ars.service.impl.StaffSerivceImpl;

public interface StaffService {
	public Staff getStaffById(String id);
	public List<Staff> getAllStaff();
	public void changePasswordById(String id,String newPassword);
	public void updateStaff(Staff staff);
	public void addStaff(Staff staff);
	public int getDisabledCount();
}
