package com.kaungyeehein.kotoba.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kaungyeehein.kotoba.api.domain.Person;
import com.kaungyeehein.kotoba.api.service.HelloService;

@RestController
@RequestMapping("api")
public class PersonController {

	@Autowired
	HelloService helloService;

	@RequestMapping(value = "/person", method = RequestMethod.GET)
	public ResponseEntity<List<Person>> getPerson() {
		List<Person> persons = helloService.getPerson();
		if (persons.isEmpty()) {
			return new ResponseEntity<List<Person>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Person>>(persons, HttpStatus.OK);
	}

}
