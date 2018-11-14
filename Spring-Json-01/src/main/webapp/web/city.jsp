<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body style="font-size: 30px;">
  省份：
  <select id="province" onchange="getCity(this.value)">
    <option>请选择</option>
    <option value="1">四川省</option>
    <option value="2">广东省</option>
  </select>
  城市：
  <select id="city">
   <option id="code">请选择</option>
  </select>

</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" >
/*json写法*/
      /*   function getCity(provinceCode){//这里的provinceCode仅仅作为一个参数形式，不代表任何其他意思
	     var xhr = new XMLHttpRequest();
	     xhr.onreadystatechange = function(){
	    	 if (xhr.readyState==4 && xhr.status==200) {
				var values = xhr.responseText;
				var obj = JSON.parse(values);
				var cityNode = document.getElementById("city");
				cityNode.innerHTML = "<option>--</option>";
				for (var i = 0; i < obj.data.length; i++) {
					var option = new Option(obj.data[i].cityName,obj.data[i].cityCode);
					cityNode.appendChild(option);
				}
			
			}
	    	 
	     };

	     xhr.open("get","${pageContext.request.contextPath}/showcity.do?code="+provinceCode,true)
	     xhr.send();
} */
//开发编码流程：读懂说明书（需求分析）、编码、测试（最好写一部分，测试一部分）
//JQuery写法
    function getCity(provinceCode){
       $.ajax({
    	   url:"${pageContext.request.contextPath}/showcity.do",
    	   data:"code="+provinceCode,
    	   type:"get",
    	   dataType:"json",
    	   success:function(obj){
    		   $("#city").html("<option>--</option>");
    		   for (var i = 0; i < obj.data.length; i++) {
				var option = new Option(obj.data[i].cityName,obj.data[i].cityCode);
				$("#city").append(option);
			}
    	   }
       });	
 };
 

</script>
</html>