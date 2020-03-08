package org.whystudio.internship;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.conditions.query.LambdaQueryChainWrapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.whystudio.internship.entity.File;
import org.whystudio.internship.entity.Student;
import org.whystudio.internship.mapper.FileMapper;
import org.whystudio.internship.mapper.StudentMapper;
import org.whystudio.internship.service.IFileService;
import org.whystudio.internship.service.IStudentService;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class InternshipApplicationTests {

	@Autowired
	StudentMapper studentMapper;
	@Autowired
	FileMapper fileMapper;
	@Autowired
	IFileService fileService;

	@Autowired
	IStudentService iStudentService;

	@Test
	public void contextLoads() {
//		List<Student> students = studentMapper.selectList(null);
//		students.forEach(System.out::print);
////		for (Student student:students){
////			System.out.println(student);
////		}
//		List<File> files = fileMapper.selectList(null);
		String url="image.ruankun.xyz/31cb4cbcf643ecbe9d02fe3c5f93a5df";
//		File file = fileMapper.selectByUrl(url);
		System.out.println(fileMapper.deleteByUrl(url));
//		files.forEach(System.out::print);
//		Student student = new Student();
//		student.
//		iStudentService.getOne(new W)
//		Student student = studentMapper.selectByStuno("123");
//		System.out.println(student);

	}

	@Test
	public void m(){
		List<Student> list = iStudentService.lambdaQuery().eq(Student::getStuno, "201604252").list();
		System.out.println(list == null?null:list.get(0));
	}


}
