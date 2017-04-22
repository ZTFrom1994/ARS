package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.AssessorOperationMapper;
import priv.zt.ars.domain.AssessorOperationRecord;
import priv.zt.ars.service.AssessorOperationRecordService;
@Service("assessorOperationService")
public class AssessorOperationServiceImpl implements
		AssessorOperationRecordService {
	@Autowired
	private AssessorOperationMapper mapper;
	public void addRecord(AssessorOperationRecord record) {
		mapper.addRecord(record);
	}

	public List<AssessorOperationRecord> getTopThreeRecordByAssessorId(String id) {
		return mapper.getTopThreeRecordByAssessorId(id);
	}

	public List<AssessorOperationRecord> getAllRecordByAssessorId(int id) {
		return mapper.getAllRecordByAssessorId(id);
	}

	public List<AssessorOperationRecord> getCustomRecordByAssessorId(String id,
			String condition1, String condition2, String condition3) {
		return mapper.getCustomRecordByAssessorId(id, condition1, condition2, condition3);
	}

}
