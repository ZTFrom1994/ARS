package priv.zt.ars.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.TravelReimbursementItemMapper;
import priv.zt.ars.domain.DailyReimbursementItem;
import priv.zt.ars.domain.TravelReimbursementItem;
import priv.zt.ars.service.TravelReimbursementItemService;
@Service("travelReimbursementItemService")
public class TravelReimbursementItemServiceImpl implements TravelReimbursementItemService {
	@Autowired
	private TravelReimbursementItemMapper mapper;

	public List<TravelReimbursementItem> getAllItems() {
		return mapper.getAllItems();
	}




	public void batchAddByList(List<TravelReimbursementItem> itemList) {
			mapper.batchAddByList(itemList);		
	}

}
