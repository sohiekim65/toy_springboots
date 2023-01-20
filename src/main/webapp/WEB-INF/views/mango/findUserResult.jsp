<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Find</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/resources/css/font.css" />
    <link
      href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet"
    />
  </head>
  <body class="bg-light">
    <% 
        HashMap<String, Object> findID = (HashMap<String, Object>)request.getAttribute("findID"); 
        HashMap<String, Object> findPassword = (HashMap<String, Object>)request.getAttribute("findPassword"); 
     %>
    <div class="container-fluid p-5">
      <%@ include file="header.jsp" %>
      <main class="mt-5 mb-5">
        <div class='text-center mt-5 pt-5'>
        <%
         if(findID != null){
        %>
            <div class="fs-1 text-success opacity-75 mb-1">아이디 찾기</div>
            <div class="fs-3 text-success opacity-75 mb-3">아이디 찾기가 완료되었습니다.</div>
            <div class="fs-5 text-success opacity-75 mb-3"><%= findID.get("NAME") %>님의 아이디는 '<%= findID.get("USER_ID") %>'입니다.</div>
        <% } else if(findPassword != null){ %>
            <div class="fs-1 text-success opacity-75 mb-1">비밀번호 찾기</div>
            <div class="fs-3 text-success opacity-75 mb-3">비밀번호 찾기가 완료되었습니다.</div>
            <div class="fs-5 text-success opacity-75 mb-3"><%= findPassword.get("NAME") %>님의 비밀번호는 '<%= findPassword.get("PASSWORD") %>'입니다.</div>
        <% } %>
        <div>
      </main>
      <hr />
      <%@ include file="footer.jsp" %>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html> --%>