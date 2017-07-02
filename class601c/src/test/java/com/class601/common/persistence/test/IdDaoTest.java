package com.class601.common.persistence.test;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import static org.mockito.Mockito.*;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.class601.persistence.IdGenDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath*:**/applicationContext.xml")
@TransactionConfiguration(defaultRollback=false)
@Transactional
public class IdDaoTest {
	
	@Resource(name="idGenDao")
	IdGenDao dao;
		
	@Test
	public void nextIdTest() {
		String nextId = dao.getNextId("TEST");
		
		assertThat(nextId, is("1"));
	}
	
	@Rollback(true)
	@Test
	public void updateIdTest() {
		int update = dao.updateNextId("TEST");
		
		assertThat(update, is(1));
	}
}
