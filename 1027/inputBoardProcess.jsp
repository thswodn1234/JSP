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
	<!-- 1.파라미터 읽기 (title, content, id)-->
	<%
	//utf-8
	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("num");
	String title = request.getParameter("title");
	String content= request.getParameter("content");
	String id = request.getParameter("id");
	
	System.out.println(title+ "," + content+ "," + id);
// 2.데이터베이스 연결 및 기타 

// 드라이버 로드
// 	Mysql Class.forName("com.mysql.cj.jdbc.Driver");
Class.forName("org.h2.Driver");

// 데이터베이스 connection
// 	String dburl = "jdbc:mysql://localhost:3306/musthave";
// 	String dbid = "musthave";
// 	String dbpw = "tiger";

	String dburl = "jdbc:h2:~/test";
	String dbid = "sa";
	String dbpw = "";
	 Connection con = DriverManager.getConnection(dburl, dbid, dbpw);
// PreparedStatement
	PreparedStatement psmt = con.prepareStatement("insert into board(num,title,content,id) values(?,?,?,?)");
	psmt.setInt(1,Integer.parseInt(num));
	psmt.setString(2,title);
	psmt.setString(3,content);
	psmt.setString(4,id);
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
	<a href="BoardInputForm.jsp">입력창으로돌아가기</a>
	<!-- 3. 데이터베이스 입력 -->

	<!-- 4. 완료 메시지 출력 -->


</body>
</html>