package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.StaffMapper;
import priv.zt.ars.domain.Staff;
import priv.zt.ars.service.StaffService;
@Service("staffrService")
public class StaffSerivceImpl implements StaffService{
	
	@Autowired
	private StaffMapper mapper;//注入dao
	
	public void changePasswordById(String id, String newPassword) {
		mapper.changePasswordById(id,newPassword);
	}
	
	public Staff getStaffById(String id) {
		return mapper.getStaffById(id);
	}

	public void updateStaff(Staff staff) {
		mapper.updateStaff(staff);
	}

	public List<Staff> getAllStaff() {
		return mapper.getAllStaff();
	}

	public void addStaff(Staff staff) {
		mapper.addStaff(staff);
	}

	public int getDisabledCount() {
		return mapper.getDisabledCount();
	}
}
