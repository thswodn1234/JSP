<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="common1.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

%>


<html>
<head>
<title>JDBC</title>
</head>
<body>
	<h2>회원 추가 테스트(executeUpdate() 사용)</h2>

	

	<%
	// DB에 연결

	JDBConnect jdbc = new JDBConnect();

	// 쿼리문 생성

	String sql = "INSERT INTO board(title, content, id) VALUES (?, ?, ?)";
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);

	//     for(int i = 0; i < 100; i++){
	//     	int num = i + 1 ;
	// 		String title = String.valueOf((i+1) * 1000 + (i+1) * 100 + (i+1) *10 + i+1);
	//         String content= "테스트"+i+"회원";
	//         String id="";
	//         if(i % 2 == 1) {
	// 	         id = "musthave1";
	//   	    } else{
	//   	    	id = "musthave2";
	//   	    }
	//     }
	
// 	int num = 0;
// 	String snum = request.getParameter("num");
// 	num = Integer.parseInt(snum);
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String id = request.getParameter("id");

// 	psmt.setInt(1, num);
	psmt.setString(1, title);
	psmt.setString(2, content);
	psmt.setString(3, id);

	// 쿼리 수행
	int inResult = psmt.executeUpdate();
	out.println(inResult + "행이 입력되었습니다.");

	// 연결 닫기
	jdbc.close();
	%>
</body>
</html>
