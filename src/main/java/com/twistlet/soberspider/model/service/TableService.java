package com.twistlet.soberspider.model.service;

import java.util.List;

public interface TableService {

	List<String> listTableDependenciesForTable(String tablename);
}
