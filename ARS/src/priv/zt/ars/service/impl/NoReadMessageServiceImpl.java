package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.NoReadMessageMapper;
import priv.zt.ars.domain.NoReadMessage;
import priv.zt.ars.service.NoReadMessageService;
@Service("noReadMessageService")
public class NoReadMessageServiceImpl implements NoReadMessageService {
	@Autowired
	private NoReadMessageMapper mapper;
	public void batchAddNoReadMessage(List<NoReadMessage> noReadMessages) {
		mapper.batchAddNoReadMessage(noReadMessages);
	}
	public List<NoReadMessage> getAdminNoReadMessageById(int id) {
		return mapper.getAdminNoReadMessageById(id);
	}
	public void clearAdminNoReadMessageById(int id) {
		mapper.clearAdminNoReadMessageById(id);
	}
	public void clearAssessorNoReadMessageById(int id) {
		mapper.clearAssessorNoReadMessageById(id);
	}
	public void clearStaffNoReadMessageById(int id) {
		mapper.clearStaffNoReadMessageById(id);
	}
	public List<NoReadMessage> getAssessorNoReadMessageById(int id) {
		return mapper.getAssessorNoReadMessageById(id);
	}
	public List<NoReadMessage> getStaffNoReadMessageById(int id) {
		return mapper.getStaffNoReadMessageById(id);
	}

}
