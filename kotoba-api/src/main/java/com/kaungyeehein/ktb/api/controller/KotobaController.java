package com.kaungyeehein.ktb.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kaungyeehein.ktb.api.domain.KtbKotobaJp;
import com.kaungyeehein.ktb.api.domain.KtbKotobaJpCriteria;
import com.kaungyeehein.ktb.api.service.KotobaService;

@RestController
@RequestMapping("api/kotoba")
public class KotobaController {

	@Autowired
	KotobaService kotobaService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<KtbKotobaJp>> getKotobaJp() {
		KtbKotobaJpCriteria jpCriteria = new KtbKotobaJpCriteria();
		List<KtbKotobaJp> kotobaJp = kotobaService.getKotobaJp(jpCriteria); 

		if (kotobaJp.isEmpty()) {
			return new ResponseEntity<List<KtbKotobaJp>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<KtbKotobaJp>>(kotobaJp, HttpStatus.OK);
	}
}
