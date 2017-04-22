package priv.zt.ars.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import priv.zt.ars.domain.BorrowRecord;
import priv.zt.ars.service.BorrowApplicationService;
import priv.zt.ars.service.BorrowRecordService;
import priv.zt.ars.service.DailyReimbursementService;
import priv.zt.ars.service.DataProcessService;
import priv.zt.ars.service.TravelReimbursementService;
import priv.zt.ars.service.impl.DataProcessServiceImpl;

public class ChartAction {
	@Autowired
	private DailyReimbursementService dailyReimServiceImpl;
	@Autowired
	private TravelReimbursementService travelReimServiceImpl;
	@Autowired
	private BorrowRecordService borrowRecordServiceImpl;
	@Autowired
	private DataProcessService dataProcessServiceImpl;

	public void getChartJson() {
		Calendar calendar = Calendar.getInstance(); 
		
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		String day1 = (calendar.get(Calendar.MONTH)+1)+"月"+calendar.get(Calendar.DAY_OF_MONTH)+"日";
		float dailyDay1 = dailyReimServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		String day2 = (calendar.get(Calendar.MONTH)+1)+"月"+calendar.get(Calendar.DAY_OF_MONTH)+"日";
		float dailyDay2 = dailyReimServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		String day3 = (calendar.get(Calendar.MONTH)+1)+"月"+calendar.get(Calendar.DAY_OF_MONTH)+"日";
		float dailyDay3 = dailyReimServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		String day4 = (calendar.get(Calendar.MONTH)+1)+"月"+calendar.get(Calendar.DAY_OF_MONTH)+"日";
		float dailyDay4 = dailyReimServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		String day5 = (calendar.get(Calendar.MONTH)+1)+"月"+calendar.get(Calendar.DAY_OF_MONTH)+"日";
		float dailyDay5 = dailyReimServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		String day6 = (calendar.get(Calendar.MONTH)+1)+"月"+calendar.get(Calendar.DAY_OF_MONTH)+"日";
		float dailyDay6 = dailyReimServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		
		calendar = Calendar.getInstance();  
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		float travelDay1 = travelReimServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		float travelDay2 =travelReimServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		float travelDay3 = travelReimServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		float travelDay4 = travelReimServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		float travelDay5 = travelReimServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		float travelDay6 = travelReimServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		
		calendar = Calendar.getInstance(); 
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		float borrowDay1 = borrowRecordServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		float borrowDay2 = borrowRecordServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		float borrowDay3 = borrowRecordServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		float borrowDay4 = borrowRecordServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		float borrowDay5 = borrowRecordServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - 1);
		float borrowDay6 = borrowRecordServiceImpl.getFinishedSumByDate(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH)+1, calendar.get(Calendar.DAY_OF_MONTH));
		String json = "{" +
						"days:['"+day6+"','"+day5+"','"+day4+"','"+day3+"','"+day2+"','"+day1+"'],"+
						"data:[" +
								"{name: '日常报销',type: 'bar',data: ["+dailyDay6+", "+dailyDay5+","+dailyDay4+","+dailyDay3+","+dailyDay2+","+dailyDay1+"]}," +
								"{name: '差旅费报销',type: 'bar',data: ["+travelDay6+","+travelDay5+","+travelDay4+","+travelDay3+","+travelDay2+","+travelDay1+"]}," +
								"{name: '借款',type: 'bar',data: ["+borrowDay6+","+borrowDay5+","+borrowDay4+","+borrowDay3+","+borrowDay2+","+borrowDay1+"]}" +
							"]" +
					"}";
		dataProcessServiceImpl.out(json);
	}
	
	
}
