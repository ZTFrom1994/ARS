package priv.zt.ars.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.ApplicationSheet;
import priv.zt.ars.domain.BorrowApplication;
import priv.zt.ars.domain.BorrowRecord;
import priv.zt.ars.domain.DailyReimbursement;
import priv.zt.ars.domain.DailyReimbursementItem;
import priv.zt.ars.domain.Event;
import priv.zt.ars.domain.OffsetBorrowing;
import priv.zt.ars.domain.Project;
import priv.zt.ars.domain.Staff;
import priv.zt.ars.domain.StaffHomeData;
import priv.zt.ars.domain.SystemSettings;
import priv.zt.ars.domain.TravelReimbursement;
import priv.zt.ars.domain.TravelReimbursementItem;
import priv.zt.ars.service.ApplicationSheetService;
import priv.zt.ars.service.BorrowApplicationService;
import priv.zt.ars.service.BorrowRecordService;
import priv.zt.ars.service.DailyReimbursementItemService;
import priv.zt.ars.service.DailyReimbursementService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.EventService;
import priv.zt.ars.service.OffsetBorrowingService;
import priv.zt.ars.service.ProjectService;
import priv.zt.ars.service.TravelReimbursementItemService;
import priv.zt.ars.service.TravelReimbursementService;

import com.opensymphony.xwork2.ActionSupport;



public class TravelReimbursementAction extends ActionSupport {
	private String items;
	private int counteractFlag;
	private int projectId;
	private String remarks;
	private int paymentType;
	private String startTime;
	private String endTime;
	private float totalMoney;
	private int totalSheets;
	private float counteractNumber;
	private int borrowRecordId;
	private int peopleNumber;
	private String place;
	private String travelTime;
	
	
	public void setItems(String items) {
		this.items = items;
	}
	public void setCounteractFlag(int counteractFlag) {
		this.counteractFlag = counteractFlag;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public void setPaymentType(int paymentType) {
		this.paymentType = paymentType;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public void setTotalMoney(float totalMoney) {
		this.totalMoney = totalMoney;
	}
	public void setTotalSheets(int totalSheets) {
		this.totalSheets = totalSheets;
	}
	public void setCounteractNumber(float counteractNumber) {
		this.counteractNumber = counteractNumber;
	}
	public void setBorrowRecordId(int borrowRecordId) {
		this.borrowRecordId = borrowRecordId;
	}
	public void setPeopleNumber(int peopleNumber) {
		this.peopleNumber = peopleNumber;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public void setTravelTime(String travelTime) {
		this.travelTime = travelTime;
	}
	@Autowired
	private TravelReimbursementService travelReimServiceImpl;
	@Autowired
	private TravelReimbursementItemService travelItemServiceImpl;
	@Autowired
	private EventService eventServiceImpl;
	@Autowired
	private OffsetBorrowingService offsetBorrowingServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	public void addSingleApplication(){
			//添加报销记录
			TravelReimbursement tra = new TravelReimbursement();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");//小写的mm表示的是分钟  
			Project p = new Project();
			p.setId(projectId);
			HttpSession session = ServletActionContext.getRequest().getSession();
			tra.setProposer((Staff)session.getAttribute("currentUser"));
			tra.setState("预约中");
			tra.setApplyDate(new Date());
			tra.setProject(p);
			tra.setRemarks(remarks);
			tra.setPeopleNumber(peopleNumber);
			tra.setPlace(place);
			tra.setPaymentType("现金");
			try {
				Date date = sdf.parse(travelTime);
				tra.setTravelTime(date);
				Event event = new Event();
				event.setColor("#D94F52");
				event.setTitle("差旅费报销");
				event.setStartTime(sdf.parse(startTime));
				event.setEndTime(sdf.parse(endTime));
				event.setState(1);
				eventServiceImpl.addEvent(event);
				tra.setEvent(event);
				OffsetBorrowing ob = new OffsetBorrowing();
				if(counteractFlag == 0){
					ob.setAmount(counteractNumber);
					BorrowRecord br = new BorrowRecord();
					br.setId(borrowRecordId);
					ob.setBorrowRecord(br);
					ob.setState("审核中");
					offsetBorrowingServiceImpl.addOffset(ob);
				}else{
					ob.setId(-1);
				}
				tra.setOffsetBorrowing(ob);
				tra.setTotalMoney(totalMoney);
				tra.setTotalSheets(totalSheets);
				travelReimServiceImpl.addTravelReimbursement(tra);
				List<TravelReimbursementItem> itemList = new ArrayList<TravelReimbursementItem>();
				String[] itemsArray = items.split("</br>");
				for (int i = 0; i < itemsArray.length; i++) {
					TravelReimbursementItem item = new TravelReimbursementItem();
					String[] options = itemsArray[i].split("-");
					item.setTraId(tra.getId());
 					item.setLargeClass(options[0]);
 					item.setSmallClass(options[1]);
 					item.setPeopleNumber(Integer.parseInt(options[2]));
 					item.setSinglePrice(Float.parseFloat(options[3]));
 					item.setSheetNumber(Integer.parseInt(options[4]));
 					item.setDescription(options[5]);
 					itemList.add(item);
				}
				travelItemServiceImpl.batchAddByList(itemList);
				Staff staff = (Staff)session.getAttribute("currentUser");
				dataProcessServiceImpl.loadStaffData(staff.getId()+"");
				dataProcessServiceImpl.out(1);
			} catch (ParseException e) {
				System.out.println("日期转换出错！添加失败！");
				dataProcessServiceImpl.out(-1);
				e.printStackTrace();
			}
			
	}
}
