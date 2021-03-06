<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
<script src="js/jquery/2.0.0/jquery.min.js" charset="utf-8"></script>
<script src="css/layui/layui.js"></script>
<link rel="stylesheet" href="css/layui/css/layui.css">
</head>
	<style type="text/css">
		body{
			background: #f2f2f2;
		}
		#big_div{
			width:1900px
		}
		
		/* 顶部导航栏开始 */
		#div_nav_top{
			width:100%;
			height:63px;					
		}
		#div_nav_item{
			display: inline;
			margin-left: 5px;
		}
		
		/* 顶部导航栏结束 */
		
		/* 图片轮播开始 */
		#div_food_img{
			width:1200px;
			height:680px;
			border:solid ;
			border-width: 1px;
			border-color:#CCCCCC;
			margin:0 auto;
			margin-top: 20px;
			text-align: center;			
		}
		
		.carouselImg{
			width: 100%;
			height: 100%;
		}
		/* 图片轮播结束 */
		
		/* 分类跳转开始 */
		#div_category{
			width: 1210px;
			height: 40px;
			
			margin:0 auto;
			margin-top: 10px;
			
			border:solid ;
			border-width: 1px;
			border-color:#D3D4D3;
			
		}
		#div_category_box{
			
		}
		.div_category_item{
			float: left;
			width: 240px;
			height: 40px;
					
			
			border:solid ;
			border-width: 1px;
			border-color:#D3D4D3;
		}
		/* 分类跳转结束 */
		
		/* 分类推荐开始 */
		#div_content{
			/* height:500px; */
			max-width: 1200px;
			
			margin:0 auto ;
			margin-top: 10px;
			padding: 30px 10px 30px 10px; /* 上右下左 */
			
			
			/* border:solid ;
			border-width: 1px;
			border-color:#CCCCCC; */
			
			
			background: #eeeeee;
		}
		
		div.eachCategoryFood {
			margin: 0px 0px 40px 0px;
		}
		
		div.left-mark{
			display: inline-block;
			height: 22px;
			vertical-align: top;
			width: 5px;
			background-color: #19C8A9;
			margin-left:10px;
		}
		/* 食物分类名称字体 */
		span.categoryName {
			font-size: 16px;
			margin-left: 10px;
			color: #646464;
			font-weight: bold;
		}
		div.foodItem_box{
			margin-top:10px;
			margin-left:30px;
		}
		div.foodItem{		
			display:inline-block;
			margin-left:20px;
			
			width:200px;
			
			
		}
		a:hover{
			/* background-color:#e2e2e2; */
			opacity: 0.7;
			filter: alpha(opacity = 70);
			
		}
		/* 食物名称字体 */
		div.foodName{
			margin-top:12px;
			margin-left:2px;
			font-size: 17px;
			font-weight: bold;
		}
		div.description{
			color:#2F4056;
			margin-top:5px;
			margin-left:2px;
		}
		div.foodPrice{
			font-size: 20px;
			margin-top:20px;
			font-weight: bold;
			color: #FF5722;
			
			display:inline-block;
		}
		/* 选择数量 */
		
		
		
	</style>
	
	<script type="text/javascript">
		layui.use(['carousel'], function(){
		  var carousel = layui.carousel;
		  //建造实例
		  carousel.render({
		    elem: '#test1'
		    ,width: '100%'
		    ,height:'100%'//设置容器宽度
		    ,arrow: 'always' //始终显示箭头
		    //,anim: 'updown' //切换动画方式
		  });
		});
		$(function(){
			
			layui.use(["element","layer"], function(){
  			var element = layui.element,
  				layer = layui.layer; 
			});
        	//layer.alert("最多只能购买100件!");

			/*$("div_nav_item")
			$("nav_top .layui-nav-item").click(function(){
				$(this).siblings("li").removeClass("layui-this");  
        		$(this).addClass("layui-this"); 
//			$(".layui-nav-item layui-this").attr("class","layui-nav-item");
//			$(this).attr("class","layui-nav-item layui-this");
			});*/
			
			
		});	
		function logoutConfirm(){
			layer.confirm('确认要退出登录？', function(index){
				$.ajax({
					type:"post",					
					url:"http://127.0.0.1:8080/logout",
					success:function(msg){						
						if(msg=="success"){
							window.location.href="login";
						}else{
							layer.alert("退出登录失败！");
						}						
					}
				})
				layer.close(index);
			});
		}
	</script>
<body>
	<div id="big_div">
		<div id="div_nav_top">
			<ul class="layui-nav" id="item" lay-filter=""style="">
				
				<a href="home"><img src="img/logo.png" style="margin-left:320px;width: 200px;height: 100%;"/></a>
				<div id="div_nav_item">
					<li class="layui-nav-item layui-this"><a href="/home" style="font-size: 20px;">首页</a></li>
					<li class="layui-nav-item"><a href="/search" style="font-size: 20px;">搜索</a></li>
	  				<li class="layui-nav-item"><a href="/shoppingCart" style="font-size: 20px;">购物车<c:if test="false"><span class="layui-badge">0</span></c:if></a></li>
				  	<li class="layui-nav-item"><a href="/order" style="font-size: 20px;">我的订单</a></li>
				  	<!-- <li class="layui-nav-item"><a href="#" style="font-size: 20px;">个人中心</a></li> -->
				  	
				</div>
					
				<c:choose>
					<c:when test="${user!=null }">
						<div id="div_nav_item" style="float:right;margin-right:240px;">
							<li class="layui-nav-item"  lay-unselect="">
						    <a href="javascript:;"><img src="img/user/${user.id}.jpg" onerror="this.src='img/user/0.jpg'" class="layui-nav-img">${user.username}</a>
						    <dl class="layui-nav-child">
						      <dd><a href="userInfo">修改信息</a></dd>
						      <dd><a href="javascript:logoutConfirm();">退出登录</a></dd>
						    </dl>
						  	</li>
						</div>
					</c:when>
					<c:otherwise>
						<div id="div_nav_item" style="float:right;margin-right:240px;">
							<li class="layui-nav-item"  lay-unselect="">
						    <a href="javascript:;"><img src="img/food/noimg.jpg" class="layui-nav-img">到此一游</a>
						    <dl class="layui-nav-child">						      
						      <dd><a href="login">登录</a></dd>
						    </dl>
						  	</li>
						</div>
					</c:otherwise>		
				</c:choose>				
				
  				
			</ul>				
		</div>
		
		<div id="div_food_img">
			<div class="layui-carousel" id="test1">
  				<div carousel-item>
				    <div><img class="carouselImg" src="img/carousel1.jpg"/></div>
				    <div><img class="carouselImg" src="img/carousel2.jpg"/></div>
				    <div><img class="carouselImg" src="img/carousel3.jpg"/></div>
				    <div><img class="carouselImg" src="img/carousel4.jpg"/></div>
				    <div><img class="carouselImg" src="img/carousel5.jpg"/></div>
  				</div>
			</div>
		</div>
		
		<div id="div_category">
			<div id="div_category_box">
				<c:forEach items="${cs}" var="c">
					<div class="div_category_item">
						<a href="CategoryPage?cid=${c.id}" class="layui-btn layui-bg-cyan" style="width: 100%;">${c.name}</a>
					</div>		
				</c:forEach>
				<!-- <div class="div_category_item">
					<button class="layui-btn layui-bg-cyan" style="width: 100%;">快餐便当</button>
				</div>
				<div class="div_category_item">
					<button class="layui-btn layui-bg-cyan" style="width: 100%;">暖胃粉面</button>
				</div>
				<div class="div_category_item">
					<button class="layui-btn layui-bg-cyan" style="width: 100%;">汉堡薯条</button>
				</div>
				<div class="div_category_item">
					<button class="layui-btn layui-bg-cyan" style="width: 100%;">甜品饮品</button>
				</div>
				<div class="div_category_item">
					<button class="layui-btn layui-bg-cyan" style="width: 100%;">生鲜果蔬</button>
				</div> -->
			</div>
		</div>
		<div id="div_content" style="">
			
			<c:forEach items="${cs}" var="c"> <!-- varStatus="stc" -->
					<!-- 循环分类 -->
					<div class="eachCategoryFood">
						<div class="left-mark"></div>
						<span class="categoryName">${c.name}</span>
						<br>
						
						<div class="foodItem_box">
							<c:forEach items="${c.foods}" var="f" varStatus="st">
								<!-- 每个分类循环五个食物 -->
								<c:if test="${st.count<=5}">
									<!-- 单个食物项 -->
									<div class="foodItem" >
										<a href="forefood?id=${f.id}"><img width="200px" src="img/food/${f.img}.jpg" onerror="this.src='img/food/noimg.jpg'"></a>
										<%-- <img class="foodImg" width="200px" src="img/food/${f.img}.jpg">	 --%>									
										<div class="foodName">${f.name}</div>
										<div class="description">${f.description}</div>
										<div class="foodPrice">¥${f.price}</div>
																																										
									</div>
									
								</c:if>				
							</c:forEach>
						</div>
						
						
						<div style="clear:both"></div>
					</div>
					
			</c:forEach>
		</div>
	</div>						
</body>
</html>