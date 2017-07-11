package com.kaungyeehein.ktb.api.service;

import java.util.List;

import com.kaungyeehein.ktb.api.domain.KtbKotobaEnCriteria;
import com.kaungyeehein.ktb.api.domain.KtbKotobaJp;
import com.kaungyeehein.ktb.api.domain.KtbKotobaJpCriteria;
import com.kaungyeehein.ktb.api.domain.KtbKotobaMmCriteria;

public interface KotobaService {
	
	public List<KtbKotobaJp> getKotobaJp(
			KtbKotobaJpCriteria jpCriteria,
			KtbKotobaMmCriteria mmCriteria,
			KtbKotobaEnCriteria enCriteria);

}
