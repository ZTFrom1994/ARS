package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.AdminMapper;
import priv.zt.ars.domain.Admin;
import priv.zt.ars.service.AdminService;
@Service("adminService")
public class AdminSerivceImpl implements AdminService{
	
	@Autowired
	private AdminMapper mapper;//注入dao

	public void changePasswordById(String id, String newPassword) {
		mapper.changePasswordById(id, newPassword);
	}

	public Admin getAdminById(String id) {
		return mapper.getAdminById(id);
	}

	public List<Admin> getAllAdmin() {
		return mapper.getAllAdmin();
	}

	
	
	
}
