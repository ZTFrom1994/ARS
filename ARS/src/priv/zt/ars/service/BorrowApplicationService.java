package priv.zt.ars.service;

import java.util.List;

import priv.zt.ars.domain.BorrowApplication;

public interface BorrowApplicationService {
	public List<BorrowApplication>  getAllApplication();
	public BorrowApplication getApplicationById(String id);
	public List<BorrowApplication> getApplicationByBorrowerId(String id);
	public List<BorrowApplication> getApplicationByState(String state);
	public void addApplication(BorrowApplication application);
	public void batchUpdateWithList(List<BorrowApplication> applications);
	public BorrowApplication getApplicationBySheetId(String id);
	public List<BorrowApplication>  getAllApplicationByBorrowerId(String id);
	public BorrowApplication getApplicationByIdAndBorrowerId(String id,String borrowerId);
	public List<BorrowApplication> getApplicationByStateAndBorrowerId(String state,String id);
}
