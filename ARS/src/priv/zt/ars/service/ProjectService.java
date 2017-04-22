package priv.zt.ars.service;

import java.util.List;

import priv.zt.ars.domain.Project;

public interface ProjectService {
	public List<Project> getProjectByPrincipalId(String id);
}
