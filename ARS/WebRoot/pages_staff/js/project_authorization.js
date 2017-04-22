$(function(){
	 $('#datepicker').datepicker({
	      autoclose: true
	});
	 $('#project_authorization_datatable').DataTable({
	      "paging": true,
	      "searching": true,
	      "ordering": true,
	      "info": true,
	      "autoWidth": true,
	      "language": {
	            "url": "json/datatables_chinese.json"
	        }
	    });
	 $('#staff_datatable').DataTable({
		 "paging": true,
		 "searching": true,
		 "ordering": true,
		 "info": true,
		 "autoWidth": true,
		 "language": {
		 "url": "json/datatables_chinese.json"
	 }
	 });
	$("input[name='authorization_type']").click(function(){
		if($(this).val()=="temporary"){
			$("#datepicker").prop("disabled",false);
		}else{
			$("#datepicker").prop("disabled",true);
		}
	})
})