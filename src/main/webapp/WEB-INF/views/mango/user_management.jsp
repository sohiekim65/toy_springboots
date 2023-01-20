<%@ page contentType="text/html;charset=UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
            <form action="/admin/userList">
              <div class="d-flex input-group w-50">
                <select class="form-select" name="keyField" id="">
                  <option value="NAME">이름</option>
                  <option value="BIRTH_DATE">생년월일</option>
                  <option value="PHONE">전화번호</option>
                </select>
                <input class="form-control w-50" type="text" name="keyWord" id="">
                <button type="submit" class="btn btn-success opacity-75">검색</button>
              </div>
            </form>
            <table class="table text-center mt-3">
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
                <c:forEach var="resultData" items="${resultMap}" varStatus="loop">
                  <tr>
                  <form action="/mango/surveyorSurveyResult" method="post">
                    <th>${resultData.USER_ID}</th>
                    <th>${resultData.NAME}</th>
                    <th>${resultData.BIRTH_DATE}</th>
                    <th>${resultData.PHONE}</th>
                    <th>
                        <input type="submit" class="btn btn-outline-secondary opacity-75" value="보기"/>
                        <input type="hidden" name="user_id" value='${resultData.USER_ID}'/>
                    </th>
                  </form>
                    <th>
                      <div class="d-flex justify-content-center">
                        <form action="/mango/modify" method="post">  
                          <input type="submit" class="btn btn-outline-secondary opacity-75" value="수정"/>
                          <input type="hidden" name="user_id" value='${resultData.USER_ID}'/>
                          <input type="hidden" name="user_name" value="${resultData.NAME}"/>
                          <input type="hidden" name="birth_date" value="${resultData.BIRTH_DATE}"/>
                          <input type="hidden" name="phone" value="${resultData.PHONE}"/>
                        </form>
                        <form class="ms-1" action="/mango/delete" method="post">
                            <input type="submit" class="btn btn-outline-danger" value="삭제" onclick="if(!confirm('정말로 삭제하시겠습니까?')) return false"/>
                            <input type="hidden" name="user_id" value='${resultData.USER_ID}'/>
                        </form>
                      </div>
                    </th>
                  </tr>
                </c:forEach>
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
</html>