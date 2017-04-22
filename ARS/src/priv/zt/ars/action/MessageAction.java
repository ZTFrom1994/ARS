package priv.zt.ars.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.Admin;
import priv.zt.ars.domain.Assessor;
import priv.zt.ars.domain.Message;
import priv.zt.ars.domain.NoReadMessage;
import priv.zt.ars.domain.Staff;
import priv.zt.ars.service.AdminService;
import priv.zt.ars.service.AssessorService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.MessageService;
import priv.zt.ars.service.NoReadMessageService;
import priv.zt.ars.service.StaffService;

import com.opensymphony.xwork2.ActionSupport;

public class MessageAction extends ActionSupport {
	private int sendObject;
	private String sendContent;
	public void setSendObject(int sendObject) {
		this.sendObject = sendObject;
	}
	public void setSendContent(String sendContent) {
		this.sendContent = sendContent;
	}
	@Autowired
	private MessageService messageServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	@Autowired
	private NoReadMessageService noReadMessageServiceImpl;
	@Autowired
	private StaffService staffServiceImpl;
	@Autowired
	private AssessorService assessorServiceImpl;
	@Autowired
	private AdminService adminServiceImpl;
	public void addMessage(){
		Message message = new Message();
		message.setContent(sendContent);
		message.setObject(sendObject);
		Admin admin = (Admin) ServletActionContext.getRequest().getSession().getAttribute("currentUser");
		message.setAdmin(admin);
		message.setState("已发送");
		message.setType("推送");
		message.setDate(new Date());
		messageServiceImpl.addMessage(message);
		List<NoReadMessage> noReadMessages = new ArrayList<NoReadMessage>();
		List<Admin> admins = null;
		List<Staff> staffs = null;
		List<Assessor> assessors = null;
		NoReadMessage noReadMessage = null;
		if(sendObject == 0){
			//all people
			admins = adminServiceImpl.getAllAdmin();
			if(admins != null){
				for(Admin a:admins){
					noReadMessage = new NoReadMessage();
					noReadMessage.setMessage(message);
					noReadMessage.setUserId(a.getId());
					noReadMessage.setUserType(0);//0 admin 1 assessor 2 staff
					noReadMessages.add(noReadMessage);
				}
				
			}
			staffs = staffServiceImpl.getAllStaff();
			if(staffs != null){
				for(Staff s:staffs){
					noReadMessage = new NoReadMessage();
					noReadMessage.setMessage(message);
					noReadMessage.setUserId(s.getId());
					noReadMessage.setUserType(2);//0 admin 1 assessor 2 staff
					noReadMessages.add(noReadMessage);
				}
			}
			assessors = assessorServiceImpl.getAllAssessor();
			if(assessors != null){
				for(Assessor as:assessors){
					noReadMessage = new NoReadMessage();
					noReadMessage.setMessage(message);
					noReadMessage.setUserId(as.getId());
					noReadMessage.setUserType(1);//0 admin 1 assessor 2 staff
					noReadMessages.add(noReadMessage);
				}
			}
			noReadMessageServiceImpl.batchAddNoReadMessage(noReadMessages);
		}else if(sendObject == 1){
			//assessor
			assessors = assessorServiceImpl.getAllAssessor();
			if(assessors != null){
				for(Assessor as:assessors){
					noReadMessage = new NoReadMessage();
					noReadMessage.setMessage(message);
					noReadMessage.setUserId(as.getId());
					noReadMessage.setUserType(1);//0 admin 1 assessor 2 staff
					noReadMessages.add(noReadMessage);
				}
			}
			noReadMessageServiceImpl.batchAddNoReadMessage(noReadMessages);
		}else if(sendObject == 2){
			staffs = staffServiceImpl.getAllStaff();
			if(staffs != null){
				for(Staff s:staffs){
					noReadMessage = new NoReadMessage();
					noReadMessage.setMessage(message);
					noReadMessage.setUserId(s.getId());
					noReadMessage.setUserType(2);//0 admin 1 assessor 2 staff
					noReadMessages.add(noReadMessage);
				}
			}
			noReadMessageServiceImpl.batchAddNoReadMessage(noReadMessages);
		}else if(sendObject == 3){
			admins = adminServiceImpl.getAllAdmin();
			if(admins != null){
				for(Admin a:admins){
					noReadMessage = new NoReadMessage();
					noReadMessage.setMessage(message);
					noReadMessage.setUserId(a.getId());
					noReadMessage.setUserType(0);//0 admin 1 assessor 2 staff
					noReadMessages.add(noReadMessage);
				}
				
			}
			noReadMessageServiceImpl.batchAddNoReadMessage(noReadMessages);
		}else{
			dataProcessServiceImpl.out(0);
			return ;
		}
		dataProcessServiceImpl.out(1);
	}
	public void clearAdminNoReadMessage(){
		Admin admin = (Admin)ServletActionContext.getRequest().getSession().getAttribute("currentUser");
		noReadMessageServiceImpl.clearAdminNoReadMessageById(admin.getId());
	}
	public void clearAssessorNoReadMessage(){
		Assessor assessor = (Assessor) ServletActionContext.getRequest().getSession().getAttribute("currentUser");
		noReadMessageServiceImpl.clearAssessorNoReadMessageById(assessor.getId());
	}
	public void clearStaffNoReadMessage(){
		Staff staff = (Staff) ServletActionContext.getRequest().getSession().getAttribute("currentUser");
		noReadMessageServiceImpl.clearStaffNoReadMessageById(staff.getId());
	}
}
