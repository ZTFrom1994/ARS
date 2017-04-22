package priv.zt.ars.service;

import java.util.List;

import priv.zt.ars.domain.DailyReimbursementItem;
import priv.zt.ars.domain.TravelReimbursementItem;

public interface TravelReimbursementItemService {
	public List<TravelReimbursementItem> getAllItems();
	public void batchAddByList(List<TravelReimbursementItem> itemList);
}
