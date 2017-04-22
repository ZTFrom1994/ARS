package priv.zt.ars.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.ApplicationSheet;
import priv.zt.ars.domain.Assessor;
import priv.zt.ars.domain.AssessorOperationRecord;
import priv.zt.ars.domain.BorrowApplication;
import priv.zt.ars.domain.DailyReimbursement;
import priv.zt.ars.domain.Staff;
import priv.zt.ars.domain.TravelReimbursement;
import priv.zt.ars.service.ApplicationSheetService;
import priv.zt.ars.service.AssessorOperationRecordService;
import priv.zt.ars.service.BorrowApplicationService;
import priv.zt.ars.service.DailyReimbursementService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.TravelReimbursementService;

import com.opensymphony.xwork2.ActionSupport;

public class SearchAction extends ActionSupport {
	private int searchType;// 0 = daily 1 = travel
	/*
	 * <option value="0">全部进度</option> <option value="1">预约中</option> <option
	 * value="2">预约失败</option> <option value="3">审核中</option> <option
	 * value="4">未通过审核</option> <option value="5">已报销</option>
	 */
	private int searchProgress;// 0 all 1
	private int searchId;
	private int applicationType;
	private int checkType;
	private int selectResult;

	public void setSearchType(int searchType) {
		this.searchType = searchType;
	}

	public void setSearchProgress(int searchProgress) {
		this.searchProgress = searchProgress;
	}

	public void setSearchId(int searchId) {
		this.searchId = searchId;
	}

	public void setApplicationType(int applicationType) {
		this.applicationType = applicationType;
	}

	public void setCheckType(int checkType) {
		this.checkType = checkType;
	}

	public void setSelectResult(int selectResult) {
		this.selectResult = selectResult;
	}

	@Autowired
	private DailyReimbursementService dailyReimbursementServiceImpl;
	@Autowired
	private TravelReimbursementService travelReimbursementServiceImpl;
	@Autowired
	private BorrowApplicationService borrowApplicationServiceImpl;
	@Autowired
	private AssessorOperationRecordService operationRecordServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	public void searchProgress() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		Staff proposer = (Staff) session.getAttribute("currentUser");
		if (searchType == 0) {
			List<DailyReimbursement> searchedDailyReims = null;
			if (searchId != 0) {
				DailyReimbursement d = dailyReimbursementServiceImpl
						.getReimbursementByIdAndProposerId(searchId + "",
								proposer.getId() + "");
				if (d != null) {
					searchedDailyReims = new ArrayList<DailyReimbursement>();
					searchedDailyReims.add(d);
				}
			} else {
				if (searchProgress == 0) {
					searchedDailyReims = dailyReimbursementServiceImpl
							.getAllReimbursementsByProposerId(proposer.getId()
									+ "");
				} else {
					if (searchProgress == 1) {
						searchedDailyReims = dailyReimbursementServiceImpl
								.getReimbursementByStateAndProposerId("预约中",
										proposer.getId() + "");
					} else if (searchProgress == 2) {
						searchedDailyReims = dailyReimbursementServiceImpl
								.getReimbursementByStateAndProposerId("预约失败",
										proposer.getId() + "");
					} else if (searchProgress == 3) {
						searchedDailyReims = dailyReimbursementServiceImpl
								.getReimbursementByStateAndProposerId("审核中",
										proposer.getId() + "");
					} else if (searchProgress == 4) {
						searchedDailyReims = dailyReimbursementServiceImpl
								.getReimbursementByStateAndProposerId("未通过审核",
										proposer.getId() + "");
					} else if (searchProgress == 5) {
						searchedDailyReims = dailyReimbursementServiceImpl
								.getReimbursementByStateAndProposerId("已报销",
										proposer.getId() + "");
					} else {
						searchedDailyReims = dailyReimbursementServiceImpl
								.getAllReimbursementsByProposerId(proposer
										.getId()
										+ "");
					}
				}
			}
			session.setAttribute("searchedDailyReims", searchedDailyReims);
			dataProcessServiceImpl.out(1);
		} else if (searchType == 1) {
			List<TravelReimbursement> searchedTravelReims = null;
			if (searchId != 0) {
				TravelReimbursement t = travelReimbursementServiceImpl
						.getTravelByIdAndProposerId(searchId + "", proposer
								.getId()
								+ "");
				if (t != null) {
					searchedTravelReims = new ArrayList<TravelReimbursement>();
					searchedTravelReims.add(t);
				}
			} else {
				if (searchProgress == 0) {
					searchedTravelReims = travelReimbursementServiceImpl
							.getAllTravelByProposerId(proposer.getId() + "");
				} else {
					if (searchProgress == 1) {
						searchedTravelReims = travelReimbursementServiceImpl
								.getTravelByStateAndProposerId("预约中", proposer
										.getId()
										+ "");
					} else if (searchProgress == 2) {
						searchedTravelReims = travelReimbursementServiceImpl
								.getTravelByStateAndProposerId("预约失败", proposer
										.getId()
										+ "");
					} else if (searchProgress == 3) {
						searchedTravelReims = travelReimbursementServiceImpl
								.getTravelByStateAndProposerId("审核中", proposer
										.getId()
										+ "");
					} else if (searchProgress == 4) {
						searchedTravelReims = travelReimbursementServiceImpl
								.getTravelByStateAndProposerId("未通过审核",
										proposer.getId() + "");
					} else if (searchProgress == 5) {
						searchedTravelReims = travelReimbursementServiceImpl
								.getTravelByStateAndProposerId("已报销", proposer
										.getId()
										+ "");
					} else {
						searchedTravelReims = travelReimbursementServiceImpl
								.getAllTravelByProposerId(proposer.getId() + "");
					}
				}
			}
			session.setAttribute("searchedTravelReims", searchedTravelReims);
			dataProcessServiceImpl.out(1);
		} else if (searchType == 2) {
			List<BorrowApplication> searchBorrowApplications = null;
			if (searchId != 0) {
				BorrowApplication ba = borrowApplicationServiceImpl
						.getApplicationByIdAndBorrowerId(searchId + "",
								proposer.getId() + "");
				if (ba != null) {
					searchBorrowApplications = new ArrayList<BorrowApplication>();
					searchBorrowApplications.add(ba);
				}
			} else {
				if (searchProgress == 0) {
					searchBorrowApplications = borrowApplicationServiceImpl
							.getAllApplicationByBorrowerId(proposer.getId()
									+ "");
				} else {
					if (searchProgress == 1) {
						searchBorrowApplications = borrowApplicationServiceImpl
								.getApplicationByStateAndBorrowerId("预约中",
										proposer.getId() + "");
					} else if (searchProgress == 2) {
						searchBorrowApplications = borrowApplicationServiceImpl
								.getApplicationByStateAndBorrowerId("预约失败",
										proposer.getId() + "");
					} else if (searchProgress == 3) {
						searchBorrowApplications = borrowApplicationServiceImpl
								.getApplicationByStateAndBorrowerId("审核中",
										proposer.getId() + "");
					} else if (searchProgress == 4) {
						searchBorrowApplications = borrowApplicationServiceImpl
								.getApplicationByStateAndBorrowerId("未通过审核",
										proposer.getId() + "");
					} else if (searchProgress == 5) {
						searchBorrowApplications = borrowApplicationServiceImpl
								.getApplicationByStateAndBorrowerId("已借款",
										proposer.getId() + "");
					} else {
						searchBorrowApplications = borrowApplicationServiceImpl
								.getAllApplicationByBorrowerId(proposer.getId()
										+ "");
					}
				}
			}
			session.setAttribute("searchBorrowApplications",
					searchBorrowApplications);
			dataProcessServiceImpl.out(1);
		} else {
			System.out.println("search type not 0,1,2");
			dataProcessServiceImpl.out(0);
		}
	}

	public void searchOperation() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		Assessor assessor = (Assessor) session.getAttribute("currentUser");
		String condition1="1 = 1";
		String condition2="1 = 1";
		String condition3="1 = 1";
		if(applicationType == 1){
			condition1="aor_application_type in ('差旅费报销','日常报销')";
		}else if(applicationType == 2){
			condition1="aor_application_type = '借款'";
		}
		if(checkType == 1){
			condition2 = "aor_check_type  = '预约审核'";
		}else if(checkType == 2){
			condition2 = "aor_check_type  = '现场审核'";
		}
		if(selectResult == 1){
			condition3 = "aor_operation_result = '通过'";
		}else if(selectResult == 2){
			condition3 = "aor_operation_result = '不通过'";
		}
		List<AssessorOperationRecord> myOperationRecords = operationRecordServiceImpl
				.getCustomRecordByAssessorId(assessor.getId() + "", condition1,
						condition2, condition3);
		session.setAttribute("myOperationRecords", myOperationRecords);
		dataProcessServiceImpl.out(1);
	}
}
