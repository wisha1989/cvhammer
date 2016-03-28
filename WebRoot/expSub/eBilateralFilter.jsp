<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CVHammer</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
	<link href="../css/bootstrap-slider.css" rel="stylesheet">
	 <!-- Loading Flat UI -->
    <link href="../css/flat-ui.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
	<style>
	 body {
            padding-top: 50px;
            color: #5a5a5a;
        }
	li a{
		color:#000;}
	footer{
	background-color:#eee;
	padding-top:20px;
	}
	#ex1Slider .slider-selection {
	background: #BABABA;
    }

       
		/* 响应式布局 */
		@media (max-width: 768px) {
		    

        }

        @media (min-width: 992px) {
          
        }
	</style>
  </head>
  <body>
    <!--导航条-->
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse  navbar-embossed"" name="top">
  <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="../index.jsp">CVHammer</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       <li class="dropdown">
       <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">实验集合 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="../expSub/eCanny.jsp">Canny</a></li>
            <li><a href="../expSub/eSketchRecognition.jsp">SketchRecognition</a></li>
            <li><a href="../expSub/eSketchRetrieve.jsp">SketchRetrieve</a></li>
            <li><a href="../expSub/eBilateralFilter.jsp">BilateralFilter</a></li>
            </ul>
        </li>
		<li id="userLabBtn" ><a href="../expSub/userLab.jsp">个人实验站</a></li>
        <li><a href="#" data-toggle="modal"  data-target="#aboutModal">联系我们</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right"id="userNav">
	  <li id="userBtn" style="display:none" ><a  href='#'>"</a></li> <li  style="display:none" id="navlogoffBtn"><a id="logoffBtn" class='glyphicon glyphicon-off'></a></li>
	  <li id="navloginBtn"  class="active" ><a  href='#' data-toggle='modal'  data-target='#loginModal' >登录</a></li> <li id="registerBtn"><a href="../userDo/register.html">注册</a>
	  </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!--导航条结束-->
<!--主要部分-->
<div class="maincontent container">
<div class="row">
   <div class=" col-xs-12 col-md-offset-1 col-md-10">
  <!--标题-->
     <h2 class="experiment_title"> BilateralFilter 算子</h2>
	 <p > <span class="label label-default">边缘提取</span>&nbsp </p>
	 <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a><a href="#" class="bds_youdao" data-cmd="youdao" title="分享到有道云笔记"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{},"image":{"viewList":["qzone","weixin","tsina","sqq","youdao","renren","tqq"],"viewText":"分享到：","viewSize":"24"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","weixin","tsina","sqq","youdao","renren","tqq"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
    <!--标题结束-->
     <!--实验区域-->
	  <h4 class="bg-primary">Do实验</h4>
	  <form class="form-horizontal">
		   <div class="form-group">
			<label class="col-sm-4" for="InputData">选择输入的参入 threshold1:</label>		
             <div class="col-sm-8">			
			<input id="InputData" data-slider-id='ex1Slider' type="text" data-slider-min="5" data-slider-max="150" data-slider-step="1" data-slider-value="10"/>
			<p>当前值为【<span id="showInputDate">10</span>】</p>
			<p>范围[5:150] 默认值：【10】</p>
			</div>
		 </div>
		  <hr/>
		  <div class="form-group">
			<label class="col-sm-4" >选择输入数据</label>
			<div class="col-sm-8">
			<div class="btn-group" role="group" aria-label="...">
			  <button type="button" class="btn btn-primary btn-success " id="chooseImg" data-toggle="modal" data-target="#imgModal">本地图片</button>
			</div>
			</div>
			</div>
			<div class="col-sm-offset-2  col-sm-10">
			
			<img id="showImg" width=300 src=""   class="img-thumbnail" style="display:none"  alt="显示图片"/>  
			</div>
			

		<button type="button" class="btn  btn-block btn-embossed " id="upParamBtn">实验</button>
		</form>

	   <hr/>  
<!--实验区域结束-->
 <!--简介-->
 	<details close>
    <summary class="experiment_abs bg-primary">算法简介</summary>
    <p>
             双边滤波（Bilateral filter）是一种非线性的滤波方法，是结合图像的空间邻近度和像素值相似度的一种折衷处理，同时考虑空域信息和灰度相似性，达到保边去噪的目的。具有简单、非迭代、局部的特点。
    </p>
	</details><!--简介结束-->
      <hr/> 
	 <!--参考文献-->
 	<details close>
    <summary class=" bg-primary">参考</summary>
     <ul >
		<li>
		 <a href="http://baike.baidu.com/view/4709162.htm" target="_blank">百度百科</a>
		</li>
		<li>
		 <a target="_blank" href="http://blog.csdn.net/bugrunner/article/details/7170471">CSDN</a>
		</li>
		</ul>
	</details><!--简介结束-->
	 
	

	</div>
 </div >   <!--row OVER-->
 
	  
</div> <!--container OVER-->
  <!--主要部分结束-->
  <!--底部设计-->
  <footer>
  <div class="container">
   <p class="pull-right"><a href="#top">回到顶部</a></p>
   <p>2015 CVHammer</p>
   </div>
  </footer>
  
  <!--弹出框-->
  <!--联系我们弹出框-->
	  <div class="modal fade" id="aboutModal">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title">联系我们</h4>
		  </div>
		  <div class="modal-body">
		  <p>期待建议/建议联系我们:18482137463</p>
			
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
		  </div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!--联系我们弹出框-->
 <!--选择模态框-->
	<div class="modal fade  bs-example-modal-lg" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog  modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
	   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title">选择图片</h4>
	  </div>
      <div class="modal-body">
        <input  type="file" id="inputImg"  >
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success glyphicon glyphicon-floppy-saved" data-dismiss="modal"></button>
      </div>
    </div>
  </div>
</div>
 <!--/选择图片模态框结束-->
 <!--登录弹出框-->
	  <div class="modal fade" id="loginModal">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title"><img src="../image/CVHammer_Login.png"/></h4>
		  </div>
		   
		  <div class="modal-body">
			<label for="inputPoneNum" >手机号码：</label>
			<input type="text" id="inputPoneNum" name="PoneNum" class="form-control" placeholder="请输入11位手机号码" required autofocus>
			<label for="inputPassword" >密码：</label>
			<input type="password" id="inputPassword" name="Password" class="form-control" placeholder="请输6~10位入密码" required>
			<p  id="errInfo" > &nbsp </p>
		  </div>
		  <div class="modal-footer">
		  <button class="btn btn-sm btn-primary btn-block"  id="loginBtn">登录</button>
			<a class="btn btn-sm btn-info btn-block " id="test" href="../userDo/register.html" >立即注册</a>
		  </div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!--/登录弹出框-->
	<!-- 实验提示框 -->
	<div class="modal fade  bs-example-modal-sm"  id="expSuccessModal">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
      <div class="modal-body">
                                         实验完成，点击<a href="userLab.jsp" target="_blank">个人实验站</a>查看结果
      </div>
      <div class="modal-footer">
        <a type="button" class="btn btn-success" href="userLab.jsp" role="button">看结果</a>
        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	<!-- /实验提示框 -->
  <!--/弹出框结束-->
  <!--底部设计结束-->
    <script src="../js/jquery-1.11.1.min.js"></script>
     <script src="../js/localResizeIMG.js"></script>
    <script src="../js/bootstrap.min.js"></script>
	<script type='text/javascript' src="../js/bootstrap-slider.js"></script>
	<script type='text/javascript'>
	 <%--参数输入提示--%>
		$('#InputData').slider({
			formatter: function(value) {
				$('#showInputDate').text(value);
				return '当前值: ' + value;
			}
		});
	var isExit =false;
	var isData = false;
	function ChangeUpParamBtnInfo(station)
	  { 
		if(station=="NoExitNoData")
		{
			  $("#upParamBtn").addClass("disabled btn-warning");
			  $("#upParamBtn").html("请先登录");
			  isExit =false;
			  isData = false;
		}else if(station=="ExitNoData"){
			  $("#upParamBtn").addClass("disabled btn-primary");
		      $("#upParamBtn").html("尚未上传数据");
		      isExit =true;
		      isData = false;
		}else if(station=="ExitData"){
			  $("#upParamBtn").removeClass("disabled  btn-warning btn-primary");
			  $("#upParamBtn").addClass("btn-success");
			  $("#upParamBtn").html("做实验");
			  isExit =true;
			  isData = true;
		}else if(station=="NoExitData"){
			  $("#upParamBtn").addClass("disabled   btn-primary");
			  $("#upParamBtn").html("登录后再点击实验");
			  isExit =false;
		      isData = true;
		}else if(station=="DoingExp"){
			  $("#upParamBtn").addClass("disabled   btn-primary");
			  $("#upParamBtn").html("正在实验请稍等");
		}else if(station=="DoneExp"){
			  $("#expSuccessModal").modal('show');
			  $("#upParamBtn").html("做实验");
			  $("#upParamBtn").removeClass("disabled ");
		}else if(station=="FalseExp"){
			  $("#upParamBtn").removeClass("disabled ");
			  $("#upParamBtn").html("结束出错，请重做实验");
			  $("#upParamBtn").delay(2000).html("做实验");
			  $("#upParamBtn").removeClass("disabled ");
		}else if(station=="ErrorExp"){
			  $("#upParamBtn").addClass("disabled ");
			  $("#upParamBtn").html("后台出错了。。。");
		}
			
	  }
	/*验证用户是否存在*/
	<%if((String)session.getAttribute("ISLOGIN")=="true"){
	  out.println("$('#userBtn').css('display','block');$('#navlogoffBtn').css('display','block');$('#navloginBtn').css('display','none');$('#registerBtn').css('display','none');");
	  out.println("$('#userBtn a').text("+(String)session.getAttribute("UserPN")+");");
	  out.println("ChangeUpParamBtnInfo('ExitNoData');");
	  
	}else{
		out.println("$('#loginModal').modal('show');");
		out.println("ChangeUpParamBtnInfo('NoExitNoData');");
	}%>
	<%--inputImgShow--%>
    $("#inputImg").localResizeIMG({
        width: 300,
        quality: 1,
        //before: function (that, blob) {},
        success: function (result) {
        	  $("#showImg").css('display','block');
       	      $("#showImg").attr("src",result.base64);
       	    if(isExit)
       		   {
       	     ChangeUpParamBtnInfo("ExitData");
       		   }else{
       		 ChangeUpParamBtnInfo("NoExitData");  
       		   }
        },
        name:function(name)
        {
        	imgFileNameString=name;
        }
    });
/*---------------登录.注销-------------------*/

 function CheckLogin( poneNum,  password){
	regPoneNum = /^1[3|4|5|8]\d{9}$/;
	regpassword = /^[a-zA-Z0-9]{6,10}$/;
    if((regPoneNum.test(poneNum))&&(regpassword.test(password)))
	{
	return true;
	}
	else{
	$("#errInfo").text("手机或密码格式输入有误");
	return false;
	}
	}
	
$("#loginBtn").click(function(){
	var poneNum=$("#inputPoneNum").val();
	var password=$("#inputPassword").val();
	if(!CheckLogin(poneNum, password))
	{ 
		$("#errInfo").text("用户名或密码有误");
	   return ;
	 }
	/*Ajax异步传输*/
	  htmlobj=$.ajax({url:"../DoLogin",
	  type: 'POST',
	  data: {PoneNum:poneNum,Password:password},
	  success: function (data) { 
	  /*如果传的是真值*/
	    if(data == "true")
		{
		  $("#userBtn").css('display','block');
		  $("#userBtn a").text(poneNum);
		  $("#navlogoffBtn").css('display','block'); 
		  $("#navloginBtn").css('display','none');
		  $("#registerBtn").css('display','none');
		  $('#loginModal').modal('hide');
		   if(isData)
		   {
	     ChangeUpParamBtnInfo("ExitData");
		   }else{
		 ChangeUpParamBtnInfo("ExitNoData");  
		   }
		  }
	     else if(data == "false"){
		$("#errInfo").text("用户不存在或密码错误");
	  }else if(data == "error") { 
   	  $('#loginModal').modal('hide');
	     alert("CVHammer受伤了,在修理中,先逛会儿吧");
	  }
	  
  }
  });
  });
  
  <%--注销登录--%>
 $("#logoffBtn").click( function (){
			  htmlobj=$.ajax({url:"../DoLogoff",
			  type: 'POST',
			  success: function (data) { 
			  $("#userBtn").css('display','none');
			  $("#userBtn a").text("");
			  $("#navlogoffBtn").css('display','none');
			  $("#navloginBtn").css('display','block');
			  $("#registerBtn").css('display','block');
			  if(isData)
			   {
		     ChangeUpParamBtnInfo("NoExitData");
			   }else{
			 ChangeUpParamBtnInfo("NoExitNoData");  
			   }
			  }
			  });
			});
  <%--提交实验信息--%>
 $("#upParamBtn").click( function (){
	  ChangeUpParamBtnInfo("DoingExp");
	  htmlobj=$.ajax({url:"../DoEBilateralFilter",
		  type: 'POST',
		  data: {threshold1:$("#InputData").val(),imgFile:$("#showImg").attr("src"),imgFileName:imgFileNameString},
		  success: function (data) { 
			  if(data == "true")
				{
				  ChangeUpParamBtnInfo("DoneExp");
				 }
			     else if(data == "false"){
			     ChangeUpParamBtnInfo("FalseExp");
			  }else  { 
				 ChangeUpParamBtnInfo("ErrorExp");
			  }
		  }
		  });
		});
  
	</script>
  </body>
</html>
