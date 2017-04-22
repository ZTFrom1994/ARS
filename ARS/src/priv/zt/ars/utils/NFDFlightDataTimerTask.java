package priv.zt.ars.utils;

import java.io.File;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.domain.SystemSettings;
import priv.zt.ars.service.BorrowRecordService;
/**
 * 在 TimerManager 这个类里面，大家一定要注意 时间点的问题。如果你设定在凌晨2点执行任务。但你是在2点以后
 *发布的程序或是重启过服务，那这样的情况下，任务会立即执行，而不是等到第二天的凌晨2点执行。为了，避免这种情况
 *发生，只能判断一下，如果发布或重启服务的时间晚于定时执行任务的时间，就在此基础上加一天。
 * @author wls
 *
 */
public class NFDFlightDataTimerTask extends TimerTask {
	@Override
    public void run() {
        try {
        	
        } catch (Exception e) {
            System.out.println("-------------解析信息发生异常--------------");
        }
    }
     
}
