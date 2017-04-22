package priv.zt.ars.dao;

import java.util.List;

import priv.zt.ars.domain.ApplicationSheet;

public interface ApplicationSheetMapper {
	public ApplicationSheet getSheetByDailyReimbursementId(String id);
	public ApplicationSheet getSheetByTravelReimbursementId(String id);
	public ApplicationSheet getSheetByBorrowApplicationId(String id);
	public void addSheet(ApplicationSheet sheet);
	public void updateSheet(ApplicationSheet sheet);
	public ApplicationSheet getSheetById(String id);
	public List<ApplicationSheet> getTopFiveSheetsByStaffId(int id);
}
