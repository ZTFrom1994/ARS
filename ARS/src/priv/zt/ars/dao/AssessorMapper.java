package priv.zt.ars.dao;


import java.util.List;

import priv.zt.ars.domain.Assessor;


public interface AssessorMapper {
	public void updateAssessor(Assessor assessor);
	public Assessor getAssessorById(String id);
	public List<Assessor> getAllAssessor();
	public void changePasswordById(String id,String newPassword);
	public void addAssessor(Assessor assessor);
	public int getDisabledCount();
}