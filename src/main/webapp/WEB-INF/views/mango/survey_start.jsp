<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Survey_start</title>
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
        <div class="text-center" style="margin-top: 8%">
          <div class="img-align">
            <img
              class="img"
              src="/resources/img/black-cat.png"
              alt="cat"
              width="100px%"
            />
          </div>
          <div class="opacity-75 mt-3 mb-2">
            더 나은 유기동물의 처우 개선을 위한
          </div>
          <div class="fs-2 text-success">반려동물 설문조사</div>
          </button>
          <div class="opacity-75 mt-2 mb-3">
            반려동물에 대한 여러분의 생각은 어떠신가요?
          </div>
           <div class=" d-flex justify-content-center">
            <a href="/survey/surveyServelts" class="btn btn-success opacity-75">설문 시작</a>
          </div>
         

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
