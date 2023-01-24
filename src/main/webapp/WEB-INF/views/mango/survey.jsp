<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survey</title>
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
        <form action="/survey/surveyResult" method="post">
          <div class="row" style="margin-top: 8%">
          <%-- 설문버튼 --%>
            <div class="ms-2" style="width: 8rem">
                <a
                  href="#modalTarget02"
                  class="btn btn-success opacity-75 mb-2 text-middle p-3"
                  style="width: 6.5rem; height: 4rem"
                  data-bs-toggle="modal"
                  >설문 조사</a
                >
                <a href="/survey/surveyResultServletsTest"
                  class="btn btn-success opacity-75"
                  style="width: rem; height: 4rem"
                >
                  설문 결과 조회
                </a>
            </div>

            <%-- survey --%>
            <div class="col text-center ms-5">
              
              <table class="table text-center table-striped" style="width: 90%">
                <tbody>
              <%-- 질문 출력 --%>
              <c:forEach var="question" items="${questionList}" varStatus="loop">
                <tr>                  
                    <th class="text-center" colspan="5"> 
                        ${question.QUESTION_LIST}
                    </th>
                </tr>
                <tr>
                  <td>답</td>
                  <%-- 답변 출력 --%>
                  <c:forEach var="answer" items="${answerList}" varStatus="loop">
                    <td>
                      <input type="radio" class="form-check-input" name="${question.QUESTION_UID}" id="${question.QUESTION_UID}${answer.ANSWER_UID}" value="${answer.ANSWER_UID}" required="required"/>
                      <label for="${question.QUESTION_UID}${answer.ANSWER_UID}" class="form-check-label">
                        ${answer.ANSWER_LIST}
                      </label>
                    </td>
                  </c:forEach>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>

            <div class="ms-5 d-flex justify-content-center">
              <input type="submit" class="btn btn-success opacity-75" value="설문 제출" />
            </div>
          </div>
        </form>
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
