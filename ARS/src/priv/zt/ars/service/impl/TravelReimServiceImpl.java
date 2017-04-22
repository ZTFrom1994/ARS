package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.TravelReimbursementMapper;
import priv.zt.ars.domain.TravelReimbursement;
import priv.zt.ars.service.TravelReimbursementService;
@Service("travelReimService")
public class TravelReimServiceImpl implements TravelReimbursementService{
	@Autowired
	private TravelReimbursementMapper mapper;
	
	public List<TravelReimbursement> getTravelByState(String state) {
		return mapper.getTravelByState(state);
	}
	public void addTravelReimbursement(TravelReimbursement reimbursement) {
		mapper.addTravelReimbursement(reimbursement);
	}
	public void batchUpdateWithList(List<TravelReimbursement> reimbursement) {
		mapper.batchUpdateWithList(reimbursement);
	}
	public List<TravelReimbursement> getAllTravel() {
		return mapper.getAllTravel();
	}
	public TravelReimbursement getTravelById(String id) {
		return mapper.getTravelById(id);
	}
	public TravelReimbursement getTravelBySheetId(String id) {
		return mapper.getTravelBySheetId(id);
	}
	public List<TravelReimbursement> getAllTravelByProposerId(String id) {
		return mapper.getAllTravelByProposerId(id);
	}
	public TravelReimbursement getTravelByIdAndProposerId(String id,
			String proposerId) {
		return mapper.getTravelByIdAndProposerId(id, proposerId);
	}
	public List<TravelReimbursement> getTravelByStateAndProposerId(
			String state, String id) {
		return mapper.getTravelByStateAndProposerId(state, id);
	}
	public int getCountByDateAndProposerId(int year, int month, int id) {
		return mapper.getCountByDateAndProposerId(year, month, id);
	}
	public int getApprovedCountByDateAndProposerId(int year, int month, int id) {
		return mapper.getApprovedCountByDateAndProposerId(year, month, id);
	}
	public float getFinishedSumByDate(int year, int month, int day) {
		return mapper.getFinishedSumByDate(year, month, day);
	}

}
