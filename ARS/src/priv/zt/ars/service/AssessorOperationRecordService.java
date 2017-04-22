package priv.zt.ars.service;

import java.util.List;

import priv.zt.ars.domain.AssessorOperationRecord;

public interface AssessorOperationRecordService {
	public List<AssessorOperationRecord> getTopThreeRecordByAssessorId(String id);
	public void addRecord(AssessorOperationRecord record);
	public List<AssessorOperationRecord> getAllRecordByAssessorId(int id);
	public List<AssessorOperationRecord> getCustomRecordByAssessorId(String id,String condition1,String condition2,String condition3);
}
