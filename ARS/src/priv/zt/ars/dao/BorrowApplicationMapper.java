package priv.zt.ars.dao;

import java.util.List;

import priv.zt.ars.domain.BorrowApplication;

public interface BorrowApplicationMapper {
	public List<BorrowApplication>  getAllApplication();
	public BorrowApplication getApplicationById(String id);
	public List<BorrowApplication> getApplicationByState(String state);
	public List<BorrowApplication>  getAllApplicationByBorrowerId(String id);
	public BorrowApplication getApplicationByIdAndBorrowerId(String id,String borrowerId);
	public List<BorrowApplication> getApplicationByStateAndBorrowerId(String state,String id);
	public List<BorrowApplication> getApplicationByBorrowerId(String id);
	public void addApplication(BorrowApplication application);
	public void batchUpdateWithList(List<BorrowApplication> applications);
	public BorrowApplication getApplicationBySheetId(String id);
}
