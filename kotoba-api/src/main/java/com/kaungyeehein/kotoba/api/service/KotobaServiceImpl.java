package com.kaungyeehein.kotoba.api.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaungyeehein.kotoba.api.domain.kotoba.Kotoba;
import com.kaungyeehein.kotoba.api.domain.kotoba.KotobaCriteria;
import com.kaungyeehein.kotoba.api.mapper.kotoba.KotobaMapper;

@Service
@Transactional
public class KotobaServiceImpl implements KotobaService {

	@Autowired
	KotobaMapper kotobaMapper;
	
	@Override
	public List<Kotoba> getKotoba(KotobaCriteria criteria) {
		RowBounds rowBounds = new RowBounds();
		return kotobaMapper.selectByExampleWithRowbounds(criteria, rowBounds);
	}

}
