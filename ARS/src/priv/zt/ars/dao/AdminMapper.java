package priv.zt.ars.dao;


import java.util.List;

import priv.zt.ars.domain.Admin;
import priv.zt.ars.domain.Staff;


public interface AdminMapper {
	public Admin getAdminById(String id);
	public void changePasswordById(String id,String newPassword);
	public List<Admin> getAllAdmin();
}