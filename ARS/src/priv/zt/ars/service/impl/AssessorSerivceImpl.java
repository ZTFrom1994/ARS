package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.AssessorMapper;
import priv.zt.ars.domain.Assessor;
import priv.zt.ars.service.AssessorService;
@Service("assessorService")
public class AssessorSerivceImpl implements AssessorService{
	
	@Autowired
	private AssessorMapper mapper;//注入dao

	public void changePasswordById(String id, String newPassword) {
		mapper.changePasswordById(id, newPassword);
	}

	public Assessor getAssessorById(String id) {
		return mapper.getAssessorById(id);
	}

	public List<Assessor> getAllAssessor() {
		return mapper.getAllAssessor();
	}

	public void updateAssessor(Assessor assessor) {
			mapper.updateAssessor(assessor);
	}

	public void addAssessor(Assessor assessor) {
		mapper.addAssessor(assessor);
	}

	public int getDisabledCount() {
		return mapper.getDisabledCount();
	}

	
	
}
