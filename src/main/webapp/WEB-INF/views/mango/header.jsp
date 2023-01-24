<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<header class="mb-5 fs-5">
  <nav class="navbar fixed-top navbar-expand-sm bg-light p-3">
    <div class="container-fluid">
      <a href="/main" class="navbar-brand">
        <img src="/resources/img/logo.png" width="100" alt="" />
      </a>
      <a href="#collapseId" class="navbar-toggler" data-bs-toggle="collapse"
        ><span class="navbar-toggler-icon"></span
      ></a>
      <div
        class="collapse navbar-collapse d-flex-md justify-content-between"
        id="collapseId"
      >
        <div class="navbar-nav">
          <a href="/main" class="nav-item nav-link">Home</a>
          <a href="/survey/surveyStart" class="nav-item nav-link">설문</a>
          <div class="dropdown"> 
            <a
              href=""
              class="nav-link dropdown-toggle"
              data-bs-toggle="dropdown"
              aria-expanded="false"
              >통계</a
            >
            <ul class="dropdown-menu mb-3">
              <a href="/result/statistics1Servlets" class="dropdown-item text-secondary"
                >설문자별 답변 결과</a
              >
              <a href="/result/statistics2Servlets" class="dropdown-item text-secondary"
                >질문별 총 답변수</a
              >
            </ul>
          </div>
        </div>
        <div class="d-flex justify-content-center">
          <%-- <c:choose>
            <c:when test="${resultMap == null}">
              <a href="/admin/login" class="btn btn-secondary me-2">로그인</a>
              <a href="/admin/signUp_form" class="btn btn-success opacity-75">회원가입</a>
            </c:when>
            <c:when test='${resultMap.PASSWORD eq "1229"}'> --%>
              <a href="/admin/adminUserList" class="btn btn-secondary me-2">회원관리</a>
              <a href="/admin/signUp_form" class="btn btn-success opacity-75">회원가입</a>
              <%-- <a href="/admin/login" class="btn btn-secondary me-2">로그인</a>
              <a href="/admin/main" class="btn btn-success opacity-75">로그아웃</a> --%>
            <%-- </c:when>
            <c:otherwise >
              <a href="/admin/main" class="btn btn-secondary me-2">로그아웃</a>
            </c:otherwise>
          </c:choose> --%>
        </div>
      </div>
    </div>
  </nav>
</header>
