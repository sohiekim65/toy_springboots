<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
    String msg = (String)request.getAttribute("msg");
    String find_id = (String)request.getAttribute("find_id");
    String id = (String)request.getAttribute("id");
  %>
    <div class="container-fluid pb-5">
      <%@ include file="header.jsp" %>
      <main class="mt-5">
        <div class="row mt-5 p-5">
          <div class="col-12 col-md-6 text-center pt-5">
            <form action="/find/findUserInfoServlets" method="post">
              <div class="fs-2 text-success opacity-75 mb-4">아이디 찾기</div>
              <% if(msg != null){ %>
                <div class="text-success opacity-75 mb-2"> <%= msg %> </div>
              <% } %>
              <div>
                <input
                  type="text"
                  class="form-control opacity-75 mb-2"
                  name="find_id"
                  id="find_id"
                  placeholder="이름"
                  required
                />
              </div>
              <div class="mb-3">
                <div class="text-start text-secondary">휴대전화</div>
                <div class="row">
                  <div class="col mb-3">
                    <select name="phone0" class="form-select text-secondary opacity-75">
                      <option>선택</option>
                      <option value="010">010</option>
                      <option value="012">012</option>
                      <option value="013">013</option>
                    </select>
                  </div>
                  <div class="col">
                    <input
                      type="text"
                      name="phone1"
                      id="phone1"
                      class="form-control opacity-75"
                      required
                    />
                  </div>
                  <div class="col">
                    <input
                      type="text"
                      name="phone2"
                      id="phone2"
                      class="form-control opacity-75"
                      required
                    />
                  </div>
                </div>
                <div>
                  <button
                    class="form-control btn btn-success btn-lg opacity-75 mb-5"
                  >
                    아이디 찾기
                  </button>
                </div>
              </div>
            </form>
          </div>
          <div class="col-12 col-md-6 text-center pt-5">
            <form form action="/find/findUserInfoServlets" method="post">
              <div class="fs-2 text-success opacity-75 mb-4">비밀번호 찾기</div>
              <div>
                <input
                  type="text"
                  class="form-control opacity-75 mb-2"
                  name="id"
                  id="id"
                  placeholder="아이디"
                  required
                />
              </div>
              <div class="mb-3">
                <div class="row">
                  <div class="col">
                    <input
                      type="text"
                      class="form-control opacity-75 mb-4"
                      name="find_name"
                      id="find_name"
                      placeholder="이름"
                      required
                    />
                  </div>
                </div>
                <div class="pt-3">
                  <button
                    class="form-control btn btn-success btn-lg opacity-75"
                  >
                    비밀번호 찾기
                  </button>
                </div>
              </div>
            </form>
          </div>
        </div>
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
</html>
