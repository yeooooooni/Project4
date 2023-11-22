<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.project4_final.BoardDAO"%>
<%@ page import="com.example.project4_final.FileUpload" %>
<%@ page import="com.example.project4_final.BoardVO" %>

<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:useBean id="u" class="com.example.project4_final.BoardVO" />--%>
<%--<jsp:setProperty property="*" name="u"/>--%>

<%
	request.setCharacterEncoding("utf-8");

	BoardDAO boardDAO = new BoardDAO();
	FileUpload upload = new FileUpload();
	BoardVO u = upload.uploadPhoto(request);


	int i = boardDAO.updateBoard(u);
//	response.sendRedirect("posts.jsp");
	String msg = "데이터 수정 성공";
	if(i == 0) msg = "에러 데이터 수정 실패";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>