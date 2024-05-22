<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jp.main.model.Teacher" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>更新内容の確認</title>
</head>
<body>
    <h1>更新内容の確認</h1>
    <p>以下の情報で更新を実行しますか？</p>
    <ul>
        <li>教師番号: <%= request.getParameter("id") %></li>
        <li>名前: <%= request.getParameter("name") %></li>
        <li>年齢: <%= request.getParameter("age") %></li>
        <li>性別: <%= request.getParameter("sex") %></li>
        <li>コース: <%= request.getParameter("course") %></li>
    </ul>
    <form action="update" method="post">
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>">
        <input type="hidden" name="name" value="<%= request.getParameter("name") %>">
        <input type="hidden" name="age" value="<%= request.getParameter("age") %>">
        <input type="hidden" name="sex" value="<%= request.getParameter("sex") %>">
        <input type="hidden" name="course" value="<%= request.getParameter("course") %>">
        <input type="submit" value="はい、更新します">
    </form>
    <a href="javascript:history.back()">いいえ、キャンセルします</a>
</body>
</html>
