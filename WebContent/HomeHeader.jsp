<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String imgname = null;
	String url = null;
	if (session.getAttribute("id") == null) {
		imgname = "로그인버튼";
		url = "Login.jsp";
	} else {
		imgname = "로그아웃로고";
		url = "LogOutServlet";
	}
	
	String imgname1 = null;
	String url1 = null;
	if (session.getAttribute("id") == null) {
		imgname1 = "회원가입버튼";
		url1 = "Join2.jsp";
	} else {
		imgname1 = "마이페이지로고";
		url1 = "MyPage.jsp";
	}
%>

<html>
<head>

<meta charset="UTF-8">

</head>
<body>
	<div id="header">
		<div id="topbtn">
			<%
				if(session.getAttribute("id") == null) {
			%>
			<button type="submit" class="btn btn-default btn-sm" id="loginBtn">
				<img src="Images/로그인버튼.png" width="60" height="40">
			</button>
			<%
				} else {
			%>
			<button type="submit" class="btn btn-default btn-sm" id="logoutBtn">
				<img src="Images/로그아웃로고.png" width="60" height="40">
			</button>
			<%
				}
			%>
			<button type="submit" class="btn btn-default btn-sm">
				<img src="Images/<%=imgname1%>.png" width="60" height="40"
					onclick="location.href='<%=url1%>'">
			</button>
			<button type="submit" class="btn btn-default btn-sm" id="msgBtn">
				<img src="Images/댕댕쪽지.png" width="60" height="40">
			</button>
		</div>
		<h1 id="logoall">
			<button type="submit" class="btn btn-default btn-sm">
				<img src="Images/강아지로고2.gif" style="width: 400px; height: 100px;"
					onclick="location.href='Home.jsp'" />
			</button>
		</h1>
		<div id="categorybtn">
			<div id="btn_query" style="float: left">
				<button class="btn btn-default btn-sm">
					<img src="Images/홈버튼.png" style="width: 130px; height: 105px;"
						onclick="location.href='Home.jsp'">
				</button>
				&nbsp; &nbsp;
			</div>
			<div id="btn_query" style="float: left">
				<button class="btn btn-default btn-sm">
					<img src="Images/댕댕사전버튼.png" style="width: 130px; height: 105px;"
						onclick="location.href='DaengController?command=DictionaryAction'">
				</button>
				&nbsp; &nbsp;
			</div>
			<div id="btn_query" style="float: left">
				<button class="btn btn-default btn-sm">
					<img src="Images/커뮤니티버튼.png" style="width: 130px; height: 105px;"
						onclick="location.href='DaengController?command=CommunityAction'">
				</button>
				&nbsp; &nbsp;
			</div>
			<div id="btn_query" style="float: left">
				<button class="btn btn-default btn-sm">
					<img src="Images/자랑방버튼.png" style="width: 130px; height: 105px;"
						onclick="location.href='DaengController?command=BoardPicAction'">
				</button>
				&nbsp; &nbsp;
			</div>
			<div id="btn_query" style="float: left">
				<button class="btn btn-default btn-sm">
					<img src="Images/병원버튼.png" style="width: 130px; height: 105px;"
						onclick="location.href='Hospital.jsp'">
				</button>
				&nbsp; &nbsp;
			</div>
			<div id="btn_query" style="float: left">
				<button class="btn btn-default btn-sm">
					<img src="Images/유기견버튼.png" style="width: 130px; height: 105px;"
						onclick="location.href='Abandoned.jsp'">
				</button>
			</div>
		</div>
	</div>
<script>
	$(function(){
		$("#msgBtn").click(function() {
			$.ajax({
				type: "post",
				url: "SessionCheck",
				dataType: "text",
				success: function(data){
					if(data == 1) {
						location.href="DaengController?command=MsgReceiveAction&mtype=Receive";
					} else {
						alert("로그인 후 이용가능합니다.");
						location.href="Login.jsp?type=DaengController?command=MsgReceiveAction&mtype=Receive";
					}
				}
			})
		});
		$("#logoutBtn").click(function(){
			var url = window.location.href;		// 현재 페이지
			console.log(url);
			$.ajax({
				type: "get",
				url: "LogOutServlet",
				success: function() {
					location.href=url;
				},
				error: function() {}
			})
		});
		$("#loginBtn").click(function() {
			var url2 = window.location.pathname;
			var parameter = window.location.search;
			location.href="Login.jsp?url="+url2+parameter;
		});
	});
</script>
</body>
</html>