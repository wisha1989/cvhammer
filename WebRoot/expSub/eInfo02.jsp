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
      <a class="navbar-brand" href="#">Brand</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li ><a href="/CVHammer/index.jsp">主页 </a></li>
		<li ><a href="/CVHammer/expSub/userLab.html">个人实验站</a></li>
        <li><a href="#" data-toggle="modal"  data-target="#aboutModal">联系我们</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right"id="userNav">
	  <li id="userBtn" style="display:none" ><a  href='#'>"</a></li> <li  style="display:none" id="navlogoffBtn"><a id="logoffBtn" class='glyphicon glyphicon-off'></a></li>
	  <li id="navloginBtn"  class="active" ><a  href='#' data-toggle='modal'  data-target='#loginModal' >登录</a></li> <li id="registerBtn"><a href="/CVHammer/userDo/register.html">注册</a>
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
     <h2 class="experiment_title">CANNY 算子</h2>
	 <p > <span class="label label-default">边缘提取</span>&nbsp <span class="label label-default">边缘提取</span></p>
	 <div class="bdsharebuttonbox"><a href="#" class="bds_more" data-cmd="more"></a><a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a><a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a><a href="#" class="bds_youdao" data-cmd="youdao" title="分享到有道云笔记"></a><a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#" class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a></div>
<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"24"},"share":{},"image":{"viewList":["qzone","weixin","tsina","sqq","youdao","renren","tqq"],"viewText":"分享到：","viewSize":"24"},"selectShare":{"bdContainerClass":null,"bdSelectMiniList":["qzone","weixin","tsina","sqq","youdao","renren","tqq"]}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
    <!--标题结束-->
     <!--实验区域-->
	  <h4 class="bg-primary">Do实验</h4>
	  <form class="form-horizontal">
		   <div class="form-group">
			<label class="col-sm-2" for="InputData">选择输入的参入</label>		
             <div class="col-sm-10">			
			<input id="InputData" data-slider-id='ex1Slider' type="text" data-slider-min="0" data-slider-max="120" data-slider-step="1" data-slider-value="14"/>
			<span>说明参数的默认值；可选范围</span>
			</div>
		 </div>
		  <div class="row">
			<label class="col-sm-2" >选择输入数据</label>
			<div class="col-sm-10">
			<div class="btn-group" role="group" aria-label="...">
			  <button type="button" class="btn btn-primary btn-success " id="chooseImg" data-toggle="modal" data-target="#imgModal">本地图片</button>
			  <button type="button" class="btn btn-primary" id="chooseSketch" data-toggle="modal" data-target="#sketchModal" >手绘图片</button>
			</div>
			</div>
			</div>
			<div class="row">
			    
			</div>
			<div class="row">
			<div class="col-sm-offset-2  col-sm-10">
			<img id="showImg" height=100 src="" style="display:none"  alt="显示图片"/>  
			</div>
			</div>
			

		<button type="submit" class="btn btn-danger btn-block btn-embossed">做实验</button>
		</form>

	   <hr/>  
<!--实验区域结束-->
 <!--简介-->
 	<details close>
    <summary class="experiment_abs bg-primary">算法简介</summary>
    <p>Canny边缘检测算子是John F. Canny于 1986 年开发出来的一个多级边缘检测算法。更为重要的是 Canny 创立了边缘检测计算理论（Computational theory of edge detection）解释这项技术如何工作。
     通常情况下边缘检测的目的是在保留原有图像属性的情况下，显著减少图像的数据规模。目前有多种算法可以进行边缘检测，虽然Canny算法年代久远，但可以说它是边缘检测的一种标准算法，而且仍在研究中广泛使用。</p>
	   <h5>
		最优边缘准则
		</h5>	
		<p>
		Canny 的目标是找到一个最优的边缘检测算法，最优边缘检测的含义是：<br/>
	(1)最优检测：算法能够尽可能多地标识出图像中的实际边缘，漏检真实边缘的概率和误检非边缘的概率都尽可能小；<br/>
	(2)最优定位准则：检测到的边缘点的位置距离实际边缘点的位置最近，或者是由于噪声影响引起检测出的边缘偏离物体的真实边缘的程度最小；<br/>
	(3)检测点与边缘点一一对应：算子检测的边缘点与实际边缘点应该是一一对应。<br/>
	为了满足这些要求 Canny 使用了变分法（calculus of variations），这是一种寻找优化特定功能的函数的方法。最优检测使用四个指数函数项表示，但是它非常近似于高斯函数的一阶导数。<br/>
		</p>
		<h5>
		算法的实现步骤
		</h5>
		<p>
		Canny边缘检测算法可以分为以下5个步骤：<br/>
	1.应用高斯滤波来平滑图像，目的是去除噪声<br/>
	2.找寻图像的强度梯度（intensity gradients）<br/>
	3.应用非最大抑制（non-maximum suppression）技术来消除边误检（本来不是但检测出来是）<br/>
	4.应用双阈值的方法来决定可能的（潜在的）边界<br/>
	5.利用滞后技术来跟踪边界<br/>
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
		 <a target="_blank" href="http://www.cnki.net/">中国知网</a>
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
	<!--绘图模态框-->
	<div class="modal fade  bs-example-modal-lg" id="sketchModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog  modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
	   <!--  <h6 class="modal-title" class="pull-right" id="myModalLabel">草图绘制</h6>--> 
	   <!--画笔-->
	   <button type="button" class="btn btn-default btn-sm" onclick="javascript:setPenArea();return false;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></button>
       <!--橡皮-->
	   <button type="button" class="btn btn-success btn-sm" onclick="javascript:eraserArea();return false;" >橡皮</button>
	   <!--尺寸-->
	    笔/橡皮尺寸 <select id="selWidth">
				<option value="3">3</option>
				<option value="6">6</option>
				<option value="9" selected="selected" >9</option>
				<option value="12">12</option>
				<option value="15">15</option>
				</select>
		<span id="positionX"></span>
	  </div>
      <div class="modal-body">
        <canvas id="myCanvas" >您的浏览器不能用于绘制草图</canvas>
      </div>
      <div class="modal-footer">
        <!--清除-->
		<button type="button" class="btn btn-default glyphicon glyphicon-trash" onclick="javascript:clearArea()" >清除</button>
		
		<!--保存-->
		<button type="button" class="btn btn-info glyphicon glyphicon-ok" onclick="javascript:saveArea()">保存</button> 
      
	     <!--关闭-->
		<button type="button" class="btn btn-danger glyphicon glyphicon-remove" data-dismiss="modal">关闭</button>
      </div>
    </div>
  </div>
</div>
 <!--/绘图模态框结束-->
 <!--选择模态框-->
	<div class="modal fade  bs-example-modal-lg" id="imgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog  modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
	   <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<h4 class="modal-title">选择图片</h4>
	  </div>
      <div class="modal-body">
        <input style="display:none" type="file" id="inputImg"  >
      </div>
       <div class="modal-footer">
        <button type="button" class="btn btn-default glyphicon glyphicon-floppy-saved" data-dismiss="modal">关闭</button>
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
			<h4 class="modal-title"><img src="/CVHammer/image/CVHammer_Login.png"/></h4>
		  </div>
		   
		  <div class="modal-body">
			<label for="inputPoneNum" >账号：</label>
			<input type="text" id="inputPoneNum" name="PoneNum" class="form-control" placeholder="请输入11位手机号码" required autofocus>
			<label for="inputPassword" >密码：</label>
			<input type="password" id="inputPassword" name="Password" class="form-control" placeholder="请输6~10位入密码" required>
			<p  id="errInfo" > &nbsp </p>
		  </div>
		  <div class="modal-footer">
		  <button class="btn btn-sm btn-primary btn-block"  id="loginBtn">登录</button>
			<a class="btn btn-sm btn-info btn-block " id="test" href="/CVHammer/userDo/register.html" >立即注册</a>
	
		  </div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!--/登录弹出框-->
  <!--弹出框结束-->
  <!--底部设计结束-->
    <script src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
	<script type='text/javascript' src="../js/bootstrap-slider.js"></script>
	<script type='text/javascript'>
	/*运用#自动弹出Modal*/
	/*验证用户是否存在*/
		<%if((String)session.getAttribute("ISLOGIN")=="true"){
	  out.println("$('#userBtn').css('display','block');$('#navlogoffBtn').css('display','block');$('#navloginBtn').css('display','none');$('#registerBtn').css('display','none');");
	  out.println("$('#userBtn a').text("+(String)session.getAttribute("UserPN")+");");
	}%>
	/*---------------画板有关-------------------*/
	// With JQuery
	$('#InputData').slider({
		formatter: function(value) {
			return '当前值: ' + value;
		}
	});
	$("#chooseImg").click(function(){
    $("#inputImg").css('display','block');
	$("#showImg").css('display','block');
    })
	/*绘话部分*/
	var board,canvas; 
	$('#sketchModal').on('shown.bs.modal', function (e) {
       
	    //获取位置
		 function pos(event){
		 var x,y;
		if(isTouch(event)){
		 x = event.touches[0].pageX;
		 y = event.touches[0].pageY;
		}else{
		 x = event.offsetX+event.target.offsetLeft;
		 y = event.offsetY+event.target.offsetTop;
		}
		log('x='+x+' y='+y);
		return {x:x,y:y};
		}
		//下笔
		 function beginDraw(){
		 mousePress = true;
		}
        //绘画，移动中
		 function drawing(event){
		event.preventDefault();
		if(!mousePress)return;
		 var xy = pos(event);
		if(last!=null){
		board.beginPath();
		board.lineWidth = $('#selWidth').val();
		board.lineJoin = "round";
		board.moveTo(last.x,last.y);
		board.lineTo(xy.x,xy.y);
		board.closePath();
		board.stroke();
		}
		 last = xy;
		}
		 function endDraw(event){
		 mousePress = false;
		 event.preventDefault();
		 last = null;
		}
		  /*测试用的*/
		 function log(msg){									
		 console.log(msg+'n');
		 console.log(board.lineWidth);
		 $("#positionX").text(msg);
		 
		}

		 function isTouch(event){
		 var type = event.type;
		if(type.indexOf('touch')>=0){
		 return true;
		}else{
		 return false;
		}
		}	 
		var mousePress = false;
		var last = null;
		function InitThis() {
		     canvas = document.getElementById('myCanvas');
			 board = canvas.getContext('2d');
			 board.strokeStyle="black";
			 console.log(board.lineWidth);

			var myCanvasWidth=$('#myCanvas').parent().eq(0).width();
			var myCanvasHeigt=document.documentElement.clientHeight-$("#sketchModal").find(".modal-header").eq(0).height();
			
			console.log( $("#sketchModal").find(".modal-header").eq(0).height());
			console.log($("#sketchModal").find(".modal-footer").eq(0).height());
		    document.getElementById('myCanvas').width= myCanvasWidth;
			document.getElementById('myCanvas').height=myCanvasWidth ;
			//console.log("02")
			canvas.onmousedown = beginDraw;
			//console.log("03")
			canvas.onmousemove = drawing;
			canvas.onmouseup = endDraw;
			//console.log("setHTML文件")
			canvas.addEventListener('touchstart',beginDraw,false);
			canvas.addEventListener('touchmove',drawing,false);
			canvas.addEventListener('touchend',endDraw,false);
			} 
	    InitThis();				
    })
	<!--手绘其他按钮-->
	function saveArea(){
	    /*关闭画板*/
		$('#sketchModal').modal('hide');
		
		//base64
		 var dataUrl = canvas.toDataURL("image/png");
		$("#showImg").attr("src",dataUrl);
		 console.log(dataUrl);
		}

		function clearArea() {
			// Use the identity matrix while clearing the canvas
			board.setTransform(1, 0, 0, 1, 0, 0);
			board.clearRect(0, 0, board.canvas.width, board.canvas.height);
		}  
		function eraserArea() {
			// Use the identity matrix while clearing the canvas
			board.strokeStyle='white';
		}        
		function setPenArea() {
			// Use the identity matrix while clearing the canvas
			board.strokeStyle='black';
		}  
     <!--显示图片-->
     $("#inputImg").change(function(e){
	 //console.log($("#inputImg").val());
	var simpleFile =  document.getElementById("inputImg").files[0];
	console.log(simpleFile);
    if(!/image\/\w+/.test(simpleFile.type)) {
      alert("请确保文件类型为图像类型");
      return false;
    }
    var reader = new FileReader();
    // 将文件以Data URL形式进行读入页面
    reader.readAsDataURL(simpleFile);
    reader.onload = function(e){
      //console.log(this.result);
	   $("#showImg").css('display','block');
	   $("#showImg").attr("src",this.result);
    }
      });	 
	  
       if(typeof FileReader == 'undefined') {
        //result.innerHTML = "抱歉，你的浏览器不支持FileReader";
		console("抱歉，你的浏览器不支持FileReader")
    }
/*---------------登录.注销-------------------*/

 function CheckLogin( poneNum,  password){
	regPoneNum = /^1[3|4|5|8]\d{9}$/;
	regpassword = /^[a-zA-Z0-9]{6,10}$/;
    if((regPoneNum.test(poneNum))&&(regpassword.test(password)))
	{
	return true;
	}
	else{
	$("#errInfo").text("信息输入有误,请重新输入");
	return false;
	}
	}
	
$("#loginBtn").click(function(){
    $('#loginModal').modal('hide');
    /*点击禁用*/
	//$("#test").addClass("disabled");
	var poneNum=$("#inputPoneNum").val();
	var password=$("#inputPassword").val();
	/*前端验证,不通过就return了*/
	if(!CheckLogin(poneNum, password))
	{ console.log("2"+poneNum);
	//$("#test").removeClass("disabled");
	   return ;
	 }
	/*Ajax异步传输*/
	  htmlobj=$.ajax({url:"/CVHammer/DoLogin",
	  type: 'POST',
	  data: {PoneNum:poneNum,Password:password},
	  success: function (data) { 
	  /*如果传的是真值*/
	    if(data == "true")
		{
		   console.log("login Change");
		  $("#userBtn").css('display','block');
		  $("#userBtn a").text(poneNum);
		  $("#navlogoffBtn").css('display','block');
		  
		  $("#navloginBtn").css('display','none');
		  $("#registerBtn").css('display','none');
		  
		 
		  $('#loginModal').modal('hide');
		 
		  }
	     else if(data == "false"){
		$("#errInfo").text("用户不存在或密码错误");
	  }else if(data == "error") { 
   	  $('#loginModal').modal('hide');
	     alert("CVHammer受伤了,在修理中,先逛会儿吧");
	  }
	  console.log("请求结束");
	  
  }
  });
   $("#test").removeClass("disabled");
  });
  
  /*AJAX注销*/
 $("#logoffBtn").click( function (){
		  console.log("进入logoff");
			/*Ajax异步传输*/
			  htmlobj=$.ajax({url:"/CVHammer/DoLogoff",
			  type: 'POST',
			  success: function (data) { 
			  /*如果传的是真值*/
			  console.log("进入logoff-2");
			  $("#userBtn").css('display','none');
			  $("#userBtn a").text("");
			  $("#navlogoffBtn").css('display','none');
			  $("#navloginBtn").css('display','block');
			  $("#registerBtn").css('display','block');
			  }
			  });
			});
	</script>
  </body>
</html>
