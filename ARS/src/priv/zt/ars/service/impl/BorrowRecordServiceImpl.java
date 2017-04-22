package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.BorrowRecordMapper;
import priv.zt.ars.domain.BorrowRecord;
import priv.zt.ars.service.BorrowRecordService;
@Service("borrowRecordService")
public class BorrowRecordServiceImpl implements BorrowRecordService {
	@Autowired
	private BorrowRecordMapper mapper;

	public List<BorrowRecord> getAllRecord() {
		return mapper.getAllRecord();
	}

	public List<BorrowRecord> getRecordByBorrowerId(String id) {
		return mapper.getRecordByBorrowerId(id);
	}

	public BorrowRecord getRecordById(int id) {
		return mapper.getRecordById(id);
	}

	public void updateRecord(BorrowRecord record) {
		mapper.updateRecord(record);
	}

	public void addRecord(BorrowRecord borrowRecord) {
		mapper.addRecord(borrowRecord);
	}

	public List<BorrowRecord> getRecentReturnRecord() {
		return mapper.getRecentReturnRecord();
	}

	public List<BorrowRecord> getRecordByStateAndBorrowerId(String state,
			String id) {
		return mapper.getRecordByStateAndBorrowerId(state, id);
	}

	public BorrowRecord getRecordByApplicationId(int id) {
		return mapper.getRecordByApplicationId(id);
	}

	public float getFinishedSumByDate(int year, int month, int day) {
		return mapper.getFinishedSumByDate(year, month, day);
	}

	
	

}
