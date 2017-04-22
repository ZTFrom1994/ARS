package priv.zt.ars.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.Assessor;
import priv.zt.ars.domain.AssessorOperationRecord;
import priv.zt.ars.domain.BorrowApplication;
import priv.zt.ars.domain.DailyReimbursement;
import priv.zt.ars.domain.TravelReimbursement;
import priv.zt.ars.service.AssessorOperationRecordService;
import priv.zt.ars.service.BorrowApplicationService;
import priv.zt.ars.service.DailyReimbursementService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.EventService;
import priv.zt.ars.service.TravelReimbursementService;

import com.opensymphony.xwork2.ActionSupport;

public class ReservationProcessAction extends ActionSupport{
	private String order;
	
	public void setOrder(String order) {
		this.order = order;
	}
	@Autowired
	private DailyReimbursementService dailyReimServiceImpl;
	@Autowired
	private TravelReimbursementService travelReimServiceImpl;
	@Autowired
	private EventService eventSerivceImpl;
	@Autowired
	private BorrowApplicationService borrowApplicationServiceImpl;
	@Autowired
	private AssessorOperationRecordService assessorOperationRecordServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	public void dailyProcess(){
		String[] str = order.split(",");
		List<DailyReimbursement> list = new ArrayList<DailyReimbursement>();
		for (int i = 0; i < str.length; i++) {
			DailyReimbursement d = dailyReimServiceImpl.getReimbursementById(str[i].split("-")[1]);
			if(d != null){
				d.setState(str[i].split("-")[0] .equals("1")?"审核中":"预约失败");
				if(str[i].split("-")[0] .equals("0")){
					d.getEvent().setState(0);
					eventSerivceImpl.updateEvent(d.getEvent());
				}
				list.add(d);
				//添加operation记录
				AssessorOperationRecord assessorOperationRecord = new AssessorOperationRecord();
				assessorOperationRecord.setApplicationType("日常报销");
				assessorOperationRecord.setCheckType("预约审核");
				assessorOperationRecord.setOperationResult(str[i].split("-")[0] .equals("1")?"通过":"不通过");
				assessorOperationRecord.setOperationTime(new Date());
				HttpSession session = ServletActionContext.getRequest().getSession();
				assessorOperationRecord.setAssessor((Assessor)session.getAttribute("currentUser"));
				assessorOperationRecordServiceImpl.addRecord(assessorOperationRecord);
			}
		}
		dailyReimServiceImpl.batchUpdateWithList(list);
		dataProcessServiceImpl.loadAssessorData();
		//添加报销进度到消息队列
		dataProcessServiceImpl.out(1);
	}
	public void travelProcess(){
		String[] str = order.split(",");
		List<TravelReimbursement> list = new ArrayList<TravelReimbursement>();
		for (int i = 0; i < str.length; i++) {
			TravelReimbursement t = travelReimServiceImpl.getTravelById(str[i].split("-")[1]);
			if(t != null){
				t.setState(str[i].split("-")[0] .equals("1")?"审核中":"预约失败");
				if(str[i].split("-")[0] .equals("0")){
					t.getEvent().setState(0);
					eventSerivceImpl.updateEvent(t.getEvent());
				}
				list.add(t);
				//添加operation记录
				AssessorOperationRecord assessorOperationRecord = new AssessorOperationRecord();
				assessorOperationRecord.setApplicationType("差旅费报销");
				assessorOperationRecord.setCheckType("预约审核");
				assessorOperationRecord.setOperationResult(str[i].split("-")[0] .equals("1")?"通过":"不通过");
				assessorOperationRecord.setOperationTime(new Date());
				HttpSession session = ServletActionContext.getRequest().getSession();
				assessorOperationRecord.setAssessor((Assessor)session.getAttribute("currentUser"));
				assessorOperationRecordServiceImpl.addRecord(assessorOperationRecord);
			}
		}
		travelReimServiceImpl.batchUpdateWithList(list);
		dataProcessServiceImpl.loadAssessorData();
		//添加operation记录
		//添加报销进度到消息队列
		dataProcessServiceImpl.out(1);
	}
	public void borrowProcess(){
		String[] str = order.split(",");
		List<BorrowApplication> list = new ArrayList<BorrowApplication>();
		for (int i = 0; i < str.length; i++) {
			BorrowApplication b = borrowApplicationServiceImpl.getApplicationById(str[i].split("-")[1]);
			if(b != null){
				b.setState(str[i].split("-")[0] .equals("1")?"审核中":"预约失败");
				if(str[i].split("-")[0] .equals("0")){
					eventSerivceImpl.deleteEventById(b.getEvent().getId()+"");
					b.getEvent().setId(-1);
				}
				list.add(b);
				//添加operation记录
				AssessorOperationRecord assessorOperationRecord = new AssessorOperationRecord();
				assessorOperationRecord.setApplicationType("借款");
				assessorOperationRecord.setCheckType("预约审核");
				assessorOperationRecord.setOperationResult(str[i].split("-")[0] .equals("1")?"通过":"不通过");
				assessorOperationRecord.setOperationTime(new Date());
				HttpSession session = ServletActionContext.getRequest().getSession();
				assessorOperationRecord.setAssessor((Assessor)session.getAttribute("currentUser"));
				assessorOperationRecordServiceImpl.addRecord(assessorOperationRecord);
			}
		}
		borrowApplicationServiceImpl.batchUpdateWithList(list);
		dataProcessServiceImpl.loadAssessorData();
		//添加operation记录
		//添加报销进度到消息队列
		dataProcessServiceImpl.out(1);
	}
	
}
