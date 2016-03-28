<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@page import="java.util.List"%>  
<%@page import="java.util.List"%> 
<%@page import="dao.UExpItemDAO"%>  
<%@page import="entity.UExpItemEnt"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CVHammer</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
	 <!-- Loading Flat UI -->
    <link href="../css/flat-ui.min.css" rel="stylesheet">
    <!--[if lt IE 9]>
      <script src="../js/html5shiv.js"></script>
      <script src="../js/respond.min.js"></script>
    <![endif]-->
	<style>
	html {
	  position: relative;
	  min-height: 100%;
	}
	 body {
            padding-top: 70px;
            color: #5a5a5a;
        }
		
	.e_item_title
	{
	  padding:5px 10px;
	  background-color:#2C3E50;
	}
	
	summary{
	margin-bottom:10px;}
	
	footer {
	  position: absolute;
	  bottom: -40px;
	  width: 100%;
	  /* Set the fixed height of the footer here */
	  height: 40px;
	  background-color: #f5f5f5;
	  padding-top:10px;
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
		<li class="active"><a href="#">个人实验站 <span class="sr-only">(current)</span></a></li>
        <li><a href="#" data-toggle="modal"  data-target="#aboutModal">联系我们</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right"id="userNav">
	  <li id="userBtn"><a  href='#'><%=session.getAttribute("UserPN")%></a></li> <li  id="navlogoffBtn"><a id="logoffBtn" class='glyphicon glyphicon-off'></a></li>
	  </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<!--主要部分-->
<%
  String userPone = (String)session.getAttribute("UserPN");
  
   UExpItemDAO uexpitemdao =new UExpItemDAO();
    
   List<UExpItemEnt> uexpitemlist =uexpitemdao.getUExpItemByPoneNum(userPone);
   
   int lenlist =uexpitemlist.size();
    
   request.setAttribute("uexpitemlist", uexpitemlist);
   
    
%>
<div class="container">
 <c:forEach  items="${uexpitemlist}" var="item" varStatus="status">
      <br>
      
      <details open>
    <summary class="e_item_title bg-primary "> ${item.eName}算子</summary>
	 <dl class="dl-horizontal e_item_body">
	  <dt class="e_item_result_name">实验结果</dt>
	  <dd class="e_item_result_content">
	  <%--选择输出类型 --%>
	   <c:if test="${item.eRessType=='image'}">

       <img  alt="实验结果" style="height: auto; width: 180px; display: block;" src="${item.eRess}" class="img-thumbnail" data-holder-rendered="true">

        </c:if>
         <c:if test="${item.eRessType=='images'}">
         <div class="row">
 
          
      
  
          <c:forEach var="imgPathItem" items="${item.eResImgList}">
         <!--  <div class="col-xs-6 col-md-3">
          <a href="#" class="thumbnail"style="height: auto; width: 180px; display: block;">
            <img  alt="实验结果"  src="${imgPathItem}" >
           </a>
           </div>
          -->
              <div class="col-sm-6 col-md-4">
          <div class="thumbnail">
            <img data-src="holder.js/100%x200" alt="100%x200" style="height: 200px; width: 100%; display: block;" src="${imgPathItem}"  data-holder-rendered="true">
            <div class="caption">
            <c:set var="string2" value="${fn:split(imgPathItem, '/')}" />
            <h5>${string2[4]} </h5>
            </div>
          </div>
        </div>
          </c:forEach>
       </div>
        </c:if>
        
        <c:if test="${item.eRessType=='label'}">

         <p>${item.eRess}</p>

        </c:if>
	  
	  </dd>
	  <dt class="e_item_output_name">输入数据</dt>
	  <dd class="e_item_output_content">
	  <img  alt="输入数据" style="height: auto; width: 180px; display: block;" src="${item.eSrcs}" class="img-thumbnail"  data-holder-rendered="true">
	  </dd>
	  <c:if test="${item.eRessType=='image'}">
	  <dt class="e_item_params">实验参数</dt>
	  <dd>
				<p class="e_item_param_item">${item.eParams} </p>
	  </dd>
	   </c:if>
	</dl>
</details>
      
 	<hr/>
 </c:forEach>
</div>
 <!--/主要部分结束-->
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
	<!--/联系我们弹出框-->
	
  <!--弹出框结束-->
  <!--底部设计结束-->
    <script src="../js/jquery-1.11.1.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
/*注销登录*/
 $("#logoffBtn").click( function (){
		  console.log("进入logoff");
			/*Ajax异步传输*/
			  htmlobj=$.ajax({url:"../DoLogoff",
			  type: 'POST',
			  success: function (data) { 
			  /*如果传的是真值*/
			   location.href = "../index.jsp";
			  }
			  });
			});


 
   </script>
  </body>
</html>
