package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.ApplicationSheetMapper;
import priv.zt.ars.domain.ApplicationSheet;
import priv.zt.ars.service.ApplicationSheetService;
@Service("applicationSheetService")
public class ApplicationSheetServiceImpl implements ApplicationSheetService {
	@Autowired 
	private ApplicationSheetMapper mapper;
	public void addSheet(ApplicationSheet sheet) {
		mapper.addSheet(sheet);
	}

	public ApplicationSheet getSheetByDailyReimbursementId(String id) {
		return mapper.getSheetByDailyReimbursementId(id);
	}

	public ApplicationSheet getSheetByTravelReimbursementId(String id) {
		return mapper.getSheetByTravelReimbursementId(id);
	}

	public void updateSheet(ApplicationSheet sheet) {
			mapper.updateSheet(sheet);
	}

	public ApplicationSheet getSheetById(String id) {
		return mapper.getSheetById(id);
	}

	public ApplicationSheet getSheetByBorrowApplicationId(String id) {
		return mapper.getSheetByBorrowApplicationId(id);
	}

	public List<ApplicationSheet> getTopFiveSheetsByStaffId(int id) {
		return mapper.getTopFiveSheetsByStaffId(id);
	}

}
