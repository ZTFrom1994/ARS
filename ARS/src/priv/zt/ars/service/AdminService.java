package priv.zt.ars.service;

import java.util.List;

import priv.zt.ars.domain.Admin;

public interface AdminService {
	public Admin getAdminById(String id);
	public void changePasswordById(String id,String newPassword);
	public List<Admin> getAllAdmin();
}
