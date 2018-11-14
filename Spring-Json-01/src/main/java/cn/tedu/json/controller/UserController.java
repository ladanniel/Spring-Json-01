package cn.tedu.json.controller;
//�����󣬣����߼����
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

	@RequestMapping("/test1.do")	//��Ӧ�ͻ��˵�����Ϊstate��1��message���ɹ�  ,������dataֵ�� <Void>��ʾ����û�з���ֵ
	@ResponseBody    //�����أ���Ӧ����ͼ��ҳ�棩
	public ResponseResult<Void> test1(){
		//��װ״̬�룬��״̬���ʾ����Ϣ
		ResponseResult<Void> rr = new ResponseResult<Void>(1,"�ɹ�");
		//����jackson����jar��
		return rr;
	}
	@RequestMapping("/test2.do")
	@ResponseBody
	public ResponseResult<User>test2(){
		//����rr����
		ResponseResult<User>rr = new ResponseResult<User>(1,"�ɹ�");
		User user = new User();
		user.setId(1);
		user.setName("admin");
		user.setPhone("1234567891");
		user.setAddress("�ж�");
		rr.setData(user);
		return rr;
	}
	@RequestMapping("/test3.do")
	@ResponseBody
	public ResponseResult<List<User>> test3(){
		ResponseResult<List<User>> rr = new ResponseResult<List<User>>(1,"�ɹ�");//��ʵ�˴��������������ҳ������Ƿ����
		//����data����ֵΪlist
		User user1 = new User();
		user1.setId(1);
		user1.setName("��");
		user1.setPhone("15908895075");
		user1.setAddress("�ж�7��");
		User user2 = new User();
		user2.setId(2);
		user2.setName("��");
		user2.setPhone("15908895070");
		user2.setAddress("�ж�8��");
		//����rr����
		List<User> list = new ArrayList<User>();
		list.add(user1);
		list.add(user2);
		rr.setData(list);	
		return rr;
		
	}
	//��ʾupdateҳ��
	@RequestMapping("/showUpdate.do")
	public String showUpdate(){
		return "city";
	}
	//�첽����������User���󣩣���ʾ������
	@RequestMapping("/showData.do")
	@ResponseBody    //�����أ���Ӧ����ͼ��ҳ�棩
	public ResponseResult<User> showData(){
		//����rr����
		ResponseResult<User> rr = new ResponseResult<User>(1,"��Ӧ�ɹ�");
		//����data����ֵΪUser������Ӧ�����ݿ��в�ѯ���ݲ����뵽���棩
		User user = new User();
		user.setName("������");
		user.setPhone("15908895075");
		user.setAddress("���Ҵ���");
		rr.setData(user);
		//return rr;
		return rr;
	}

	@RequestMapping("/showcity.do")
	@ResponseBody
	public ResponseResult<List<City>> getCity(Integer code){
		//json�Ǽ��ϣ�������Ӧ����������ݺ�����ӵ�json������
		List<City> list = new ArrayList<City>();
		if (code==1) {
			list.add(new City("11","�ɶ���"));
			list.add(new City("12","üɽ��"));
			list.add(new City("13","��Ԫ��"));
		}else{
			list.add(new City("21","������"));
			list.add(new City("22","������"));
			list.add(new City("23","�麣��"));
		}
		ResponseResult<List<City>> rr = new ResponseResult<List<City>>(1,"�ɹ�");
		rr.setData(list);
		return rr;
		
	
		
	}

}
