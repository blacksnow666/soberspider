package com.twistlet.soberspider.model.service.actual;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class DatabaseServiceImpl implements DatabaseService {

	private final ListTableService listTableService;

	@Autowired
	public DatabaseServiceImpl(final ListTableService listTableService) {
		this.listTableService = listTableService;
	}

	@Override
	public List<String> listTables(final DataSource dataSource) {
		return listTableService.list(dataSource);
	}

	@Override
	public List<String> sortTables(final DataSource dataSource, final List<String> tables) {
		// TODO Auto-generated method stub
		return null;
	}

}
