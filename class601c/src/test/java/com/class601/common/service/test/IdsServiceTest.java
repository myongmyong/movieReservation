package com.class601.common.service.test;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;
import static org.mockito.Matchers.*;
import static org.mockito.Mockito.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import com.class601.comm.service.IdGenService;
import com.class601.comm.service.impl.IdGenServiceImpl;
import com.class601.persistence.IdGenDao;


@RunWith(MockitoJUnitRunner.class)
public class IdsServiceTest {

	@InjectMocks
	private IdGenService service = new IdGenServiceImpl();
		
	@Mock
	IdGenDao dao;
	
	@Test
	public void nextIdTest() {
		when(dao.getNextId("TEST")).thenReturn("1");
		when(dao.updateNextId("TEST")).thenReturn(1);
		
		String str = service.getNextId("TEST");
		
		assertThat(str,is("1"));
	}

}
