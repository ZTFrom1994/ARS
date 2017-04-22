package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.ProjectMapper;
import priv.zt.ars.domain.Project;
import priv.zt.ars.service.ProjectService;
@Service("projectService")
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectMapper mapper;
	public List<Project> getProjectByPrincipalId(String id) {
		return mapper.getProjectByPrincipalId(id);
	}

}
