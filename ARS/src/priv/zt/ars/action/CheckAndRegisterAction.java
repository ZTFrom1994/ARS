package priv.zt.ars.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.ApplicationSheet;
import priv.zt.ars.domain.Assessor;
import priv.zt.ars.domain.AssessorOperationRecord;
import priv.zt.ars.domain.BorrowApplication;
import priv.zt.ars.domain.BorrowRecord;
import priv.zt.ars.domain.DailyReimbursement;
import priv.zt.ars.domain.OffsetBorrowing;
import priv.zt.ars.domain.Staff;
import priv.zt.ars.domain.TravelReimbursement;
import priv.zt.ars.service.ApplicationSheetService;
import priv.zt.ars.service.AssessorOperationRecordService;
import priv.zt.ars.service.AssessorService;
import priv.zt.ars.service.BorrowApplicationService;
import priv.zt.ars.service.BorrowRecordService;
import priv.zt.ars.service.DailyReimbursementService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.OffsetBorrowingService;
import priv.zt.ars.service.StaffService;
import priv.zt.ars.service.TravelReimbursementService;

import com.opensymphony.xwork2.ActionSupport;

public class CheckAndRegisterAction extends ActionSupport {
	private String order;
	public void setOrder(String order) {
		this.order = order;
	}
	@Autowired
	private DailyReimbursementService dailyReimServiceImpl;
	@Autowired
	private TravelReimbursementService travelReimServiceImpl;
	@Autowired
	private ApplicationSheetService sheetServiceImpl;
	@Autowired
	private BorrowApplicationService borrowApplicationServiceImpl;
	@Autowired
	private BorrowRecordService borrowRecordServiceImpl;
	@Autowired
	private OffsetBorrowingService offsetBorrowingServiceImpl;
	@Autowired
	private AssessorOperationRecordService assessorOperationRecordServiceImpl;
	@Autowired
	private StaffService staffServiceImpl;
	@Autowired
	private AssessorService assessorServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	public void checkReimbursement(){
		String[] orders = order.split(";");
		for (int i = 0; i < orders.length; i++) {
			String[] items = orders[i].split("-");
			ApplicationSheet sheet = sheetServiceImpl.getSheetById(items[1]);
			if(sheet != null){
				sheet.setInvoiceCheck(items[2].equals("1")?"发票无误":"不合格");
				sheet.setReimbursementResult(items[3].equals("1")?"已报销":"未报销");
				sheet.setRemarks(items[4]);
				sheetServiceImpl.updateSheet(sheet);
				if(items[0].equals("d")){
					DailyReimbursement dailyReim = dailyReimServiceImpl.getDailyBySheetId(items[1]);
					if(dailyReim != null){
						dailyReim.setLeaveMessages(items[4]);
						dailyReim.setFinishDate(new Date());
						dailyReim.setState(items[3].equals("1")?"已报销":"未通过审核");
						List<DailyReimbursement> list = new ArrayList<DailyReimbursement>();
						list.add(dailyReim);
						dailyReimServiceImpl.batchUpdateWithList(list);
						//borrowrecord处理
						if(dailyReim.getOffsetBorrowing() !=null && dailyReim.getOffsetBorrowing().getId() != 0){
							if(items[3].equals("1")){
								BorrowRecord borrowRecord = borrowRecordServiceImpl.getRecordById(dailyReim.getOffsetBorrowing().getBorrowRecord().getId());
								borrowRecord.setPaidMoney(borrowRecord.getPaidMoney()+dailyReim.getOffsetBorrowing().getAmount());
								if(borrowRecord.getAmount() <=  borrowRecord.getPaidMoney()){
									if(borrowRecord.getPaymentTime().before(new Date())){
										int days = daysBetween(borrowRecord.getPaymentTime(),new Date());
										Staff borrower = borrowRecord.getBorrower();
										borrower.setCreditIntegral(borrower.getCreditIntegral() - days*4);
										staffServiceImpl.updateStaff(borrower);
									}
									borrowRecord.setState("已还清款项");
								}
								borrowRecordServiceImpl.updateRecord(borrowRecord);
							}
							//offsetBorrowing 处理
							OffsetBorrowing borrowing = dailyReim.getOffsetBorrowing();
							borrowing.setState(items[3].equals("1")?"已冲借款":"未通过审核");
							offsetBorrowingServiceImpl.updateOffsetBorrowing(borrowing);
						}
						//添加operation记录
						AssessorOperationRecord assessorOperationRecord = new AssessorOperationRecord();
						assessorOperationRecord.setApplicationType("日常报销");
						assessorOperationRecord.setCheckType("现场审核");
						assessorOperationRecord.setOperationResult(items[3].equals("1")?"通过":"不通过");
						assessorOperationRecord.setOperationTime(new Date());
						HttpSession session = ServletActionContext.getRequest().getSession();
						Assessor assessor = (Assessor)session.getAttribute("currentUser");
						assessorOperationRecord.setAssessor(assessor);
						assessorOperationRecordServiceImpl.addRecord(assessorOperationRecord);
						assessor.setOperationTimes(assessor.getOperationTimes()+1);
						assessorServiceImpl.updateAssessor(assessor);
						//信用分操作
						Staff proStaff = dailyReim.getProposer();
						if(items[2].equals("1")){
							if(items[3].equals("1")){
								int addNumber = (int)(dailyReim.getTotalMoney()*0.009);
								proStaff.setCreditIntegral(proStaff.getCreditIntegral()+(addNumber >=1?addNumber:1));
								staffServiceImpl.updateStaff(proStaff);
							}
						}else {
								//发票有问题 直接扣100分
								proStaff.setCreditIntegral(proStaff.getCreditIntegral()-100);
								staffServiceImpl.updateStaff(proStaff);
						}
						
					}
				}else if(items[0].equals("t")){
					TravelReimbursement travelReim = travelReimServiceImpl.getTravelBySheetId(items[1]);
					if(travelReim != null){
						travelReim.setLeaveMessages(items[4]);
						travelReim.setFinishDate(new Date());
						travelReim.setState(items[3].equals("1")?"已报销":"未通过审核");
						List<TravelReimbursement> list = new ArrayList<TravelReimbursement>();
						list.add(travelReim);
						travelReimServiceImpl.batchUpdateWithList(list);
						//borrowrecord处理
						if(travelReim.getOffsetBorrowing() !=null && travelReim.getOffsetBorrowing().getId() != 0 ){
							if(items[3].equals("1")){
								BorrowRecord borrowRecord = borrowRecordServiceImpl.getRecordById(travelReim.getOffsetBorrowing().getBorrowRecord().getId());
								borrowRecord.setPaidMoney(borrowRecord.getPaidMoney()+travelReim.getOffsetBorrowing().getAmount());
								if(borrowRecord.getState() == "逾期"){
									int days = daysBetween(borrowRecord.getPaymentTime(),new Date());
									Staff borrower = borrowRecord.getBorrower();
									borrower.setCreditIntegral(borrower.getCreditIntegral() - days*4);
									staffServiceImpl.updateStaff(borrower);
								}
								if(borrowRecord.getAmount() <=  borrowRecord.getPaidMoney()){
									if(borrowRecord.getPaymentTime().before(new Date())){
										int days = daysBetween(borrowRecord.getPaymentTime(),new Date());
										Staff borrower = borrowRecord.getBorrower();
										borrower.setCreditIntegral(borrower.getCreditIntegral() - days*4);
										staffServiceImpl.updateStaff(borrower);
									}
									borrowRecord.setState("已还清款项");
								}
								borrowRecordServiceImpl.updateRecord(borrowRecord);
							}
							//offsetBorrowing 处理
							OffsetBorrowing borrowing = travelReim.getOffsetBorrowing();
							borrowing.setState(items[3].equals("1")?"已冲借款":"未通过审核");
							offsetBorrowingServiceImpl.updateOffsetBorrowing(borrowing);
						}
						//添加operation记录
						AssessorOperationRecord assessorOperationRecord = new AssessorOperationRecord();
						assessorOperationRecord.setApplicationType("日常报销");
						assessorOperationRecord.setCheckType("现场审核");
						assessorOperationRecord.setOperationResult(items[3].equals("1")?"通过":"不通过");
						assessorOperationRecord.setOperationTime(new Date());
						HttpSession session = ServletActionContext.getRequest().getSession();
						Assessor assessor = (Assessor)session.getAttribute("currentUser");
						assessorOperationRecord.setAssessor(assessor);
						assessorOperationRecordServiceImpl.addRecord(assessorOperationRecord);
						assessor.setOperationTimes(assessor.getOperationTimes()+1);
						assessorServiceImpl.updateAssessor(assessor);
						//信用分操作
						Staff proStaff = travelReim.getProposer();
						if(items[2].equals("1")){
							if(items[3].equals("1")){
								int addNumber = (int)(travelReim.getTotalMoney()*0.002);
								proStaff.setCreditIntegral(proStaff.getCreditIntegral()+(addNumber >=1?addNumber:1));
								staffServiceImpl.updateStaff(proStaff);
							}
						}else {
								//发票有问题 直接扣100分
								proStaff.setCreditIntegral(proStaff.getCreditIntegral()-100);
								staffServiceImpl.updateStaff(proStaff);
						}
					}
				}else{
					System.out.println("命令错误");
				}
			}
		}
		dataProcessServiceImpl.loadAssessorData();
		dataProcessServiceImpl.out(1);
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
	public void checkBorrow(){
		String[] orders = order.split(";");
		for (int i = 0; i < orders.length; i++) {
			String[] items = orders[i].split("-");
			ApplicationSheet sheet = sheetServiceImpl.getSheetById(items[0]);
			if(sheet != null){
				sheet.setReimbursementResult(items[1].equals("1")?"已借款":"已拒绝");
				sheet.setRemarks(items[2]);
				sheetServiceImpl.updateSheet(sheet);
				BorrowApplication borrowApplication = borrowApplicationServiceImpl.getApplicationBySheetId(items[0]);
				if(borrowApplication != null){
					borrowApplication.setLeaveMessages(items[2]);
					borrowApplication.setState(items[1].equals("1")?"已借款":"未通过审核");
					//offsetBorrowing 处理
					List<BorrowApplication> list = new ArrayList<BorrowApplication>();
					list.add(borrowApplication);
					borrowApplicationServiceImpl.batchUpdateWithList(list);
					if(items[1].equals("1")){
						BorrowRecord borrowRecord = new BorrowRecord();
						borrowRecord.setAmount(borrowApplication.getAmount());
						borrowRecord.setBorrower(borrowApplication.getBorrower());
						borrowRecord.setPaidMoney(0);
						Calendar calendar=Calendar.getInstance();   
						calendar.setTime(new Date()); 
						calendar.add(Calendar.DAY_OF_MONTH,borrowApplication.getPaymentDaysLimit());
						borrowRecord.setPaymentTime(calendar.getTime());
						borrowRecord.setProject(borrowApplication.getProject());
						borrowRecord.setRecordDate(new Date());
						borrowRecord.setRemarks(borrowApplication.getRemarks());
						borrowRecord.setState("还款中");
						borrowRecord.setUse(borrowApplication.getUse());
						borrowRecord.setApplicationId(borrowApplication.getId());
						borrowRecordServiceImpl.addRecord(borrowRecord);
					}
					//添加operation记录
					AssessorOperationRecord assessorOperationRecord = new AssessorOperationRecord();
					assessorOperationRecord.setApplicationType("借款");
					assessorOperationRecord.setCheckType("现场审核");
					assessorOperationRecord.setOperationResult(items[1].equals("1")?"通过":"不通过");
					assessorOperationRecord.setOperationTime(new Date());
					HttpSession session = ServletActionContext.getRequest().getSession();
					Assessor assessor = (Assessor)session.getAttribute("currentUser");
					assessorOperationRecord.setAssessor(assessor);
					assessorOperationRecordServiceImpl.addRecord(assessorOperationRecord);
					assessor.setOperationTimes(assessor.getOperationTimes()+1);
					assessorServiceImpl.updateAssessor(assessor);
				}
			}
			
		}
		dataProcessServiceImpl.loadAssessorData();
		dataProcessServiceImpl.out(1);
	}
}
