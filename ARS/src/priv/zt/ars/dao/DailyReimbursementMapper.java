package priv.zt.ars.dao;


import java.util.List;

import priv.zt.ars.domain.DailyReimbursement;

public interface DailyReimbursementMapper {
	public DailyReimbursement getReimbursementById(String id);
	public List<DailyReimbursement> getAllReimbursements();
	public List<DailyReimbursement> getReimbursementByState(String state);
	public DailyReimbursement getReimbursementByIdAndProposerId(String id,String proposerId);
	public List<DailyReimbursement> getAllReimbursementsByProposerId(String id);
	public List<DailyReimbursement> getReimbursementByStateAndProposerId(String state,String id);
	public void batchUpdateWithList(List<DailyReimbursement> list);
	public void addSingleApplication(DailyReimbursement dailyReimbursement);
	public DailyReimbursement getDailyBySheetId(String id);
	public int getCountByDateAndProposerId(int year,int month,int id);
	public int getApprovedCountByDateAndProposerId(int year,int month,int id);
	public float getFinishedSumByDate(int year,int month,int day);
	
}