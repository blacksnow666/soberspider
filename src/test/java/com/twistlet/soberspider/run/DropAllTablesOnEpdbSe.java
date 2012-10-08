package com.twistlet.soberspider.run;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.twistlet.soberspider.model.service.actual.SoberSpiderService;

public class DropAllTablesOnEpdbSe {
	public static void main(final String[] args) {
		final ConfigurableApplicationContext applicationContext = new ClassPathXmlApplicationContext(
				"classpath:application-context-drop-all-tables.xml");
		final SoberSpiderService soberSpiderService = applicationContext.getBean(SoberSpiderService.class);
		final DataSource dataSource = createEpdbSeDataSource();
		soberSpiderService.dropAllTables(dataSource);
		applicationContext.close();

	}

	private static DataSource createEpdbSeDataSource() {
		final BasicDataSource dataSource = new BasicDataSource();
		dataSource.setUsername("connids");
		dataSource.setPassword("connids1");
		dataSource.setUrl("jdbc:informix-sqli://10.2.8.10:1521/epdb_se:informixserver=epdev_shm");
		dataSource.setDriverClassName("com.informix.jdbc.IfxDriver");
		return dataSource;
	}
}
