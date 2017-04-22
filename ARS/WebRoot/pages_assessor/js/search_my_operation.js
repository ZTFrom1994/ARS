$(function(){
	$('#table_my_operation').DataTable({
		"paging": true,
		"searching": true,
		"ordering": false,
		"info": true,
		"autoWidth": false,
		"language": {
		"url": "json/datatables_chinese.json"
	}
	});
	$('#table_my_operation').on( 'draw.dt', function () {
		var h = $('#frame_search_operation_page',window.parent.document).contents().find("body").height()+70;
		$('#frame_search_operation_page',window.parent.document).height(h);
	} );
});
 