package com.kaungyeehein.kotoba.api.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaungyeehein.kotoba.api.domain.Person;
import com.kaungyeehein.kotoba.api.domain.PersonExample;
import com.kaungyeehein.kotoba.api.domain.Pet;
import com.kaungyeehein.kotoba.api.mapper.PersonMapper;

@Service
@Transactional
public class HelloServiceImpl implements HelloService {
	
	@Autowired
	PersonMapper personMapper;

	@Override
	public List<Person> getPerson() {
		// TODO Auto-generated method stub
		// return getPersonDummy();
		PersonExample example = new PersonExample();
		return personMapper.selectPersonAndPetsByExample(example);
	}
	
	private List<Person> getPersonDummy() {
		List<Person> personList = new ArrayList<>();
		for(int i=1; i<=5; i++) {
			Person p = new Person();
			List<Pet> petList = new ArrayList<>();
			Pet p1 = new Pet();
			Pet p2 = new Pet();
			
			p1.setPetId(100+i);
			p1.setOwnerId(i);
			p1.setPetName("Pet Name A"+i);
			
			p2.setPetId(200+i);
			p2.setOwnerId(i);
			p2.setPetName("Pet Name B"+i);
			
			petList.add(p1);
			petList.add(p2);
			
			p.setId(i);
			p.setName("Person Name "+i);
			p.setGender("Male");
			p.setEmail("email "+i);
			p.setPets(petList);
			
			personList.add(p);
		}
		return personList;
	}

}
