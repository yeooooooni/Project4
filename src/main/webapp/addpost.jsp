<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.example.project4_final.BoardDAO"%>
<%@ page import ="com.example.project4_final.*, java.io.File" %>
<%@ page import ="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<% request.setCharacterEncoding("utf-8"); %>

<%--<jsp:useBean id="u" class="com.example.project4_final.BoardVO" />--%>
<%--<jsp:setProperty property="*" name="u"/>--%>

<%
//	String filename = "";
//	int sizeLimit = 15 * 1024 * 1024;
//
//	String realPath = request.getServletContext().getRealPath("upload");
//	File dir = new File(realPath);
//	if (!dir.exists()) dir.mkdirs();
//
//	MultipartRequest multpartRequest = null;
//	multpartRequest = new MultipartRequest(request, realPath,
//			sizeLimit, "utf-8",new DefaultFileRenamePolicy());
//	filename = multpartRequest.getFilesystemName("img");
//	u.setImg("filename");

	request.setCharacterEncoding("utf-8");

	BoardDAO boardDAO = new BoardDAO();
	FileUpload upload = new FileUpload();
	BoardVO u = upload.uploadPhoto(request);

	int i = boardDAO.insertBoard(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 추가 ";
%>

<script>
	alert('<%=msg%>');
	location.href='posts.jsp';
</script>