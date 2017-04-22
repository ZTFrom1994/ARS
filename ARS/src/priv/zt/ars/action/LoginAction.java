package priv.zt.ars.action;

import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.Admin;
import priv.zt.ars.domain.Assessor;
import priv.zt.ars.domain.Staff;
import priv.zt.ars.service.AdminService;
import priv.zt.ars.service.AssessorService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.StaffService;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	
	private String id;
	private String password;
	private int userType;
	private String remFlag;
	public void setRemFlag(String remFlag) {
		this.remFlag = remFlag;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Autowired
	private StaffService staffServiceImpl;
	@Autowired
	private AssessorService assessorServiceImpl;
	@Autowired
	private AdminService adminServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	public void loginCheck() throws NoSuchAlgorithmException {
			int openState = dataProcessServiceImpl.getSystemOpenState();
			if(userType == 0){
				if(openState == 1 ){
					Staff  staff = staffServiceImpl.getStaffById(id);
					if(staff != null){
						if(staff.getState().equals("正常")){
							if(staff.getPassword().equals(password)){
								HttpServletResponse response = ServletActionContext.getResponse();
								if("1".equals(remFlag)){ //"1"表示用户勾选记住密码
									String loginInfo = remFlag+","+id+","+password+","+userType;
									Cookie userCookie=new Cookie("loginInfo",loginInfo); 
									userCookie.setMaxAge(30*24*60*60);   //存活期为一个月 30*24*60*60
									userCookie.setPath("/");
									response.addCookie(userCookie); 
								}else if("0".equals(remFlag)){
									Cookie userCookie=new Cookie("loginInfo",null);  //假如要删除名称为username的Cookie
									userCookie.setMaxAge(0); //立即删除型
									userCookie.setPath("/"); //项目所有目录均有效，这句很关键，否则不敢保证删除
									response.addCookie(userCookie); 
								}
								HttpSession session = ServletActionContext.getRequest().getSession();
								session.setAttribute("currentUser", staff);
								dataProcessServiceImpl.loadStaffData(id);
								dataProcessServiceImpl.out(userType);
							}else{
								dataProcessServiceImpl.out(-1);
							}
						}else if(staff.getState().equals("已封禁")){
							dataProcessServiceImpl.out(10);
						}else{
							dataProcessServiceImpl.out(-1);
						}
					}else{
						dataProcessServiceImpl.out(-1);
					}
				}else{
					dataProcessServiceImpl.out(11);
				}	
			}else if(userType == 1){
				if(openState == 1 ){
					Assessor  assessor = assessorServiceImpl.getAssessorById(id);
					if(assessor != null){
						if(assessor.getState().equals("正常")){
							if(assessor.getPassword().equals(password)){
								HttpServletResponse response = ServletActionContext.getResponse();
								if("1".equals(remFlag)){ //"1"表示用户勾选记住密码
									String loginInfo = remFlag+","+id+","+password+","+userType;
									Cookie userCookie=new Cookie("loginInfo",loginInfo); 
									userCookie.setMaxAge(30*24*60*60);   //存活期为一个月 30*24*60*60
									userCookie.setPath("/");
									response.addCookie(userCookie); 
								}else if("0".equals(remFlag)){
									Cookie userCookie=new Cookie("loginInfo",null);  //假如要删除名称为username的Cookie
									userCookie.setMaxAge(0); //立即删除型
									userCookie.setPath("/"); //项目所有目录均有效，这句很关键，否则不敢保证删除
									response.addCookie(userCookie); 
								}
								HttpSession session = ServletActionContext.getRequest().getSession();
								session.setAttribute("currentUser", assessor);
								dataProcessServiceImpl.loadAssessorData();
								dataProcessServiceImpl.out(userType);
							}else{
								dataProcessServiceImpl.out(-1);
							}
						}else if(assessor.getState().equals("已封禁")){
							dataProcessServiceImpl.out(10);
						}else{
							dataProcessServiceImpl.out(-1);
						}
					}else{
						dataProcessServiceImpl.out(-1);
					}
				}else{
					dataProcessServiceImpl.out(11);
				}	
			}else if(userType == 2){
				Admin  admin = adminServiceImpl.getAdminById(id);
				if(admin != null){
					if(admin.getPassword().equals(password)){
						HttpServletResponse response = ServletActionContext.getResponse();
						if("1".equals(remFlag)){ //"1"表示用户勾选记住密码
							String loginInfo = remFlag+","+id+","+password+","+userType;
							Cookie userCookie=new Cookie("loginInfo",loginInfo); 
							userCookie.setMaxAge(30*24*60*60);   //存活期为一个月 30*24*60*60
							userCookie.setPath("/");
							response.addCookie(userCookie); 
						}else if("0".equals(remFlag)){
							Cookie userCookie=new Cookie("loginInfo",null);  //假如要删除名称为username的Cookie
							userCookie.setMaxAge(0); //立即删除型
							userCookie.setPath("/"); //项目所有目录均有效，这句很关键，否则不敢保证删除
							response.addCookie(userCookie); 
						}
						HttpSession session = ServletActionContext.getRequest().getSession();
						session.setAttribute("currentUser", admin);
						dataProcessServiceImpl.loadAdminData();
						dataProcessServiceImpl.out(userType);
					}else{
						dataProcessServiceImpl.out(-1);
					}
				}else{
					dataProcessServiceImpl.out(-1);
				}
			}else{
				dataProcessServiceImpl.out(-1);
			}
		
	}
	public void logout() {
		Map<String, Object> session = ServletActionContext.getContext()
				.getSession();
			session.remove("currentUser");
	}
	public void isLogged() {
		Map<String, Object> session = ServletActionContext.getContext()
				.getSession();
		if (session.get("currentUser") != null) {
			dataProcessServiceImpl.out(1);
		} else {
			dataProcessServiceImpl.out(0);
		}
	}
	public void loadAdminData(){
		dataProcessServiceImpl.loadAdminData();
	}
	public void loadStaffData(){
		Staff staff = (Staff) ServletActionContext.getRequest().getSession().getAttribute("currentUser");
		dataProcessServiceImpl.loadStaffData(staff.getId()+"");
	}
	public void loadAssessorData(){
		dataProcessServiceImpl.loadAssessorData();
	}
}
