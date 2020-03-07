package org.whystudio.internship;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import org.whystudio.internship.entity.Notification;
import org.whystudio.internship.mapper.NotificationMapper;
import java.util.List;

import org.whystudio.internship.entity.Report;
import org.whystudio.internship.mapper.ReportMapper;
import org.whystudio.internship.mapper.StudentMapper;
import org.whystudio.internship.mapper.TeacherMapper;
import java.util.Arrays;
import java.util.List;
import java.util.Map;


@RunWith(SpringRunner.class)
@SpringBootTest
public class InternshipApplicationTests {

	@Autowired
	NotificationMapper notificationMapper;

  @Autowired
	ReportMapper reportMapper;

	@Autowired
	StudentMapper studentMapper;


	@Test
	public void contextLoads() {
	}

	@Test

	public void selectPage(){
		IPage<Notification> notificationIPage=new Page<>(1,10);
		notificationIPage=notificationMapper.selectPage(notificationIPage,null);
		List<Notification> list=notificationIPage.getRecords();
		list.forEach(System.out :: println);

	public void rkTest(){
		List<Integer> asList = Arrays.asList(123, 321, 422, 432, 664, 763);
		asList.forEach((item) -> {
			System.out.println(item);
		});
		//select by map 多个条件查询
	}

	/**
	 *
	 * 条件构造器查询
	 * 比如 第一阶段填写了第二阶段没有填写的学生report信息
	 *
	 */
	@Test
	public void selectByWrapper(){
		QueryWrapper<Report> queryWrapper = Wrappers.query();
		queryWrapper.select("stuno","stage1_summary","stage2_summary").isNotNull("stage1_summary")
				.isNotNull("stage2_summary")
				.like("stuno", "123");
		List<Report> reports = reportMapper.selectList(queryWrapper);
		reports.forEach(System.out::println);
		System.out.println("记录数:" + reports.size());

		// 查询 第一阶段和第二阶段有没填写的
		queryWrapper.like(StringUtils.isBlank("stuno"),"stuno","123").isNull("stage1_summary")
				.or().isNull("stage2_summary")
				.select(Report.class, info -> !info.getColumn().equals("created"));

		List<Map<String, Object>> maps = reportMapper.selectMaps(queryWrapper);
		System.out.println("找到第一阶段或者第二阶段没有填写的:");
		maps.forEach(System.out::println);
	}

	// 使用lambda

	/**
	 * lambda 与 上面的方式差不多, 就是不容易写错字段罢了？
	 */
	@Test
	public void testLambda(){
		LambdaQueryWrapper<Report> lambdaQueryWrapper = Wrappers.lambdaQuery();
		lambdaQueryWrapper.like(Report::getStuno, "123")
				.select(Report::getStuno,Report::getStage1Summary,Report::getStage2Summary);
		List<Map<String, Object>> maps = reportMapper.selectMaps(lambdaQueryWrapper);
		maps.forEach(System.out::println);
	}
	/**
	 * lambda2
	 */
	@Test
	public void lambda2(){
		List<Report> list = new LambdaQueryChainWrapper<>(reportMapper)
				.select(Report::getStuno, Report::getStage1Summary, Report::getStage2Summary)
				.like(Report::getStuno, "123").list();
		list.forEach(System.out::println);
	}
//	/**
//	 * 条件构造器自定义sql
//	 */
//	@Test
//	public void modifySql(){
//
//	}
	// 分页查询
	@Test
	public void selectPage(){
		QueryWrapper<Report> queryWrapper = Wrappers.query();
		queryWrapper.like("stuno", "123");
		Page<Report> page = new Page<>(1,2);
		Page<Report> page1 = reportMapper.selectPage(page, queryWrapper);
		System.out.println("分页情况: size:" + page1.getSize() + ",total:" + page1.getTotal() +
				", current:" + page1.getCurrent());
		page1.getRecords().forEach(System.out::println);
	}

	/**
	 * 更新
	 */
	//uodate中,entity将出现在set中, wrapper将出现在where中
	/**
	 * 删除
	 */
	// 使用lambdaQueryWrapper即可,很简单

	/**
	 * ActiveRecord模式
	 * 真特喵有意思
	 *  Teacher extends Model<Teacher> 即可
	 *  还需要保证对应mapper extends baseMapper<>
	 */
	// teacher.insert();
	// teacher.updateById();
	// teacher.deleteById();

	/**
	 * 多表联查？
	 * 使用@Query VO 简单实现即可
	 */


	// 以下是正经测试
	@Test
	public void testSelectStudent(){
		List<Map<String, Object>> maps = studentMapper.listTeachersStudentWithReportStatusAndAppraisalStatus("2010010024");
		maps.forEach(item -> System.out.println(JSON.toJSONString(item)));
	}
}
