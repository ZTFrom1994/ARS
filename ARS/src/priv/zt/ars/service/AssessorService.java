package priv.zt.ars.service;

import java.util.List;

import priv.zt.ars.domain.Assessor;

public interface AssessorService {
	public void updateAssessor(Assessor assessor);
	public Assessor getAssessorById(String id);
	public void changePasswordById(String id,String newPassword);
	public List<Assessor> getAllAssessor();
	public void addAssessor(Assessor assessor);
	public int getDisabledCount();
}
