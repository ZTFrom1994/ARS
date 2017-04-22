package priv.zt.ars.dao;


import java.util.List;

import priv.zt.ars.domain.Admin;
import priv.zt.ars.domain.Event;
import priv.zt.ars.domain.Staff;


public interface EventMapper {
	public List<Event> getAllEvent();
	public void addEvent(Event e);
	public void deleteEventById(String id);
	public void updateEvent(Event e);
}