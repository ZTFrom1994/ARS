package priv.zt.ars.dao;

import java.util.List;

import priv.zt.ars.domain.NoReadMessage;

public interface NoReadMessageMapper {
	public void batchAddNoReadMessage(List<NoReadMessage> noReadMessages);
	public List<NoReadMessage> getAdminNoReadMessageById(int id);
	public List<NoReadMessage> getAssessorNoReadMessageById(int id);
	public List<NoReadMessage> getStaffNoReadMessageById(int id);
	public void clearAdminNoReadMessageById(int id);
	public void clearAssessorNoReadMessageById(int id);
	public void clearStaffNoReadMessageById(int id);
}
