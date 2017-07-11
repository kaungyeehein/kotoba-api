package com.kaungyeehein.ktb.api.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kaungyeehein.ktb.api.common.KTBConstant;
import com.kaungyeehein.ktb.api.domain.KtbKotobaEnCriteria;
import com.kaungyeehein.ktb.api.domain.KtbKotobaJp;
import com.kaungyeehein.ktb.api.domain.KtbKotobaJpCriteria;
import com.kaungyeehein.ktb.api.domain.KtbKotobaMmCriteria;
import com.kaungyeehein.ktb.api.service.KotobaService;

@RestController
@RequestMapping("api/kotoba")
public class KotobaController {

	@Autowired
	KotobaService kotobaService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ResponseEntity<List<KtbKotobaJp>> getKotobaJp(@RequestParam(name = "q", required = false) String q,
			@RequestParam(name = "sby", required = false) String sby) {

		KtbKotobaJpCriteria jpCriteria = null;
		KtbKotobaMmCriteria mmCriteria = null;
		KtbKotobaEnCriteria enCriteria = null;

		if (q != null && sby != null) {
			if (KTBConstant.SBY_KANA.equalsIgnoreCase(sby)) {
				jpCriteria = new KtbKotobaJpCriteria();
				jpCriteria.createCriteria().andKanaLike(q + KTBConstant.SBY_PERCENT);
			} else if (KTBConstant.SBY_ROMAJI.equalsIgnoreCase(sby)) {
				jpCriteria = new KtbKotobaJpCriteria();
				jpCriteria.createCriteria().andRomajiLikeInsensitive(q + KTBConstant.SBY_PERCENT);
			} else if (KTBConstant.SBY_KANJI.equalsIgnoreCase(sby)) {
				jpCriteria = new KtbKotobaJpCriteria();
				jpCriteria.createCriteria().andKanjiLike(q + KTBConstant.SBY_PERCENT);
			} else if (KTBConstant.SBY_MM.equalsIgnoreCase(sby)) {
				mmCriteria = new KtbKotobaMmCriteria();
				mmCriteria.createCriteria().andNameLike(q + KTBConstant.SBY_PERCENT);
			} else if (KTBConstant.SBY_EN.equalsIgnoreCase(sby)) {
				enCriteria = new KtbKotobaEnCriteria();
				enCriteria.createCriteria().andNameLikeInsensitive(q + KTBConstant.SBY_PERCENT);
			}
		}

		List<KtbKotobaJp> kotobaJp = kotobaService.getKotobaJp(jpCriteria, mmCriteria, enCriteria);

		if (kotobaJp.isEmpty()) {
			return new ResponseEntity<List<KtbKotobaJp>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<KtbKotobaJp>>(kotobaJp, HttpStatus.OK);
	}
}
