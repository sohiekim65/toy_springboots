<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>statistics_1</title>
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
  ArrayList<HashMap> userName_list = (ArrayList<HashMap>)request.getAttribute("userName_list"); 
  ArrayList<HashMap> statistics1_list = (ArrayList<HashMap>)request.getAttribute("statistics1_list");

  %>
    <div class="container pb-5">
      <%@ include file="header.jsp" %>

      <main class="mt-5 p-1">
        <div class="row" style="margin-top: 8%">
          <div class="ms-2 me-5" style="width: 8rem">
          <form action="/result/statistics1Servlets" method="post">
            <a href="/result/statistics1Servlets" class="btn btn-success opacity-75 mb-2" style="width: 6.5rem; height: 4rem">설문자별 답변 결과</a>
           
            <a href="/result/statistics2Servlets" class="btn btn-success opacity-75" style="width: rem; height: 4rem">질문별 총 답변수</a>
          </div>
          <div class="col">
            <table class="table text-center" style="width: 90%">
              <thead>
                <tr class="table-success opacity-75">
                  <th>설문자 명</th>
                  <th>설문 1</th>
                  <th>설문 2</th>
                  <th>설문 3</th>
                  <th>설문 4</th>
                  <th>설문 5</th>
                </tr>
              </thead>
              <tbody>
                <% for(int i = 1; i < userName_list.size(); i++) { 
                  HashMap<String, Object> userName = (HashMap<String, Object>)userName_list.get(i); %>
                  <tr>
                    <td><%= userName.get("NAME") %></td>
                    <% for(int j = 0; j < statistics1_list.size(); j++) { 
                      HashMap<String, Object> statistics1 = (HashMap<String, Object>)statistics1_list.get(j);
                      String answer = (String)statistics1.get("ANSWER_LIST"); %>
                      <td><%= answer %></td>
                    <% } %>
                  </tr>
                <% } %>
              </tbody>
            </table>
            <table class="table text-center" style="width: 90%">
              <thead>
                <tr class="table-success opacity-75">
                  <th>설문자 명</th>
                  <th>설문 1</th>
                  <th>설문 2</th>
                  <th>설문 3</th>
                  <th>설문 4</th>
                  <th>설문 5</th>
                </tr>
              </thead>
              <tbody>
              <%-- 통계 출력 --%>
              <% 
                HashMap<String, Object> usersName0 = (HashMap<String, Object>)userName_list.get(1);
                String name0 = (String)usersName0.get("NAME");
              %>
                <tr class="table-light">
                  <td><%= name0 %></td>
                  <%
                    HashMap<String,Object> statistics0 = (HashMap<String, Object>)statistics1_list.get(0);
                    String answer0 = (String)statistics0.get("ANSWER_UID");
                  %>
                 <td><%= answer0 %></td>
                  <%
                    HashMap<String,Object> statistics01 = (HashMap<String, Object>)statistics1_list.get(1);
                    String answer01 = (String)statistics01.get("ANSWER_UID");
                  %>
                 <td><%= answer01 %></td>
                  <%
                    HashMap<String,Object> statistics02 = (HashMap<String, Object>)statistics1_list.get(2);
                    String answer02 = (String)statistics02.get("ANSWER_UID");
                  %>
                 <td><%= answer02 %></td>
                  <%
                    HashMap<String,Object> statistics03 = (HashMap<String, Object>)statistics1_list.get(3);
                    String answer03 = (String)statistics03.get("ANSWER_UID");
                  %>
                 <td><%= answer03 %></td>
                  <%
                    HashMap<String,Object> statistics04 = (HashMap<String, Object>)statistics1_list.get(4);
                    String answer04 = (String)statistics04.get("ANSWER_UID");
                  %>
                 <td><%= answer04 %></td>
               
              <% 
                HashMap<String, Object> usersName1 = (HashMap<String, Object>)userName_list.get(1);
                String name1 = (String)usersName1.get("NAME");
              %>
                <tr class="table-light">
                  <td><%= name1 %></td>
                  <%
                    HashMap<String,Object> statistics11 = (HashMap<String, Object>)statistics1_list.get(5);
                    String answer11 = (String)statistics11.get("ANSWER_UID");
                  %>
                 <td><%= answer11 %></td>
                  <%
                    HashMap<String,Object> statistics12 = (HashMap<String, Object>)statistics1_list.get(6);
                    String answer12 = (String)statistics12.get("ANSWER_UID");
                  %>
                 <td><%= answer12 %></td>
                  <%
                    HashMap<String,Object> statistics13 = (HashMap<String, Object>)statistics1_list.get(7);
                    String answer13 = (String)statistics13.get("ANSWER_UID");
                  %>
                 <td><%= answer13 %></td>
                  <%
                    HashMap<String,Object> statistics14 = (HashMap<String, Object>)statistics1_list.get(8);
                    String answer14 = (String)statistics14.get("ANSWER_UID");
                  %>
                 <td><%= answer14 %></td>
                  <%
                    HashMap<String,Object> statistics15 = (HashMap<String, Object>)statistics1_list.get(9);
                    String answer15 = (String)statistics15.get("ANSWER_UID");
                  %>
                 <td><%= answer15 %></td>
              <% 
                HashMap<String, Object> usersName2 = (HashMap<String, Object>)userName_list.get(2);
                String name2 = (String)usersName2.get("NAME");
              %>
                <tr class="table-light">
                  <td><%= name2 %></td>
                  <%
                    HashMap<String,Object> statistics21 = (HashMap<String, Object>)statistics1_list.get(10);
                    String answer21 = (String)statistics21.get("ANSWER_UID");
                  %>
                 <td><%= answer21 %></td>
                  <%
                    HashMap<String,Object> statistics22 = (HashMap<String, Object>)statistics1_list.get(11);
                    String answer22 = (String)statistics22.get("ANSWER_UID");
                  %>
                 <td><%= answer22 %></td>
                  <%
                    HashMap<String,Object> statistics23 = (HashMap<String, Object>)statistics1_list.get(12);
                    String answer23 = (String)statistics23.get("ANSWER_UID");
                  %>
                 <td><%= answer23 %></td>
                  <%
                    HashMap<String,Object> statistics24 = (HashMap<String, Object>)statistics1_list.get(13);
                    String answer24 = (String)statistics24.get("ANSWER_UID");
                  %>
                 <td><%= answer24 %></td>
                  <%
                    HashMap<String,Object> statistics25 = (HashMap<String, Object>)statistics1_list.get(14);
                    String answer25 = (String)statistics25.get("ANSWER_UID");
                  %>
                 <td><%= answer25 %></td>
              <% 
                HashMap<String, Object> usersName3 = (HashMap<String, Object>)userName_list.get(3);
                String name3 = (String)usersName3.get("NAME");
              %>
                <tr class="table-light">
                  <td><%= name3 %></td>
                  <%
                    HashMap<String,Object> statistics31 = (HashMap<String, Object>)statistics1_list.get(15);
                    String answer31 = (String)statistics31.get("ANSWER_UID");
                  %>
                 <td><%= answer31 %></td>
                  <%
                    HashMap<String,Object> statistics32 = (HashMap<String, Object>)statistics1_list.get(16);
                    String answer32 = (String)statistics32.get("ANSWER_UID");
                  %>
                 <td><%= answer32 %></td>
                  <%
                    HashMap<String,Object> statistics33 = (HashMap<String, Object>)statistics1_list.get(17);
                    String answer33 = (String)statistics33.get("ANSWER_UID");
                  %>
                 <td><%= answer33 %></td>
                  <%
                    HashMap<String,Object> statistics34 = (HashMap<String, Object>)statistics1_list.get(18);
                    String answer34 = (String)statistics34.get("ANSWER_UID");
                  %>
                 <td><%= answer34 %></td>
                  <%
                    HashMap<String,Object> statistics35 = (HashMap<String, Object>)statistics1_list.get(19);
                    String answer35 = (String)statistics35.get("ANSWER_UID");
                  %>
                 <td><%= answer35 %></td>
              <% 
                HashMap<String, Object> usersName4 = (HashMap<String, Object>)userName_list.get(4);
                String name4 = (String)usersName4.get("NAME");
              %>
                <tr class="table-light">
                  <td><%= name4 %></td>
                  <%
                    HashMap<String,Object> statistics41 = (HashMap<String, Object>)statistics1_list.get(20);
                    String answer41 = (String)statistics41.get("ANSWER_UID");
                  %>
                 <td><%= answer41 %></td>
                  <%
                    HashMap<String,Object> statistics42 = (HashMap<String, Object>)statistics1_list.get(21);
                    String answer42 = (String)statistics42.get("ANSWER_UID");
                  %>
                 <td><%= answer42 %></td>
                  <%
                    HashMap<String,Object> statistics43 = (HashMap<String, Object>)statistics1_list.get(22);
                    String answer43 = (String)statistics43.get("ANSWER_UID");
                  %>
                 <td><%= answer43 %></td>
                  <%
                    HashMap<String,Object> statistics44 = (HashMap<String, Object>)statistics1_list.get(23);
                    String answer44 = (String)statistics44.get("ANSWER_UID");
                  %>
                 <td><%= answer44 %></td>
                  <%
                    HashMap<String,Object> statistics45 = (HashMap<String, Object>)statistics1_list.get(24);
                    String answer45 = (String)statistics45.get("ANSWER_UID");
                  %>
                 <td><%= answer45 %></td>
              </tbody>
            </table>
            </form>
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
