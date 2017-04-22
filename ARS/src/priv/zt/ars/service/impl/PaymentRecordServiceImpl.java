package priv.zt.ars.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import priv.zt.ars.dao.PaymentRecordMapper;
import priv.zt.ars.domain.PaymentRecord;
import priv.zt.ars.service.PaymentRecordService;
@Service("paymentRecordService")
public class PaymentRecordServiceImpl implements PaymentRecordService {
	@Autowired
	private PaymentRecordMapper mapper;
	public void addRecord(PaymentRecord paymentRecord) {
		mapper.addRecord(paymentRecord);
	}

}
