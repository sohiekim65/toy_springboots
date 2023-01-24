<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
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
      <% 
        String user_id = (String)request.getAttribute("user_id");
        String modify_name = (String)request.getAttribute("modify_name");
        String birth_date = (String)request.getAttribute("birth_date");
        String phone = (String)request.getAttribute("phone");
      %>
    <div class="container pb-5">
      <%@ include file="header.jsp" %>

      <main class="mt-5 p-1">
        <div class="mt-5">
            <div class="fs-3 text-center text-success opacity-75 mb-3">회원 정보 수정</div>
            <form action="/admin/modify_done" method="post">
                <table class="table text-center">
                    <thead>
                        <tr class="table-success opacity-75">
                            <th>아이디</th>
                            <th>이름</th>
                            <th>생년월일</th>
                            <th>전화번호</th>
                            <th>회원수정</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <tr>
                            <th><input type="text" class="form-control" name="user_id" value="${resultMap.USER_ID}"></th>
                            <th><input type="text" class="form-control" name="name" value="${resultMap.NAME}" placeholder="이름"></th>
                            <th><input type="text" class="form-control" name="birth_date" value="${resultMap.BIRTH_DATE}" placeholder="생년월일"></th>
                            <th><input type="text" class="form-control" name="phone" value="${resultMap.PHONE}" placeholder="전화번호"></th>
                            <th><input type="submit" class="btn btn-outline-secondary opacity-75" value="수정하기"></th>
                        </tr>
                    </tbody>
                </table>
            </form>
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
</html>
