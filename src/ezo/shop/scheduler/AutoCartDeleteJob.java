package ezo.shop.scheduler;

import java.sql.SQLException;
import java.util.Date;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import ezo.shop.dao.CartDao;

public class AutoCartDeleteJob implements Job {

	private CartDao cartDao = CartDao.getInstance();
	
	@Override
	public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
		
		try {
			cartDao.deleteCarts();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
