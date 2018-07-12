<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="<c:url value="/resources/bootstrap/css/bootstrap.css"/> " />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
<link rel="stylesheet" href="<c:url value="/resources/pagebill.css"/> " />
<title>Page Bill</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<h3>Bill Admin</h3>
				<table border="1" cellspacing="0" cellpadding="10"
					id="table_billadmin" class="display">
					<thead>
						<tr>
							<th>idBill</th>
							<th>banks</th>
							<th>nameCus</th>
							<th>phone</th>
							<th>address</th>
							<th>sates</th>
							<th>dates</th>
							<th>summoney</th>
							<th>Display Detail Bill</th>
							<th>Update</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="listBill" items="${arrBill }">
							<tr>
								<td class="listBill-id"
									data-listCartidSong="${listBill.getIdBill() }">${listBill.getIdBill() }</td>
								<td class="listBill-idBank"
									data-listCartidUser="${listBill.getBanks().getIdBank() }">${listBill.getBanks().getNameBank()}</td>
								<td>${listBill.getNameCus()}</td>
								<td>${listBill.getPhone()}</td>
								<td>${listBill.getAddress()}</td>
								<td data-sates="${listBill.getSates()}" class="listBill-sates">
									<%-- <c:if test="${listBill.getSates() ==1}">Đã nhận tiền</c:if>
									<c:if test="${listBill.getSates() ==0}">Chưa nhận tiền</c:if> --%>
								 <select class="form-control" id="sel1" name="option-sates">
								 <%-- <c:forEach items="${listSates }" var="arrSates"> --%>
								
								  <option value="0" <c:out value="${listBill.getSates()==0 ?'selected':''}"></c:out>>Chưa nhận tiền</option>
   								 <option value="1" <c:out value="${listBill.getSates() ==1 ?'selected':''} "></c:out> >Đã nhận tiền</option>
   							<%-- 	</c:forEach> --%>
  								</select>
								</td>
								<td><fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss"
										value="${listBill.getDates()}" /></td>
								<td>${listBill.getSummoney()}VND</td>
								<td><button
										onclick="document.getElementById('id01').style.display='block'"
										class="btn btn-success idBill" style="width: auto;">Deltail
										Bill</button></td>
								<td><button class="btn btn-success updateBill">Update</button></td>

								<td><button class="btn btn-success xoaBill">Delete</button></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
			
			<div id="id02" class="modal">

				<div class="modal-content animate">
					<div class="imgcontainer">
						<span
							onclick="document.getElementById('id02').style.display='none'"
							class="close" title="Close Modal">&times;</span>

					</div>

					<div class="container">
						<div class="row">
							
						</div>
					</div>
				</div>
			</div>		
			
			
			<div id="id01" class="modal">

				<div class="modal-content animate">
					<div class="imgcontainer">
						<span
							onclick="document.getElementById('id01').style.display='none'"
							class="close" title="Close Modal">&times;</span>

					</div>

					<div class="container">
						<div class="row">
							
								<h3>Detail Bill Admin</h3>
								<table border="1" cellspacing="0" cellpadding="10"
									id="Table_DetailBillAdmin" class="display">
									<thead>
										<tr>
											<th>Bill</th>
											<th>User</th>
											<th>Song</th>
											<th>Count</th>
											<th>A Price</th>
										</tr>
									</thead>
									<tbody id="listDetailSong">
										
									</tbody>
								</table>
							
						</div>
					</div>

				</div>
			</div>


		</div>
	</div>
</body>
<script src="<c:url value="/resources/jscustome/jquery-3.3.1.js"/> "
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		$('.idBill').click(function(){
			id = $(this).closest('tr').find('.listBill-id').attr('data-listCartidSong');
			idBill = parseInt(id);
			$.ajax({
					url : "/musiconline/api/getAllDetailBillByIdBil",
					type : "get",
					data : {
						idBill : idBill
						},
					success : function(value){
							var tbodyDetail = $('#listDetailSong');
							tbodyDetail.empty();
							tbodyDetail.html(value);
						}	
				});

			});

		$('.xoaBill').click(function(){
				deleteBill = $(this).closest('tr');
				id = $(this).closest('tr').find('.listBill-id').attr('data-listCartidSong')
				idBill= parseInt(id);
				$.ajax({
						url: "/musiconline/api/deleteBill",
						type: "post",
						data : {
							idBill : idBill
							},
						success : function(value){
							deleteBill.remove();
							}	
					});
		
			});

		var satesChange = 2 ;
		$('.form-control').change(function(){
			  satesChange =	$(this).val();
			});
		
		$('.updateBill').click(function(){
				sates = $(this).closest('tr').find('select[name=option-sates]').val();
				id = $(this).closest('tr').find('.listBill-id').attr('data-listCartidSong');
				idBill = parseInt(id);
				satesBill = parseInt(satesChange);
				console.log(satesChange);
				if(satesBill!=2){
				 $.ajax({
					url : "/musiconline/api/updateStateBill",
					type : "post",
					data : {
						idBill: idBill,
						satesBill: satesBill
						},
					success : function(value){

						}
					}); 
				}else{
					
					}
			});
		
	});
</script>	
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#table_billadmin').DataTable();
		/*  $('#Table_DetailBillAdmin').DataTable();  */

		
	});
</script>
<script>
	// Get the modal
	var modal = document.getElementById('id01');
	var modal2 = document.getElementById('id02');

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	window.onclick = function(event) {
		if (event.target == modal2) {
			modal2.style.display = "none";
		}
	}
</script>
</html>
