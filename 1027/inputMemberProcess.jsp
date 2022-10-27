<%@ page import="java.sql.PreparedStatement"%>
<%@ page import=" java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 입력</title>
</head>
<body>
	<!-- 1.파라미터 읽기 (id, pass, name)-->
	<%
	String id= request.getParameter("id");
	String pass= request.getParameter("pass");
	String name = request.getParameter("name");
	
	System.out.println(id+ "," + pass+ "," + name);
// 2.데이터베이스 연결 및 기타 

// 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");

// 데이터베이스 connection
	String dburl = "jdbc:mysql://localhost:3306/musthave";
	String dbid = "musthave";
	String dbpw = "tiger";
	 Connection con = DriverManager.getConnection(dburl, dbid, dbpw);
// PreparedStatement
	PreparedStatement psmt = con.prepareStatement("insert into member(id,pass,name) values(?,?,?)");
	psmt.setString(1,id);
	psmt.setString(2,pass);
	psmt.setString(3,name);
// query 실행
// 3. 데이터베이스 입력
	int result = psmt.executeUpdate();
	psmt.close();
	con.close();
	
	if(result != 1){
		out.println("입력에 실패하였습니다.");
	} else {
		out.println("입력에 성공하였습니다.");
	}
%>
	<br>
	<br>
	<a href="MemberInputForm.jsp">입력창으로돌아가기</a>
	<!-- 3. 데이터베이스 입력 -->

	<!-- 4. 완료 메시지 출력 -->


</body>
</html>