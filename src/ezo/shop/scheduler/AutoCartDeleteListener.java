package ezo.shop.scheduler;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

import ezo.shop.dao.CartDao;

public class AutoCartDeleteListener implements ServletContextListener {

	
	private Scheduler scheduler;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		JobDetail job = JobBuilder.newJob(AutoCartDeleteJob.class)
								.withIdentity("autoCartDeleteJob", "group1")
								.build();
		
		Trigger trigger = TriggerBuilder.newTrigger()
								.withIdentity("autiCartDeleteTrigger", "group1")
								.startNow()
								.withSchedule(SimpleScheduleBuilder.simpleSchedule()
												.withIntervalInMinutes(1).repeatForever())
								.build();
		
		try {
			scheduler = StdSchedulerFactory.getDefaultScheduler();
			scheduler.scheduleJob(job, trigger);
			scheduler.start();
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		try {
			if (scheduler != null) {
				scheduler.shutdown();
			}
		} catch (SchedulerException e) {
			e.printStackTrace();
		}
	}
}
