package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.MessageMapper;
import priv.zt.ars.domain.Message;
import priv.zt.ars.service.MessageService;
@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageMapper mapper;
	public void addMessage(Message message) {
		mapper.addMessage(message);
	}
	public List<Message> getMessageByObject(int object) {
		return mapper.getMessageByObject(object);
	}
	public List<Message> getAllMessage() {
		return mapper.getAllMessage();
	}
	public int getCountById(int id) {
		return mapper.getCountById(id);
	}

}
