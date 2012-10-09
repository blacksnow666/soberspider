package com.twistlet.soberspider.model.service.old;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;

public class TableServiceRowMapperProcessor<T> {
	public List<T> processRowMapper(final ResultSet rs, final RowMapper<T> rm) throws SQLException {
		int count = 0;
		final List<T> list = new ArrayList<>();
		while (rs.next()) {
			list.add(rm.mapRow(rs, count++));
		}
		return list;
	}
}