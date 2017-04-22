package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.DailyReimbursementItemMapper;
import priv.zt.ars.domain.DailyReimbursementItem;
import priv.zt.ars.service.DailyReimbursementItemService;
@Service("dailyReimbursementItemService")
public class DailyReimbursementItemServiceImpl implements DailyReimbursementItemService {
	@Autowired
	private DailyReimbursementItemMapper mapper;
	
	
	public List<DailyReimbursementItem> getAllItems() {
		return mapper.getAllItems();
	}


	public void batchAddByList(List<DailyReimbursementItem> itemList) {
		mapper.batchAddByList(itemList);
	}

}
