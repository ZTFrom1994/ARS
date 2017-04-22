$(function(){
	$('#table_admin_message').DataTable({
		"paging": true,
		"searching": true,
		"ordering": true,
		"info": true,
		"autoWidth": true,
		"language": {
		"url": "json/datatables_chinese.json"
		}
	});
})