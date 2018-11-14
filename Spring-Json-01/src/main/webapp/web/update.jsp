<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>显示数据</title>
</head>
<body style="font-size: 30px;">

	姓名：
	<input name="name" type="text" id="name">
	<br /> 电话：
	<input name="phone" type="text" id="phone">
	<br /> 地址：
	<input name="address" type="text" id="address">
	<br />
	<input type="button" value="显示数据" onclick="showData()">

	<br />
	 省份：
	<select id="province" onchange="getCity(this.value)">
		<option>请选择</option>
		<option value="1" >四川省</option>
		<option value="2" >广东省</option>
	</select>
	<br /> 
	城市：
	<select id="city" >
		<option id="code">请选择</option>
	</select>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" >

//ajax-json底层写法
  /**   function getCity(provinceCode){
    	 var xhr = new XMLHttpRequest();
    	 xhr.onreadystatechange = function(){
    		 if (xhr.readyState==4 && xhr.status==200) {
    			//获取json字符串
				var values = xhr.responseText;
				//json字符串转换成json对象
				var obj = JSON.parse(values);
				//获取城市节点
				var cityNode = document.getElementById("city");
				cityNode.innerHTML = "<option>请选择</option>";
				//循环数组
				for(var i=0;i<obj.data.length;i++){
					//date[i].名字=（java封装类的名字）
					//创建option对象
					var option = new Option(obj.data[i].cityName,obj.data[i].cityCode);
					//option节点添加的city节点中
					cityNode.appendChild(option);
				}
			}
    	 };
    	 xhr.open("get","${pageContext.request.contextPath}/showcity.do?code="+provinceCode,true);
    	 xhr.send();
    	 
     }
     */
    /*这里很明显的显示了ajax异步请求与json回调过程；前面是ajax请求，后面是转换格式并回调*/
     
     function showData(){
    	 //创建对象
    	 var xhr = new XMLHttpRequest();//不使用ie浏览器
    	 
    	 //监听事件处理
    	 xhr.onreadystatechange=function(){
    		 if (xhr.readyState==4&&xhr.status==200) {
    			 //json格式的字符串(从服务器得到json串)
				var values = xhr.responseText;
    			 //把字符串转换为json对象
    			 var obj = JSON.parse(values);
			     document.getElementById("name").value = obj.data.name;
			    document.getElementById("phone").value = obj.data.phone;
			    document.getElementById("address").value = obj.data.address
    		 }
    	 }
    	 //open
    	 xhr.open("get","${pageContext.request.contextPath}/showData.do",true)
    	 //send
    	 xhr.send();
     }
     
     
     //JQuery框架写法二级菜单联动（异步提交）
     //JQuery实现获取城市信息
     function getCity(provinceCode){
    	 //使用ajax发送异步请求
    	 $.ajax({
    		 //发送请求的路径 success相当于（1,"成功"）
    		 url:"${pageContext.request.contextPath}/showcity.do",
    		 //不管是get还是post,提交的数据都由data提供（不用再url后写？）
    		 data:"code="+provinceCode,
    		 //表示提交方式
    		 type:"GET",
    		 //表示相应数据的类型
    		 
    		 dataType:"json",
    		 //obj:服务器响应的json对象,success:表示成功响应
    		 success:function(obj){
    			 console.log(obj);
    			$("#city").html("<option>请选择</option>"); 
    			/*遍历并生成所有的后台异步提交的数据*/
    			 for(var i=0;i<obj.data.length;i++){
    				var option = new Option(obj.data[i].cityName,obj.data[i].cityCode);
    				$("#city").append(option);
    			} 
    		 }
    		 
    	 });
     }
     
     
     </script>
</html>