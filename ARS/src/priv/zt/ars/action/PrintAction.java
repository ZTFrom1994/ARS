package priv.zt.ars.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.BorrowApplication;
import priv.zt.ars.domain.DailyReimbursement;
import priv.zt.ars.domain.ApplicationSheet;
import priv.zt.ars.domain.Staff;
import priv.zt.ars.domain.TravelReimbursement;
import priv.zt.ars.service.ApplicationSheetService;
import priv.zt.ars.service.BorrowApplicationService;
import priv.zt.ars.service.DailyReimbursementService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.TravelReimbursementService;

import com.opensymphony.xwork2.ActionSupport;

public class PrintAction extends ActionSupport {
	private String id;
	public void setId(String id) {
		this.id = id;
	}
	@Autowired
	private DailyReimbursementService dailyReimbursementServiceImpl;
	@Autowired
	private TravelReimbursementService travelReimServiceimpl;
	@Autowired
	private ApplicationSheetService sheetServiceImpl;
	@Autowired
	private BorrowApplicationService borrowApplicationServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	
	public void dailyReimbursementPrint(){
		DailyReimbursement dailyReimPrinted = dailyReimbursementServiceImpl.getReimbursementById(id);
		if(dailyReimPrinted != null){
			HttpSession session = ServletActionContext.getRequest().getSession();
			Staff staff = (Staff)session.getAttribute("currentUser");
			ApplicationSheet printSheet = null;
			if(dailyReimPrinted.getSheetId() == 0 && dailyReimPrinted.getState().equals("审核中")){
				//添加一条申请记录
				printSheet = new ApplicationSheet();
				printSheet.setType("日常报销");
				printSheet.setDate(new Date());
				printSheet.setStaffId(staff.getId());
				printSheet.setReimbursementResult("待现场审核");
				printSheet.setRemarks("无");
				sheetServiceImpl.addSheet(printSheet);
				List<DailyReimbursement> list = new ArrayList<DailyReimbursement>();
				dailyReimPrinted.setSheetId(printSheet.getId());
				list.add(dailyReimPrinted);
				dailyReimbursementServiceImpl.batchUpdateWithList(list);
			}
			printSheet = sheetServiceImpl.getSheetByDailyReimbursementId(dailyReimPrinted.getId()+"");
			printSheet.setDailyReimbursement(dailyReimPrinted);
			session.setAttribute("printSheet", printSheet);
			dataProcessServiceImpl.out(1);
		}else{
			dataProcessServiceImpl.out(-1);
		}
	}
	public void travelReimbursementPrint(){
		TravelReimbursement travelReimPrinted = travelReimServiceimpl.getTravelById(id+"");
		if(travelReimPrinted != null){
			HttpSession session = ServletActionContext.getRequest().getSession();
			Staff staff = (Staff)session.getAttribute("currentUser");
			ApplicationSheet printSheet = null;
			if(travelReimPrinted.getSheetId() == 0 && travelReimPrinted.getState().equals("审核中")){
				//添加一条申请记录
				printSheet = new ApplicationSheet();
				printSheet.setType("差旅费报销");
				printSheet.setDate(new Date());
				printSheet.setStaffId(staff.getId());
				printSheet.setReimbursementResult("待现场审核");
				printSheet.setRemarks("无");
				sheetServiceImpl.addSheet(printSheet);
				List<TravelReimbursement> list = new ArrayList<TravelReimbursement>();
				travelReimPrinted.setSheetId(printSheet.getId());
				list.add(travelReimPrinted);
				travelReimServiceimpl.batchUpdateWithList(list);
			}
			printSheet = sheetServiceImpl.getSheetByTravelReimbursementId(travelReimPrinted.getId()+"");
			printSheet.setTravelReimbursement(travelReimPrinted);
			
			session.setAttribute("printSheet", printSheet);
			dataProcessServiceImpl.out(1);
		}else{
			dataProcessServiceImpl.out(-1);
		}
	}
	public void borrowApplicationPrint(){
		BorrowApplication borrowApplication = borrowApplicationServiceImpl.getApplicationById(id+"");
		if(borrowApplication!=null){
			HttpSession session = ServletActionContext.getRequest().getSession();
			Staff staff = (Staff)session.getAttribute("currentUser");
			ApplicationSheet printSheet = null;
			if(borrowApplication.getSheetId() == 0 && borrowApplication.getState().equals("审核中")){
				//添加一条申请记录
				printSheet = new ApplicationSheet();
				printSheet.setType("借款");
				printSheet.setDate(new Date());
				printSheet.setStaffId(staff.getId());
				printSheet.setReimbursementResult("待现场审核");
				printSheet.setRemarks("无");
				sheetServiceImpl.addSheet(printSheet);
				List<BorrowApplication> list = new ArrayList<BorrowApplication>();
				borrowApplication.setSheetId(printSheet.getId());
				list.add(borrowApplication);
				borrowApplicationServiceImpl.batchUpdateWithList(list);
			}
			printSheet = sheetServiceImpl.getSheetByBorrowApplicationId(borrowApplication.getId()+"");
			printSheet.setBorrowApplication(borrowApplication);
			session.setAttribute("printSheet", printSheet);
			dataProcessServiceImpl.out(1);
		}else{
			dataProcessServiceImpl.out(-1);
		}
		
	}
}
