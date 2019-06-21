<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>文章录入</title>
    
    
     <style type="text/css">
        div{
            width:100%;
        }
    </style>
</head>
<style>
fieldset {
	padding: .35em .625em .75em;
	margin: 0 2px;
	border: 1px solid silver
}

legend {
	padding: .5em;
	border: 0;
	width: auto
}
</style>
<body>

	    <!-- 加载编辑器的容器 -->
   <h1 align="center">文章录入</h1>
    <!-- 配置文件 -->
    <script type="text/javascript" src="ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('container');
    </script>
	<form action="${ctx}/Article/save.htm" method="post" name="inputForm"
		id="inputForm" enctype="multipart/form-data"
		data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
		data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
		data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">

		<div id="telDiv" class="row form-group">
			<div id="telCT">
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon2">文章标题</span> <input
						type="text" class="form-control" id="articleHeader"
						name="articleHeader" placeholder="请输入文章标题"
						value="${articleHeader}" required
						data-bv-notempty-message="题目不能为空" aria-describedby="basic-addon2"
						data-bv-phone="true" data-bv-phone-country="CN"
						data-bv-phone-message="输入不是有效的手机号 " data-bv-threshold="11"
						data-bv-remote="true" />
				</div>
			</div>
		</div>

	<!-- 	<textarea name="content"></textarea>
		<script>
			CKEDITOR.replace('content');
		</script> -->
	<div>
    <span class="input-group-addon" id="basic-addon2">文章类容</span>
     <script id="container" name="container" type="text/plain" style="width:100%;height:500px;">
        这里写你的初始化内容
    </script>
	</div>
      <input type = "hidden" name = "content" id = "content"/>
      
      
		<div class="panel panel-default">
			<div class="panel-body">
				<c:if test="${not empty message}">
					<div class="alert alert-danger alert-dismissible" role="alert">
						${message}
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true"></span>
						</button>
					</div>
				</c:if>

				<div id="enableCT" class="row form-group">
					<div class="input-group">
						<span class="input-group-addon">文章类型</span> <select
							class="form-control" title="请选择一个问题" name="type" id="type">
							<option value="yx">研学类型</option>
							<option value="zzzs">自主招生类型</option>
							<option value="zytb">志愿填报类型</option>
							<option value="zhpj">综合评价类型</option>
							<option value="xgk">新高考类型</option>
							<option value="ms">面试培训类型</option>
							<option value="js">竞赛消息类型</option>
						</select> <span class="input-group-addon" id="basic-addon1"><i
							class="glyphicon glyphicon-link"></i></span>
					</div>
				</div>



				<div class="form-group">
					<div id="datepicker" class="input-group">
						<span class="input-group-addon">页面展示的时间</span> <input
							id="startDate" name="showTime" class="form-control form_datetime"
							type="datetime" placeholder="展示时间" readonly
							value="<fmt:formatDate value="${showTime}" pattern="yyyy-MM-dd HH:mm" />">
					</div>
				</div
			</div>

			<div id="nameCT" class="row form-group">
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon3">是否置顶</span>
					<div
						style="boorder: 1px solid #ccc; text-align: center; margin: 10px auto;">
						<div class="radio-custom radio-primary" style="float: left;">
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="first"
								checked="checked" value="0"> <label style="width: 70px;">不置顶</label>
						</div>
						<div class="radio-custom radio-primary" style="float: left;">
							<input type="radio" name="first" value="1"> <label>置顶</label>
						</div>

					</div>
				</div>
			</div>



			<div id="telDiv" class="row form-group">
				<div id="telCT">
					<div class="input-group">
						<span class="input-group-addon" id="basic-addon2">图片地址</span> <input
							class="form-control" id="imagePath" name="imagePath" type="file" />
					</div>
				</div>
			</div>
			
			<div id="nameCT" class="row form-group">
				<div class="input-group">
					<span class="input-group-addon" id="basic-addon3">是否轮播图</span>
					<div
						style="boorder: 1px solid #ccc; text-align: center; margin: 10px auto;">
						<div class="radio-custom radio-primary" style="float: left;">
							&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="loopImage"
								checked="checked" value="0"> <label style="width: 70px;">不是轮播图</label>
						</div>
						<div class="radio-custom radio-primary" style="float: left;">
							<input type="radio" name="loopImage" value="1"> <label>是轮播图</label>
						</div>

					</div>
				</div>
			</div>

		<!-- 	<div style="text-align: center">
			<input type="button" class="btn btn-primary" name="submit" value="确认录入" onclick="getAllHtml()"/></div>
 -->
			<div style="text-align: center">
				<button type="submit" class="btn btn-primary" onclick="getAllHtml()">确认录入</button>
			</div>
			
			<!-- <div style="text-align: center">
				<button onclick="getAllHtml()" type=""button>测试</button>
			</div> -->
		</div>
	</form>
	<script type="text/javascript">


	function getAllHtml(){
		var str =  UE.getEditor('container').getContent();
			$("#content").val(str);
			$("#inputForm").submit();


		}
	

	


	
		$(".form_datetime").datetimepicker({
			format : "yyyy-mm-dd hh:ii",
			autoclose : true,
			todayBtn : false,
			language : 'zh-CN',
			pickerPosition : "bottom-right"
		});

		$("#startDate").datetimepicker().on('changeDate', function(ev) {
			$("#endDate").datetimepicker('setStartDate', ev.date);
		});
		var loadUpFn = function(me) {
			window.location.reload();
		}

		var loadDownFn = function(me) {
			var obj = me.$element;

			var id = obj.attr("id");

			var totalPages = $("#totalPages").val();
			var currentPage = $("#currentPage").val();

			if (totalPages) {
				if (parseInt(currentPage) >= parseInt(totalPages)) {
					me.resetload();
					return;
				}
				$.blockUI();
			}

			try {
				$.post("${ctx}/finance/pageFromDetail.htm", {
					"types" : $("#types").val(),
					"startDate" : $("#startDate").val(),
					"endDate" : $("#endDate").val(),
					"currentPage" : parseInt(currentPage) + 1
				}, function(html) {
					$(".params").remove();
					$("#pages").append(html);
					if (totalPages) {
						$.unblockUI();
					}
					if (me.resetload) {
						me.resetload();
					}
				}, "html");
			} catch (e) {
				$.unblockUI();
				me.resetload();
			}

		}
		befordMsg = function() {
			buildDropLoad($(".inner"));
			loadDownFn({
				$element : $("#pages")
			});
		}

	
		
	</script>
</body>
</html>