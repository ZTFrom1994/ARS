package priv.zt.ars.dao;

import java.util.List;

import priv.zt.ars.domain.TravelReimbursement;

public interface TravelReimbursementMapper {
	public List<TravelReimbursement> getTravelByState(String state);
	public TravelReimbursement getTravelById(String id);
	public List<TravelReimbursement> getAllTravel();
	public List<TravelReimbursement> getTravelByStateAndProposerId(String state,String id);
	public TravelReimbursement getTravelByIdAndProposerId(String id,String proposerId);
	public List<TravelReimbursement> getAllTravelByProposerId(String id);
	public TravelReimbursement getTravelBySheetId(String id);
	public void addTravelReimbursement(TravelReimbursement reimbursement);
	public void batchUpdateWithList(List<TravelReimbursement> reimbursement);
	public int getCountByDateAndProposerId(int year,int month,int id);
	public int getApprovedCountByDateAndProposerId(int year,int month,int id);
	public float getFinishedSumByDate(int year,int month,int day);
}
