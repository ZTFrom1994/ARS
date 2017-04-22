$(function() {
	$("#borrowing_info_datatable").DataTable( {
		"paging" : true,
		"searching" : true,
		"ordering" : true,
		"info" : true,
		"autoWidth" : true,
		"language" : {
			"url" : "json/datatables_chinese.json"
		}
	})

})