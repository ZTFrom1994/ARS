package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.DailyReimbursementMapper;
import priv.zt.ars.domain.DailyReimbursement;
import priv.zt.ars.service.DailyReimbursementService;
@Service("dailyReimbursementService")
public class DailyReimbursementServiceImpl implements DailyReimbursementService {
	
	@Autowired
	private DailyReimbursementMapper mapper;
	public DailyReimbursement getReimbursementById(String id) {
		return mapper.getReimbursementById(id);
	}
	
	public void addSingleApplication(DailyReimbursement dailyReimbursement) {
		
		 mapper.addSingleApplication(dailyReimbursement);
	}

	public List<DailyReimbursement> getReimbursementByState(String state){
		return mapper.getReimbursementByState(state);
	}

	public void batchUpdateWithList(List<DailyReimbursement> list) {
		mapper.batchUpdateWithList(list);
	}

	public List<DailyReimbursement> getAllReimbursements() {
		return mapper.getAllReimbursements();
	}

	public DailyReimbursement getDailyBySheetId(String id) {
		return mapper.getDailyBySheetId(id);
	}

	public List<DailyReimbursement> getAllReimbursementsByProposerId(String id) {
		return mapper.getAllReimbursementsByProposerId(id);
	}

	public DailyReimbursement getReimbursementByIdAndProposerId(String id,
			String proposerId) {
		return mapper.getReimbursementByIdAndProposerId(id, proposerId);
	}

	public List<DailyReimbursement> getReimbursementByStateAndProposerId(
			String state, String id) {
		return mapper.getReimbursementByStateAndProposerId(state, id);
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
