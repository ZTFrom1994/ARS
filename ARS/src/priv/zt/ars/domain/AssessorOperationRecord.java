package priv.zt.ars.domain;

import java.io.Serializable;
import java.util.Date;

public class AssessorOperationRecord implements Serializable{
	private static final long serialVersionUID = 1704261434602628632L;
	private int id;
	private Assessor assessor;
	private String checkType;
	private String applicationType;
	private Date operationTime;
	private String operationResult;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Assessor getAssessor() {
		return assessor;
	}
	public void setAssessor(Assessor assessor) {
		this.assessor = assessor;
	}
	public String getCheckType() {
		return checkType;
	}
	public void setCheckType(String checkType) {
		this.checkType = checkType;
	}
	public String getApplicationType() {
		return applicationType;
	}
	public void setApplicationType(String applicationType) {
		this.applicationType = applicationType;
	}
	public Date getOperationTime() {
		return operationTime;
	}
	public void setOperationTime(Date operationTime) {
		this.operationTime = operationTime;
	}
	public String getOperationResult() {
		return operationResult;
	}
	public void setOperationResult(String operationResult) {
		this.operationResult = operationResult;
	}
	
}
