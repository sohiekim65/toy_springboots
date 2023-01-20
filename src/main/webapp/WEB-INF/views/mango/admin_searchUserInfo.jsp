<%-- <%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ page import="java.util.HashMap, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
      crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/resources/css/font.css" />
  </head>
  <body class="bg-light">
    <div class="container pb-5">
      <%@ include file="header.jsp" %>

      <main class="mt-5 p-1">
          <div class="mt-5">
            <div class="fs-3 text-center text-success opacity-75 mb-3">회원관리 페이지</div>
            <table class="table text-center">
              <thead>
                <tr class="table-success opacity-75">
                  <th>아이디</th>
                  <th>이름</th>
                  <th>생년월일</th>
                  <th>전화번호</th>
                  <th>설문조사 결과 조회</th>
                  <th>회원수정</th>
                </tr>
              </thead>
              <tbody class="align-middle">
                  <% 
                      HashMap<String, Object> userWithUid = (HashMap<String, Object>) request.getAttribute("userWithUid");
                  %>
                 <form action="/admin/userManagementServlet" method="post">
                <tr>
                  <% String user_id = (String)userWithUid.get("USER_ID"); %>
                  <th><%= user_id %></th>
                  <th><%= userWithUid.get("NAME") %></th>
                  <th><%= userWithUid.get("BIRTH_DATE") %></th>
                  <th><%= userWithUid.get("PHONE") %></th>
                  <th>
                      <input type="submit" class="btn btn-outline-secondary opacity-75" value="보기"/>
                      <input type="hidden" name="user_id" value="<%= user_id %>"/>
                  </th>
                </form>
                  <th>
                      <a href="/admin/userManagementServlet?name=modify&user_id=<%= user_id %>" class="btn btn-outline-secondary opacity-75">수정</a>
                      <a href="/admin/userManagementServlet?name=delete&user_id=<%= user_id %>" class="btn btn-outline-danger" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false">삭제</a>
                  </th>
                </tr>
              </tbody>
            </table>
          </div>
      </main>
    </div>
    <hr />
    <%@ include file="footer.jsp" %>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous"
    ></script>
  </body>
</html> --%>
