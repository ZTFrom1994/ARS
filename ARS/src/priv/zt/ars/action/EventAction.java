package priv.zt.ars.action;

import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.EventService;

import com.opensymphony.xwork2.ActionSupport;

public class EventAction extends ActionSupport {
	@Autowired
	private EventService eventServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;
	public void getAllEventJson(){
		dataProcessServiceImpl.out(eventServiceImpl.getAllEventJson());
	}
	
}
