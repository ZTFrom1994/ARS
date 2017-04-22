package priv.zt.ars.service.impl;

import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.EventMapper;
import priv.zt.ars.domain.Event;
import priv.zt.ars.service.EventService;
@Service("eventServiceService")
public class EventServiceImpl implements EventService {
	@Autowired
	private EventMapper mapper;
	public void addEvent(Event e) {
		mapper.addEvent(e);
	}

	public String getAllEventJson() {
		List<Event> events = mapper.getAllEvent();
		String  str = "";
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for(Event e:events){
			str += "{\"id\":" + e.getId()
			+ ",\"title\":\"" + e.getTitle()
			+ "\",\"start\":\"" + sdf.format(e.getStartTime())
			+ "\",\"end\":\"" + sdf.format(e.getEndTime())
			+ "\",\"editable\":false" 
			+ ",\"color\":\""+ e.getColor()
			+ "\"},";
		}
		if (!str.equals("")) {
			str = str.substring(0,str.length()-1);
		}
		return "["+str+"]";
	}

	public void deleteEventById(String id) {
		mapper.deleteEventById(id);
	}

	public void updateEvent(Event e) {
		mapper.updateEvent(e);
	}

}

