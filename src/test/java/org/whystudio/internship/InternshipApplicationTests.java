package org.whystudio.internship;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.whystudio.internship.entity.Notification;
import org.whystudio.internship.mapper.NotificationMapper;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class InternshipApplicationTests {

	@Autowired
	NotificationMapper notificationMapper;

	@Test
	public void contextLoads() {
	}

	@Test
	public void selectPage(){
		IPage<Notification> notificationIPage=new Page<>(1,10);
		notificationIPage=notificationMapper.selectPage(notificationIPage,null);
		List<Notification> list=notificationIPage.getRecords();
		list.forEach(System.out :: println);
	}
}
