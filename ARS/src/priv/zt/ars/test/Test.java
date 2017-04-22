package priv.zt.ars.test;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Attribute;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import priv.zt.ars.action.LoginAction;
import priv.zt.ars.domain.Assessor;
import priv.zt.ars.domain.BorrowRecord;
import priv.zt.ars.domain.PaymentRecord;
import priv.zt.ars.service.BorrowRecordService;
import priv.zt.ars.service.DailyReimbursementService;
import priv.zt.ars.service.NoReadMessageService;
import priv.zt.ars.service.PaymentRecordService;
import priv.zt.ars.service.TravelReimbursementService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/applicationContext-*.xml"})
public class Test{
	@Autowired
	private PaymentRecordService paymentRecordServiceImpl;
	@Autowired
	private NoReadMessageService noReadMessageServiceImpl;
	@Autowired
	private DailyReimbursementService dailyReimServiceImpl;
	@Autowired
	private TravelReimbursementService travelReimServiceImpl;
	@Autowired
	private BorrowRecordService borrowRecordServiceImpl;
	@org.junit.Test
	public void Test(){
		Date date2 = new Date(2017,10,10,11,00);
		Date date1 = new Date(2017,10,10,12,10);
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		int minutes = date1.getHours()*60 - date2.getHours()*60;
		int minutes2 = date1.getMinutes() - date2.getMinutes(); 
		int minutes3= minutes + minutes2;
		System.out.println("hour:"+minutes3/60+"minute:"+(minutes3-(minutes3/60)*60));
	}
	
}
