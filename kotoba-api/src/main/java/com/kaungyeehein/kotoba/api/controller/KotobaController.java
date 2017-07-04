package com.kaungyeehein.kotoba.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kaungyeehein.kotoba.api.domain.kotoba.Kotoba;
import com.kaungyeehein.kotoba.api.domain.kotoba.KotobaCriteria;
import com.kaungyeehein.kotoba.api.service.KotobaService;

@RestController
@RequestMapping("api/kotoba")
public class KotobaController {

	@Autowired
	KotobaService kotobaService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<Kotoba>> getKotoba() {
		KotobaCriteria criteria = new KotobaCriteria();
		List<Kotoba> kotobas = kotobaService.getKotoba(criteria);

		if (kotobas.isEmpty()) {
			return new ResponseEntity<List<Kotoba>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Kotoba>>(kotobas, HttpStatus.OK);
	}
}
