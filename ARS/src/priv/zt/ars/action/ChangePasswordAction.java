package priv.zt.ars.action;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.Admin;
import priv.zt.ars.domain.Assessor;
import priv.zt.ars.domain.Staff;
import priv.zt.ars.service.AdminService;
import priv.zt.ars.service.AssessorService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.StaffService;

import com.opensymphony.xwork2.ActionSupport;

public class ChangePasswordAction extends ActionSupport {
	
	private String id;
	private String oldPassword;
	private String newPassword;
	private String userType;
	
	public void setUserType(String userType) {
		this.userType = userType;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	@Autowired
	private StaffService staffServiceImpl;
	@Autowired
	private AssessorService assessorServiceImpl;
	@Autowired
	private AdminService adminServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	public void changePassword() throws NoSuchAlgorithmException {
		System.out.println(userType);
		if("0".equals(userType)){
			Staff s = staffServiceImpl.getStaffById(id);
			if (s != null) {
				if(s.getPassword().equals(oldPassword)){
					staffServiceImpl.changePasswordById(id, newPassword);
					dataProcessServiceImpl.out(1);
				}else{
					dataProcessServiceImpl.out(0);
				}
			} else {
				dataProcessServiceImpl.out(0);
			}
		}else if("1".equals(userType)){
			Assessor assessor = assessorServiceImpl.getAssessorById(id);
			if (assessor != null) {
				if(assessor.getPassword().equals(oldPassword)){
					assessorServiceImpl.changePasswordById(id, newPassword);
					dataProcessServiceImpl.out(1);
				}else{
					dataProcessServiceImpl.out(0);
				}
			} else {
				dataProcessServiceImpl.out(0);
			}
		}else if("2".equals(userType)){
			Admin admin = adminServiceImpl.getAdminById(id);
			if (admin != null) {
				if(admin.getPassword().equals(oldPassword)){
					adminServiceImpl.changePasswordById(id, newPassword);
					dataProcessServiceImpl.out(1);
				}else{
					dataProcessServiceImpl.out(0);
				}
			} else {
				dataProcessServiceImpl.out(0);
			}
		}else{
			dataProcessServiceImpl.out(-1);
		}
	}
}
