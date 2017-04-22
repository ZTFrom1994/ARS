package priv.zt.ars.dao;

import java.util.List;

import priv.zt.ars.domain.TravelReimbursementItem;

public interface TravelReimbursementItemMapper {
	public List<TravelReimbursementItem> getAllItems();
	public void batchAddByList(List<TravelReimbursementItem> itemList);
}