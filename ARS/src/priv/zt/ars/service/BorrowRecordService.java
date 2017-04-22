package priv.zt.ars.service;

import java.util.List;

import priv.zt.ars.domain.BorrowRecord;
public interface BorrowRecordService {
	public List<BorrowRecord> getAllRecord();
	public List<BorrowRecord> getRecordByBorrowerId(String id);
	public void updateRecord(BorrowRecord record);
	public BorrowRecord getRecordById(int id);
	public BorrowRecord getRecordByApplicationId(int id);
	public void addRecord(BorrowRecord borrowRecord);
	public List<BorrowRecord> getRecentReturnRecord();
	public List<BorrowRecord> getRecordByStateAndBorrowerId(String state,String id);
	public float getFinishedSumByDate(int year,int month,int day);
}
