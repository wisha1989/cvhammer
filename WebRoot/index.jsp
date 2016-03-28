<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CVHammer</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	 <!-- Loading Flat UI -->
    <link href="css/flat-ui.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
	<style>
	 body {
            padding-top: 50px;
            color: #5a5a5a;
        }
	footer{
	background-color:#eee;
	padding-top:20px;
	}

        /* 轮播广告 */

        .carousel {
            height: 300px;
            margin-bottom: 60px;
        }

        .carousel .item {
            height: 300px;
            background-color: #000;
        }

        .carousel .item img {
            width: 100%;
        }

        .carousel-caption {
            z-index: 10;
        }

        .carousel-caption p {
            margin-bottom: 20px;
            font-size: 20px;
            line-height: 1.8;
        }
		.e_item p{
		color:black;
		}
		/* 响应式布局 */
		@media (max-width: 768px) {
		    .carousel {
                height: 200px;
                margin-bottom: 30px;
            }

            .carousel .item {
                height: 200px;
            }

            .carousel img {
                min-height: 200px;
            }

            .carousel-caption p {
                font-size: 16px;
                line-height: 1.4;
            }
         h2{
          font-size: 25px;
         }
          h3{
          font-size: 25px;
         }

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
      <button type="button" class="navbar-toggle collapsed " data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.jsp">CVHammer</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav ">
        <li class="active"><a href="#">主页 <span class="sr-only">(current)</span></a></li>
		<li ><a href="expSub/userLab.jsp">个人实验站</a></li>
		 <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">实验集合 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="expSub/eCanny.jsp">Canny</a></li>
            <li><a href="expSub/eSketchRecognition.jsp">SketchRecognition</a></li>
            <li><a href="expSub/eSketchRetrieve.jsp">SketchRetrieve</a></li>
            <li><a href="expSub/eBilateralFilter.jsp">BilateralFilter</a></li>
          </ul>
        </li>
        <li><a href="#" data-toggle="modal"  data-target="#aboutModal">联系我们</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right"id="userNav">
	  <li id="userBtn" style="display:none" ><a  href='#'>"</a></li> <li  style="display:none" id="navlogoffBtn"><a id="logoffBtn" class='glyphicon glyphicon-off'></a></li>
	  <li id="navloginBtn"><a  href='#' data-toggle='modal'  data-target='#loginModal' >登录</a></li> <li id="registerBtn"><a href="userDo/register.html">注册</a>
	  </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<!--导航条结束-->
<!-- 广告轮播 -->
<div id="ad-carousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
        <li data-target="#ad-carousel" data-slide-to="1"></li>
        <li data-target="#ad-carousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="image/bg1.jpg" alt="1 slide">

            <div class="container">
                <div class="carousel-caption">
                   <h2>CVHammer</h2>

                    <p><计算机视觉研究网站></p>
                    <p><a class="btn btn-lg btn-primary" href="userDo/register.html" target="_blank"
                          role="button">注册吧</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="image/bg2.png" alt="2 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h2>Sketch Retrieve</h2>
                    <p><基于深度学习的草图检索系统></p>
                    <p><a class="btn btn-lg btn-primary" href="expSub/eSketchRecognition.jsp" target="_blank"
                          role="button">了解更多</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img src="image/bg3.jpg" alt="3 slide">

            <div class="container">
                <div class="carousel-caption">
                    <h3>加入我们</h3>

                    <p><诚挚邀请有共同志向的你></p>

                    <p><a class="btn btn-lg btn-primary" href="#" data-toggle="modal"  data-target="#aboutModal">联系我们</a></p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#ad-carousel" data-slide="prev"><span
            class="glyphicon glyphicon-chevron-left"></span></a>
    <a class="right carousel-control" href="#ad-carousel" data-slide="next"><span
            class="glyphicon glyphicon-chevron-right"></span></a>
</div>
<!--轮播组件结束-->
<!--主要部分-->
<div class=" container">
   <a href="expSub/eCanny.jsp">
	<div class="e_item">
	   <div class="pull-right">
          <img class="media-object"  alt="图片君尚未P图" style="width: 100px; height: 100px;" >
      </div>
		<h4 class="e_heading">Canny</h4>
		 <p>Canny边缘检测算子是John F. Canny于 1986 年开发出来的一个多级边缘检测算法。 截止2014年8月, Canny发表的该篇论文，已被引用19000余次。</p> 
	 </div>
	</a>
	 <hr/>
	 
	 <a href="expSub/eSketchRecognition.jsp">
	 <div class="e_item">
	   <div class="pull-right">
          <img class="media-object"  alt="图片君尚未P图" style="width: 100px; height: 100px;" >
      </div>
		 <h4 class="e_heading">草图识别</h4>
		 <p>利用CNN神经网络对250个类的草图数据进行训练，得出识别模型，在线版你画电脑猜</p> 
	 </div>
	 </a>
	 <hr/>
	 
	 <a href="expSub/eSketchRetrieve.jsp">
	 <div class="e_item">
	   <div class="pull-right">
          <img class="media-object"  alt="图片君尚未P图" style="width: 100px; height: 100px;" >
        </div>
		 <h4 class="e_heading">草图检索</h4>
		 <p>基于深度学习卷积神经网络的草图检索系统</p> 
	 </div>
	 </a>
	 <hr/>
	 <a href="expSub/eBilateralFilter.jsp">
	 <div class="e_item">
	   <div class="pull-right">
          <img class="media-object"  alt="图片君尚未P图" style="width: 100px; height: 100px;" >
        </div>
		 <h4 class="e_heading">双边滤波器</h4>
		 <p>双边滤波器-磨皮好帮手</p> 
	 </div>
	 </a>
</div>
	
	
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
	
<!--联系登录弹出框-->
	  <div class="modal fade" id="loginModal">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<h4 class="modal-title"><img src="image/CVHammer_Login.png"/></h4>
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
			<a class="btn btn-sm btn-info btn-block " id="test" href="userDo/register.html" >立即注册</a>
	    
		  </div>
		</div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!--联系我们弹出框-->
  <!--弹出框结束-->
  <!--底部设计结束-->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
	if(location.hash=='#Login')
	{
	$('#loginModal').modal('show');
	}
	<%if((String)session.getAttribute("ISLOGIN")=="true"){
	  out.println("$('#userBtn').css('display','block');$('#navlogoffBtn').css('display','block');$('#navloginBtn').css('display','none');$('#registerBtn').css('display','none');");
	  out.println("$('#userBtn a').text("+(String)session.getAttribute("UserPN")+");");
	}%>
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
	  htmlobj=$.ajax({url:"DoLogin",
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
		 
		  }
	     else if(data == "false"){
		$("#errInfo").text("用户不存在或密码错误");
	  }else if(data == "error") { 
   	  $( '#loginModal').modal('hide');
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
			  htmlobj=$.ajax({url:"DoLogoff",
			  type: 'POST',
			  success: function (data) { 
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
