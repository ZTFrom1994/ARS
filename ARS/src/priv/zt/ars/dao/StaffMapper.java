package priv.zt.ars.dao;


import java.util.List;

import priv.zt.ars.domain.Staff;


public interface StaffMapper {
	public Staff getStaffById(String id);
	public List<Staff> getAllStaff();
	public void changePasswordById(String id,String newPassword);
	public void updateStaff(Staff staff);
	public void addStaff(Staff staff);
	public int getDisabledCount();
}