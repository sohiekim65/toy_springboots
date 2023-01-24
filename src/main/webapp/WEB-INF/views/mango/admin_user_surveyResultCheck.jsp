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
            <c:choose>
              <c:when test="${empty resultMap}">
                <div class="fs-3 text-center text-success opacity-75 pt-5 mb-3">${msg}</div>
                <div class="text-center mt-3">
                <a href="/admin/adminUserList" class="btn btn-success btn-lg opacity-75"
                  >회원목록 페이지로</a
                >
                </div>
              </c:when>
              <c:otherwise>
                <div class="fs-3 text-center text-success opacity-75 mb-3">'${surveyor.NAME}'님의 설문결과입니다.</div>
                <table class="table text-center" style="width: 90%">
                  <thead>
                    <tr class="table-success opacity-75">
                      <th>설문문항</th>
                      <th>설문답변</th>
                    </tr>
                  </thead>
                  <tbody class="align-middle">
                    <c:forEach var="question" items="${questionList}" varStatus="status" >
                      <tr>                  
                          <th class="text-center"> 
                            <%-- 질문 출력 --%>
                            ${question.QUESTION_LIST} 
                          </th>
                          <th>
                            <%-- 답변 출력 --%>
                            ${resultMap[status.index].ANSWER_LIST}
                          </th>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </c:otherwise>
            </c:choose>
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
