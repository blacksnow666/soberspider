package com.twistlet.soberspider.model.service;

import java.util.List;

public interface PrimaryKeyColumnListService {
	List<String> listPrimaryKeyColumns(String tablename);
}
