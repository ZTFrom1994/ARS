package priv.zt.ars.service;

import java.util.List;

import priv.zt.ars.domain.DailyReimbursement;

public interface DailyReimbursementService {
	public DailyReimbursement getReimbursementById(String id);
	public void addSingleApplication(DailyReimbursement dailyReimbursement);
	public List<DailyReimbursement> getReimbursementByState(String state);
	public void batchUpdateWithList(List<DailyReimbursement> list);
	public List<DailyReimbursement> getAllReimbursements();
	public DailyReimbursement getDailyBySheetId(String id);
	public DailyReimbursement getReimbursementByIdAndProposerId(String id,String proposerId);
	public List<DailyReimbursement> getAllReimbursementsByProposerId(String id);
	public int getCountByDateAndProposerId(int year,int month,int id);
	public int getApprovedCountByDateAndProposerId(int year,int month,int id);
	public List<DailyReimbursement> getReimbursementByStateAndProposerId(String state,String id);
	public float getFinishedSumByDate(int year,int month,int day);
}
