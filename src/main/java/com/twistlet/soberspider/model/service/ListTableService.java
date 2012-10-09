package com.twistlet.soberspider.model.service;

import java.util.List;

import javax.sql.DataSource;

public interface ListTableService {

	List<String> list(DataSource dataSource);
}
