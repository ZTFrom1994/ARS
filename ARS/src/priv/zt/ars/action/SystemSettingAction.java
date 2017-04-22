package priv.zt.ars.action;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.service.DataProcessService;

import com.opensymphony.xwork2.ActionSupport;

public class SystemSettingAction extends ActionSupport {
	private String dailyFunction;
	private String travelFunction;
	private String offsetFunction;
	private String borrowFunction;
	private int openFlag;
	public void setOpenFlag(int openFlag) {
		this.openFlag = openFlag;
	}

	public void setDailyFunction(String dailyFunction) {
		this.dailyFunction = dailyFunction;
	}

	public void setTravelFunction(String travelFunction) {
		this.travelFunction = travelFunction;
	}

	public void setOffsetFunction(String offsetFunction) {
		this.offsetFunction = offsetFunction;
	}

	public void setBorrowFunction(String borrowFunction) {
		this.borrowFunction = borrowFunction;
	}

	@Autowired
	private DataProcessService dataProcessServiceImpl;

	public void updateFunctions() {
		SAXReader reader = new SAXReader();
		try {
			String path = getClass().getClassLoader().getResource(
					"function_settings.xml").getPath();
			Document document = reader.read(new File(path));
			Element root = document.getRootElement();
			List<Element> functionElements = root.element("functions").elements();
			for (Element e : functionElements) {
				String name = e.attribute("name").getValue();
				if (name.equals("dailyReimbursement")) {
					e.setText(dailyFunction);
				}
				if (name.equals("travelReimbursement")) {
					e.setText(travelFunction);
				}
				if (name.equals("offsetBorrowing")) {
					e.setText(offsetFunction);
				}
				if (name.equals("borrow")) {
					e.setText(borrowFunction);
				}
			}
			XMLWriter writer = new XMLWriter(new FileWriter(new File(path)));
			writer.write(document);
			writer.close();
			dataProcessServiceImpl.loadAdminData();
			dataProcessServiceImpl.out(1);
		} catch (DocumentException e) {
			dataProcessServiceImpl.out(1);
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void updateOpening() {
		SAXReader reader = new SAXReader();
		try {
			String path = getClass().getClassLoader().getResource(
			"function_settings.xml").getPath();
			Document document = reader.read(new File(path));
			Element root = document.getRootElement();
			root.element("system-open").setText(openFlag+"");
			XMLWriter writer = new XMLWriter(new FileWriter(new File(path)));
			writer.write(document);
			writer.close();
			dataProcessServiceImpl.loadAdminData();
			dataProcessServiceImpl.out(1);
		} catch (DocumentException e) {
			dataProcessServiceImpl.out(1);
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
