package priv.zt.ars.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.Assessor;
import priv.zt.ars.domain.BorrowApplication;
import priv.zt.ars.domain.BorrowRecord;
import priv.zt.ars.domain.Event;
import priv.zt.ars.domain.PaymentRecord;
import priv.zt.ars.domain.Project;
import priv.zt.ars.domain.Staff;
import priv.zt.ars.service.AssessorService;
import priv.zt.ars.service.BorrowApplicationService;
import priv.zt.ars.service.BorrowRecordService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.EventService;
import priv.zt.ars.service.PaymentRecordService;
import priv.zt.ars.service.StaffService;

import com.opensymphony.xwork2.ActionSupport;

public class BorrowAction extends ActionSupport {
	private int projectId;
	private int borrowNumber;
	private String remarks;
	private String startTime;
	private String endTime;
	private String use;
	private int paymentDays;
	private int clearingBorrowSheetId;
	private float clearingNumber;
	
	public void setClearingBorrowSheetId(int clearingBorrowSheetId) {
		this.clearingBorrowSheetId = clearingBorrowSheetId;
	}
	public void setClearingNumber(float clearingNumber) {
		this.clearingNumber = clearingNumber;
	}
	public void setPaymentDays(int paymentDays) {
		this.paymentDays = paymentDays;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public void setBorrowNumber(int borrowNumber) {
		this.borrowNumber = borrowNumber;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public void setUse(String use) {
		this.use = use;
	}
	
	@Autowired
	private BorrowApplicationService borrowApplicationServiceImpl;
	@Autowired
	private EventService eventServiceImpl;
	@Autowired
	private BorrowRecordService borrowRecordServiceImpl;
	@Autowired
	private StaffService staffServiceImpl;
	@Autowired
	private AssessorService assessorServiceImpl;
	@Autowired
	private PaymentRecordService paymentRecordServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	public void addBorrowApplication(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");//小写的mm表示的是分钟  
		BorrowApplication application = new BorrowApplication();
		Project p = new Project();
		p.setId(projectId);
		application.setProject(p);
		application.setAmount(borrowNumber);
		application.setState("预约中");
		application.setBorrower((Staff)session.getAttribute("currentUser"));
		application.setApplyDate(new Date());
		application.setUse(use);
		application.setPaymentType("现金");
		application.setRemarks(remarks);
		application.setPaymentDaysLimit(paymentDays);
		Event event = new Event();
		event.setColor("#58A697");
		event.setTitle("借款");
		try {
			event.setStartTime(sdf.parse(startTime));
			event.setEndTime(sdf.parse(endTime));
			eventServiceImpl.addEvent(event);
			application.setEvent(event);
			application.setLeaveMessages("");
			borrowApplicationServiceImpl.addApplication(application);
			Staff staff = (Staff)session.getAttribute("currentUser");
			dataProcessServiceImpl.loadStaffData(staff.getId()+"");
			dataProcessServiceImpl.out(1);
		} catch (ParseException e) {
			dataProcessServiceImpl.out(-1);
			e.printStackTrace();
		}
	}
	public void clearingBorrow(){
		BorrowApplication application = borrowApplicationServiceImpl.getApplicationBySheetId(clearingBorrowSheetId+"");
		if(application != null){
			BorrowRecord record = borrowRecordServiceImpl.getRecordByApplicationId(application.getId());
			if(record != null){
				float money = record.getPaidMoney()+clearingNumber;
				if(money >= record.getAmount()){
					if(record.getPaymentTime().before(new Date())){
						int days = daysBetween(record.getPaymentTime(),new Date());
						Staff borrower = record.getBorrower();
						borrower.setCreditIntegral(borrower.getCreditIntegral() - days*4);
						staffServiceImpl.updateStaff(borrower);
					}
					record.setState("已还清款项");
				}
				record.setPaidMoney(record.getPaidMoney()+clearingNumber);
				borrowRecordServiceImpl.updateRecord(record);
				HttpSession session = ServletActionContext.getRequest().getSession();
				Assessor assessor = (Assessor)session.getAttribute("currentUser");
				assessor.setOperationTimes(assessor.getOperationTimes()+1);
				assessorServiceImpl.updateAssessor(assessor);
				PaymentRecord paymentRecord = new PaymentRecord();
				paymentRecord.setAmount(clearingNumber);
				paymentRecord.setAssessor(assessor);
				paymentRecord.setBorrowRecord(record);
				paymentRecordServiceImpl.addRecord(paymentRecord);
				//加载待结算的借款
				dataProcessServiceImpl.loadAssessorData();
				dataProcessServiceImpl.out(0);
			}else{
				dataProcessServiceImpl.out(0);
			}
		}else{
			dataProcessServiceImpl.out(0);
		}
	}
	public static int daysBetween(Date smdate,Date bdate)  
    {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        try {
			smdate=sdf.parse(sdf.format(smdate));
			 bdate=sdf.parse(sdf.format(bdate));  
		} catch (ParseException e) {
			e.printStackTrace();
		}  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(smdate);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(bdate);    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time2-time1)/(1000*3600*24);  
            
       return Integer.parseInt(String.valueOf(between_days));           
    }    
	
}
