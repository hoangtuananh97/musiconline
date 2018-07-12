<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<c:url value="/resources/bootstrap/css/bootstrap.css"/> " />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
<title>Thanh toán</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-sm-12 col-xs-12">
				<h3>Cart</h3>
				<table id="table_cart" class="display">
					<thead>
						<tr>
							<th>Songs</th>
							<th>User</th>
							<th>Count</th>
							<th>Price</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="listCart" items="${arrCart }">
							<tr>
								<td class="listCart-idSong" data-listCartidSong="${listCart.getIdSong() }">${listCart.getNameSong() }</td>
								<td class="listCart-idUser" data-listCartidUser="${listCart.getIdUser() }">${listCart.getNameUser() }</td>
								<td><input type="number" min="1" class="soluong" value="${listCart.getCountSong() }" /></td>
								<td class="giatien" data-giatien="120.000">120.000</td>
								<td><button class="xoaCart">Delete</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<h4>
					<strong><b>Tổng tiền: <span id="thanhtien">0 </span>VND</b></strong>
				</h4>
			</div>
			<div class="col-md-6 col-sm-12 col-xs-12">
				<h3>Thông tin người mua/ nhận</h3>
				<form action="/musiconline/addBill" method="post">
					<div class="form-group">
						<label for="namepeople"> Tên người mua </label> <input type="text"
							class="form-control" required="" id="namepeople" name="tennguoi" />
					</div>
					<div class="form-group">
						<label for="phone"> Số điện thoại</label> <input type="text"
							class="form-control" required="" id="phone" name="sdt" />
					</div>
					<div class="form-group">
						<label for="bank"> Ngân hàng thanh toán </label> 
						<select class="form-control" id="sel1" name="banks">
						<c:forEach items="${arrBank }" var="listBank">
							<option value="${ listBank.getIdBank()}">${listBank.getNameBank() }</option>
						</c:forEach>
						</select>
					</div>
					<div class="form-group">
						<label for="address"> Địa chỉ </label> <input type="text"
							class="form-control" id="address" required="" name="diachi" />
					</div>
					<div class="form-group">
						<label for="tien">Tổng tiền:</label>
						<input id="tien_nguoi_nhan" value="0" required="" name="tongtien" readonly="true"/> VND
					</div>
					<div class="form-group">
						<label for="submit"> Đặt Mua </label> <input type="submit"
							class="btn btn-success form-control" value="Đặt Mua" id="submit" />
					</div>
				</form>
			</div>
		</div>
			
	</div>
</body>

<script src="<c:url value="/resources/jscustome/jquery-3.3.1.js"/> "
	type="text/javascript"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#table_cart').DataTable();
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {

		
		// giá tiền ban đầu
		
		ganthanhtien(false);
		function ganthanhtien(isChange){
			var thanhtien =0;
			 var thanhtien_dautien= 0; 
		$('.giatien').each(function(){
			var giatien = $(this).text();
			console.log("giatien "+giatien);

			// load tien lan dau tien
			var soluong = $(this).closest('tr').find('.soluong').val();
			var parseSoluong = parseInt(soluong);
			var tongsotien = parseSoluong * parseInt(giatien);
		
			var formattien = parseFloat(giatien).toFixed(3).replace(/(\d)(?=(\d{3})+\,)/g, "$1,").toString();
			
			var formattongtien = parseFloat(tongsotien).toFixed(3).replace(/(\d)(?=(\d{3})+\,)/g, "$1,").toString();
			 thanhtien_dautien= thanhtien_dautien + parseFloat(formattongtien);
			console.log("thanhtien_dautien "+thanhtien_dautien);
			
	
			console.log("tongsotien "+tongsotien);
			thanhtien = thanhtien+ parseFloat(formattien);
			console.log("thanhtien "+thanhtien);
			 var formatthanhtien = thanhtien.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString();
			 // thuc hien doan code lan dau 
			if(!isChange){
				$(this).html(formattongtien);
				 var formatthanhtien_dautien = thanhtien_dautien.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString();
				 console.log("formatthanhtien_dautien "+formatthanhtien_dautien);
				 $('#thanhtien').html(formatthanhtien_dautien);
				 $('#tien_nguoi_nhan').val(formatthanhtien_dautien);
				}else{
			
				$('#thanhtien').html(formatthanhtien+"");
				$('#tien_nguoi_nhan').val(formatthanhtien);
				}
			});
		
		}
		
		$('.soluong').change(function(){
				var soluong = $(this).val();
				var giatien = $(this).closest('tr').find('.giatien').attr('data-giatien');
				 var tongtien = soluong * parseFloat(giatien);
				 var formattien = tongtien.toFixed(3).replace(/(\d)(?=(\d{3})+\,)/g, "$1,").toString();
				$(this).closest('tr').find('.giatien').html(formattien); 
				ganthanhtien(true);

				var data_listCartidSong = $(this).closest('tr').find('.listCart-idSong').attr('data-listCartidSong');
				var data_listCartidUser = $(this).closest('tr').find('.listCart-idUser').attr('data-listCartidUser');
				
				var idSong = parseInt(data_listCartidSong);
				var idUser =parseInt(data_listCartidUser);
				var parseSoluong = parseInt(soluong);
				$.ajax({
					url : "/musiconline/api/capnhatCart",
					type: "get",
					data : {
						idSong : idSong,
						parseSoluong : parseSoluong
						},
					success : function(value){

						}
					})
			});

	
		
		$('.xoaCart').click(function(){
			id = $(this).closest('tr').find('.listCart-idSong').attr('data-listCartidSong');
			var removeCart = $(this).closest('tr')
			var idSong = parseInt(id);
			ganthanhtien(true);
				$.ajax({
					url : "/musiconline/api/xoaCart",
					type : "get",
					data : {
						idSong : idSong
						},
					success : function(value){
						
						removeCart.remove();
						location.reload();
						}	
					});
			});
	});
</script>
</html>