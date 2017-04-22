package priv.zt.ars.utils;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
public class NFDFlightDataTaskListener implements ServletContextListener {
	
	public void contextDestroyed(ServletContextEvent arg0) {
		 new TimerManager();
	}

	public void contextInitialized(ServletContextEvent arg0) {

	}

}
