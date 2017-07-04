package com.kaungyeehein.ktb.api.service;

import java.util.List;

import com.kaungyeehein.ktb.api.domain.KtbKotobaJp;
import com.kaungyeehein.ktb.api.domain.KtbKotobaJpCriteria;

public interface KotobaService {
	
	public List<KtbKotobaJp> getKotobaJp(KtbKotobaJpCriteria jpCriteria);

}
