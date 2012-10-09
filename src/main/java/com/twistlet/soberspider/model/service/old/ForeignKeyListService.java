package com.twistlet.soberspider.model.service;

import java.util.List;

import com.twistlet.soberspider.model.type.ForeignKey;

public interface ForeignKeyListService {
	List<ForeignKey> listForeignKeys(String tablename);
}
