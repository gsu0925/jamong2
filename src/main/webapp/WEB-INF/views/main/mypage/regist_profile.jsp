<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../incs/top_mypage.jsp"%>
<style type="text/css">
	.col-md-3{
		width: 290px;
    	margin-right: -40px;
	}
	
	.col-md-9{
		margin-left: 42px;
		margin-top: 5px;
	}
	
	.mb30 {
		margin-top: 12px;
	    width: 250px;
	    height: 1000px;
	}

	.col-md-5 {
		margin-top: 9px;
	    width: 665px;
	    height: 1000px;
	}
	.form-group {
		margin-bottom: 35px;
	}
	
	.contact-details li{
   		margin-bottom: 42px;
   	 	border-bottom: none;
	}
	
	button{
		margin-left: 70px;
	}
	
	.service-list .col-md-4 {
	    width: 241px;
	}
	
	li div{
		margin-left:16px;
		width: 100%;
	}
	
	iframe{
		margin-left: 80px;
	}
</style>
<!-- 아래부터 mypage 각자 코딩내용 작성 -->
<c:import url="/mypage/sideMypage.do"/>
<div class="row service-list text-center">
	<%@include file="../incs/registexpert.jsp"%>
					<div class="col-md-5">
				<iframe src="<c:url value='/mypage/profile.do?userNo=${sessionScope.userNo }'/>" id="the_iframe" name="WrittenPublic" frameborder="0" scrolling="no" style="overflow-x:hidden; overflow:auto; width:100%; height: 100%;"></iframe>
				</div>
					<!--아래는 mypage 공통 사용 코드  -->
			</div>
<!-- end col -->
		</div>
<!-- end row -->
	</div>
<!-- end container -->
</section>
<!-- end section -->

<%@include file="../incs/bottom_main.jsp"%>
<!-- 화면별 고유 하단js 포함할 위치 -->
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/js/parallax.js'/>"></script>
<script src="<c:url value='/resources/js/animate.js'/>"></script>
<script src="<c:url value='/resources/js/custom.js'/>"></script>

</body>
</html>