<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.HashMap, java.util.ArrayList" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>statistics_2</title>
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
   ArrayList<HashMap> statistics_list = (ArrayList<HashMap>)request.getAttribute("statistics_list");  
  %>
    <div class="container pb-5">
      <%@ include file="header.jsp" %>
      
      <main class="mt-5 p-1">
        <div class="row" style="margin-top: 8%">
          <div class="ms-2 me-5" style="width: 8rem">
          <form action="/result/ststistics2Servlets" method="get">
            <a href="/result/statistics1Servlets" class="btn btn-success opacity-75 mb-2" style="width: 6.5rem; height: 4rem">설문자별 답변 결과</a>
            <a href="/result/statistics2Servlets" class="btn btn-success opacity-75" style="width: rem; height: 4rem">질문별 총 답변수</a>
          </div>
          <div class="col mb-5">
            <table class="table text-center" style="width: 90%">
              <thead>
                <tr class="table-success opacity-75">
                  <th>설문 번호</th>

                  <th colspan="5"></th>
                </tr>
              </thead>
              <tbody>
              <%-- 통계 출력 --%>
                <% 
                  HashMap<String, Object> statistics0 = (HashMap<String, Object>)statistics_list.get(0);
                  int E1 = (int)statistics0.get("E1");
                  int E2 = (int)statistics0.get("E2");
                  int E3 = (int)statistics0.get("E3");
                  int E4 = (int)statistics0.get("E4");
                %>
                <tr class="table-light">
                  <th rowspan="3" class="">1</th>
                  <th colspan="5">반려동물에 관심이 있나요?</th>
                </tr>
                <tr>
                  <td>(1) 매우 그렇다</td>
                  <td>(2) 그렇다</td>
                  <td>(3) 그렇지 않다</td>
                  <td>(4) 전혀 그렇지 않다</td>
                </tr>
                <tr>
                  <td><%= E1 %></td>
                  <td><%= E2 %></td>
                  <td><%= E3 %></td>
                  <td><%= E4 %></td>
                </tr>
                <% 
                  HashMap<String, Object> statistics1 = (HashMap<String, Object>)statistics_list.get(1);
                  int E1_1 = (int)statistics1.get("E1");
                  int E2_1 = (int)statistics1.get("E2");
                  int E3_1 = (int)statistics1.get("E3");
                  int E4_1 = (int)statistics1.get("E4");
                %>
                <tr class="table-light">
                  <th rowspan="3" class="">2</th>
                  <th colspan="5">반려동물을 키울 생각이 있나요?</th>
                </tr>
                <tr>
                  <td>(1) 매우 그렇다</td>
                  <td>(2) 그렇다</td>
                  <td>(3) 그렇지 않다</td>
                  <td>(4) 전혀 그렇지 않다</td>
                </tr>
                <tr>
                  <td><%= E1_1 %></td>
                  <td><%= E2_1 %></td>
                  <td><%= E3_1 %></td>
                  <td><%= E4_1 %></td>
                </tr>
                <% 
                  HashMap<String, Object> statistics2 = (HashMap<String, Object>)statistics_list.get(2);
                  int E1_2 = (int)statistics1.get("E1");
                  int E2_2 = (int)statistics1.get("E2");
                  int E3_2 = (int)statistics1.get("E3");
                  int E4_2 = (int)statistics1.get("E4");
                %>
                <tr class="table-light">
                  <th rowspan="3" class="">3</th>
                  <th colspan="5">유기동물을 입양할 생각이 있나요?</th>
                </tr>
                <tr>
                  <td>(1) 매우 그렇다</td>
                  <td>(2) 그렇다</td>
                  <td>(3) 그렇지 않다</td>
                  <td>(4) 전혀 그렇지 않다</td>
                </tr>
                <tr>
                  <td><%= E1_2 %></td>
                  <td><%= E2_2 %></td>
                  <td><%= E3_2 %></td>
                  <td><%= E4_2 %></td>
                </tr>
                <% 
                  HashMap<String, Object> statistics3 = (HashMap<String, Object>)statistics_list.get(3);
                  int E1_3 = (int)statistics1.get("E1");
                  int E2_3 = (int)statistics1.get("E2");
                  int E3_3 = (int)statistics1.get("E3");
                  int E4_3 = (int)statistics1.get("E4");
                %>
                <tr class="table-light">
                  <th rowspan="3" class="">4</th>
                  <th colspan="5">반려동물을 키울 환경이 준비되어 있나요?</th>
                </tr>
                <tr>
                  <td>(1) 매우 그렇다</td>
                  <td>(2) 그렇다</td>
                  <td>(3) 그렇지 않다</td>
                  <td>(4) 전혀 그렇지 않다</td>
                </tr>
                <tr>
                  <td><%= E1_3 %></td>
                  <td><%= E2_3 %></td>
                  <td><%= E3_3 %></td>
                  <td><%= E4_3 %></td>
                </tr>
                <% 
                  HashMap<String, Object> statistics4 = (HashMap<String, Object>)statistics_list.get(4);
                  int E1_4 = (int)statistics1.get("E1");
                  int E2_4 = (int)statistics1.get("E2");
                  int E3_4 = (int)statistics1.get("E3");
                  int E4_4 = (int)statistics1.get("E4");
                %>
                <tr class="table-light">
                  <th rowspan="3" class="">5</th>
                  <th colspan="5">반려동물이 삶의 만족도에 영향을 준다고 생각하시나요?</th>
                </tr>
                <tr>
                  <td>(1) 매우 그렇다</td>
                  <td>(2) 그렇다</td>
                  <td>(3) 그렇지 않다</td>
                  <td>(4) 전혀 그렇지 않다</td>
                </tr>
                <tr>
                  <td><%= E1_4 %></td>
                  <td><%= E2_4 %></td>
                  <td><%= E3_4 %></td>
                  <td><%= E4_4 %></td>
                </tr>
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
