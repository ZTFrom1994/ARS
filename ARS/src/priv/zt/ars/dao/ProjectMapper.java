package priv.zt.ars.dao;

import java.util.List;

import priv.zt.ars.domain.Project;

public interface ProjectMapper {
	public List<Project> getProjectByPrincipalId(String id);
}
