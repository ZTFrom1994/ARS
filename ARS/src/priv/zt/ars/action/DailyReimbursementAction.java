package priv.zt.ars.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.BorrowRecord;
import priv.zt.ars.domain.DailyReimbursement;
import priv.zt.ars.domain.DailyReimbursementItem;
import priv.zt.ars.domain.Event;
import priv.zt.ars.domain.OffsetBorrowing;
import priv.zt.ars.domain.Project;
import priv.zt.ars.domain.Staff;
import priv.zt.ars.service.DailyReimbursementItemService;
import priv.zt.ars.service.DailyReimbursementService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.EventService;
import priv.zt.ars.service.OffsetBorrowingService;

import com.opensymphony.xwork2.ActionSupport;



public class DailyReimbursementAction extends ActionSupport {
	private String items;
	private int counteractFlag;
	private int projectId;
	private String message;
	private int paymentType;
	private String startTime;
	private String endTime;
	private float totalMoney;
	private int totalNumber;
	private float counteractNumber;
	private int borrowRecordId;
	public void setCounteractNumber(float counteractNumber) {
		this.counteractNumber = counteractNumber;
	}
	public void setBorrowRecordId(int borrowRecordId) {
		this.borrowRecordId = borrowRecordId;
	}
	public void setTotalMoney(float totalMoney) {
		this.totalMoney = totalMoney;
	}

	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}

	public void setItems(String items) {
		this.items = items;
	}

	public void setCounteractFlag(int counteractFlag) {
		this.counteractFlag = counteractFlag;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public void setMessage(String message) {
		this.message = message;
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
	@Autowired
	private DailyReimbursementService dailyReimServiceImpl;
	@Autowired
	private EventService eventServiceImpl;
	@Autowired
	private DailyReimbursementItemService dailyItemServiceImpl;
	@Autowired
	private OffsetBorrowingService offsetBorrowingServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	public void addSingleApplication(){
			//添加报销记录
			DailyReimbursement dra = new DailyReimbursement();
			dra.setRemarks(message);
			dra.setApplyDate(new Date());
			Project project = new Project();
			project.setId(projectId);
			dra.setProject(project);
			dra.setPaymentType("现金");
			HttpSession session = ServletActionContext.getRequest().getSession();
			dra.setProposer((Staff)session.getAttribute("currentUser"));
			dra.setState("预约中");
			try {
				Event event = new Event();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");//小写的mm表示的是分钟  
				event.setStartTime(sdf.parse(startTime));
				event.setEndTime(sdf.parse(endTime));
				event.setColor("#F28C63");//选择1175B9 借款：58A697
				event.setTitle("日常报销");
				eventServiceImpl.addEvent(event);
				dra.setEvent(event);
				OffsetBorrowing ob = new OffsetBorrowing();
				if(counteractFlag == 0){
					ob.setAmount(counteractNumber);
					ob.setState("审核中");
					BorrowRecord br = new BorrowRecord();
					br.setId(borrowRecordId);
					ob.setBorrowRecord(br);
					offsetBorrowingServiceImpl.addOffset(ob);
				}else{
					ob.setId(-1);
				}
				dra.setOffsetBorrowing(ob);
				dra.setTotalMoney(totalMoney);
				dra.setTotalNumber(totalNumber);
				dailyReimServiceImpl.addSingleApplication(dra);
				List<DailyReimbursementItem> itemList = new ArrayList<DailyReimbursementItem>();
				String[] itemsArray = items.split("</br>");
				for (int i = 0; i < itemsArray.length; i++) {
					DailyReimbursementItem item = new DailyReimbursementItem();
					String[] options = itemsArray[i].split("-");
					item.setDraId(dra.getId());
 					item.setLargeClass(options[0]);
 					item.setSmallClass(options[1]);
 					item.setName(options[2]);
 					item.setNumber(Integer.parseInt(options[3]));
 					item.setTotal(Float.parseFloat(options[4]));
 					item.setDescription(options[5]);
 					itemList.add(item);
				}
				dailyItemServiceImpl.batchAddByList(itemList);
				dataProcessServiceImpl.out(1);
				Staff staff = (Staff)session.getAttribute("currentUser");
				dataProcessServiceImpl.loadStaffData(staff.getId()+"");
			} catch (ParseException e) {
				System.out.println("日期转换出错！添加失败！");
				dataProcessServiceImpl.out(-1);
				e.printStackTrace();
			}
			
	}
	
}
