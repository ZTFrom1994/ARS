package priv.zt.ars.service;

import java.util.List;

import priv.zt.ars.domain.DailyReimbursementItem;

public interface DailyReimbursementItemService {
	public List<DailyReimbursementItem> getAllItems();
	public void batchAddByList(List<DailyReimbursementItem> itemList);
}
