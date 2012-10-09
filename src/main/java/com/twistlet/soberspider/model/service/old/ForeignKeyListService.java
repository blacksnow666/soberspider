package com.twistlet.soberspider.model.service.old;

import java.util.List;

import com.twistlet.soberspider.model.type.ForeignKey;

public interface ForeignKeyListService {
	List<ForeignKey> listForeignKeys(String tablename);
}
