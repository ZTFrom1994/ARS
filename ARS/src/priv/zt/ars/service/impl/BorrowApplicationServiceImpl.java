package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.BorrowApplicationMapper;
import priv.zt.ars.domain.BorrowApplication;
import priv.zt.ars.service.BorrowApplicationService;
@Service("borrowApplicationService")
public class BorrowApplicationServiceImpl implements BorrowApplicationService {
	@Autowired
	private BorrowApplicationMapper mapper;
	public void addApplication(BorrowApplication application) {
		mapper.addApplication(application);
	}

	public void batchUpdateWithList(List<BorrowApplication> applications) {
		mapper.batchUpdateWithList(applications);
	}

	public List<BorrowApplication> getAllApplication() {
		return mapper.getAllApplication();
	}

	public List<BorrowApplication> getApplicationByBorrowerId(String id) {
		return mapper.getApplicationByBorrowerId(id);
	}

	public BorrowApplication getApplicationById(String id) {
		return mapper.getApplicationById(id);
	}

	public List<BorrowApplication> getApplicationByState(String state) {
		return mapper.getApplicationByState(state);
	}

	public BorrowApplication getApplicationBySheetId(String id) {
		return mapper.getApplicationBySheetId(id);
	}

	public List<BorrowApplication> getAllApplicationByBorrowerId(String id) {
		return mapper.getAllApplicationByBorrowerId(id);
	}

	public BorrowApplication getApplicationByIdAndBorrowerId(String id,
			String borrowerId) {
		return mapper.getApplicationByIdAndBorrowerId(id, borrowerId);
	}

	public List<BorrowApplication> getApplicationByStateAndBorrowerId(
			String state, String id) {
		return mapper.getApplicationByStateAndBorrowerId(state, id);
	}

}
