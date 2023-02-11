<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
  </head>

  <body>
    <div class="container mt-3">
      <div>Main ! JSP</div>
      <div>toy_springboots mango main</div>
      <div>
        <a href="/main">
          /toy_springboots mango Controller form() /admin/a_main.jsp
        </a>
      </div>

      <hr />

      <div>Spring Security Area</div>
      <sec:authentication property="principal" var="userDetailsBean"/>
      <div>userDetails : ${userDetailsBean}</div>

      <%-- 로그인 필요 상태 --%>
      <sec:authorize access="isAnonymous()">
        <div>Message : Please sign in</div>
        <div>
          <a href="/loginForm">Login Form</a>
        </div>
        <div>
          <a href="/joinForm">Join Form</a>
        </div>
      </sec:authorize>

      <%-- 로그인 완료 상태 --%>
      <sec:authorize access="isAuthenticated()">
        <div>Message : Welcome !</div>
        <div>
          ID : ${userDetailsBean.username}, Name : ${userDetailsBean.memberName}, Role : ${userDetailsBean.role}
        </div>
        <div>
          <a href="/logoutForm">Logout Form</a>
        </div>
      </sec:authorize>
    </div>
  </body>
</html>
