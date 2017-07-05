package com.kaungyeehein.ktb.api.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaungyeehein.ktb.api.domain.KtbKotobaJp;
import com.kaungyeehein.ktb.api.domain.KtbKotobaJpCriteria;
import com.kaungyeehein.ktb.api.mapper.KtbKotobaJpMapper;

@Service
@Transactional
public class KotobaServiceImpl implements KotobaService {
	
	@Autowired
	KtbKotobaJpMapper jpMapper;

	@Override
	public List<KtbKotobaJp> getKotobaJp(KtbKotobaJpCriteria jpCriteria) {
		/*RowBounds rowBounds = new RowBounds();
		return jpMapper.selectByExampleWithRowbounds(jpCriteria, rowBounds);*/
		
		return jpMapper.selectKotoba();
	}

}
