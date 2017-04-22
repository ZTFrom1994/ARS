package priv.zt.ars.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.OffsetBorrowingMapper;
import priv.zt.ars.domain.OffsetBorrowing;
import priv.zt.ars.service.OffsetBorrowingService;
@Service("offsetBorrowingService")
public class OffsetBorrowingServiceImpl implements OffsetBorrowingService {
	@Autowired OffsetBorrowingMapper mapper;
	public void addOffset(OffsetBorrowing borrowing) {
		mapper.addOffset(borrowing);
	}
	public void updateOffsetBorrowing(OffsetBorrowing offsetBorrowing) {
		mapper.updateOffsetBorrowing(offsetBorrowing);
	}
	
}
