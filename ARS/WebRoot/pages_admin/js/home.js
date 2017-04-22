$(function(){
	$("#btn_send_message").click(function(){
		if($("#text_message_content").val()== ""){
			alert("请填写推送内容");
		}else{
			$.ajax({
				url:"messageAction!addMessage",
				type:"post",
				data:{
					sendObject:$("#select_message_object").val(),
					sendContent:$("#text_message_content").val()
				},
				success:function(data){
					if(data == 1){
						$("#tipModalTitle").text("推送成功");
						$("#tipModal").modal("show");
						$('#tip-icon').attr('class','glyphicon glyphicon glyphicon-ok');
						setTimeout("$('#tipModal').modal('hide');$('#loginModal').modal('hide');location.reload();", 2000);
					}else{
						$("#tip-icon").attr("class","glyphicon glyphicon-remove"); 
						$("#tipModalTitle").text("推送失败，请重试"); 
						$("#tipModal").modal("show");
					}
				}
			});
		}
	});
	
	 // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('my_echarts'));
    option = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'shadow'
            }
        },
        legend: {
            data: ['日常报销', '差旅费报销','借款']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        yAxis: {
            type: 'value',
            boundaryGap: [0, 0.01]
        },
    };
    $.post('chartAction!getChartJson').done(function (data) {
    	var json = eval('(' + data + ')');
    	option.series = json.data;
    	option.xAxis= {
                type: 'category',
                data: json.days
            };
        myChart.setOption(option);
    });
    
})