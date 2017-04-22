package priv.zt.ars.action;


import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.Assessor;
import priv.zt.ars.domain.Staff;
import priv.zt.ars.service.AssessorService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.StaffService;

import com.opensymphony.xwork2.ActionSupport;

public class AccountAction extends ActionSupport {
	private int assessorId;
	private String assessorName;
	private String assessorDepartment;
	private String assessorPosition;
	private String sex;
	private int staffId;
	private String staffName;
	private String staffDepartment;
	private String staffPosition;
	
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public void setStaffDepartment(String staffDepartment) {
		this.staffDepartment = staffDepartment;
	}
	public void setStaffPosition(String staffPosition) {
		this.staffPosition = staffPosition;
	}
	public void setAssessorId(int assessorId) {
		this.assessorId = assessorId;
	}
	public void setAssessorName(String assessorName) {
		this.assessorName = assessorName;
	}
	public void setAssessorDepartment(String assessorDepartment) {
		this.assessorDepartment = assessorDepartment;
	}
	public void setAssessorPosition(String assessorPosition) {
		this.assessorPosition = assessorPosition;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	@Autowired
	private AssessorService assessorServiceImpl;
	@Autowired
	private StaffService staffServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	public void addAssessor(){
		Assessor assessor =  assessorServiceImpl.getAssessorById(assessorId+"");
		if(assessor == null){
			assessor = new Assessor();
			assessor.setId(assessorId);
			assessor.setName(assessorName);
			assessor.setPassword("666666");
			assessor.setDepartment(assessorDepartment);
			assessor.setOperationTimes(0);
			assessor.setPositionName(assessorPosition);
			assessor.setRegisterDate(new Date());
			assessor.setSex(sex);
			assessor.setState("正常");
			assessorServiceImpl.addAssessor(assessor);
			dataProcessServiceImpl.loadAdminData();
			dataProcessServiceImpl.out(1);
		}else{
			dataProcessServiceImpl.out(0);
		}
	}
	public void addStaff(){
		Staff staff = staffServiceImpl.getStaffById(staffId+"");
		if(staff == null){
			staff = new Staff();
			staff.setId(staffId);
			staff.setName(staffName);
			staff.setDepartment(staffDepartment);
			staff.setPositionName(staffPosition);
			staff.setPassword("666666");
			staff.setRegisterDate(new Date());
			staff.setCreditIntegral(0);
			staff.setSex(sex);
			staff.setState("正常");
			staffServiceImpl.addStaff(staff);
			dataProcessServiceImpl.loadAdminData();
			dataProcessServiceImpl.out(1);
		}else{
			dataProcessServiceImpl.out(1);
		}
	}
	public void staffIdCheck(){
		Staff staff = staffServiceImpl.getStaffById(staffId+"");
		if(staff == null){
			dataProcessServiceImpl.out(1);
		}else{
			dataProcessServiceImpl.out(-1);
		}
	}
	public void assessorIdCheck(){
		Assessor assessor = assessorServiceImpl.getAssessorById(assessorId+"");
		if(assessor == null){
			dataProcessServiceImpl.out(1);
		}else{
			dataProcessServiceImpl.out(-1);
		}
	}
	public void disableAssessor(){
		Assessor assessor = assessorServiceImpl.getAssessorById(assessorId+"");
		if(assessor == null){
			dataProcessServiceImpl.out(-1);
		}else{
			assessor.setState("已封禁");
			assessorServiceImpl.updateAssessor(assessor);
			dataProcessServiceImpl.loadAdminData();
			dataProcessServiceImpl.out(1);
		}
	}
	public void disableStaff(){
		Staff staff = staffServiceImpl.getStaffById(staffId+"");
		if(staff == null){
			dataProcessServiceImpl.out(-1);
		}else{
			staff.setState("已封禁");
			staffServiceImpl.updateStaff(staff);
			dataProcessServiceImpl.loadAdminData();
			dataProcessServiceImpl.out(1);
		}
	}
	public void enableAssessor(){
		Assessor assessor = assessorServiceImpl.getAssessorById(assessorId+"");
		if(assessor == null){
			dataProcessServiceImpl.out(-1);
		}else{
			assessor.setState("正常");
			assessorServiceImpl.updateAssessor(assessor);
			dataProcessServiceImpl.loadAdminData();
			dataProcessServiceImpl.out(1);
		}
	}
	public void enableStaff(){
		Staff staff = staffServiceImpl.getStaffById(staffId+"");
		if(staff == null){
			dataProcessServiceImpl.out(-1);
		}else{
			staff.setState("正常");
			staffServiceImpl.updateStaff(staff);
			dataProcessServiceImpl.loadAdminData();
			dataProcessServiceImpl.out(1);
		}
	}
	
}
