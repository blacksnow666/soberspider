package com.twistlet.soberspider.model.service;

import java.util.List;

public interface DatabaseService {

	List<String> listTables();

	List<String> sortTablesByCreationOrder(List<String> list);

}
