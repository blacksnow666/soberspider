package com.twistlet.soberspider.model.service.actual;

import java.util.List;

import javax.sql.DataSource;

public interface ListTableService {

	List<String> list(DataSource dataSource);
}
