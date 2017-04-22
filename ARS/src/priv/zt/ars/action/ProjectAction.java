package priv.zt.ars.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.Project;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.ProjectService;

import com.opensymphony.xwork2.ActionSupport;


public class ProjectAction extends ActionSupport{
	@Autowired
	private  ProjectService projectServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	
	private int principalId;
	
	public void setPrincipalId(int principalId) {
		this.principalId = principalId;
	}
	
}
