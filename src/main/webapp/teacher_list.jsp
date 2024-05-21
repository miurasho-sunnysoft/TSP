<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tsm.Teacher" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>教師情報</title>
</head>
<body>
    <h1>教師情報</h1>
    <a href="new">新規登録</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>名前</th>
            <th>年齢</th>
            <th>性別</th>
            <th>コース</th>
            <th>アクション</th>
        </tr>
        <%
            List<Teacher> listTeacher = (List<Teacher>) request.getAttribute("listTeacher");
            for (Teacher teacher : listTeacher) {
        %>
        <tr>
            <td><%= teacher.getId() %></td>
            <td><%= teacher.getName() %></td>
            <td><%= teacher.getAge() %></td>
            <td><%= teacher.getSex() %></td>
            <td><%= teacher.getCourse() %></td>
            <td>
                <a href="edit?id=<%= teacher.getId() %>">編集</a>
                <a href="delete?id=<%= teacher.getId() %>">削除</a>
            </td>
        </tr>
        <% } %>
    </table>
</body>
</html>
