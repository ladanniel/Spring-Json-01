package cn.tedu.json.controller;
//检查错误，，从逻辑检查
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tedu.json.bean.City;
import cn.tedu.json.bean.ResponseResult;
import cn.tedu.json.bean.User;

@Controller
public class UserController {

	@RequestMapping("/test1.do")	//响应客户端的数据为state：1，message：成功  ,不返回data值则： <Void>表示泛型没有返回值
	@ResponseBody    //不返回（响应）视图（页面）
	public ResponseResult<Void> test1(){
		//封装状态码，和状态码表示的信息
		ResponseResult<Void> rr = new ResponseResult<Void>(1,"成功");
		//导入jackson依赖jar包
		return rr;
	}
	@RequestMapping("/test2.do")
	@ResponseBody
	public ResponseResult<User>test2(){
		//创建rr对象
		ResponseResult<User>rr = new ResponseResult<User>(1,"成功");
		User user = new User();
		user.setId(1);
		user.setName("admin");
		user.setPhone("1234567891");
		user.setAddress("中鼎");
		rr.setData(user);
		return rr;
	}
	@RequestMapping("/test3.do")
	@ResponseBody
	public ResponseResult<List<User>> test3(){
		ResponseResult<List<User>> rr = new ResponseResult<List<User>>(1,"成功");//其实此处更多的用来测试页面代码是否可行
		//设置data属性值为list
		User user1 = new User();
		user1.setId(1);
		user1.setName("李");
		user1.setPhone("15908895075");
		user1.setAddress("中鼎7层");
		User user2 = new User();
		user2.setId(2);
		user2.setName("张");
		user2.setPhone("15908895070");
		user2.setAddress("中鼎8层");
		//返回rr对象
		List<User> list = new ArrayList<User>();
		list.add(user1);
		list.add(user2);
		rr.setData(list);	
		return rr;
		
	}
	//显示update页面
	@RequestMapping("/showUpdate.do")
	public String showUpdate(){
		return "city";
	}
	//异步请求处理（返回User对象）（显示）数据
	@RequestMapping("/showData.do")
	@ResponseBody    //不返回（响应）视图（页面）
	public ResponseResult<User> showData(){
		//创建rr对象
		ResponseResult<User> rr = new ResponseResult<User>(1,"响应成功");
		//设置data属性值为User（按理应从数据库中查询数据并放入到里面）
		User user = new User();
		user.setName("王力宏");
		user.setPhone("15908895075");
		user.setAddress("云岩大厦");
		rr.setData(user);
		//return rr;
		return rr;
	}

	@RequestMapping("/showcity.do")
	@ResponseBody
	public ResponseResult<List<City>> getCity(Integer code){
		//json是集合，创建对应集合添加数据后，在添加到json集合中
		List<City> list = new ArrayList<City>();
		if (code==1) {
			list.add(new City("11","成都市"));
			list.add(new City("12","眉山市"));
			list.add(new City("13","广元市"));
		}else{
			list.add(new City("21","深圳市"));
			list.add(new City("22","广州市"));
			list.add(new City("23","珠海市"));
		}
		ResponseResult<List<City>> rr = new ResponseResult<List<City>>(1,"成功");
		rr.setData(list);
		return rr;
		
	
		
	}

}
