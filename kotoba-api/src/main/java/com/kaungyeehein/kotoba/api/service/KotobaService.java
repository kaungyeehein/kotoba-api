package com.kaungyeehein.kotoba.api.service;

import java.util.List;

import com.kaungyeehein.kotoba.api.domain.kotoba.Kotoba;
import com.kaungyeehein.kotoba.api.domain.kotoba.KotobaCriteria;

public interface KotobaService {
	
	public List<Kotoba> getKotoba(KotobaCriteria criteria);

}
