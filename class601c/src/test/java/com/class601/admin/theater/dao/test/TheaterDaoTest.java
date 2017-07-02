package com.class601.admin.theater.dao.test;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.class601.persistence.TheaterDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:**/applicationContext.xml")
@TransactionConfiguration(defaultRollback=false)
@Transactional
public class TheaterDaoTest {
	
	@Resource(name="theaterDao")
	TheaterDao dao;
	
	@Test
	public void selectTheaterListTest() {
		fail("Not yet implemented");
	}

}
