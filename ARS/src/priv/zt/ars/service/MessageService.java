package priv.zt.ars.service;

import java.util.List;

import priv.zt.ars.domain.Message;

public interface MessageService {
	public void addMessage(Message message);
	public List<Message> getMessageByObject(int object);
	public List<Message> getAllMessage();
	public int getCountById(int id);
}
