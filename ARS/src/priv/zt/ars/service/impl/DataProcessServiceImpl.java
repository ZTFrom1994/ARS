package priv.zt.ars.service.impl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.domain.Admin;
import priv.zt.ars.domain.AdminHomeData;
import priv.zt.ars.domain.ApplicationSheet;
import priv.zt.ars.domain.Assessor;
import priv.zt.ars.domain.AssessorHomeData;
import priv.zt.ars.domain.AssessorOperationRecord;
import priv.zt.ars.domain.BorrowApplication;
import priv.zt.ars.domain.BorrowRecord;
import priv.zt.ars.domain.DailyReimbursement;
import priv.zt.ars.domain.Message;
import priv.zt.ars.domain.NoReadMessage;
import priv.zt.ars.domain.Project;
import priv.zt.ars.domain.Staff;
import priv.zt.ars.domain.StaffHomeData;
import priv.zt.ars.domain.SystemSettings;
import priv.zt.ars.domain.TravelReimbursement;
import priv.zt.ars.service.AdminService;
import priv.zt.ars.service.ApplicationSheetService;
import priv.zt.ars.service.AssessorOperationRecordService;
import priv.zt.ars.service.AssessorService;
import priv.zt.ars.service.BorrowApplicationService;
import priv.zt.ars.service.BorrowRecordService;
import priv.zt.ars.service.DailyReimbursementService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.MessageService;
import priv.zt.ars.service.NoReadMessageService;
import priv.zt.ars.service.ProjectService;
import priv.zt.ars.service.StaffService;
import priv.zt.ars.service.TravelReimbursementService;
@Service("dataProcessService")
public class DataProcessServiceImpl implements DataProcessService {
	@Autowired
	private ProjectService projectServiceImpl;
	@Autowired
	private DailyReimbursementService dailyReimServiceImpl;
	@Autowired
	private BorrowRecordService borrowRecordServiceImpl;
	@Autowired
	private TravelReimbursementService travelReimServiceImpl;
	@Autowired
	private ApplicationSheetService sheetServiceImpl;
	@Autowired
	private BorrowApplicationService borrowApplicationServiceImpl;
	@Autowired
	private AssessorOperationRecordService assessorOperationRecordServiceImpl;
	@Autowired
	private AssessorService assessorServiceImpl;
	@Autowired
	private StaffService staffServiceImpl;
	@Autowired 
	private AdminService adminServiceImpl;
	@Autowired
	private NoReadMessageService noReadMessageServiceImpl;
	@Autowired
	private MessageService messageServiceImpl;
	public void loadAdminData() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		Admin admin = (Admin)session.getAttribute("currentUser");
		List<Staff> staffList = staffServiceImpl.getAllStaff();
		List<Assessor> assessorList = assessorServiceImpl.getAllAssessor();
		
		AdminHomeData adminHomeData = new AdminHomeData();
		List<Admin> admins = adminServiceImpl.getAllAdmin();
		List<Assessor> assessors = assessorServiceImpl.getAllAssessor();
		List<Staff> staffs = staffServiceImpl.getAllStaff();
		adminHomeData.setAdminNumber(admins == null?0:admins.size());
		adminHomeData.setAssessorNumber(assessors == null ?0:assessors.size());
		adminHomeData.setStaffNumber(staffs == null?0:staffs.size());
		adminHomeData.setDisabledTotal(staffServiceImpl.getDisabledCount()+assessorServiceImpl.getDisabledCount());
		adminHomeData.setMessageNumber(messageServiceImpl.getCountById(admin.getId()));
		session.setAttribute("adminHomeData", adminHomeData);
		session.setAttribute("staffList", staffList);
		session.setAttribute("assessorList", assessorList);
		
		loadSystemSettings();
		List<NoReadMessage> adminNoReadMessage = noReadMessageServiceImpl.getAdminNoReadMessageById(admin.getId());
		session.setAttribute("adminNoReadMessage", adminNoReadMessage);
		
		List<Message> adminMessages = messageServiceImpl.getMessageByObject(3);
 		session.setAttribute("adminMessages", adminMessages);
 		
 		List<Message> allPushedMessages = messageServiceImpl.getAllMessage();
 		session.setAttribute("allPushedMessages", allPushedMessages);
	}

	public void loadSystemSettings() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		//系统功能设置
		SAXReader reader = new SAXReader();
		try {
			String path = getClass().getClassLoader().getResource("function_settings.xml").getPath();  ;
			Document document = reader.read(new File(path));
			Element root = document.getRootElement(); 
			List<Element> functionElements = root.element("functions").elements(); 
			SystemSettings systemSettings = new SystemSettings();
			for(Element e :functionElements){
				String name = e.attribute("name").getValue();
				if(name.equals("dailyReimbursement")){
					systemSettings.setDailyFunction(e.getText());
				}
				if(name.equals("travelReimbursement")){
					systemSettings.setTravelFunction(e.getText());
				}
				if(name.equals("offsetBorrowing")){
					systemSettings.setOffsetFunction(e.getText());
				}
				if(name.equals("borrow")){
					systemSettings.setBorrowFunction(e.getText());
				}
			}
			systemSettings.setSystemOpen(Integer.parseInt(root.element("system-open").getText()));
			session.setAttribute("systemSettings", systemSettings);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
	}
	public int getSystemOpenState(){
		SAXReader reader = new SAXReader();
		String path = getClass().getClassLoader().getResource("function_settings.xml").getPath();  ;
		Document document;
		try {
			document = reader.read(new File(path));
			Element root = document.getRootElement(); 
			Element open = root.element("system-open"); 
			if(open.getText().equals("1")){
				return 1;
			}else{
				return 0;
			}
		} catch (DocumentException e) {
			e.printStackTrace();
			return -1;
		}
		
	}
	public void loadAssessorData() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		//加载预约数据
		List<DailyReimbursement> dailyReimbursements = dailyReimServiceImpl.getReimbursementByState("预约中");
		List<TravelReimbursement> travelReimbursements = travelReimServiceImpl.getTravelByState("预约中");
		List<BorrowApplication> borrowApplications = borrowApplicationServiceImpl.getApplicationByState("预约中");
		session.setAttribute("travelReimbursements", travelReimbursements);
		session.setAttribute("dailyReimbursements", dailyReimbursements);
		session.setAttribute("borrowApplications", borrowApplications);
		
		//加载审核数据
		List<DailyReimbursement> dailyList = dailyReimServiceImpl.getReimbursementByState("审核中");
		List<TravelReimbursement> travelList = travelReimServiceImpl.getTravelByState("审核中");
		List<BorrowApplication> borrowList = borrowApplicationServiceImpl.getApplicationByState("审核中");
		List<ApplicationSheet> sheets = new ArrayList<ApplicationSheet>();
		for (int i = 0; i < (dailyList != null?dailyList.size():0); i++) {
			ApplicationSheet sheet = sheetServiceImpl.getSheetByDailyReimbursementId(dailyList.get(i).getId()+"");
			if(sheet != null){
				sheet.setDailyReimbursement(dailyList.get(i));
				sheets.add(sheet);
			}
		}
		for (int i = 0; i < (travelList != null?travelList.size():0); i++) {
			ApplicationSheet sheet = sheetServiceImpl.getSheetByTravelReimbursementId(travelList.get(i).getId()+"");
			if(sheet != null){
				sheet.setTravelReimbursement(travelList.get(i));
				sheets.add(sheet);
			}
		}
		for (int i = 0; i < (borrowList != null?borrowList.size():0); i++) {
			ApplicationSheet sheet = sheetServiceImpl.getSheetByBorrowApplicationId(borrowList.get(i).getId()+"");
			if(sheet != null){
				sheet.setBorrowApplication(borrowList.get(i));
				sheets.add(sheet);
			}
		}
		if(sheets.size() == 0){
			sheets = null;
		}
		session.setAttribute("checkAndRegisterList", sheets);
		//加载首页数据
		AssessorHomeData assessorHomeData = new AssessorHomeData();
		int dReserNumber = (dailyReimbursements == null?0:dailyReimbursements.size());
		int tReserNumber = (travelReimbursements == null?0:travelReimbursements.size());
		int bReserNumber = (borrowApplications == null?0:borrowApplications.size());
		assessorHomeData.setReservationNumber(dReserNumber+tReserNumber+bReserNumber);
		int dCheckNumber = (dailyList == null?0:dailyList.size());
		int tCheckNumber = (travelList == null?0:travelList.size());
		int bCheckNumber = (borrowList == null?0:borrowList.size());
		assessorHomeData.setReimCheckNumber(dCheckNumber+tCheckNumber);
		assessorHomeData.setBorrowCheckNumber(bCheckNumber);
		Assessor assessor = (Assessor)session.getAttribute("currentUser");
		List<AssessorOperationRecord> operationRecords = assessorOperationRecordServiceImpl.getTopThreeRecordByAssessorId(assessor.getId()+"");
		assessorHomeData.setOperationRecords(operationRecords);
		session.setAttribute("assessorHomeData", assessorHomeData);
		
		//加载待结算的借款
		List<BorrowRecord> borrowRecords = borrowRecordServiceImpl.getRecentReturnRecord();
		System.out.println(borrowRecords.size());
		List<ApplicationSheet> applicationSheets = new ArrayList<ApplicationSheet>();
		for (int i = 0; i < (borrowRecords == null?0:borrowRecords.size()); i++) {
			ApplicationSheet applicationSheet = sheetServiceImpl.getSheetByBorrowApplicationId(borrowRecords.get(i).getApplicationId()+"");
			System.out.println(applicationSheet);
			applicationSheet.setBorrowRecord(borrowRecords.get(i));
			applicationSheets.add(applicationSheet);
		}
		session.setAttribute("clearingBorrow", applicationSheets);
		loadSystemSettings();
		
		List<NoReadMessage> assessorNoReadMessage = noReadMessageServiceImpl.getAssessorNoReadMessageById(assessor.getId());
		session.setAttribute("assessorNoReadMessage", assessorNoReadMessage);
		
		List<Message> assessorMessages = messageServiceImpl.getMessageByObject(1);
 		session.setAttribute("assessorMessages", assessorMessages);
	}

	public void loadStaffData(String id) {
		HttpSession session = ServletActionContext.getRequest().getSession();
		List<Project> projects = projectServiceImpl.getProjectByPrincipalId(id);
		List<BorrowRecord> payingBorrows = borrowRecordServiceImpl.getRecordByStateAndBorrowerId("还款中", id);
		List<BorrowRecord> allBorrowRecords = borrowRecordServiceImpl.getRecordByBorrowerId(id);
		session.setAttribute("payingBorrows", payingBorrows);
		session.setAttribute("allBorrowRecords", allBorrowRecords);
		session.setAttribute("projects", projects);
		//加载首页数据
		StaffHomeData data = new StaffHomeData();
		Calendar a=Calendar.getInstance();
		int year = a.get(Calendar.YEAR);
		int month = a.get(Calendar.MONTH)+1;
		int myId = Integer.parseInt(id);
		int dailyTotal = dailyReimServiceImpl.getCountByDateAndProposerId(year,month,myId);
		int travelTotal =travelReimServiceImpl.getCountByDateAndProposerId(year,month,myId);
		data.setMonthTotalReimbursement(dailyTotal+travelTotal);//本月总共报销次数
		int approvedDaily = dailyReimServiceImpl.getApprovedCountByDateAndProposerId(year,month,myId);
		int approvedTravel = travelReimServiceImpl.getApprovedCountByDateAndProposerId(year, month,myId);
		data.setMonthTotalApprovedReim(approvedDaily+approvedTravel);//本月成功次数
		List<ApplicationSheet> applicationSheets = sheetServiceImpl.getTopFiveSheetsByStaffId(myId);
		data.setApplicationSheets(applicationSheets);//申请记录
		List<DailyReimbursement> dailyList = dailyReimServiceImpl.getReimbursementByStateAndProposerId("预约中", id);
		List<TravelReimbursement> travelList = travelReimServiceImpl.getTravelByStateAndProposerId("预约中", id);
		List<BorrowApplication> borrowApplications = borrowApplicationServiceImpl.getApplicationByStateAndBorrowerId("预约中", id);
		int daily =  dailyList == null ?0:dailyList.size();
		int travel = travelList == null ?0:travelList.size();
		int borrow = borrowApplications == null ?0:borrowApplications.size();
		data.setNumberOfSentReservations(daily+travel+borrow);
		List<DailyReimbursement> dailyList2 = dailyReimServiceImpl.getReimbursementByStateAndProposerId("未通过审核", id);
		List<TravelReimbursement> travelList2 = travelReimServiceImpl.getTravelByStateAndProposerId("未通过审核", id);
		int daily2 =  dailyList2 == null ?0:dailyList2.size();
		int travel2 = travelList2 == null ?0:travelList2.size();
		data.setNumberOfFailReimSheets(daily2+travel2);//未通过申请次数
		List<BorrowRecord> records = borrowRecordServiceImpl.getRecordByStateAndBorrowerId("还款中", id);
		data.setNumberOfMyBorrowingRecord(records == null?0:records.size());//再借shu
		
		List<DailyReimbursement> dList = dailyReimServiceImpl.getReimbursementByStateAndProposerId("已报销", id);
		List<TravelReimbursement> tList = travelReimServiceImpl.getTravelByStateAndProposerId("已报销", id);
		float dTotal = 0.00f;
		float tTotal = 0.00f;
		for (int i = 0; i < (dList == null?0:dList.size()); i++) {
			dTotal += dList.get(i).getTotalMoney();
		}
		for (int i = 0; i < (tList == null?0:tList.size()); i++) {
			tTotal += tList.get(i).getTotalMoney();
		}
		data.setTotalReimMoney(dTotal+tTotal);
		session.setAttribute("staffHomeData", data);
		loadSystemSettings();
		
		List<NoReadMessage> staffNoReadMessage = noReadMessageServiceImpl.getStaffNoReadMessageById(Integer.parseInt(id));
		session.setAttribute("staffNoReadMessage", staffNoReadMessage);
		
		List<Message> staffMessages = messageServiceImpl.getMessageByObject(2);
 		session.setAttribute("staffMessages", staffMessages);
	}

	public void out(String msg) {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.print(msg);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void out(int msg) {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer;
		try {
			writer = response.getWriter();
			writer.print(msg);
			writer.flush();
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
