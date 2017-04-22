package priv.zt.ars.dao;

import java.util.List;

import priv.zt.ars.domain.DailyReimbursementItem;

public interface DailyReimbursementItemMapper {
	public List<DailyReimbursementItem> getAllItems();
	public void batchAddByList(List<DailyReimbursementItem> itemList);
}