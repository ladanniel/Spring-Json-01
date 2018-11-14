<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body style="font-size: 30px;">
  <a onclick="fun1()">一个key-value的Jason对象的定义及访问</a>
  <br/>
  <a onclick="fun2()">多个key-value的Jason对象的定义及访问</a>
    <br/>
  <a onclick="fun3()">多个key-value的Jason对象的定义及访问,value表示对象</a>
     <br/>
  <a onclick="fun4()">多个key-value的Jason对象的定义及访问,value表示数组（集合）</a>
  
    
</body>
    <script type="text/javascript">
       //一个key-value的json对象
       function fun1(){
       var obj = {"state":1};
       alert(obj.state);
       }
       //多个key-value的json对象
       function fun2(){
    	   var obj = {"state":1,"message":"成功"};
    	   alert(obj.state+","+obj.message)
       }
      //多个key-value的json对象，value表示对象
      function fun3(){
    	  var obj = {"state":1,"message":"成功",
    			     "data":{"name":"admin","age":18}};
    	  alert(obj.data.name+","+obj.data.age)
      }
      //多个key-value的json对象，value表示数组
      function fun4(){
    	  var obj = {
    			  "state":1,"message":"成功",
    			  "data":[{"cityCode":21,"cityName":"成都市"},
    			          {"cityCode":22,"cityName":"绵阳市"},
    			          {"cityCode":23,"cityName":"峨眉市"}]
    	  };
    	  for(var i=0;i<obj.data.length;i++){
    		  alert(obj.data[i].cityCode+","+obj.data[i].cityName);
    	  }
    	  
      }
    </script>
</html>