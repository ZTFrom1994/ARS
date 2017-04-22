package priv.zt.ars.service;

import priv.zt.ars.domain.Event;

public interface EventService {
	public String getAllEventJson();
	public void addEvent(Event e);
	public void deleteEventById(String id);
	public void updateEvent(Event e);
}
