<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- <link rel="stylesheet" type="text/css" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">-->

<!-- <link href="css/bootstrap.css" rel="stylesheet" />  -->
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	function checkMsg(){
		//获取表单里面的值
		var name = document.getElementById("name").value ;
		var age = document.getElementById("age").value ;
		var address = document.getElementById("address").value ;
		
		if( name == '' || age == '' || address == ''){
			document.getElementById("msg").innerHTML = "<font color='red' size=-1>&nbsp;&nbsp;&nbsp;信息不完整，请补充</font>";
			return false; 
		}
		
		//提交表单   ajax 方式提交表单
		//data:{id:id,name:name,age:age,address:address},
		//$("#frm")  相当于   document.getElementById("frm")
		$.ajax({
			url:'add.action',
			type:'post',
			data:$("#frm").serialize(),
			dateType : "json" ,
			success : function(data){
				if(data.code == 100){
					
					/* var table1 = $("#table1"); //document.getElementById("table1")
					var tr = $("<tr></tr>"); //创建一个tr
					id = table1.find("tr").length ;  //判断这个表格的行数			
					var td1 = $("<td>"+id+"</td><td>"+name+"</td><td>"+age+"</td><td>"+address+"</td><td><a class='btn btn-info' data-toggle='modal' data-backdrop='false' data-id='"+id+"' href='#customerEditDialog' >修改</a>&nbsp<input type='button' value='删除'  id='btn' onclick='deleteMsg("+id+")' class='btn btn-info'>");
					tr.append(td1); //把td添加到 tr中
					table1.append(tr); //把tr 放到  table中 */
					window.location.reload();
					//添加完成之后，将表单内容清空，调用reset按钮
					$("#frm :input").not(":button, :submit , :reset , :hidden").val("");
				}else{
					$("#msg").html(data.msg);
				}
			}
		}) ; 
	}

</script>
<script type="text/javascript">
	
	function deleteMsg(id){
		//获取表单里面的值		
		
		//提交表单   ajax 方式提交表单
		//data:{id:id,name:name,age:age,address:address},
		//$("#frm")  相当于   document.getElementById("frm")
		$.ajax({
			url:'del.action',
			type:'post',
			data:{id:id},
			dateType : "json" ,
			success : function(data){
				if(data.code == 100){		
					//alert(id);
					 for(var i=1;i<6;i++){
						 var modalId = document.getElementById("table1").rows[i].cells[0].innerHTML;  
			        	 if(modalId==id){
			        			document.getElementById('table1').deleteRow(i);
			        			location.reload();			        		 
			        	 }
			        	 
			         }
						 // alert("a%b="+n);
						//document.getElementById('table1').deleteRow(id);
						//location.reload()
					
					//document.getElementById('table1').deleteRow(id);	
					//location.reload()
				}else{
					$("#msg").html(data.msg);
				}
			}
		}) ; 
	}

</script>

<script type="text/javascript">
	
	function updateMsg(obj){
		//获取表单里面的值
		var id = document.getElementById("Uid").value ;
	 	var name = document.getElementById("Uname").value ;
		var age = document.getElementById("Uage").value ;
		var address = document.getElementById("Uaddress").value ;
		var upd = $("#updfrm").serialize();
		
		if( name == '' || age == '' || address == ''){
			document.getElementById("mss").innerHTML = "<font color='red' size=-1>&nbsp;&nbsp;&nbsp;信息不完整，请补充</font>";
			return false; 
		}  
		
		//提交表单   ajax 方式提交表单
		//data:{id:id,name:name,age:age,address:address},
		//$("#frm")  相当于   document.getElementById("frm")
		$.ajax({
			url:'upd.action',
			type:'post',
			data: upd,
			dateType : "json" ,
			success : function(data){
				if(data.code == 100){									
					  for(var i=1;i<6;i++){
				        	var modalId = document.getElementById("table1").rows[i].cells[0].innerHTML;  
				        	 if(modalId==id){
				        		 var x = document.getElementById("table1").rows[i].cells;				 			
									
									x[0].innerHTML = id;
									x[1].innerHTML = name;
									x[2].innerHTML = age;
									x[3].innerHTML = address;									
									window.location.reload();
				        	 } 
				         }	
				   
					//alert(id)		
					//location.reload()
				}else{
					$("#msg").html(data.msg);
				}
			}
		}) ; 
	}

</script>

</head>
<body>
	<div class="container">
		<table id="table1" class="table table-bordered table-hover">
		<tr>
			<td>编号</td>
			<td>名称</td>
			<td>年龄</td>
			<td>地址</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${pageInfo.list}" var="ui" >
			<tr>
				<td>${ui.id}</td>
				<td>${ui.name}</td>
				<td>${ui.age}</td>
				<td>${ui.address}</td>
				<td>
					<a class="btn btn-info btn-sm" data-toggle="modal" data-backdrop="false" data-id="${ui.id}" href="#customerEditDialog" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
					修改</a>
					<a type="button" href="#" onclick="deleteMsg(${ui.id})" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true" ></span>
					删除</a>
				</td>	
			</tr>
		</c:forEach>
	</table>
	
		<div class="row">
            <!-- 分页文字信息，其中分页信息都封装在pageInfo中 -->
            <div class="col-md-6">
                当前第：${pageInfo.pageNum}页，总共：${pageInfo.pages}页，总共：${pageInfo.total}条记录
            </div>

        <!-- 分页条 -->
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                  <ul class="pagination">
                    <li><a href="${path}query.action?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage }">
                         <li>
                          <a href="${path}query.action?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                          </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                        <c:if test="${page_Num == pageInfo.pageNum }">
                            <li class="active"><a href="#">${ page_Num}</a></li>
                        </c:if>
                        <c:if test="${page_Num != pageInfo.pageNum }">
                            <li><a href="${path}query.action?pn=${ page_Num}">${ page_Num}</a></li>
                        </c:if>
                    </c:forEach> 
                    <c:if test="${pageInfo.hasNextPage }">
                        <li>
                          <a href="${path}query.action?pn=${pageInfo.pageNum+1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                          </a>
                        </li>
                    </c:if>   
                    <li><a href="${path}query.action?pn=${pageInfo.pages}">末页</a></li>
                  </ul>
                </nav>
            </div>
</div>
	
	<!-- 模态窗口，修改  start -->
	<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" id="updfrm">
					<input type="hidden" id="edit_cust_id" name="custId"/>	
					<div class="form-group">
						<label for="Uid" class="col-sm-2 control-label">编号</label>
						<div class="col-sm-10">
							<input type="text" readonly="readonly" value=" " class="form-control" id="Uid"  placeholder="编号" name="id" />
						</div>
					</div>				
					<div class="form-group">
						<label for="Uname" class="col-sm-2 control-label">客户名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="Uname" placeholder="客户名称" name="name" />
						</div>
					</div>
					<div class="form-group">
						<label for="Uage" class="col-sm-2 control-label">年龄</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="Uage" placeholder="年龄" name="age" />
						</div>
					</div>
					<div class="form-group">
						<label for="Uaddress" class="col-sm-2 control-label">地址</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="Uaddress" placeholder="地址" name="address" />
						</div>
					</div>
				  	<span id = "mss"></span>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary"  onclick="updateMsg(this)">保存修改</button>
			</div>
		</div>
	</div>
</div>
	<!-- 模态窗口，修改 end -->
<script>
	$("#customerEditDialog").on("hide.bs.modal", function() {	
		$(this).removeData(); 
		
});
</script>
<script>
$(function() {
    $('#customerEditDialog').on('show.bs.modal',function(event) {
    	 var btnThis = $(event.relatedTarget); //触发事件的按钮
         var modal = $(this); //当前模态框
         var dataId = btnThis.data('id'); //解析出data-id的内容
         for(var i=1;i<6;i++){
        	var modalId = document.getElementById("table1").rows[i].cells[0].innerHTML;  
        	 if(modalId==dataId){
        		 document.getElementById("Uid").value = document.getElementById("table1").rows[i].cells[0].innerHTML;
        		 document.getElementById("Uid").placeholder = document.getElementById("table1").rows[i].cells[0].innerHTML;
        		 document.getElementById("Uname").placeholder = document.getElementById("table1").rows[i].cells[1].innerHTML;
        		 document.getElementById("Uname").value = "";
        		 document.getElementById("Uage").placeholder = document.getElementById("table1").rows[i].cells[2].innerHTML;
        		 document.getElementById("Uage").value = "";
        		 document.getElementById("Uaddress").placeholder = document.getElementById("table1").rows[i].cells[3].innerHTML;
        		 document.getElementById("Uaddress").value = "";
        		 document.getElementById("mss").innerHTML = "";
        		 break;
        	 } 
         }	
        // alert(dataId)                 
        
       /*      modalId = document.getElementById("table1").rows[dataId].cells[0].innerHTML;
			modalName = document.getElementById("table1").rows[dataId].cells[1].innerHTML;
			modalAge = document.getElementById("table1").rows[dataId].cells[2].innerHTML;
			modalAddress = document.getElementById("table1").rows[dataId].cells[3].innerHTML;
		document.getElementById("Uid").value=modalId; 
		document.getElementById("Uid").placeholder=modalId; 
		document.getElementById("Uname").placeholder=modalName; 
		document.getElementById("Uage").placeholder=modalAge; 
		document.getElementById("Uaddress").placeholder=modalAddress;  */
    })
});
</script>
	<h2>参数绑定</h2>
	<!--  <input type="button" value="更新" id="btn" onclick="updateMsg(this)" >-->
	<form id="frm">
		<table class="table table-bordered">			
			<tr>
				<td>姓名</td>
				<td>
					<input type="text" id="name" name="name">
				</td>
			</tr>
			<tr>
				<td>年龄</td>
				<td>
					<input type="text" id="age" name="age">
				</td>
			</tr>
			<tr>
				<td>地址</td>
				<td>
					<input type="text" id="address" name="address">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="提交" id="btn" onclick= "checkMsg()" class="btn btn-info">
					<input type="reset" value="取消" id="cancal" class="btn btn-danger">
					<span id = "msg"></span>
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>