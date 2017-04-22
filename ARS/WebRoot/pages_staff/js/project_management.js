$(function () { 
		$('#table_project_datatable').DataTable({
		      "paging": true,
		      "searching": true,
		      "ordering": true,
		      "info": true,
		      "autoWidth": true,
		      "language": {
		            "url": "json/datatables_chinese.json"
		        }
		 });
	    $("#a_all_reimbusement_sheets").click(function(){
	    	window.open("./pages_staff/sheets/invoice-print.jsp","_blank","menubar=0,scrollbars=1, resizable=1,status=1,titlebar=0,toolbar=0,location=1");
	    });
	    $("#a_all_borrow_sheets").click(function(){
	    	window.open("./pages_staff/sheets/borrow-print.jsp","_blank","menubar=0,scrollbars=1, resizable=1,status=1,titlebar=0,toolbar=0,location=1");
	    });
});